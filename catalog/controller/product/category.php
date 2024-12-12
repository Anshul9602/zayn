<?php
class ControllerProductCategory extends Controller
{
	public function index()
	{
		$this->load->language('product/category');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		if (isset($this->request->get['filter']) && trim($this->request->get['filter']) != "") {

			$filter = $this->request->get['filter'];
		} else {

			$filter = '';
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'p.sort_order';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['limit'])) {
			$limit = (int)$this->request->get['limit'];
		} else {
			$limit = $this->config->get($this->config->get('config_theme') . '_product_limit');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		if (isset($this->request->get['path'])) {
			$p = (string)$this->request->get['path'];
			if (strpos($p, '_')) {
				$url = '';

				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}

				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}

				if (isset($this->request->get['limit'])) {
					$url .= '&limit=' . $this->request->get['limit'];
				}
				$data['logged'] = $this->customer->isLogged();


				$path = '';

				$parts = explode('_', (string)$this->request->get['path']);

				$category_id = (int)array_pop($parts);

				foreach ($parts as $path_id) {
					if (!$path) {
						$path = (int)$path_id;
					} else {
						$path .= '_' . (int)$path_id;
					}

					$category_info = $this->model_catalog_category->getCategory($path_id);

					if ($category_info) {
						$data['breadcrumbs'][] = array(
							'text' => $category_info['name'],
							'href' => $this->url->link('product/category', 'path=' . $path . $url)
						);
					}
				}
			} else {
				$category_id = (int)$this->request->get['path'];
			}
		} else {
			$category_id = 0;
		}

		/*custom code for lustlist*/
		$a[0] = 0;

		if (isset($this->session->data['lustlist'])) {
			foreach ($this->session->data['lustlist'] as $prodcut_id => $key) {
				$i = 0;
				$a[$i] = $prodcut_id;
				$i++;
			}
			$data['lustlist_ids'] = $a;
		} else {
			$data['lustlist_ids'] = $a;
		}

		/*custom code for wishlist heart buttble*/
		$a[0] = 0;

		if (isset($this->session->data['wishlist'])) {

			$data['wishlist_ids'] = $this->session->data['wishlist'];
		} else {
			$data['wishlist_ids'] = $a;
		}



		$category_info = $this->model_catalog_category->getCategory($category_id);

		if ($category_info) {
			$this->document->setTitle($category_info['meta_title']);
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);

			$data['heading_title'] = $category_info['name'];

			$data['text_refine'] = $this->language->get('text_refine');
			$data['text_empty'] = $this->language->get('text_empty');
			$data['text_quantity'] = $this->language->get('text_quantity');
			$data['text_manufacturer'] = $this->language->get('text_manufacturer');
			$data['text_model'] = $this->language->get('text_model');
			$data['text_price'] = $this->language->get('text_price');
			$data['text_tax'] = $this->language->get('text_tax');
			$data['text_points'] = $this->language->get('text_points');
			$data['text_compare'] = sprintf($this->language->get('text_compare'), (isset($this->session->data['compare']) ? count($this->session->data['compare']) : 0));
			$data['text_sort'] = $this->language->get('text_sort');
			$data['text_limit'] = $this->language->get('text_limit');

			$data['button_cart'] = $this->language->get('button_cart');
			$data['button_wishlist'] = $this->language->get('button_wishlist');
			$data['button_compare'] = $this->language->get('button_compare');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_list'] = $this->language->get('button_list');
			$data['button_grid'] = $this->language->get('button_grid');

			// Set the last category breadcrumb
			$data['breadcrumbs'][] = array(
				'text' => $category_info['name'],
				'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'])
			);

			if ($category_info['image']) {
				$data['thumb'] = $this->model_tool_image->resize($category_info['image'], 1400, 561);
			} else {
				$data['thumb'] = '';
			}

			$data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$data['compare'] = $this->url->link('product/compare');

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['categories'] = array();

			$results = $this->model_catalog_category->getCategories($category_id);


			foreach ($results as $result) {
				$filter_data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);

				if ($result['image']) {
					$image1 = $this->model_tool_image->resize($result['image'], 300, 300);
				} else {
					$image1 = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				$data['categories'][] = array(
					'name' => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
					'href' => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '_' . $result['category_id'] . $url),
					'image' => $image1
				);
			}

			$data['products'] = array();
			if ($filter != '') {
				$filter_data = array(
					'filter_category_id' => $category_id,
					'filter_filter'      => $filter,
					'sort'               => $sort,
					'order'              => $order,
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit
				);
			} else {
				$filter_data = array(
					'filter_category_id' => $category_id,
					'filter_filter'      => $filter,
					'sort'               => $sort,
					'order'              => $order,
					'start'              => ($page - 1) * $limit,
					'limit'              => $limit
				);
			}


			if ((trim($filter) != "") && $category_id != '99') {
				$key2 = "XXXX";
				switch ($category_id) {
					case '80':
						$key = "RG";
						break;

					case '83':
						$key = "BG";
						break;

					case '85':
						$key = "PD";
						break;

					case '86':
						$key = "NL";
						break;

					case '82':
						$key = "ER";
						break;

					case '84':
						$key = "BL";
						break;
					case '89':
						$key = "ER";
						break;

					case '107':
						$key = "ER";
						break;

					case '106':
						$key = "PD";
						break;
					case '109':
						$key = "RG";


						break;
					case '108':
						$key = "RG";


						break;

					case '95':
						$key = "TC1";
						$key2 = "TC2";
						break;
				}

				if ($category_id == 109 || $category_id == 108 || $category_id == 110 || $category_id == 107 || $category_id == 111) {
					$results = $this->model_catalog_product->getProducts($filter_data);
					$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
				} else {
					$results = $this->model_catalog_product->getProductsnew($key, $key2, $filter_data);
					$product_total = $this->model_catalog_product->getTotalProductsnew($key, $key2, $filter_data);
				}
				shuffle($results);
			} else {

				$results = $this->model_catalog_product->getProducts($filter_data);
				$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
				shuffle($results);
			}
			if (isset($_GET['filter']) && trim($_GET['filter']) != "") {
				$user_filter = explode(',', $_GET['filter']);
				$filter_by_group = array();

				for ($ll = 0; $ll < sizeof($user_filter); $ll++) {
					$group_id = $this->model_catalog_product->getFilterGroup($user_filter[$ll]);
					$filter_by_group[$group_id][] = $user_filter[$ll];
				}
				$data['filter_by_group'] = $filter_by_group;
			}



			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

				//additional images
				$data['attribute_groups'] = $this->model_catalog_product->getProductAttributes($result['product_id']);
				foreach ($data['attribute_groups'] as $attr) {
					if ($attr['name'] == 'Stone details') {
						foreach ($attr['attribute'] as $attribute) {
							$wet = $attribute['text'];
						}
					}
				}
				$pid = $result['product_id'];

				$data['images'][$pid] = array();

				$results_img = $this->model_catalog_product->getProductImages($pid);
				$first = true;

				foreach ($results_img as $result_img) {
					if ($first) {
						$data['images'][$pid]['popup'] = $this->model_tool_image->resize($result_img['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
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
						$wish_price = $this->currency->format(
							$this->tax->calculate($price_raw, $result['tax_class_id'], $this->config->get('config_tax')),
							$this->session->data['currency']
						);
					} else {
						$price_raw = 0;
						$price = false;
						$wish_price = false;
					}
				
					if (isset($result['special']) && is_numeric($result['special']) && (float)$result['special']) {
						$special_raw = (float)$result['special'];
						$special_raw = round($special_raw); // Ensures it's rounded to the nearest whole number
						$special = $this->currency->format(
							$this->tax->calculate($special_raw, $result['tax_class_id'], $this->config->get('config_tax')),
							$this->session->data['currency']
						);
						$wish_sprice = $this->currency->format(
							$this->tax->calculate($special_raw, $result['tax_class_id'], $this->config->get('config_tax')),
							$this->session->data['currency']
						);
				
						$discount_percentage = round((($price_raw - $special_raw) / $price_raw) * 100);
					} else {
						$special = false;
						$wish_price = false;
						$discount_percentage = false;
					}
				} else {
					$price_raw = (float)$result['price'];
						$price_raw = round($price_raw);
					$special_raw = (float)$result['special'];
						$special_raw = round($special_raw);
					$price = false;
					$wish_price = $this->currency->format(
						$this->tax->calculate($price_raw, $result['tax_class_id'], $this->config->get('config_tax')),
						$this->session->data['currency']
					);
					$wish_sprice = $this->currency->format(
						$this->tax->calculate($special_raw, $result['tax_class_id'], $this->config->get('config_tax')),
						$this->session->data['currency']
					);
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

				$options = array();

				foreach ($this->model_catalog_product->getProductOptions($result['product_id']) as $option) {

					if ($option['name'] == 'RING SIZE') {
						$product_size1 = $option['product_option_value'][0]['name'];
					} else if ($option['name'] == 'Bangle Size') {
						$product_size1 = $option['product_option_value'][0]['name'];
					} else if ($option['name'] == 'Bracelet Size') {
						$product_size1 = $option['product_option_value'][0]['name'];
					} else if ($option['name'] == 'Necklace Size') {
						$product_size1 = $option['product_option_value'][0]['name'];
					} else {
						$product_size1 = '';
					}

					$product_option_value_data = array();

					foreach ($option['product_option_value'] as $option_value) {
						if (!$option_value['subtract'] || ($option_value['quantity'] > 0)) {

							$opt_price = false;

							$product_option_value_data[] = array(
								'product_option_value_id' => $option_value['product_option_value_id'],
								'option_value_id'         => $option_value['option_value_id'],
								'name'                    => $option_value['name'],
								'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
								'price'                   => $opt_price,
								'price_prefix'            => $option_value['price_prefix']
							);
						}
					}

					$options[] = array(
						'product_option_id'    => $option['product_option_id'],
						'product_option_value' => $product_option_value_data,
						'option_id'            => $option['option_id'],
						'name'                 => $option['name'],
						'product_size1'     => $product_size1,
						'type'                 => $option['type'],
						'value'                => $option['value'],
						'required'             => $option['required']

					);
				}
				if (isset($this->session->data['wishlist_items'])) {
					$wishlist_items1 = $this->session->data['wishlist_items'];
				} else {
					$wishlist_items1 = null;
				}

				$filter_ids = $this->model_catalog_product->getProductFilters($result['product_id']);


				if ($wishlist_items1 == null) {
					$product_in_wishlist = false;
				} else {
					$wishlist_items1_array = json_decode($wishlist_items1, true);

					$product_in_wishlist = false;
					foreach ($wishlist_items1_array as $item) {

						if ($item['productid'] == $result['product_id']) {
							$product_in_wishlist = true;
							break;
						}
					}
				}

				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'filter_id' => $filter_ids,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					'model'       => $result['model'],
					'option'		=> $options,
					'wet' => $wet,
					'product_size1'     => $product_size1,
					'price'       => $price,
					'special'       => $special,
					'in_wishlist'    => $product_in_wishlist,
					'wish_price'       => $wish_price,
					'wish_sprice'       => $wish_sprice,
					'special'     => $special,
					'discount_percentage'     => $discount_percentage,
					'style_no' => $result['model'],
					'metal_purity' => $result['upc'],
					'tax'         => $tax,
					'minimum'     => $result['minimum'] > 0 ? $result['minimum'] : 1,
					'rating'      => $result['rating'],
					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result['product_id'] . $url)
				);
			}



			if (isset($filter_by_group)) {
				if (sizeof($filter_by_group) > 1) {
					foreach ($data['products'] as $key => $product) {
						foreach ($filter_by_group as $k1 => $fg) {
							if (!isset($product['filter_id'][$k1])) {
								unset($data['products'][$key]);
								continue;
							} else {

								if (empty(array_intersect($product['filter_id'][$k1], $fg))) {
									unset($data['products'][$key]);
								}
							}
						}
					}
				}
			}



			if (isset($_GET['filter']) && trim($_GET['filter']) != "") {
				$x = (ceil(sizeof($data['products']) / 16));
				if (!isset($_GET['page']) || $_GET['page'] == '1') {
					array_splice($data['products'], 16, (sizeof($data['products']) - 16));
				} else if ($_GET['page'] == $x) {
					array_splice($data['products'], 0, 16 * ($_GET['page'] - 1));
				} else {
					array_splice($data['products'], 0, 16 * ($_GET['page'] - 1));
					array_splice($data['products'], 16, (sizeof($data['products']) - 16));
				}
			}



			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['sorts'] = array();

			$data['sorts'][] = array(
				'text'  => 'SORT',
				'value' => 'p.sort_order-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.sort_order&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_asc'),
				'value' => 'pd.name-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_name_desc'),
				'value' => 'pd.name-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=pd.name&order=DESC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_asc'),
				'value' => 'p.price-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_price_desc'),
				'value' => 'p.price-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.price&order=DESC' . $url)
			);

			/*	if ($this->config->get('config_review_status')) {
				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_desc'),
					'value' => 'rating-DESC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=DESC' . $url)
				);

				$data['sorts'][] = array(
					'text'  => $this->language->get('text_rating_asc'),
					'value' => 'rating-ASC',
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=rating&order=ASC' . $url)
				);
			}

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_asc'),
				'value' => 'p.model-ASC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=ASC' . $url)
			);

			$data['sorts'][] = array(
				'text'  => $this->language->get('text_model_desc'),
				'value' => 'p.model-DESC',
				'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&sort=p.model&order=DESC' . $url)
			);*/

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			$data['limits'] = array();

			$limits = array_unique(array($this->config->get($this->config->get('config_theme') . '_product_limit'), 25, 50, 75, 100));

			sort($limits);

			foreach ($limits as $value) {
				$data['limits'][] = array(
					'text'  => $value,
					'value' => $value,
					'href'  => $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&limit=' . $value)
				);
			}

			$url = '';

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$prodcut_total = sizeof($data['products']);
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->url = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url . '&page={page}');


			$data['pagination'] = $pagination->render();

			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($product_total - $limit)) ? $product_total : ((($page - 1) * $limit) + $limit), $product_total, ceil($product_total / $limit));

			// http://googlewebmastercentral.blogspot.com/2011/09/pagination-with-relnext-and-relprev.html
			if ($page == 1) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'canonical');
			} elseif ($page == 2) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'], true), 'prev');
			} else {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page=' . ($page - 1), true), 'prev');
			}

			if ($limit && ceil($product_total / $limit) > $page) {
				$this->document->addLink($this->url->link('product/category', 'path=' . $category_info['category_id'] . '&page=' . ($page + 1), true), 'next');
			}

			$data['sort'] = $sort;
			$data['order'] = $order;
			$data['limit'] = $limit;

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/category', $data));
		} else {
			$url = '';

			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}

			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_error'),
				'href' => $this->url->link('product/category', $url)
			);

			$data['action'] = str_replace('&amp;', '&', $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url));


			$this->document->setTitle($this->language->get('text_error'));

			$data['heading_title'] = $this->language->get('text_error');

			$data['text_error'] = $this->language->get('text_error');

			$data['button_continue'] = $this->language->get('button_continue');

			$data['continue'] = $this->url->link('common/home');

			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('error/not_found', $data));
		}
	}
}
