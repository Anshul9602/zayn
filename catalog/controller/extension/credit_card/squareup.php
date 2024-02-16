<?php

use vendor\isenselabs\Squareup\Compatibility\Controller\Credit_Card as Controller;

class ControllerExtensionCreditCardSquareup extends Controller {
    public function index() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/account', '', $this->getUrlSsl());

            $this->responseRedirect($this->url->link('account/login', '', $this->getUrlSsl()));
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $data = $this->imodule_language_credit_card;

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'separator' => '',
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_account'),
            'separator' => ' » ',
            'href' => $this->url->link('account/account', '', $this->getUrlSsl())
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'separator' => ' » ',
            'href' => $this->url->link($this->imodule_route_credit_card, '', $this->getUrlSsl())
        );

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        } 

        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];

            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        } 

        $data['back'] = $this->url->link('account/account', '', $this->getUrlSsl());

        $data['cards'] = array();

        foreach ($this->imodule_model_credit_card->getCards($this->customer->getId()) as $card) {
            $data['cards'][] = array(
                'text' => sprintf($this->language->get('text_card_ends_in'), $card['brand'], $card['ends_in']),
                'delete' => $this->url->link($this->imodule_route_credit_card . '/forget', 'squareup_token_id=' . $card['squareup_token_id'], $this->getUrlSsl())
            );
        }

        $this->loadCatalogChildren($data);
        
        $this->response->setOutput($this->loadView($this->imodule_route_credit_card, $data));
    }

    public function forget() {
        if (!$this->customer->isLogged()) {
            $this->session->data['redirect'] = $this->url->link('account/account', '', $this->getUrlSsl());

            $this->responseRedirect($this->url->link('account/login', '', $this->getUrlSsl()));
        }

        $this->loadLibrary('vendor/isenselabs/squareup');

        $squareup_token_id = !empty($this->request->get['squareup_token_id']) ?
            $this->request->get['squareup_token_id'] : 0;

        if ($this->imodule_model_credit_card->verifyCardCustomer($squareup_token_id, $this->customer->getId())) {
            $card_info = $this->imodule_model_credit_card->getCard($squareup_token_id);

            $customer_info = $this->imodule_model_credit_card->getCustomer($this->customer->getId());
            
            try {
                $this->squareup_api->deleteCard($customer_info['square_customer_id'], $card_info['token']);
                
                $this->imodule_model_credit_card->deleteCard($squareup_token_id);
                
                // This card has been deleted. Set the default card to the first available one
                $first_squareup_token_id = $this->imodule_model_credit_card->getFirstTokenId($this->customer->getId());
                $this->imodule_model_credit_card->updateDefaultCustomerToken($this->customer->getId(), $first_squareup_token_id);

                $this->session->data['success'] = $this->language->get('text_success_card_delete');
            } catch (vendor\isenselabs\Squareup\Exception\Api $e) {
                $this->session->data['error'] = $e->getMessage();
            }
        }

        $this->responseRedirect($this->url->link($this->imodule_route_credit_card, '', $this->getUrlSsl()));
    }
}