<?php

namespace vendor\isenselabs\Squareup\Compatibility\Traits;

trait Loader {
    protected function isInAdmin() {
        return basename(rtrim(DIR_TEMPLATE, '/\\')) == 'template';
    }

    protected function loadLibrary($route) {
        if (method_exists($this->load, 'library')) {
            $this->load->library($route);
        }

        $route = preg_replace('/[^a-zA-Z0-9_\/]/', '', (string)$route);
        $class = str_replace('/', '\\', $route);

        if (!$this->registry->has(basename($route))) {
            $this->registry->set(basename($route), new $class($this->registry));
        }
    }

    protected function getUrlSsl($value = true) {
        if (version_compare(VERSION, '2', '>=')) {
            return $value;
        } else {
            return $value ? 'SSL' : 'NONSSL';
        }
    }

    protected function loadView($route, $data) {
        if (version_compare(VERSION, '2.2.0.0', '>=')) {
            return $this->renderView($route, $data);
        } else {
            if ($this->isInAdmin()) {
                return $this->renderView($route . '.tpl', $data);
            } else {
                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/' . $route . '.tpl')) {
                    return $this->renderView($this->config->get('config_template') . '/template/' . $route . '.tpl', $data);
                } else {
                    return $this->renderView('default/template/' . $route . '.tpl', $data);
                }
            }
        }
    }

    private function renderView($tpl, $data) {
        if (version_compare(VERSION, '2.0.0.0', '>=')) {
            return $this->load->view($tpl, $data);
        } else {
            $this->template = $tpl;
            $this->data = $data;

            return $this->render();
        }
    }
}