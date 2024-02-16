<?php
class ControllerCommonHome extends Controller
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

		//diamond fashion categories
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$data['categories1'] = array();
		$children = $this->model_catalog_category->getCategories('67');
		foreach ($children as $category) {
			$catres = $this->model_catalog_category->getCategory($category['category_id']);
			$data['categories1'][] = array(
				'name'     => $catres['name'],
				'children' => $children,
				'description' => html_entity_decode($catres['description']),
				'image' => $catres['image'],
				'column'   => $catres['column'] ? $catres['column'] : 1,
				'href'     => $this->url->link('product/category', 'path=' . $catres['category_id']),
				'id' => $catres['category_id']
			);
		}

		//most wanted design

		$data['categories2'] = array();
		$children = $this->model_catalog_category->getCategories('73');
		foreach ($children as $category) {
			$catres = $this->model_catalog_category->getCategory($category['category_id']);
			$data['categories2'][] = array(
				'name'     => $catres['name'],
				'children' => $children,
				'description' => html_entity_decode($catres['description']),
				'image' => $catres['image'],
				'column'   => $catres['column'] ? $catres['column'] : 1,
				'href'     => $this->url->link('product/category', 'path=' . $catres['category_id']),
				'id' => $catres['category_id']
			);
		}

// mob category

		$data['mobcat'] = array();
		$cat = $this->model_catalog_category->getCategories('79');
		foreach ($cat as $category) {
			$catres = $this->model_catalog_category->getCategory($category['category_id']);
			$data['mobcat'][] = array(
				'name'     => $catres['name'],
				'image' => $this->model_tool_image->resize($catres['image'], '400', '400'),
				'column'   => $catres['column'] ? $catres['column'] : 1,
				'href'     => $this->url->link('product/category', 'path=' . $catres['category_id']),
				'id' => $catres['category_id']
			);
		}

		// most wated designs banner version
		$filter_data1 = array(
			'filter_category_id' => '98',
			'start' => '0',
			'limit' => '8'
		);
		$data['mostcat'] = array();
		$new_results1 = $this->model_catalog_product->getProducts($filter_data1);

		foreach ($new_results1 as $result) {
			// echo "<pre>";

			// print_r($wish);
			// echo "</pre>";

			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], '400', '400');
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
			}

		

			$data['mostcat'][] = array(
				'product_id'  => $result['product_id'],
				'image'       => $image,
				'name'        => $result['name'],
				
				'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'])
			);
		}
		//new arrival design

		$filter_data = array(
			'filter_category_id' => '97',
			'start' => '0',
			'limit' => '8'
		);
		$data['newcat'] = array();
		$new_results2 = $this->model_catalog_product->getProducts($filter_data);

		foreach ($new_results2 as $result) {
			// echo "<pre>";

			// print_r($wish);
			// echo "</pre>";

			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], '400', '400');
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_width'), $this->config->get('theme_' . $this->config->get('config_theme') . '_image_product_height'));
			}

		

			$data['newcat'][] = array(
				'product_id'  => $result['product_id'],
				'image'       => $image,
				'name'        => $result['name'],
				
				'href'        => $this->url->link('product/product', '&product_id=' . $result['product_id'])
			);
		}

		
// end new arrival
		//shaded of gold
		$data['bannersshades'] = array();

		$results = $this->model_design_banner->getBanner(11);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['bannersshades'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '1920', '670')
				);
			}
		}

		//banner-gaurantee
		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['bannersGuarantee'] = array();

		$results = $this->model_design_banner->getBanner(12);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['bannersGuarantee'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '1410', '470')
				);
			}
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
