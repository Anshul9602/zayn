<?php
class ControllerCommonJewelry extends Controller
{
	public function index()
	{
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}



		$categorie_ids = [87];
		//product fetching

		$this->load->model('catalog/product');
		$this->load->model('catalog/category');
		$this->load->model('tool/image');
		$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');



		for ($i = 0; $i < sizeof($categorie_ids); $i++) {
			$category_info = $this->model_catalog_category->getCategory($categorie_ids[$i]);
			if ($category_info) {
				$products[$categorie_ids[$i]] = array();
				$filter_data = array(
					'filter_category_id' => $categorie_ids[$i],
					'start'  			=> '0',
					'limit'              => '8'
				);

				$results = $this->model_catalog_product->getProducts($filter_data);


				foreach ($results as $result) {
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}

					$pid = $result['product_id'];

					$results_img = $this->model_catalog_product->getProductImages($pid);
					$first = true;

					foreach ($results_img as $result_img) {
						if ($first) {
							$images = $this->model_tool_image->resize($result_img['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
							$first = false;
						}
					}


					if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
						if (isset($result['price']) && is_numeric($result['price'])) {
							$price_raw = (float)$result['price'];
							$price_raw = round($price_raw); // Ensures it's rounded to the nearest whole number
							$price = $this->currency->format(
								$this->tax->calculate($price_raw, $result['tax_class_id'], $this->config->get('config_tax')),
								$this->session->data['currency']
							);
						} else {
							$price_raw = 0;
							$price = false;
						}
					
						if (isset($result['special']) && is_numeric($result['special']) && (float)$result['special']) {
							$special_raw = (float)$result['special'];
							$special_raw = round($special_raw); // Ensures it's rounded to the nearest whole number
							$special = $this->currency->format(
								$this->tax->calculate($special_raw, $result['tax_class_id'], $this->config->get('config_tax')),
								$this->session->data['currency']
							);
					
							$discount_percentage = round((($price_raw - $special_raw) / $price_raw) * 100);
						} else {
							$special = false;
							$discount_percentage = false;
						}
					} else {
						$price = false;
						$special = false;
						$discount_percentage = false;
					}

					

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = (int)$result['rating'];
					} else {
						$rating = false;
					}

					$products[$categorie_ids[$i]][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
						'price'       => $price,
						'discount_percentage'       => $discount_percentage,
						'special'     => $special,
						'tax'         => $tax,
						'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
						'rating'      => $result['rating'],
						'href'        => $this->url->link('product/product' . '&product_id=' . $result['product_id']),
						'popup' => $images,
						'quantity' => $result['quantity']
					);
				}
			}
		}

		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}
		$data['products_featured'] = $products['87'];





		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/jewelry', $data));
	}
}
