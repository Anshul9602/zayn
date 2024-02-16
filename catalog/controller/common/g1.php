<?php
class ControllerCommonG1 extends Controller
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

		$data['bannerstop'] = array();

		$results = $this->model_design_banner->getBanner(13);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['bannerstop'][] = array(
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
		$children = $this->model_catalog_category->getCategories('68');
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
		$children = $this->model_catalog_category->getCategories('74');
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

		//shaded of gold
		$data['bannersshades'] = array();

		$results = $this->model_design_banner->getBanner(12);

		foreach ($results as $result) {
			if (is_file(DIR_IMAGE . $result['image'])) {
				$data['bannersshades'][] = array(
					'title' => $result['title'],
					'link'  => $result['link'],
					'image' => $this->model_tool_image->resize($result['image'], '1410', '470')
				);
			}
		}

		//banner-gaurantee
		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$data['bannersGuarantee'] = array();

		$results = $this->model_design_banner->getBanner(9);

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

		$this->response->setOutput($this->load->view('common/g1', $data));
	}
}
