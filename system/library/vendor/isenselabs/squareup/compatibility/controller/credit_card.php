<?php

namespace vendor\isenselabs\Squareup\Compatibility\Controller;

use \vendor\isenselabs\Squareup\Compatibility\Controller as SquareController;

class Credit_Card extends SquareController {
    protected $imodule_route_credit_card;
    protected $imodule_model_credit_card;
    protected $imodule_language_credit_card;

    public function __construct($registry) {
        // Construct the OC controller
        parent::__construct($registry);

        // Load config
        $this->load->config('vendor/isenselabs/squareup/compatibility');

        // Set some config values
        $this->imodule_route_credit_card = $this->config->get('squareup_imodule_route_credit_card');

        // Load the model
        $this->load->model($this->imodule_route_credit_card);

        // Init the model and language
        $this->imodule_model_credit_card = $this->{$this->config->get('squareup_imodule_model_credit_card')};
        $this->imodule_language_credit_card = $this->load->language($this->imodule_route_credit_card);
    }
}