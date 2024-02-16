<?php

namespace vendor\isenselabs\Squareup;

class Library {
    use Compatibility\Traits\Loader;
    use Compatibility\Traits\Mail;

    protected $registry;

    public function __construct($registry) {
        $this->registry = $registry;
    }

    public function __get($key) {
        return $this->registry->get($key);
    }

    public function __set($key, $value) {
        $this->registry->set($key, $value);
    }

    public function loadPaymentModel() {
        $this->load->model($this->config->get('squareup_imodule_route_payment'));

        $this->imodule_model_payment = $this->{$this->config->get('squareup_imodule_model_payment')};
    }
}