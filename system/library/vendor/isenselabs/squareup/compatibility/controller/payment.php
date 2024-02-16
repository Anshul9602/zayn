<?php

namespace vendor\isenselabs\Squareup\Compatibility\Controller;

use \vendor\isenselabs\Squareup\Compatibility\Controller as SquareController;
use \vendor\isenselabs\Squareup\OrderHistory;
use \vendor\isenselabs\Squareup\Exception\Api as ApiException;

class Payment extends SquareController {
    protected $imodule_route_payment;
    protected $imodule_extension_route;
    protected $imodule_model_payment;
    protected $imodule_model_credit_card;
    protected $imodule_language_payment;

    public function __construct($registry) {
        // Construct the OC controller
        parent::__construct($registry);

        // Load config
        $this->load->config('vendor/isenselabs/squareup/compatibility');

        // Set some config values
        $this->imodule_route_payment = $this->config->get('squareup_imodule_route_payment');
        $this->imodule_extension_route = $this->config->get('squareup_imodule_extension_route');

        // Load the model
        $this->load->model($this->imodule_route_payment);

        // Init the model and language
        $this->imodule_model_payment = $this->{$this->config->get('squareup_imodule_model_payment')};
        $this->imodule_language_payment = $this->load->language($this->imodule_route_payment);
    }

    public function beforeAddOrderHistory($route, $args = null) {
        $this->registry->set('squareup_order_history', new OrderHistory($this->registry));

        if (version_compare(VERSION, '2.3.0.0', '>=')) {
            $order_id = $args[0];
        } else if (version_compare(VERSION, '2.2.0.0', '>=')) {
            $order_id = $args;
        } else if (version_compare(VERSION, '2.1.0.1', '>=')) {
            $order_id = $route['order_id'];
        } else {
            $order_id = $route;
        }

        $this->squareup_order_history->persistOrderStock($order_id);
    }

    public function afterAddOrderHistory($route, $args = null, $output = null) {
        if (!$this->registry->has('squareup_order_history')) {
            return;
        }

        $this->loadLibrary('vendor/isenselabs/squareup');

        if (version_compare(VERSION, '2.3.0.0', '>=')) {
            $order_id = $args[0];
        } else if (version_compare(VERSION, '2.2.0.0', '>=')) {
            $order_id = $output;
        } else {
            $order_id = $route;
        }

        $adjustments = array();
        $is_capture = !empty($this->session->data['squareup_is_capture']) || !empty($this->request->post['squareup_is_capture']);
        $ad_hoc_items = !empty($this->session->data['squareup_ad_hoc_items']) ? $this->session->data['squareup_ad_hoc_items'] : array();
        $stock_difference = $this->squareup_order_history->getOrderStockDifference($order_id);

        unset($this->session->data['squareup_is_capture']);
        unset($this->session->data['squareup_ad_hoc_items']);

        // Store ad-hoc items. They will be used to restrict the itemized re-stock.
        foreach ($ad_hoc_items as $order_product_id) {
            $this->db->query("INSERT INTO `" . DB_PREFIX . "squareup_ad_hoc` SET order_product_id=" . (int)$order_product_id);
        }

        // Process Square-specific quantity adjustments
        if ($this->squareup_order_history->isPaymentMethodSquare($order_id)) {
            // Step 1 - first, revert the products to their original state. This is to ensure the Square quantity changes will be properly applied later below. In case $stock_difference === false, no need to do anything.
            if ($stock_difference !== false) {
                if ($this->config->get('squareup_debug')) {
                    $this->log->write("SQUAREUP ORDER HISTORY - REVERT STOCK DIFFERENCE: " . json_encode($stock_difference));
                }

                // Revert stocks
                foreach ($stock_difference as $order_product) {
                    $product_id = (int)$order_product['product_id'];
                    // We expect all signs to be minus, but we also support plus in case of third-party mods. The end-goal is to have the same quantities as before the order history has been added.
                    $sign = (int)$order_product['quantity'] > 0 ? '+' : '-';
                    $quantity = abs($order_product['quantity']);

                    $this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity " . $sign . " " . (int)$quantity . ") WHERE product_id = '" . (int)$product_id . "' AND subtract = '1'");

                    $order_options = $order_product['order_options'];

                    foreach ($order_options as $order_option) {
                        $product_option_value_id = (int)$order_option['product_option_value_id'];

                        $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity " . $sign . " " . (int)$quantity . ") WHERE product_option_value_id = '" . (int)$product_option_value_id . "' AND subtract = '1'");
                    }
                }
            }

