<?php

namespace vendor\isenselabs\Squareup\Compatibility\Model;

use \vendor\isenselabs\Squareup\Compatibility\Model as SquareModel;

class Credit_Card extends SquareModel {
    protected $imodule_route_credit_card;

    public function __construct($registry) {
        // Construct the OC model
        parent::__construct($registry);

        // Load config
        $this->load->config('vendor/isenselabs/squareup/compatibility');

        // Set some config values
        $this->imodule_route_credit_card = $this->config->get('squareup_imodule_route_credit_card');
    }
}