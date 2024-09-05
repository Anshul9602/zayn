<?php
class ControllerCommonHeader extends Controller
{

	public function index()
	{
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');

		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');

		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		if ($this->customer->isLogged()) {
			$data['wishlist'] = $this->url->link('account/wishlist_guest', '', true);
		} else {
			$data['wishlist'] = $this->url->link('account/wishlist_guest', '', true);
		}
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', true);
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		// Menu
		$this->load->model('catalog/category');
		//left
		$this->load->model('catalog/product');
		$data['categories1'] = array();
		$children = $this->model_catalog_category->getCategories('59');
		foreach ($children as $category) {
			$catres = $this->model_catalog_category->getCategory($category['category_id']);
			$data['categories1'][] = array(
				'name'     => $catres['name'],
				'children' => $children,
				'description' => html_entity_decode($catres['description']),
				'image' => $catres['image'],
				'column'   => $catres['column'] ? $catres['column'] : 1,
				'href'     => $this->url->link('common/' . $catres['name']),
				'id' => $catres['category_id']
			);
		}
		//right
		$data['categories2'] = array();
		$children = $this->model_catalog_category->getCategories('60');
		foreach ($children as $category) {
			$catres = $this->model_catalog_category->getCategory($category['category_id']);
			$data['categories2'][] = array(
				'name'     => $catres['name'],
				'children' => $children,
				'description' => html_entity_decode($catres['description']),
				'image' => $catres['image'],
				'column'   => $catres['column'] ? $catres['column'] : 1,
				'href'     => $this->url->link('common/' . $catres['name']),
				'id' => $catres['category_id']
			);
		}



		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		
		/*end*/
		$totals = array();
		$taxes = $this->cart->getTaxes();
		$total = 0;

		// Because __call can not keep var references so we put them into an array.
		$total_data = array(
			'totals' => &$totals,
			'taxes'  => &$taxes,
			'total'  => &$total
		);
		$data['text_items'] = sizeof($this->cart->getProducts());
		//$data['text_items'] =  $this->cart->countProducts();

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if ($this->customer->isLogged()) {
			$data['text_customer_name'] = sprintf($this->language->get('text_customer_name'), $this->customer->getFirstName(), $this->customer->getLastName());
		} else {
			$data['text_customer_name'] = $this->language->get('text_account');
		}
		if (isset($this->session->data['wishlist_items'])) {
			$data['wishlist_items1'] = $this->session->data['wishlist_items'];
		} else {
			$data['wishlist_items1'] = array();
		}

// echo "<pre>"; print_r($data['wishlist_items1']);
// echo "</pre>";

		return $this->load->view('common/header', $data);
	}

	public function setWishlistItems() {
		$this->load->language('common/header');
	
		$json = array();
	
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			// Retrieve and decode the JSON data from the POST request
			$rawPostData = file_get_contents('php://input');
			$postData = json_decode($rawPostData, true);
	
			// Debug: Log the received raw POST data and decoded data
			error_log('Raw POST Data: ' . $rawPostData);
			error_log('Decoded POST Data: ' . print_r($postData, true));
	
			if (isset($postData['wishlist'])) {
				$wishlist = $postData['wishlist'];
	
				// Debug: Log the wishlist data
				error_log('Wishlist Data: ' . print_r($wishlist, true));
	
				if (!empty($wishlist)) {
					// Store wishlist items in a session variable
					$this->session->data['wishlist_items'] = $wishlist;
					$json['success'] = 'Wishlist items stored in session.';
				} else {
					$json['error'] = 'No wishlist items found.';
				}
			} else {
				$json['error'] = 'Wishlist key not found in POST data.';
			}
		} else {
			$json['error'] = 'Invalid request method.';
		}
	
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

}