            // Step 2
            // Process square action. In case of capture, we only need to deduct the OpenCart quantities without pushing an inventory adjustment to Square. This is because such is automatically made in case the transaction has been captured.
            if ($is_capture) {
                // Stock subtraction
                $order_products = $this->imodule_model_payment->getOrderProducts($order_id);

                if ($this->config->get('squareup_debug')) {
                    $this->log->write("SQUAREUP ORDER HISTORY - CAPTURE EVENT: " . json_encode($order_products));
                }

                foreach ($order_products as $order_product) {
                    $this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity - " . (int)$order_product['quantity'] . ") WHERE product_id = '" . (int)$order_product['product_id'] . "' AND subtract = '1'");

                    $order_options = $this->imodule_model_payment->getOrderOptions($order_id, $order_product['order_product_id']);

                    foreach ($order_options as $order_option) {
                        $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity - " . (int)$order_product['quantity'] . ") WHERE product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "' AND subtract = '1'");
                    }
                }
            } else {
                // Refund
                if (!empty($this->request->post['square_refund']) && is_array($this->request->post['square_refund'])) {
                    // This is a Square return with a refund

                    if ($this->config->get('squareup_debug')) {
                        $this->log->write("SQUAREUP ORDER HISTORY - REFUND EVENT: " . json_encode($this->request->post['square_refund']));
                    }

                    foreach ($this->request->post['square_refund'] as $refund) {
                        if (!empty($refund['catalog_object_id'])) {
                            /* Important: This step has been prohibited in the Inventory API version 2018-09-18. The code remains here in case of future updates. */
                            // $adjustments[] = array(
                            //     'catalog_object_id' => $refund['catalog_object_id'],
                            //     'quantity' => $refund['quantity'],
                            //     'from_state' => 'SOLD',
                            //     'to_state' => 'UNLINKED_RETURN'
                            // );
                        }

                        $this->db->query("INSERT INTO `" . DB_PREFIX . "squareup_refund` SET order_product_id=" . (int)$refund['order_product_id'] . ", quantity=" . (int)$refund['quantity']);
                    }
                }

                // Restock
                if (!empty($this->request->post['square_restock']) && is_array($this->request->post['square_restock'])) {
                    // This is a Square return with a restock

                    if ($this->config->get('squareup_debug')) {
                        $this->log->write("SQUAREUP ORDER HISTORY - RESTOCK EVENT: " . json_encode($this->request->post['square_restock']));
                    }

                    foreach ($this->request->post['square_restock'] as $restock) {
                        if (!empty($restock['catalog_object_id'])) {
                            $adjustments[] = array(
                                'catalog_object_id' => $restock['catalog_object_id'],
                                'quantity' => $restock['quantity'],
                                'from_state' => 'UNLINKED_RETURN',
                                'to_state' => 'IN_STOCK'
                            );
                        }

                        $this->db->query("INSERT INTO `" . DB_PREFIX . "squareup_restock` SET order_product_id=" . (int)$restock['order_product_id'] . ", quantity=" . (int)$restock['quantity']);

                        $this->db->query("UPDATE " . DB_PREFIX . "product SET quantity = (quantity + " . (int)$restock['quantity'] . ") WHERE product_id = '" . (int)$restock['product_id'] . "' AND subtract = '1'");

                        $order_options = $this->imodule_model_payment->getOrderOptions($order_id, $restock['order_product_id']);

                        foreach ($order_options as $order_option) {
                            $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET quantity = (quantity + " . (int)$restock['quantity'] . ") WHERE product_option_value_id = '" . (int)$order_option['product_option_value_id'] . "' AND subtract = '1'");
                        }
                    }
                }
            }
        } else {
            // If the payment method is not Square, push the order differences

            if ($stock_difference !== false) {
                // Revert stocks
                foreach ($stock_difference as $order_product) {
                    $quantity = (int)$order_product['quantity'];
                    $product_id = (int)$order_product['product_id'];
                    $catalog_object_id = $order_product['catalog_object_id'];

                    if (!empty($catalog_object_id)) {
                        if ($quantity < 0) {
                            // This is a return
                            /* Important: This step has been prohibited in the Inventory API version 2018-09-18. The code remains here in case of future updates. */
                            // $adjustments[] = array(
                            //     'catalog_object_id' => $catalog_object_id,
                            //     'quantity' => $quantity,
                            //     'from_state' => 'SOLD',
                            //     'to_state' => 'UNLINKED_RETURN'
                            // );

                            $adjustments[] = array(
                                'catalog_object_id' => $catalog_object_id,
                                'quantity' => $quantity,
                                'from_state' => 'UNLINKED_RETURN',
                                'to_state' => 'IN_STOCK'
                            );
                        } else {
                            // This is a purchase
                            $adjustments[] = array(
                                'catalog_object_id' => $catalog_object_id,
                                'quantity' => abs($quantity),
                                'from_state' => 'IN_STOCK',
                                'to_state' => 'SOLD'
                            );
                        }
                    }
                }
            }
        }

        if (!empty($adjustments)) {
            try {
                $this->squareup_api->pushInventoryAdjustments($adjustments);
            } catch (ApiException $e) {
                if ($e->isCurlError()) {
                    // Do nothing
                } else if ($e->isAccessTokenRevoked()) {
                    // Send reminder e-mail to store admin to refresh the token
                    $this->imodule_model_payment->tokenRevokedEmail();
                } else if ($e->isAccessTokenExpired()) {
                    // Send reminder e-mail to store admin to refresh the token
                    $this->imodule_model_payment->tokenExpiredEmail();
                } else {
                    // Do nothing
                }
            } catch (\Exception $e) {
                // Do nothing
            }
        }
    }

    protected function loadCreditCardModel() {
        $this->load->model($this->config->get('squareup_imodule_route_credit_card'));

        $this->imodule_model_credit_card = $this->{$this->config->get('squareup_imodule_model_credit_card')};
    }
}