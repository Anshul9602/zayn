<?php

namespace vendor\isenselabs\Squareup\Compatibility\Controller;

use \vendor\isenselabs\Squareup\Compatibility\Controller as SquareController;

class Recurring extends SquareController {
    protected $imodule_route_recurring;
    protected $imodule_model_recurring;
    protected $imodule_language_recurring;

    public function __construct($registry) {
        // Construct the OC controller
        parent::__construct($registry);

        // Load config
        $this->load->config('vendor/isenselabs/squareup/compatibility');

        // Set some config values
        $this->imodule_route_recurring = $this->config->get('squareup_imodule_route_recurring');

        // Load the payment model
        $this->load->model($this->config->get('squareup_imodule_route_payment'));

        // Init the language
        $this->imodule_language_recurring = $this->load->language($this->imodule_route_recurring);
    }
}