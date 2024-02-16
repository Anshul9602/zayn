<?php
class ControllerAccountQuotation extends Controller
{
	public function index()
	{
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/quotation', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->document->setTitle('Quotations');


		$this->load->language('account/order');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => 'All Quotations',
			'href' => $this->url->link('account/quotation', '', true)
		);

		$data['heading_title'] = 'All Quotations';

		$data['text_empty'] = $this->language->get('text_empty');

		$data['column_quotation_id'] = $this->language->get('column_quotation_id');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_product'] = $this->language->get('column_product');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['button_view'] = $this->language->get('button_view');
		$data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['quotations'] = array();

		$this->load->model('account/quotation');

		$quotation_total = $this->model_account_quotation->getTotalQuotation();

		$results = $this->model_account_quotation->getQuotations(($page - 1) * 10, 10);


		foreach ($results as $result) {
			$product_total = $this->model_account_quotation->getTotalQuotationProductsByQuotationId($result['quotation_id']);

			$data['quotations'][] = array(
				'quotation_id'   => $result['quotation_id'],
				'name'       => $result['firstname'] . ' ' . $result['lastname'],
				'date_valid'   => date($this->language->get('date_format_short'), strtotime($result['date_valid'])),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'products'   => ($product_total),
				'total'      => $this->currency->format($result['total'], 'USD', '1'),
				'view'       => $this->url->link('account/quotation/info', 'quotation_id=' . $result['quotation_id'], true),
			);
		}

		$pagination = new Pagination();
		$pagination->total = $quotation_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('account/quotation', 'page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($quotation_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($quotation_total - 10)) ? $quotation_total : ((($page - 1) * 10) + 10), $quotation_total, ceil($quotation_total / 10));

		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/quotation_list', $data));
	}

	public function info()
	{
		$this->document->setTitle('Quotation Info');

		$this->load->language('account/order');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => 'All Quotations',
			'href' => $this->url->link('account/quotation', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => 'Quotation Info',
			'href' => ''
		);

		$data['heading_title'] = 'Quotation info';
		$this->load->language('account/order');

		if (isset($this->request->get['quotation_id'])) {
			$quotation_id = $this->request->get['quotation_id'];
		} else {
			$quotation_id = 0;
		}

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/quotation/info', 'quotation_id=' . $quotation_id, true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->model('account/quotation');
		$this->load->model('account/address');

		$data['quotation_info'] = $this->model_account_quotation->getQuotation($quotation_id);

		$address_id = $this->customer->getAddressId();
		$data['address'] = $this->model_account_address->getAddress($address_id);


		$data['quotation_products'] = $products =	$this->model_account_quotation->getQuotationProducts($quotation_id);


		foreach ($products as $product) {
			$option_data = array();

			$options = $this->model_account_quotation->getQuotationOptions($this->request->get['quotation_id'], $product['quotation_product_id']);

			foreach ($options as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}



			$data['products'][] = array(
				'name'     => $product['name'],
				'image' => $product['image'],
				'model'    => $product['model'],
				'option'   => $option_data,
				'quantity' => $product['quantity'],
				'price'    => $this->currency->format($product['price'], 'USD', '1'),
				'total'    => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), 'USD', '1')

			);
		}

		$data['totals'] = array();



		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/quotation_info', $data));
	}

	public function add()
	{

		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/quotation', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}
		$this->load->model('account/quotation');



		$customer_id = $this->customer->getId();
		$qtotal = $this->cart->getTotal();
		$count = $this->cart->countProducts();
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
			}

			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['value'];
				} else {
					$upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

					if ($upload_info) {
						$value = $upload_info['name'];
					} else {
						$value = '';
					}
				}

				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				$unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));

				$price = $unit_price;
				$total = $unit_price * $product['quantity'];
			} else {
				$price = false;
				$total = false;
			}

			$recurring = '';

			if ($product['recurring']) {
				$frequencies = array(
					'day'        => $this->language->get('text_day'),
					'week'       => $this->language->get('text_week'),
					'semi_month' => $this->language->get('text_semi_month'),
					'month'      => $this->language->get('text_month'),
					'year'       => $this->language->get('text_year'),
				);

				if ($product['recurring']['trial']) {
					$recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
				}

				if ($product['recurring']['duration']) {
					$recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				} else {
					$recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
				}
			}

			$data['products'][] = array(
				'product_id'   => $product['product_id'],
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'recurring' => $recurring,
				'quantity'  => $product['quantity'],
				'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
				'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
				'price'     => $price,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}


		$status = 'active';
		$this->model_account_quotation->addQuotation($customer_id, $qtotal, $status, $count, $data);
		$this->cart->clear();
		$this->response->redirect($this->url->link('account/quotation', '', true));
	}
}
