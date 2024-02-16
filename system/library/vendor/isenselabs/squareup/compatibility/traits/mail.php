<?php

namespace vendor\isenselabs\Squareup\Compatibility\Traits;

trait Mail {
    protected function initMailObject() {
        if (VERSION >= '2.0.0.0' && VERSION < '2.0.2.0') {
            $mail = new \Mail($this->config->get('config_mail'));
        } else {
            $mail = new \Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');

            if (VERSION >= '2.0.2.0') {
                $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
                $mail->smtp_username = $this->config->get('config_mail_smtp_username');
                $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
                $mail->smtp_port = $this->config->get('config_mail_smtp_port');
                $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
            } else {
                $mail->hostname = $this->config->get('config_smtp_host');
                $mail->username = $this->config->get('config_smtp_username');
                $mail->password = $this->config->get('config_smtp_password');
                $mail->port = $this->config->get('config_smtp_port');
                $mail->timeout = $this->config->get('config_smtp_timeout');
            }
        }

        return $mail;
    }
}