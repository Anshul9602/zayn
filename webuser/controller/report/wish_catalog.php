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
			$this->model_report_wishcat->updateStatus($Id, $pdf);
			// die();
			$this->SendEmailuser($requestData,$pdf);
			$this->SendEmail($requestData,$pdf);

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
	public function updateproduct()
	{
		if ($this->request->server['HTTP_X_REQUESTED_WITH'] == 'XMLHttpRequest' && $this->request->server['REQUEST_METHOD'] == 'POST') {
			$Id = isset($this->request->post['orderId']) ? (int)$this->request->post['orderId'] : 0;
			$product_data = ($this->request->post['product_data']);



			$decoded_product_data = html_entity_decode($product_data, ENT_QUOTES, 'UTF-8');
			// Ensure product_data is properly escaped for SQL query
			// Decode JSON string to PHP array
			//   echo $decoded_product_data;
			//   die();
			// Perform the update
			$this->load->model('report/wishcat');
			$this->model_report_wishcat->updateproduct($Id, $decoded_product_data);
			
			// Send a success response
			$json['success'] = 'Product updated successfully';
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		} else {
			// Handle non-AJAX requests
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
	
		// Initialize HTML content
		$html = '<!DOCTYPE html>
		<html lang="en">
		<head>
			<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>Product Catalog</title>
			<style>
				  body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .page {
            page-break-after: always;
            position: relative;
            margin: 0; /* Removed padding-bottom */
            padding: 0; /* Removed padding-bottom */
        }
        .table-container {
            width: 100%;
            border-collapse: collapse;
        }
        .table-container td {
            padding: 5px;
            vertical-align: top;
            border: none;
            box-sizing: border-box;
        }
        .product-card {
            display: flex;
            flex-direction: column;
            border:none;
            border-radius: 4px;
            overflow: hidden;
            box-shadow:none;
        }
        .product-card img {
            width: auto;
            height: auto;
            max-height: 150px;
            object-fit: cover;
        }
        .product-card .content {
            padding: 10px;
            font-size: 12px;
        }
        .product-card a {
            color: #000;
            text-decoration: none;
        }
        .product-card h5 {
            margin: 5px 0;
        }
        .page-header img {
            width: 100%;
            display: block; /* Ensure no extra space below the image */
        }
        .last-page-img {
            text-align: center;
            margin-top: 20px;
        }
        .last-page-img img {
            width: auto;
            object-fit: contain;
        }
			</style>
		</head>
		<body>
			<div class="page-header">
				<img src="' . HTTP_CATALOG . 'image/pag1.jpg" alt="Header Image">
			</div>
			<div class="page">
				<table class="table-container">
					<tbody>';
	
		$count = 0;
		$productsPerRow = 3; // Number of products per row
		$totalProducts = 0;
	
		foreach ($wishlist as $item) {
			$productData = json_decode($item['product_data'], true);
	
			foreach ($productData as $product) {
				if ($count % $productsPerRow == 0) {
					if ($count > 0) {
						$html .= '</tr>';
					}
					$html .= '<tr>';
				}
	
				$imageUrl = htmlspecialchars($product['productimg']);
				$html .= '
                      <td>
                          <div class="product-card">
                              <img src="' . $imageUrl . '" alt="' . htmlspecialchars($product['productname']) . '">
                              <div class="content">
                                  <a href="' . htmlspecialchars($product['producturl']) . '">' . htmlspecialchars($product['productname']) . '</a>
                                  <h5>Design No: ' . htmlspecialchars($product['productstyle']) . '</h5>
                                  <h5>Metal Purity: ' . htmlspecialchars($product['productsize']) . '</h5>
                                  <h5>Size: US #7.0</h5>
                                  <h5>MSRP: ' . htmlspecialchars(preg_replace('~\.0+$~', '', str_replace('$', 'USD ', $product['productprice']))) . '</h5>
                              </div>
                          </div>
                      </td>';
				$count++;
				$totalProducts++;
	
				// Add a new page after every 9 products
				if ($count % 9 == 0) {
					$html .= '</tr></tbody></table></div>';
					$html .= '<div class="page"><table class="table-container"><tbody>';
				}
			}
		}
	
		// Close any remaining tags
		if ($count % $productsPerRow != 0) {
			$html .= '</tr>'; // Close the last row if necessary
		}
	
		$html .= '</tbody></table>';
	
		// Add the last page image
		$html .= '</body></html>';
	
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
	
	protected function SendEmailuser($requestData,$pdf)
	{
		// echo "<pre>";
		// print_r($requestData);
		// echo "</pre>";
		// die();


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

			$mail->setTo($requestData[0]['email']);

			$mail->setFrom('info@zaynjewels.com');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Confirmation of your Catalog Request with Zayn Jewels");

			$message .= "Hello " . $requestData[0]['name'] . " ,\n\n";
			$message .= "Your Catalog Request with Zayn Jewels. \n\n";
			$message .= "Company Name- " . $requestData[0]['company_name'] . "\n\n";
			$message .= "Catalog- " . $pdf. "\n\n";
			


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
	protected function SendEmail($requestData,$pdf)
	{
		// echo "<pre>";
		// print_r($requestData);
		// echo "</pre>";
		// die();


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

			$mail->setTo("radhika@zaynjewels.com");

			$mail->setFrom('info@zaynjewels.com');
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject("Confirmation of your Catalog Request with Zayn Jewels");

			$message .= "Hello  ,\n\n";
			$message .= "Catalog Request  from Zayn Jewels. \n\n";
			$message .= " Name- " . $requestData[0]['name'] . "\n\n";
			$message .= "Company Name- " . $requestData[0]['company_name'] . "\n\n";
			$message .= "Email- " . $requestData[0]['email'] . "\n\n";
			$message .= "Catalog- " . $pdf. "\n\n";
			


			
			$mail->setText($message);
			$mail->send();
		} else {
			$response['error'] = 'Validation failed';
			// You can customize this message
		}


		return $response;
	}
}
