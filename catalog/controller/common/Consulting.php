<?php
class ControllerCommonConsulting extends Controller
{
	public function index()
	{
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		//banner-top
		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['banners'] = array();

		$results = $this->model_design_banner->getBanner(14);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '2700', '1150')
				);
			}
		}


		//banner-mobile


		$data['banners2'] = array();

		$results = $this->model_design_banner->getBanner(15);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['banners2'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '900', '1200')
				);
			}
		}


		//banner-Intro
		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['bannersintro'] = array();

		$results = $this->model_design_banner->getBanner(10);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['bannersintro'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '1410', '470')
				);
			}
		}

		$this->load->model('account/consulting');
		$condata = $this->model_account_consulting->getAllConsultingData();
		if ($condata == null) {
			$data['con'][] = array(
				'current_timezone' => '1',
				'selected_time'  => '00',
				'selected_date' => '0'
			);
		}else{
			$data['con'] = $this->model_account_consulting->getAllConsultingData();
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/consulting', $data));
	}
	public function con_form() {
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
		// echo "<pre>";
		// print_r($requestData);
		// echo "</pre>";
			if ($requestData) {
				$this->load->model('account/consulting');
			
				// Call the model method to save consulting data
				$this->model_account_consulting->saveConsultingData($requestData['currentTime'],$requestData['currentTimezone'], 
				 $requestData['selectedTime'],$requestData['selectedDate'],$requestData['userEmail'],
				$requestData['userName'],$requestData['meetingTitle'],$requestData['usermessage']);
			


				$this->send_email(
					$requestData['currentTime'],
					$requestData['currentTimezone'],
					$requestData['selectedTime'],
					$requestData['selectedDate'],
					$requestData['userEmail'],
					$requestData['userName'],
					$requestData['meetingTitle'],
					$requestData['usermessage']
				);

				$response = $requestData;
			} else {
				$response['error'] = 'Validation failed';
				// You can customize this message
			}
		
	
		return $response;
	}
	public function send_email($currentTime, $currentTimezone, $selectedTime, $selectedDate, $userEmail, $userName, $meetingTitle, $usermessage)
{
    $mail = new Mail();
    $mail->protocol = $this->config->get('config_mail_protocol');
    $mail->parameter = $this->config->get('config_mail_parameter');
    $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
    $mail->smtp_username = $this->config->get('config_mail_smtp_username');
    $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
    $mail->smtp_port = $this->config->get('config_mail_smtp_port');
    $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

    // $mail->setTo('radhika@zaynjewels.com'); // Adjust recipient email address as needed
    $mail->setTo($userEmail);

    $mail->setFrom($this->config->get('config_email'));
    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
    $mail->setSubject("Appointment Confirmation -" . $userName . "\n");
	$mail->setReplyTo($userEmail);   
	
	$message .= "Hello Team Zayn Jewels,\n\n";
	
	$message .= "You have a new appointment booking through the website. Below are the details of the appointment:,\n\n";
	$message .= "Full Name- " . $userName . "\n\n";
	$message .= "Date- " . $selectedDate . "\n\n";
	$message .= "Time- " . $selectedTime . "\n\n";
	$message .= "Time Zone- " .$currentTimezone . "\n\n";
	$message .= "Subject- " . $meetingTitle . "\n\n";
	$message .= "Message- " . $usermessage . "\n\n";
	$message .= "Email- " . $userEmail . "\n\n";
	$message .= "\n\n";
	$message .= "Please take a moment to review this information and confirm the appointment at your earliest convenience.\n\n";
	

    
     $mail->setText($message);

    $mail->send();
	$this->send_email_user(
		$currentTime,
		$currentTimezone,
		$selectedTime,
		$selectedDate,
		$userEmail,
		$userName,
		$meetingTitle,
		$usermessage
	);



}
	public function send_email_user($currentTime, $currentTimezone, $selectedTime, $selectedDate, $userEmail, $userName, $meetingTitle, $usermessage)
{
    
    $mail = new Mail();
    $mail->protocol = $this->config->get('config_mail_protocol');
    $mail->parameter = $this->config->get('config_mail_parameter');
    $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
    $mail->smtp_username = $this->config->get('config_mail_smtp_username');
    $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
    $mail->smtp_port = $this->config->get('config_mail_smtp_port');
    $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

    // $mail->setTo('radhika@zaynjewels.com'); // Adjust recipient email address as needed
    $mail->setTo($userEmail);

    $mail->setFrom($this->config->get('config_email'));
    $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
    $mail->setSubject("Confirmation of your appointment booking with Zayn Jewels");
  

	$message .= "Dear". $userName ." ,\n\n";

	$message .= "We are delighted to confirm that we have received your appointment booking through our website. We look forward to assisting you.\n\n";
	$message .= "Here are the details of your upcoming appointment:\n\n";

	$message .= "Appointment with-Zayn Jewels https://zaynjewels.com/ \n\n";
	
	$message .= "Date- " . $selectedDate . "\n\n";
	$message .= "Time- " . $selectedTime . "\n\n";
	$message .= "Time Zone- " .$currentTimezone . "\n\n";
	$message .= "Subject- " . $meetingTitle . "\n\n";
	$message .= "Message- " . $usermessage . "\n\n";
	$message .= "Email- " . $userEmail . "\n\n";

	$message .= "If you need to make any changes to your appointment or have any specific requirements, please do not hesitate to reply to this email.\n\n";

	$message .= "Best regards,\n\n";
	
	$message .= "-Team Zayn Jewels\n\n";
	

    
     $mail->setText($message);
    $mail->send();
}
}
