<?php

use vendor\isenselabs\Squareup\Compatibility\Controller\Recurring as Controller;

class ControllerExtensionRecurringSquareup extends Controller {
    public function index() {
        $this->load->model('account/recurring');

        $data = $this->imodule_language_recurring;

        if (isset($this->request->get[$this->config->get('squareup_imodule_recurring_id_get_parameter')])) {
            $order_recurring_id = $this->request->get[$this->config->get('squareup_imodule_recurring_id_get_parameter')];
        } else {
            $order_recurring_id = 0;
        }
        
        $recurring_info = $this->model_account_recurring->{$this->config->get('squareup_imodule_recurring_get_method_name')}($order_recurring_id);
        
        if ($recurring_info) {
            $data['cancel_url'] = html_entity_decode($this->url->link($this->imodule_route_recurring . '/cancel', 'order_recurring_id=' . $order_recurring_id, 'SSL'), ENT_QUOTES, "UTF-8");

            $data['continue'] = $this->url->link('account/recurring', '', $this->getUrlSsl());    
            
            if ($recurring_info['status'] == ModelExtensionPaymentSquareup::RECURRING_ACTIVE) {
                $data['order_recurring_id'] = $order_recurring_id;
            } else {
                $data['order_recurring_id'] = '';
            }

            return $this->loadView($this->imodule_route_recurring, $data);
        }
    }
    
    public function cancel() {
        $this->load->model('account/recurring');

        if (isset($this->request->get[$this->config->get('squareup_imodule_recurring_id_get_parameter')])) {
            $order_recurring_id = $this->request->get[$this->config->get('squareup_imodule_recurring_id_get_parameter')];
        } else {
            $order_recurring_id = 0;
        }

        $json = array();
        
        $recurring_info = $this->model_account_recurring->{$this->config->get('squareup_imodule_recurring_get_method_name')}($order_recurring_id);

        if ($recurring_info) {
            $this->{$this->config->get('squareup_imodule_recurring_edit_model')}->editOrderRecurringStatus($order_recurring_id, ModelExtensionPaymentSquareup::RECURRING_CANCELLED);

            $this->load->model('checkout/order');

            $order_info = $this->model_checkout_order->getOrder($recurring_info['order_id']);

            $this->model_checkout_order->{$this->config->get('squareup_imodule_update_order_history_method')}($recurring_info['order_id'], $order_info['order_status_id'], $this->language->get('text_order_history_cancel'), true);

            $json['success'] = $this->language->get('text_canceled');
        } else {
            $json['error'] = $this->language->get('error_not_found');
        }

        if (version_compare(VERSION, '2.0.0.0', '<')) {
            if (!empty($json['success'])) {
                $this->session->data['success'] = $json['success'];
            }

            if (!empty($json['error'])) {
                $this->session->data['error'] = $json['error'];
            }

            $this->responseRedirect($this->url->link('account/recurring/info', $this->config->get('squareup_imodule_recurring_id_get_parameter') . '=' . $this->request->get[$this->config->get('squareup_imodule_recurring_id_get_parameter')], $this->getUrlSsl()));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
}