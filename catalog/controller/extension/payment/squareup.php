<?php

use vendor\isenselabs\Squareup\Compatibility\Controller\Payment as Controller;
use vendor\isenselabs\Squareup;

class ControllerExtensionPaymentSquareup extends Controller {
    public function index() {
        $this->loadLibrary('vendor/isenselabs/squareup');

        $this->load->model('localisation/country');

        $data = $this->imodule_language_payment;

        $data['action'] = $this->url->link($this->imodule_route_payment . '/checkout', '', $this->getUrlSsl());
        $data['save_card_action'] = $this->url->link($this->imodule_route_payment . '/saveCard', '', $this->getUrlSsl());
        $data['getTotals'] = $this->url->link($this->imodule_route_payment . '/getTotals', '', $this->getUrlSsl());
        $data['squareup_js_api'] = 'https://web.squarecdn.com/v1/square.js';

        if($this->config->get('squareup_key_type') == 'sandbox'){
          $data['squareup_js_api'] = 'https://sandbox.web.squarecdn.com/v1/square.js';
        }

        if (version_compare(VERSION, '2.0.0.0', '<') && !empty($this->session->data['guest']) && !empty($this->session->data['guest']['payment']['postcode'])) {
            $data['payment_zip'] = htmlentities($this->session->data['guest']['payment']['postcode'], ENT_QUOTES, 'UTF-8');
        } else if (version_compare(VERSION, '2.0.0.0', '<') && !empty($this->session->data['payment_address_id'])) {
            $this->load->model('account/address');
            $addr = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
            $data['payment_zip'] = htmlentities($addr['postcode'], ENT_QUOTES, 'UTF-8');
        } else if (!empty($this->session->data['payment_address']['postcode'])) {
            $data['payment_zip'] = htmlentities($this->session->data['payment_address']['postcode'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['payment_zip'] = '';
        }

        $data['app_id'] = $this->config->get('squareup_client_id');
        $data['squareup_apple_pay_status']	= $this->config->get('squareup_apple_pay_status');
        $data['squareup_google_pay_status']	= $this->config->get('squareup_google_pay_status');
        $data['squareup_after_pay_status']	= $this->config->get('squareup_after_pay_status');
        $data['squareup_gift_card_status']	= $this->config->get('squareup_gift_card_status');

        $data['location_id'] = $this->config->get('squareup_location_id');

        $data['cards'] = array();
        $data['has_selected_card'] = false;
        $data['has_recurring_products'] = $this->cart->hasRecurringProducts() ? true : false;
        $data['icon_status'] = (bool)$this->config->get('squareup_icon_status');
        $data['accepted_cards_status'] = (bool)$this->config->get('squareup_accepted_cards_status');

        $apple_pay_line_items = $this->imodule_model_payment->getApplePayLineItems($this->session->data['order_id']);
        $has_applepay_line_items = !is_null($apple_pay_line_items);

        $data['has_applepay_line_items'] = $has_applepay_line_items;
        $data['apple_pay_line_items'] = $has_applepay_line_items ? json_encode($apple_pay_line_items) : '{}';

        if ($this->customer->isLogged()) {
            $data['is_logged'] = true;

            $this->loadCreditCardModel();

            $cards = $this->imodule_model_credit_card->getCards($this->customer->getId());

            $square_customer = $this->imodule_model_credit_card->getCustomer($this->customer->getId());

            foreach ($cards as $card) {
                $selected = $card['squareup_token_id'] == $square_customer['squareup_token_id'];

                if ($selected) {
                    $data['has_selected_card'] = true;
                }

                $data['cards'][] = array(
                    'id' => $card['squareup_token_id'],
                    'selected' => $selected,
                    'token' => $card['token'],
                    'text' => sprintf($this->language->get('text_card_ends_in'), $card['brand'], $card['ends_in'])
                );
            }
        } else {
            $data['is_logged'] = false;
        }

        $data['error_currency'] = '';
        $data['warning_currency'] = '';

        $location_currency = $this->squareup_api->getLocationCurrency(null);

        $data['amount'] = 0;

        if (is_null($location_currency)) {
            $data['error_currency'] = $this->language->get('error_currency_invalid');
        } else {
            if ($this->session->data['currency'] != $location_currency) {
                $rate = round($this->currency->getValue($location_currency) / $this->currency->getValue($this->session->data['currency']), 8);

                $this->load->model('checkout/order');

                $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

                $amount = $this->currency->format($this->currency->convert($order_info['total'], $this->config->get('config_currency'), $location_currency), $location_currency, 1, false);

                $dec_place = $this->currency->getDecimalPlace($location_currency);
                $amount_formatted = number_format($amount, (int)$dec_place, $this->language->get('decimal_point'), $this->language->get('thousand_point'));

                $data['amount'] = $amount_formatted;
                $data['amount_new'] = str_replace( ',', '', $amount_formatted );
                $data['currency'] = $location_currency;

                $data['warning_currency'] = sprintf($this->language->get('warning_currency_converted'), $location_currency, $rate, $amount);
            } else{
              $rate = round($this->currency->getValue($location_currency) / $this->currency->getValue($this->session->data['currency']), 8);

              $this->load->model('checkout/order');

              $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

              $dec_place = $this->currency->getDecimalPlace($location_currency);

              $amount = round($this->currency->convert($order_info['total'], $this->config->get('config_currency'), $location_currency), (int)$dec_place);

              $amount_formatted = number_format($amount, (int)$dec_place, $this->language->get('decimal_point'), $this->language->get('thousand_point'));

              $data['amount'] = $amount_formatted;
			  $data['amount_new'] = str_replace( ',', '', $amount_formatted );
              $data['currency'] = $location_currency;

            }
        }
		
		// Totals
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;
		
		// Because __call can not keep var references so we put them into an array. 			
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
		
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
		}

		$data['totals'] = array();

		foreach ($totals as $total) {
			$data['totals'][] = array(
				'title' => $total['title'],
				'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
			);
		}

        // Workaround:
        // There is an "unset($this->session->data['shipping_address']);" at the beginning of ControllerCheckoutConfirm::index()
        // This unset is messing up the taxes which is why we need to re-create $this->session->data['shipping_address'] like so:
        if (!$this->cart->hasShipping() && empty($this->session->data['shipping_address']) && $this->customer->isLogged() && $this->config->get('config_tax_customer') == 'shipping') {

            $this->load->model('account/address');

            $this->session->data['shipping_address'] = $this->model_account_address->getAddress($this->customer->getAddressId());
        }

        // Data for the customer verification check
        $billing_country_info = $this->model_localisation_country->getCountry($this->session->data['payment_address']['country_id']);

        $data['customer_family_name'] = $this->session->data['payment_address']['lastname'] ? $this->session->data['payment_address']['lastname'] : "";
        $data['customer_given_name'] = $this->session->data['payment_address']['firstname'] ? $this->session->data['payment_address']['firstname'] : "";
        $data['customer_email'] = (isset($this->session->data['customer']) && $this->session->data['customer']['email']) ? $this->session->data['customer']['email'] : "";
        $data['customer_country'] = $billing_country_info['iso_code_2'] ? $billing_country_info['iso_code_2'] : "";
        $data['customer_city'] = $this->session->data['payment_address']['city'] ? $this->session->data['payment_address']['city'] : "";
        $data['customer_address'] = json_encode([$this->session->data['payment_address']['address_1'] . ' ' . $this->session->data['payment_address']['address_2']]);
        $data['customer_postal_code'] = $this->session->data['payment_address']['postcode'] ? $this->session->data['payment_address']['postcode'] : "" ;
        $data['customer_phone'] = (isset($this->session->data['customer']) && $this->session->data['customer']['telephone']) ? $this->session->data['customer']['telephone'] : "";

        return $this->loadView($this->imodule_route_payment, $data);
    }

    public function saveCard(){
      $this->loadCreditCardModel();
      $this->load->model('checkout/order');
      $this->load->model('localisation/country');
	  $inputPost = json_decode(file_get_contents('php://input'), true);

      $this->imodule_model_payment->setExceptionHandler();

      $this->loadLibrary('vendor/isenselabs/squareup');

      $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

      $shipping_country_info = $this->model_localisation_country->getCountry($order_info['shipping_country_id']);

      $billing_country_info = $this->model_localisation_country->getCountry($order_info['payment_country_id']);

      if (!empty($billing_country_info)) {
          $billing_address = array(
              'first_name' => $order_info['payment_firstname'],
              'last_name' => $order_info['payment_lastname'],
              'address_line_1' => $order_info['payment_address_1'],
              'address_line_2' => $order_info['payment_address_2'],
              'locality' => $order_info['payment_city'],
              'sublocality' => $order_info['payment_zone'],
              'postal_code' => $order_info['payment_postcode'],
              'country' => $billing_country_info['iso_code_2'],
              'organization' => $order_info['payment_company']
          );
      } else {
          $billing_address = array();
      }

      $json = array();

      try {

          if($this->cart->hasRecurringProducts() && !$this->customer->isLogged()){
            throw new \Squareup\Exception\Api($this->registry, "You need to login to complete an order with a recurring payment.");
          }

          // Ensure we have registered the customer with Square
          $square_customer = $this->imodule_model_credit_card->getCustomer($this->customer->getId());

          if (!$square_customer && $this->customer->isLogged()) {
              $square_customer = $this->squareup_api->addLoggedInCustomer();

              $this->imodule_model_credit_card->addCustomer($square_customer);
          }

          // Save the card only if we have paid without a digital wallet...
          if (empty($inputPost['squareup_digital_wallet_type']) || $inputPost['squareup_digital_wallet_type'] == 'NONE') {
              // check if user is logged in and wanted to save this card
              if ($this->customer->isLogged() && isset($inputPost['squareup_save_card'])) {
                  // Save the card
                  $card_data = array(
                      'card_nonce' => $inputPost['squareup_nonce'],
                      'billing_address' => $billing_address,
                      'cardholder_name' => $order_info['payment_firstname'] . ' ' . $order_info['payment_lastname']
                  );

                  $square_card = $this->squareup_api->addCard($square_customer['square_customer_id'], $card_data);

                  if (!$this->imodule_model_credit_card->cardExists($this->customer->getId(), $square_card)) {
                      $this->imodule_model_credit_card->addCard($this->customer->getId(), $square_card);
                  }

                  $json = ["card_id" => $square_card['id']];
              }
          }
        } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
            if ($e->isCurlError()) {
                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else if ($e->isAccessTokenRevoked()) {
                // Send reminder e-mail to store admin to refresh the token
                $this->imodule_model_payment->tokenRevokedEmail();

                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else if ($e->isAccessTokenExpired()) {
                // Send reminder e-mail to store admin to refresh the token
                $this->imodule_model_payment->tokenExpiredEmail();

                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else {
                $json['error'] = $e->getMessage();
            }
        } catch (\Exception $e) {
            $json['error'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function checkout() {
        $this->loadCreditCardModel();
        $this->load->model('checkout/order');
        $this->load->model('localisation/country');
		$inputPost = json_decode(file_get_contents('php://input'), true);

        $this->imodule_model_payment->setExceptionHandler();

        $this->loadLibrary('vendor/isenselabs/squareup');

        $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);

        $shipping_country_info = $this->model_localisation_country->getCountry($order_info['shipping_country_id']);

        $billing_country_info = $this->model_localisation_country->getCountry($order_info['payment_country_id']);

        if (!empty($billing_country_info)) {
            $billing_address = array(
                'first_name' => $order_info['payment_firstname'],
                'last_name' => $order_info['payment_lastname'],
                'address_line_1' => $order_info['payment_address_1'],
                'address_line_2' => $order_info['payment_address_2'],
                'locality' => $order_info['payment_city'],
                'sublocality' => $order_info['payment_zone'],
                'postal_code' => $order_info['payment_postcode'],
                'country' => $billing_country_info['iso_code_2'],
                'organization' => $order_info['payment_company']
            );
        } else {
            $billing_address = array();
        }

        if (!empty($shipping_country_info)) {
            $shipping_address = array(
                'first_name' => $order_info['shipping_firstname'],
                'last_name' => $order_info['shipping_lastname'],
                'address_line_1' => $order_info['shipping_address_1'],
                'address_line_2' => $order_info['shipping_address_2'],
                'locality' => $order_info['shipping_city'],
                'sublocality' => $order_info['shipping_zone'],
                'postal_code' => $order_info['shipping_postcode'],
                'country' => $shipping_country_info['iso_code_2'],
                'organization' => $order_info['shipping_company']
            );
        } else {
            $shipping_address = array();
        }

        $json = array();

        try {

            if($this->cart->hasRecurringProducts() && !$this->customer->isLogged()){
              throw new \Squareup\Exception\Api($this->registry, "You need to login to complete an order with a recurring payment.");
            }

            // Ensure we have registered the customer with Square
            $square_customer = $this->imodule_model_credit_card->getCustomer($this->customer->getId());

            if (!$square_customer && $this->customer->isLogged()) {
                $square_customer = $this->squareup_api->addLoggedInCustomer();

                $this->imodule_model_credit_card->addCustomer($square_customer);
            }

            $use_saved = false;
            $square_card_id = null;

            // Save the card only if we have paid without a digital wallet...
            if (empty($inputPost['squareup_digital_wallet_type']) || $inputPost['squareup_digital_wallet_type'] == 'NONE') {
                // check if user is logged in and wanted to save this card
                if ($this->customer->isLogged() && !empty($inputPost['squareup_select_card'])) {
                    $card_verified = $this->imodule_model_credit_card->verifyCardCustomer($inputPost['squareup_select_card'], $this->customer->getId());

                    if (!$card_verified) {
                        throw new vendor\isenselabs\Squareup\Exception\Api($this->registry, $this->language->get('error_card_invalid'));
                    }

                    $card = $this->imodule_model_credit_card->getCard($inputPost['squareup_select_card']);

                    $use_saved = true;
                    $square_card_id = $card['token'];
                }
                if ($this->customer->isLogged() && isset($inputPost['squareup_save_card']) && strlen($inputPost['squareup_save_card']) > 10) {
                    // If we enter here, we should have called this->saveCard from the front end, recieved the new card id and verified it and then called the checkout
                    $use_saved = true;
                    $square_card_id = $inputPost['squareup_save_card'];
                }
            }

            $location_currency = $this->squareup_api->getLocationCurrency(null);

            if (is_null($location_currency)) {
                throw new \Exception($this->language->get('error_currency_invalid'));
            }

            $order_total = $this->squareup_api->roundPrice($this->currency->convert($order_info['total'], $this->config->get('config_currency'), $location_currency), $location_currency);

            $order_total_amount = $this->squareup_api->lowestDenomination($order_total, $location_currency);

            // If the Square order throws an error or if the order price is different than the OC price, ignore it and submit the transaction with no items
            $square_order_id = null;
            $square_order_errors = array();

            try {
                $source = $this->config->get('squareup_sync_source');
                $re_sync_items = false;

                try {
                    $square_order = $this->squareup_api->createOrder($order_info['order_id'], 0, true);

                    $price_diff = $square_order['total_money']['amount'] - $order_total_amount;

                    $re_sync_items = $price_diff != 0;
                } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                    if (empty($source) || $source == 'none' || $e->isCurlError() || $e->isAccessTokenRevoked() || $e->isAccessTokenExpired()) {
                        // Throw the exception in case no sync will reoccur, or if the access token has expired/been revoked, or if there is a CURL error
                        throw $e;
                    }

                    $re_sync_items = true;
                }

                if ($re_sync_items) {
                    if ($source != 'none') {
                        if (!$this->config->get('squareup_cron_is_running')) {
                            $this->imodule_model_payment->setBeginSyncFlags();

                            try {
                                $this->squareup_diff->syncOrderItems($source, $order_info['order_id']);
                            } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                                if ($e->isCurlError() || $e->isAccessTokenRevoked() || $e->isAccessTokenExpired()) {
                                    throw $e;
                                }
                            }

                            $this->imodule_model_payment->setEndSyncFlags();
                        }

                        $square_order = $this->squareup_api->createOrder($order_info['order_id']);

                        $price_diff = $square_order['total_money']['amount'] - $order_total_amount;
                    }
                }

                if ($price_diff != 0) {
                    $square_order = $this->squareup_api->createOrder($order_info['order_id'], $price_diff);
                }

                if ($square_order['total_money']['amount'] == $order_total_amount) {
                    $square_order_id = $square_order['id'];
                }
            } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                if ($e->isCurlError() || $e->isAccessTokenRevoked() || $e->isAccessTokenExpired()) {
                    throw $e;
                }

                $square_order_errors = $e->getMessages();
            } catch (\Exception $e) {
                throw $e;
            }

            // Prepare Transaction
            $transaction_data = array(
                'note' => sprintf($this->language->get('text_order_id'), $order_info['order_id']),
                'reference_id' => $order_info['order_id'],
                'idempotency_key' => uniqid(),
                'amount_money' => array(
                    'amount' => $order_total_amount,
                    'currency' => $location_currency
                ),
                'billing_address' => $billing_address,
                'buyer_email_address' => $order_info['email'],
                'autocomplete' => method_exists($this->cart, 'hasRecurringProducts') && !(!$this->cart->hasRecurringProducts() && $this->config->get('squareup_delay_capture')),
                'location_id' => $this->config->get('squareup_location_id'),
				'integration_id' => Squareup::SQUARE_INTEGRATION_ID
            );

            if (!is_null($square_order_id)) {
                $transaction_data['order_id'] = $square_order_id;
            }

            if (!empty($shipping_address)) {
                $transaction_data['shipping_address'] = $shipping_address;
            }

            if ($use_saved) {
                $transaction_data['source_id'] = $square_card_id;
                $transaction_data['customer_id'] = $square_customer['square_customer_id'];

                $transaction_data['verification_token'] = $inputPost['squareup_buyer_verification_token'];
                $square_token_id = $this->imodule_model_credit_card->getTokenIdByCustomerAndToken($this->customer->getId(), $square_card_id);
                $this->imodule_model_credit_card->updateDefaultCustomerToken($this->customer->getId(), $square_token_id);
            } else {
                $transaction_data['source_id'] = $inputPost['squareup_nonce'];
                $transaction_data['verification_token'] = $inputPost['squareup_buyer_verification_token'];

                if (!$this->customer->isLogged() && $this->config->get('squareup_guest') && !empty($this->session->data['guest']['firstname']) && !empty($this->session->data['guest']['lastname']) && !empty($this->session->data['guest']['email'])) {
                    $guest_customer = $this->squareup_api->addCustomer($this->session->data['guest']['firstname'], $this->session->data['guest']['lastname'], $this->session->data['guest']['email']);

                    $transaction_data['customer_id'] = $guest_customer['id'];
                }
            }

            $transaction = $this->squareup_api->addTransaction($transaction_data);

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                $user_agent = $this->request->server['HTTP_USER_AGENT'];
            } else {
                $user_agent = '';
            }

            if (isset($this->request->server['REMOTE_ADDR'])) {
                $ip = $this->request->server['REMOTE_ADDR'];
            } else {
                $ip = '';
            }

            if ($use_saved) {
              $this->imodule_model_payment->addTransaction($transaction, $this->config->get('squareup_merchant_id'), $billing_address, $this->session->data['order_id'], $user_agent, $ip, $square_card_id);
            }else{
              $this->imodule_model_payment->addTransaction($transaction, $this->config->get('squareup_merchant_id'), $billing_address, $this->session->data['order_id'], $user_agent, $ip);
            }

            if (isset($transaction['card_details'])) {
				if (!empty($transaction['card_details']['status'])) {
					$transaction_status = strtolower($transaction['card_details']['status']);
				} else {
					$transaction_status = '';
				}
			} else {
				if (!empty($transaction['status'])) {
					if ($transaction['status'] == 'COMPLETED') {
						$transaction['status'] = 'CAPTURED';
					}
					$transaction_status = strtolower($transaction['status']);
				} else {
					$transaction_status = '';
				}
			}

            $this->session->data['squareup_is_capture'] = $transaction_status == 'captured';

            $this->imodule_model_payment->squareOrderErrorEmail($square_order_errors, $order_info['order_id']);

            $order_status_id = $this->config->get('squareup_status_' . $transaction_status);

            if ($order_status_id) {
                if (method_exists($this->cart, 'hasRecurringProducts') && $this->cart->hasRecurringProducts() && $transaction_status == 'captured') {
                    foreach ($this->cart->getRecurringProducts() as $item) {
                        if (version_compare(VERSION, '2.0.0.0', '>=')) {
                            if ($item['recurring']['trial']) {
                                $trial_price = $this->tax->calculate($item['recurring']['trial_price'] * $item['quantity'], $item['tax_class_id']);
                                $trial_amt = $this->currency->format($trial_price, $this->session->data['currency']);
                                $trial_text =  sprintf($this->language->get('text_trial'), $trial_amt, $item['recurring']['trial_cycle'], $item['recurring']['trial_frequency'], $item['recurring']['trial_duration']);

                                $item['recurring']['trial_price'] = $trial_price;
                            } else {
                                $trial_text = '';
                            }

                            $recurring_price = $this->tax->calculate($item['recurring']['price'] * $item['quantity'], $item['tax_class_id']);
                            $recurring_amt = $this->currency->format($recurring_price, $this->session->data['currency']);
                            $recurring_description = $trial_text . sprintf($this->language->get('text_recurring'), $recurring_amt, $item['recurring']['cycle'], $item['recurring']['frequency']);

                            $item['recurring']['price'] = $recurring_price;

                            if ($item['recurring']['duration'] > 0) {
                                $recurring_description .= sprintf($this->language->get('text_length'), $item['recurring']['duration']);
                            }

                            if (!$item['recurring']['trial']) {
                                // We need to override this value for the proper calculation in updateRecurringExpired
                                $item['recurring']['trial_duration'] = 0;
                            }
                        } else {
                            if ($item['recurring_trial']) {
                                $trial_amt = $this->currency->format($this->tax->calculate($item['recurring_trial_price'] * $item['quantity'], $item['tax_class_id']), $this->session->data['currency']);
                                $trial_text =  sprintf($this->language->get('text_trial'), $trial_amt, $item['recurring_trial_cycle'], $item['recurring_trial_frequency'], $item['recurring_trial_duration']);
                            } else {
                                $trial_text = '';
                            }

                            $recurring_amt = $this->currency->format($this->tax->calculate($item['recurring_price']  * $item['quantity'], $item['tax_class_id']), $this->session->data['currency']);
                            $recurring_description = $trial_text . sprintf($this->language->get('text_recurring'), $recurring_amt, $item['recurring_cycle'], $item['recurring_frequency']);

                            if ($item['recurring_duration'] > 0) {
                                $recurring_description .= sprintf($this->language->get('text_length'), $item['recurring_duration']);
                            }
                        }

                        $this->imodule_model_payment->createRecurring($item, $this->session->data['order_id'], $recurring_description, $transaction['id']);
                    }
                }

                $order_status_comment = $this->language->get('squareup_status_comment_' . $transaction_status);

                // The payment went through. Amend the error handler to one which only logs errors
                $this->imodule_model_payment->setErrorLogHandler();

                $this->model_checkout_order->{$this->config->get('squareup_imodule_add_order_history_method')}($this->session->data['order_id'], $order_status_id, $order_status_comment, true);
            }

            $json['redirect'] = $this->url->link('checkout/success', '', $this->getUrlSsl());
        } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
            if ($e->isCurlError()) {
                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else if ($e->isAccessTokenRevoked()) {
                // Send reminder e-mail to store admin to refresh the token
                $this->imodule_model_payment->tokenRevokedEmail();

                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else if ($e->isAccessTokenExpired()) {
                // Send reminder e-mail to store admin to refresh the token
                $this->imodule_model_payment->tokenExpiredEmail();

                $json['error'] = $this->language->get('text_token_issue_customer_error');
            } else {
                $json['error'] = $e->getMessage();
            }
        } catch (\Exception $e) {
            $json['error'] = $e->getMessage();
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function info() {
        if (!$this->validate()) {
            $this->responseRedirect($this->url->link($this->config->has('action_default') ? $this->config->get('action_default') : 'common/home', '', $this->getUrlSsl()));
        } else {
            $append_token = !empty($this->session->data['token']) ? '&token=' . $this->session->data['token'] : '';

            if (isset($this->request->get['squareup_settings'])) {
                $this->responseRedirect(sprintf($this->config->get('squareup_admin_url_settings'), $append_token));
            } else {
                $this->responseRedirect(sprintf($this->config->get('squareup_admin_url_transaction'), (int)$this->request->get['squareup_transaction_id'], $append_token));
            }
        }
    }

    public function deleteSquareCatalog(){

        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
        
        $this->load->library('squareup');
        
        do {
            $cursor = isset($result['cursor']) ? $result['cursor'] : '';
            $types = array('ITEM');

            $result = $this->squareup_api->listCatalog($cursor, $types);

            if (isset($result['objects']) && is_array($result['objects'])) {
                $ids = array_column($result['objects'], 'id');
                $this->squareup_api->batchDeleteCatalog(["object_ids" => $ids]);
            }
        } while (isset($result['cursor']));

        exit;
    }
    public function cron() {
        $this->imodule_model_payment->setDetailedExceptionHandler();

        $this->loadLibrary('vendor/isenselabs/squareup');

        $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_INVALID;

        register_shutdown_function(function() use (&$flag) {
            $this->imodule_model_payment->setEndCronFlags($flag);
        });

        if ($this->imodule_model_payment->validateCRON()) {
            try {
                if ($this->config->get('squareup_cron_is_running') && $this->imodule_model_payment->cronHasTimedOut()) {
                    throw new vendor\isenselabs\Squareup\Exception\Timeout("The CRON task has timed out.");
                } else if (!$this->config->get('squareup_cron_is_running')) {
                    if ($this->config->get('squareup_cron_is_on_demand')) {
                        $this->imodule_model_payment->setBeginCronFlags(ModelExtensionPaymentSquareup::CRON_STARTED_FLAG_ON_DEMAND);

                        if ($this->config->get('squareup_debug')) {
                            $this->log->write("SQUAREUP SYNC: ON-DEMAND");
                        }

                        // On-demand sync - after pressing the button in the admin panel
                        $this->on_demand_sync();

                        $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_COMPLETE;
                    } else if ($this->imodule_model_payment->oneCronStandardPeriodHasPassed()) {
                        $this->imodule_model_payment->setBeginCronFlags(ModelExtensionPaymentSquareup::CRON_STARTED_FLAG_STANDARD);

                        if ($this->config->get('squareup_debug')) {
                            $this->log->write("SQUAREUP SYNC: STANDARD");
                        }

                        // Standard periodic sync, ran every cron stantard period (set from the admin panel)
                        $this->standard_sync();

                        $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_COMPLETE;
                    } else if ($this->imodule_model_payment->oneCronInventoryPeriodHasPassed()) {
                        $this->imodule_model_payment->setBeginCronFlags(ModelExtensionPaymentSquareup::CRON_STARTED_FLAG_INVENTORY);

                        if ($this->config->get('squareup_debug')) {
                            $this->log->write("SQUAREUP SYNC: INVENTORY");
                        }

                        // Inventory periodic sync, ran every cron inventory period
                        $this->inventory_sync();

                        $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_COMPLETE;
                    }
                }
            } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                if ($this->config->get('squareup_debug')) {
                    $this->log->write("SQUAREUP CRON API ERROR: " . implode(PHP_EOL, $e->getMessages()));
                }

                $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_ERROR;
            } catch (vendor\isenselabs\Squareup\Exception\Timeout $e) {
                if ($this->config->get('squareup_debug')) {
                    $this->log->write("SQUAREUP CRON TIMEOUT: " . $e->getMessage());
                }

                $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_TIMEOUT;
            } catch (\Exception $e) {
                if ($this->config->get('squareup_debug')) {
                    $this->log->write("SQUAREUP CRON ERROR: " . $e->getMessage());
                }

                $flag = ModelExtensionPaymentSquareup::CRON_ENDED_FLAG_ERROR;
            }
        }

        $this->imodule_model_payment->setEndCronFlags($flag);
    }

    protected function catalog_sync() {
        $result = array(
            'sync_success' => '',
            'sync_warning' => '',
            'sync_error' => ''
        );
        $square_location_currency = $this->squareup_api->getLocationCurrency(null);

        // Catalog sync
        try {
            $source = $this->config->get('squareup_sync_source');

            if ($this->config->get('config_currency') !== $square_location_currency) {
                throw new \Exception(sprintf($this->language->get('error_currency_mismatch'), $square_location_currency));
            }
            // Deprecated - should be used when we implement a Catalog sync in the direction Square > OpenCart
            // if (!$this->config->get('squareup_initial_sync')) {
            //     if ($this->config->get('squareup_initial_sync_type') == '4' && $source == 'square') {
            //         $source = 'opencart';
            //     } else if ($this->config->get('squareup_initial_sync_type') == '2' && $source == 'opencart') {
            //         $source = 'square';
            //     }
            // }

            if ($source != 'none') {
                $sync_result = $this->squareup_diff->executeSync($source);

                $result['sync_success'] = $sync_result['success'];

                $result['sync_warning'] = $sync_result['warning'];
            } else {
                $result['sync_success'] = $this->language->get('text_sync_disabled');
            }
        } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
            $result['sync_error'] = implode('<br />', $e->getMessages());
        } catch (\Exception $e) {
            $result['sync_error'] = $e->getMessage();
        }

        // Deprecated - should be used when we implement a Catalog sync in the direction Square > OpenCart

        // $new_tax_rates = $this->imodule_model_payment->getNewTaxRates();

        // $this->imodule_model_payment->newTaxRatesEmail($new_tax_rates);

        $this->imodule_model_payment->syncIssuesEmail($result['sync_warning']);

        return $result;
    }

    protected function inventory_sync() {
        $this->squareup_diff->syncInventories();
    }

    protected function on_demand_sync() {
        $result = array(
            'token_update_error' => '',
            'sync_success' => '',
            'sync_warning' => '',
            'sync_error' => ''
        );

        $result['token_update_error'] = $this->imodule_model_payment->updateToken();

        $result = array_merge($result, $this->catalog_sync());

        if ($this->config->get('squareup_cron_email_status')) {
            $this->imodule_model_payment->cronEmail($result);
        }
    }

    protected function standard_sync() {
        $result = array(
            'transaction_success' => array(),
            'transaction_error' => array(),
            'transaction_fail' => array(),
            'token_update_error' => '',
            'sync_success' => '',
            'sync_warning' => '',
            'sync_error' => ''
        );

        $expirations = array(
            'expired_authorized_transactions' => array(),
            'expiring_authorized_transactions' => array()
        );

        // Update token
        $result['token_update_error'] = $this->imodule_model_payment->updateToken();

        // Catalog Sync
        $result = array_merge($result, $this->catalog_sync());

        // Recurring
        $this->load->model('checkout/order');

        foreach ($this->imodule_model_payment->nextRecurringPayments() as $payment) {
            if ($this->imodule_model_payment->cronHasTimedOut()) {
                throw new vendor\isenselabs\Squareup\Exception\Timeout("The recurring payments task has timed out.");
            }

            try {
                if (!$payment['card_saved_on_file']) {
                   throw new \Squareup\Exception\Api($this->registry, "The payment with orderID:" . $payment['order_id']. " has no card saved on file. For recurring payments to work, the buyer must re-subscribe for this order by saving the credit card on file.");
                }
                if (!$payment['is_free']) {
                    $transaction = $this->squareup_api->addTransaction($payment['transaction']);

                    $transaction_status = !empty($transaction['card_details']['status']) ?
                        strtolower($transaction['card_details']['status']) : '';

                    $target_currency = $transaction['amount_money']['currency'];

                    $amount = $this->squareup_api->standardDenomination($transaction['amount_money']['amount'], $target_currency);

                    $this->imodule_model_payment->addTransaction($transaction, $this->config->get('squareup_merchant_id'), $payment['billing_address'], $payment['order_id'], "CRON JOB", "127.0.0.1");

                    $reference = $transaction['id'];
                } else {
                    $amount = 0;
                    $target_currency = $this->config->get('config_currency');
                    $reference = '';
                    $transaction_status = 'captured';
                }

                $success = $transaction_status == 'captured';

                $this->imodule_model_payment->addRecurringTransaction($payment['order_recurring_id'], $reference, $amount, $success);

                $trial_expired = false;
                $recurring_expired = false;
                $profile_suspended = false;

                if ($success) {
                    $trial_expired = $this->imodule_model_payment->updateRecurringTrial($payment['order_recurring_id']);

                    $recurring_expired = $this->imodule_model_payment->updateRecurringExpired($payment['order_recurring_id']);

                    $result['transaction_success'][$payment['order_recurring_id']] = $this->currency->format($amount, $target_currency);
                } else {
                    // Transaction was not successful. Suspend the recurring profile.
                    $profile_suspended = $this->imodule_model_payment->suspendRecurringProfile($payment['order_recurring_id']);

                    $result['transaction_fail'][$payment['order_recurring_id']] = $this->currency->format($amount, $target_currency);
                }


                $order_status_id = $this->config->get('squareup_status_' . $transaction_status);

                if ($order_status_id) {
                    if (!$payment['is_free']) {
                        $order_status_comment = $this->language->get('squareup_status_comment_' . $transaction_status);
                    } else {
                        $order_status_comment = '';
                    }

                    if ($profile_suspended) {
                        $order_status_comment .= $this->language->get('text_squareup_profile_suspended');
                    }

                    if ($trial_expired) {
                        $order_status_comment .= $this->language->get('text_squareup_trial_expired');
                    }

                    if ($recurring_expired) {
                        $order_status_comment .= $this->language->get('text_squareup_recurring_expired');
                    }

                    if ($success) {
                        $notify = (bool)$this->config->get('squareup_notify_recurring_success');
                    } else {
                        $notify = (bool)$this->config->get('squareup_notify_recurring_fail');
                    }

                    $this->model_checkout_order->{$this->config->get('squareup_imodule_update_order_history_method')}($payment['order_id'], $order_status_id, trim($order_status_comment), $notify);
                }
            } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                $result['transaction_error'][] = '[ID: ' . $payment['order_recurring_id'] . '] - ' . implode('<br />', $e->getMessages());
            } catch (\Exception $e) {
                $result['transaction_error'][] = '[ID: ' . $payment['order_recurring_id'] . '] - ' . $e->getMessage();
            }
        };

        // Transactions
        $this->load->model('checkout/order');

        foreach ($this->imodule_model_payment->getExpiringAuthorizedTransactions() as $expiring_authorized_transaction) {
            if ($this->imodule_model_payment->cronHasTimedOut()) {
                throw new vendor\isenselabs\Squareup\Exception\Timeout("The expiring transactions task has timed out.");
            }

            $new_transaction = $this->squareup_api->getTransaction($expiring_authorized_transaction['location_id'], $expiring_authorized_transaction['transaction_id']);

            $status = $new_transaction['card_details']['status'];
            $refunds = !empty($new_transaction['refunds']) ? $new_transaction['refunds'] : array();

            $this->imodule_model_payment->updateTransaction($expiring_authorized_transaction['squareup_transaction_id'], $status, $refunds);

            $order_info = $this->model_checkout_order->getOrder($expiring_authorized_transaction['order_id']);

            $transaction_data = array(
                'transaction_id' => $expiring_authorized_transaction['transaction_id'],
                'order_id' => $expiring_authorized_transaction['order_id'],
                'customer_name' => trim($order_info['firstname']) . ' ' . trim($order_info['lastname']),
                'transaction_url' => $this->url->link($this->imodule_route_payment . '/info', 'squareup_transaction_id=' . $expiring_authorized_transaction['squareup_transaction_id'] . '&cron_token=' . $this->config->get('squareup_cron_token'), $this->getUrlSsl())
            );

            if ($status != 'AUTHORIZED') {
                $expirations['expired_authorized_transactions'][] = $transaction_data;

                $order_status_id = $this->config->get('squareup_status_' . strtolower($status));

                $order_status_comment = $this->language->get('squareup_status_comment_' . strtolower($status));

                $this->model_checkout_order->{$this->config->get('squareup_imodule_update_order_history_method')}($expiring_authorized_transaction['order_id'], $order_status_id, $order_status_comment, true);
            } else {
                $expirations['expiring_authorized_transactions'][] = $transaction_data;
            }
        }

        $this->imodule_model_payment->expirationEmail($expirations);

        if ($this->config->get('squareup_cron_email_status')) {
            $this->imodule_model_payment->cronEmail($result);
        }
    }

    // A webhook is NOT triggered in case a product "track inventory" has been disabled from the Square Dashboard.

    public function webhook() {
        if (!$this->isSSL()) {
            return;
        }

        if (empty($this->request->server['HTTP_X_SQUARE_SIGNATURE'])) {
            return;
        }

        $payload = file_get_contents('php://input');

        $stringToSign = $this->config->get('squareup_webhook_url_static') . $payload;

        $stringSignature = base64_encode(hash_hmac('sha1', $stringToSign, $this->config->get('squareup_webhook_signature'), true));

        $this->load->helper('vendor/isenselabs/squareup/hash_equals');

        if (!hash_equals($stringSignature, $this->request->server['HTTP_X_SQUARE_SIGNATURE'])) {
            return;
        }

        if ($this->config->get('squareup_cron_is_running')) {
            return;
        }

        if ($this->config->get('squareup_debug')) {
            $this->log->write('SQUAREUP WEBHOOK: ' . $payload);
        }

        $data = json_decode($payload, true);

        if ($data['type'] == 'inventory.count.updated') {
            if ($this->config->get('squareup_inventory_sync') != 'none') {
                $this->loadLibrary('vendor/isenselabs/squareup');

                $this->squareup_diff->syncInventories(true);
            }
        }
    }

    public function recurringButtons() {
        // Only in OpenCart 2.x
        return $this->load->controller($this->config->get('squareup_imodule_route_recurring'));
    }

    public function recurringCancel() {
        // Only in OpenCart 1.5.x
        $this->getChild($this->config->get('squareup_imodule_route_recurring') . '/cancel');
    }

    protected function validate() {
        if (empty($this->request->get['cron_token']) || $this->request->get['cron_token'] != $this->config->get('squareup_cron_token')) {
            return false;
        }

        if (empty($this->request->get['squareup_transaction_id']) && empty($this->request->get['squareup_settings'])) {
            return false;
        }

        if (!$this->config->get('squareup_admin_url_transaction')) {
            return false;
        }

        if (!$this->config->get('squareup_admin_url_settings')) {
            return false;
        }

        return true;
    }
	
	public function getTotals (){
		$this->loadLibrary('vendor/isenselabs/squareup');
		$location_currency = $this->squareup_api->getLocationCurrency(null);
		$data = array();
		$this->load->model('extension/extension');

		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;
		
		// Because __call can not keep var references so we put them into an array. 			
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
		
		// Display prices
		if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);
					
					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			$sort_order = array();

			foreach ($totals as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $totals);
		}

		$data['totals'] = array();

		foreach ($totals as $total) {
			if ($total['code'] !='total') {
				$dec_place = $this->currency->getDecimalPlace($location_currency);

				$amount = round($this->currency->convert($total['value'], $this->session->data['currency'], $location_currency), (int)$dec_place);

				$amount_formatted = number_format($amount, (int)$dec_place, $this->language->get('decimal_point'), $this->language->get('thousand_point'));
				$data['totals'][] = array(
					'title' => $total['title'],
					'text'  => $amount_formatted
				);
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($data));
	}
	
	public function setJS(&$route, &$data, &$template) {
		if($this->config->get('squareup_key_type') == 'sandbox'){
			$squareup_js_api = '<script src="https://sandbox.web.squarecdn.com/v1/square.js"></script>';
        } else {
			$squareup_js_api = '<script src="https://web.squarecdn.com/v1/square.js"></script>';
		}
		$template = str_replace('</head>', $squareup_js_api . '</head>', $template);
    }
}
