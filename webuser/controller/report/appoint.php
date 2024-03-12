<?php
class ControllerReportAppoint extends Controller {
	public function index() {
		$this->load->language('report/appoint');

		$this->document->setTitle('Appointments');

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = date('Y-m-d', strtotime(date('Y') . '-' . date('m') . '-01'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = date('Y-m-d');
		}

		if (isset($this->request->get['filter_group'])) {
			$filter_group = $this->request->get['filter_group'];
		} else {
			$filter_group = 'week';
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['filter_group'])) {
			$url .= '&filter_group=' . $this->request->get['filter_group'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/appoint', 'token=' . $this->session->data['token'] . $url, true)
		);

		$this->load->model('report/consulting');
		$data['appoint'] = $this->model_report_consulting->getAllConsultingData();
	

		$order_total = $this->model_report_consulting->getTotalAppoint();

		

		$data['heading_title'] = "Appointment";

		$data['text_list'] = "Appointments List";
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_all_status'] = $this->language->get('text_all_status');

		$data['column_date_start'] = $this->language->get('column_date_start');
		$data['column_date_end'] = $this->language->get('column_date_end');
		$data['column_orders'] = $this->language->get('column_orders');
		$data['column_products'] = $this->language->get('column_products');
		$data['column_tax'] = $this->language->get('column_tax');
		$data['column_total'] = $this->language->get('column_total');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_group'] = $this->language->get('entry_group');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$data['groups'] = array();

		$data['groups'][] = array(
			'text'  => $this->language->get('text_year'),
			'value' => 'year',
		);

		$data['groups'][] = array(
			'text'  => $this->language->get('text_month'),
			'value' => 'month',
		);

		$data['groups'][] = array(
			'text'  => $this->language->get('text_week'),
			'value' => 'week',
		);

		$data['groups'][] = array(
			'text'  => $this->language->get('text_day'),
			'value' => 'day',
		);

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['filter_group'])) {
			$url .= '&filter_group=' . $this->request->get['filter_group'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/appoint', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_group'] = $filter_group;
		$data['filter_order_status_id'] = $filter_order_status_id;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/appoint', $data));
	}
	public function updatestatus() {
        // Check if the request is coming from AJAX
        if ($this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' && $this->request->server['REQUEST_METHOD'] == 'POST') {
            // Validate and sanitize the input data (orderId)
            $Id = isset($this->request->post['orderId']) ? (int)$this->request->post['orderId'] : 0;
//   echo $Id;
//   die();
            // Perform the status update in the database based on $orderId
            // Replace the following code with your actual database update logic
            $this->load->model('report/consulting');
            $this->model_report_consulting->updateStatus($Id);
            $requestData = $this->model_report_consulting->getConsultingDataById($Id);
			// $this->SendEmail($requestData);
            // Send a response (e.g., success message)
            $json['success'] = 'Status updated successfully';
            
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            // Handle non-AJAX requests or other cases
            // You may redirect to an error page or perform other actions
            $this->response->redirect($this->url->link('error/not_found', '', true));
        }
    }
	public function delete() {
        // Check if the request is coming from AJAX
        if ($this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' && $this->request->server['REQUEST_METHOD'] == 'POST') {
            // Validate and sanitize the input data (orderId)
            $Id = isset($this->request->post['orderId']) ? (int)$this->request->post['orderId'] : 0;
//   echo $Id;
//   die();
            // Perform the status update in the database based on $orderId
            // Replace the following code with your actual database update logic
            $this->load->model('report/consulting');
            $this->model_report_consulting->delete($Id);
            $requestData = $this->model_report_consulting->getConsultingDataById($Id);
			// $this->SendEmail($requestData);
            // Send a response (e.g., success message)
            $json['success'] = 'Status updated successfully';
            
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
        } else {
            // Handle non-AJAX requests or other cases
            // You may redirect to an error page or perform other actions
            $this->response->redirect($this->url->link('error/not_found', '', true));
        }
    }
	protected function SendEmail($requestData) {
		
		$response = array();
	// echo "<pre>";
	// print_r($requestData);
	// echo "</pre>";
		if ($requestData) {
		
			// $this->send_email(
			// 	$requestData['currentTime'],
			// 	$requestData['currentTimezone'],
			// 	$requestData['selectedTime'],
			// 	$requestData['selectedDate'],
			// 	$requestData['userEmail'],
			// 	$requestData['userName'],
			// 	$requestData['meetingTitle'],
			// 	$requestData['userMessage']
			// );

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		
			// $mail->setTo('radhika@zaynjewels.com'); // Adjust recipient email address as needed
			$mail->setTo($requestData['userEmail']);
		
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Confirmation of your appointment booking with Zayn Jewels");
		  
		
			$message .= "Hello". $requestData['userName'] ." ,\n\n";
		
			$message .= "Your appointment has been confirmed with Zayn Jewels. \n\n";
			
		
			$message .= "Look forward to meeting with you. \n\n";
		
			$message .= "Best ,\n\n";
			
			$message .= "-Team Zayn Jewels\n\n";
			$message .= "Note : You can reschedule your appointment anytime by clicking here https://zaynjewels.com/index.php?route=common/consulting \n\n";
			
		
			
			 $mail->setText($message);
			$mail->send();


		} else {
			$response['error'] = 'Validation failed';
			// You can customize this message
		}
	

	return $response;
}
}