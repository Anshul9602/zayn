<?php
class ControllerCommonConsultingForm extends Controller {
	public function index() {
		$this->load->language('common/Consulting_form');
		$this->document->setTitle($this->language->get('heading_title'));
	
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$requestData = json_decode(file_get_contents('php://input'), true);
			$response = $this->validateAndSendEmail($requestData);
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($response));
		}
	}
	
	protected function validateAndSendEmail($requestData) {
		$response = array();
	
		if ($requestData) {
			// Debug: Print all POST data
			echo '<pre>';
			print_r($requestData);
			echo '</pre>';
	
			
			$response['success'] = true;
		} else {
			$response['error'] = 'Validation failed';
			// You can customize this message
		}
	
		return $response;
	}
}