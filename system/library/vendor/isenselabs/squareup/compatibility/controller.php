<?php

namespace vendor\isenselabs\Squareup\Compatibility;

use \Controller as OpenCartController;

class Controller extends OpenCartController {
    use Traits\Loader;
    use Traits\Mail;

    public function __construct($registry) {
        parent::__construct($registry);

        // Load config
        $this->load->config('vendor/isenselabs/squareup/compatibility');

        if ($this->isInAdmin() && version_compare(VERSION, '2.0.0.0', '<') && stripos($this->request->get['route'], $this->config->get('squareup_imodule_route_payment')) === 0) {
            if ($this->isSSL()) {
                $server = HTTPS_SERVER;
            } else {
                $server = HTTP_SERVER;
            }

            $this->document->addStyle($server . 'view/stylesheet/vendor/isenselabs/squareup/font-awesome.css');
            $this->document->addStyle($server . 'view/stylesheet/vendor/isenselabs/squareup/bootstrap.css');
            $this->document->addStyle($server . 'view/stylesheet/vendor/isenselabs/squareup/squareup.css');
            $this->document->addScript($server . 'view/javascript/vendor/isenselabs/squareup/bootstrap.min.js');
            $this->document->addScript($server . 'view/javascript/vendor/isenselabs/squareup/squareup.js');
        }
    }

    protected function loadAdminChildren(&$data) {
        if (version_compare(VERSION, '2.0.0.0', '>=')) {
            $data['header'] = $this->load->controller('common/header');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['footer'] = $this->load->controller('common/footer');
        } else {
            $data['column_left'] = '';

            $this->children = array(
                'common/header',
                'common/footer'
            );
        }
    }

    protected function loadCatalogChildren(&$data) {
        if (version_compare(VERSION, '2.0.0.0', '>=')) {
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
        } else {
            $this->children = array(
                'common/column_left',
                'common/column_right',
                'common/content_top',
                'common/content_bottom',
                'common/footer',
                'common/header'
            );
        }
    }

    protected function isSSL() {
        if (version_compare(VERSION, '2.0.0.0', '>=')) {
            return $this->request->server['HTTPS'];
        } else {
            return isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'));
        }
    }

    protected function responseRedirect($url) {
        if (version_compare(VERSION, '2.0.0.0', '>=')) {
            $this->response->redirect($url);
        } else {
            $this->redirect($url);
        }
    }
}