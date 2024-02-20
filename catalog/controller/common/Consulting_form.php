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
			// $currentTime = $requestData['currentTime'];
			// $currentTimezone = $requestData['currentTimezone'];
			// $selectedDate = $requestData['selectedDate'];
			// $userEmail = $requestData['userEmail'];

		
		
			if ($requestData) {
				$this->load->model('account/consulting');
			
				// Call the model method to save consulting data
				$this->model_account_consulting->saveConsultingData($requestData['currentTime'],
				 $requestData['currentTimezone'], 
				 $requestData['selectedTime'],				
				$requestData['selectedDate'], $requestData['userEmail']);
			
				$response = $requestData;
			} else {
				$response['error'] = 'Validation failed';
				// You can customize this message
			}
		
	
		return $response;
	}
	
}