<?php
require '../vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

class ControllerReportWishCatalog extends Controller
{


	public function index()
	{
		$this->load->language('report/wish_catalog');

		$this->document->setTitle('Wishlist Catalog');

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
			'href' => $this->url->link('report/wish_catalog', 'token=' . $this->session->data['token'] . $url, true)
		);

		$this->load->model('report/wishcat');
		$data['appoint'] = $this->model_report_wishcat->getAllCatalogData();



		$order_total = $this->model_report_wishcat->getTotalcat();



		$data['heading_title'] = "Wishlist Catalog";

		$data['text_list'] = "Wishlist Catalogs List";
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
			'text' => $this->language->get('text_year'),
			'value' => 'year',
		);

		$data['groups'][] = array(
			'text' => $this->language->get('text_month'),
			'value' => 'month',
		);

		$data['groups'][] = array(
			'text' => $this->language->get('text_week'),
			'value' => 'week',
		);

		$data['groups'][] = array(
			'text' => $this->language->get('text_day'),
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
		$pagination->url = $this->url->link('report/wish_catalog', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_group'] = $filter_group;
		$data['filter_order_status_id'] = $filter_order_status_id;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/wish_catalog', $data));
	}
	public function updatestatus()
	{
		// Check if the request is coming from AJAX
		if ($this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' && $this->request->server['REQUEST_METHOD'] == 'POST') {
			// Validate and sanitize the input data (orderId)
			$Id = isset($this->request->post['orderId']) ? (int) $this->request->post['orderId'] : 0;
			//   echo $Id;
			//   die();
			// Perform the status update in the database based on $orderId
			// Replace the following code with your actual database update logic
			$this->load->model('report/wishcat');

			$requestData = $this->model_report_wishcat->getcatalogDataById($Id);

			// echo json_encode($requestData); 

			$pdf1 = $this->generatePdf($requestData);
			// echo $pdf;

			if ($pdf1 == true) {
				$pdf = HTTP_CATALOG . 'savepdf/wishcatalog-' . $Id . '.pdf';
			}
			$this->model_report_wishcat->updateStatus($Id,$pdf);
			// die();
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
	public function generatePdf($requestData)
	{
		// Add Dompdf and options use statements
		// Set up Dompdf options
		$options = new Options();
		$options->set('isRemoteEnabled', true);
		$dompdf = new Dompdf($options);

		// Fetch wishlist data
		$wishlist = $requestData;

		$id = $wishlist[0]['id'];

		// Generate HTML content for the first page
		$html = '
    <html>
    <head>
        <style>
            .product-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                page-break-inside: avoid;
            }
            .product {
                flex: 0 0 48%;
                margin: 1%;
                box-sizing: border-box;
                page-break-inside: avoid;
            }
            .product img {
                width: 100%;
                border-bottom: 1px solid lightgoldenrodyellow;
            }
            .product .content {
                text-align: center;
                padding: 10px;
            }
            .page {
                page-break-after: always;
            }
        </style>
    </head>
    <body>
        <div id="content">
            <div class="page-header">
                <div class="container">
                    <div class="row">
                        <img src="' . HTTP_CATALOG . 'image/pag1.jpg" alt="" width="100%">
                    </div>
                </div>
            </div>
        </div>
        <div class="page">';

		$count = 0;

		foreach ($wishlist as $item) {
			$productData = json_decode($item['product_data'], true);

			foreach ($productData as $product) {
				if ($count % 2 == 0) {
					$html .= '<div class="product-container">';
				}

				$imageUrl = htmlspecialchars($product['productimg']);
				$html .= '
            <div class="product">
                <img src="' . $imageUrl . '">
                <div class="content">
                    <a href="' . htmlspecialchars($product['producturl']) . '" style="color:#000;">' . htmlspecialchars($product['productname']) . '</a>
                    <h5 class="pt-3" style="margin-bottom: 0.5rem;">Design No : ' . htmlspecialchars($product['productstyle']) . '</h5>
                    <h5 style="margin-bottom: 0.5rem;">Diamond : ' . htmlspecialchars($product['productdesign']) . '</h5>
                    <h5 style="margin-bottom: 0.5rem;">Size : ' . htmlspecialchars($product['productsize']) . '</h5>
                    <h5 style="margin-bottom: 0.5rem;">MSRP : ' . htmlspecialchars($product['productprice']) . '</h5>
                </div>
            </div>';

				$count++;

				if ($count % 2 == 0) {
					$html .= '</div>';
				}

				if ($count % 4 == 0) {
					$html .= '</div><div class="page">';
				}
			}
		}

		if ($count % 2 != 0) {
			$html .= '</div>'; // Close the last product-container div if there's an odd number of products
		}

		$html .= '</div></body></html>';

		// Load HTML content into dompdf
		$dompdf->loadHtml($html);

		// (Optional) Setup the paper size and orientation
		$dompdf->setPaper('A4', 'portrait');

		// Render the HTML as PDF
		$dompdf->render();

		// Save the generated PDF to a file on the server
		$pdfContent = $dompdf->output();
		$pdfFilePath = '../savepdf/wishcatalog-' . $id . '.pdf'; // Specify your desired file path
		$pdfSaved = file_put_contents($pdfFilePath, $pdfContent);

		if ($pdfSaved) {
			// Optionally, return the file path or a success message
			return $pdfFilePath;
		} else {
			// Optionally, return an error message
			return false;
		}
	}
 
	
	public function delete()
	{
		// Check if the request is coming from AJAX
		if ($this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' && $this->request->server['REQUEST_METHOD'] == 'POST') {
			// Validate and sanitize the input data (orderId)
			$Id = isset($this->request->post['orderId']) ? (int) $this->request->post['orderId'] : 0;
			//   echo $Id;
			//   die();
			// Perform the status update in the database based on $orderId
			// Replace the following code with your actual database update logic
			$this->load->model('report/wishcat');

			$requestData = $this->model_report_wishcat->getcatalogDataById($Id);
			$this->model_report_wishcat->delete($Id);
			//     echo "<pre>";
			//    print_r($requestData);
			//    echo "</pre>";
			//    die();
			// $this->SendEmaild($requestData);
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
	protected function SendEmail($requestData)
	{
		// $response = array();
		// echo "<pre>";
		// print_r($requestData);
		// echo "</pre>";
		$appoint_event = $this->model_report_wishcat->getAllEventData();
		// print_r($appoint_event[0]['name']);
		// die();
		if ($requestData) {

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = 'info@zaynjewels.com';
			$mail->smtp_password = 'qjoiaxyxowiosggs'; // Use environment variables for sensitive information
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			// $mail->setTo('radhika@zaynjewels.com'); // Adjust recipient email address as needed

			$mail->setTo($requestData[0]['user_email']);

			$mail->setFrom('info@zaynjewels.com');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Confirmation of your appointment booking with Zayn Jewels");

			$message = "<!DOCTYPE html>
        <html lang=\"en\">
        <head>
            <meta charset=\"UTF-8\">
            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
            <title>Zayn Jewels Email</title>
            <style>
                body {
                    font-family: 'Arial', sans-serif;
                    margin: 0;
                    padding: 0;
                    background-color: #f2f2f2;
                }
                .container {
                    width: 100%;
                    max-width: 600px;
                    margin: 0 auto;
                    background-color: #fff;
                    border-radius: 8px;
                    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                    overflow: hidden;
                }
                .header {
                    border-bottom:#101175 thin solid;
                    color: #fff;
                    padding: 20px;
                    text-align: center;
                }
                .header img {
                    max-width: 150px;
                }
                .content {
                    padding: 30px;
                    text-align: left;
                    color: #333;
                }
                .content h2 {
                    color: #101175;
                    margin-bottom: 20px;
                }
                .details p {
                    margin: 8px 0;
                }
                .details strong {
                    color: #101175;
                }
                .footer {
                    border-top:#101175 thin solid;
                    color: #101175;
                    padding: 20px;
                    text-align: center;
                    font-size: 14px;
                }
                .footer p {
                    margin: 5px 0;
                }
                a {
                    color: #101175;
                    text-decoration: none;
                }
                a:hover {
                    text-decoration: underline;
                }
            </style>
        </head>
        <body>
            <div class=\"container\">
                <!-- Header -->
                <div class=\"header\">
                    <img src=\"https://zaynjewels.com/image/catalog/New%20Project%20(27).png\" alt=\"Zayn Jewels\">
                </div>
        
                <!-- Content -->
                <div class=\"content\">
                    <h2>Appointment Confirmation</h2>
                    <p>Dear " . $requestData[0]['userName'] . ",</p>
                    <p>Your appointment has been scheduled with Zayn Jewels at the " . $appoint_event[0]['name'] . "</p>
                    <div class=\"details\">
                        <p><strong>Date:</strong> " . $requestData[0]['selected_date'] . "</p>
                        <p><strong>Time:</strong> " . $requestData[0]['selected_time'] . "</p>
                        <p><strong>Time Zone:</strong> " . $requestData[0]['current_timezone'] . "</p>
                        <p><strong>Subject:</strong> " . $requestData[0]['meetingTitle'] . "</p>
                        <p><strong>Message:</strong> " . $requestData[0]['usermessage'] . "</p>
                        <p><strong>Email:</strong> " . $requestData[0]['user_email'] . "</p>
                    </div>
                    <p>We look forward to seeing you.</p>
                    <p>Kind Regards,</p>
                    <p><strong>-Zayn Jewels Team-</strong></p>
                </div>
        
                <!-- Footer -->
                <div class=\"footer\">
                    <p>CONTACT US:</p>
                    <p>CALL: +1 949-900-6910</p>
                    <p>EMAIL: <a href=\"mailto:info@zaynjewels.com\">INFO@ZAYNJEWELS.COM</a></p>
                </div>
            </div>
        </body>
        </html>";

			$mail->setHtml($message);
			$mail->send();
		} else {
			$response['error'] = 'Validation failed';
			// You can customize this message
		}

		return $response;
	}
	protected function SendEmaild($requestData)
	{


		if ($requestData) {

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			// $mail->setTo('radhika@zaynjewels.com'); // Adjust recipient email address as needed

			$mail->setTo($requestData[0]['user_email']);

			$mail->setFrom('info@zaynjewels.com');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Cancel your appointment from Zayn Jewels");

			$message .= "Hello " . $requestData[0]['userName'] . " ,\n\n";
			$message .= "Your appointment has been Cancel with Zayn Jewels. \n\n";
			$message .= "Full Name- " . $requestData[0]['userName'] . "\n\n";
			$message .= "Date- " . $requestData[0]['selected_date'] . "\n\n";
			$message .= "Time- " . $requestData[0]['selected_time'] . "\n\n";
			$message .= "Time Zone- " . $requestData[0]['current_timezone'] . "\n\n";
			$message .= "Subject- " . $requestData[0]['meetingTitle'] . "\n\n";
			$message .= "Message- " . $requestData[0]['usermessage'] . "\n\n";
			$message .= "Email- " . $requestData[0]['user_email'] . "\n\n";
			$message .= "\n\n";


			$message .= "Best Regards,\n\n";

			$message .= "-Team Zayn Jewels\n\n";
			$mail->setText($message);
			$mail->send();
		} else {
			$response['error'] = 'Validation failed';
			// You can customize this message
		}


		return $response;
	}
}
