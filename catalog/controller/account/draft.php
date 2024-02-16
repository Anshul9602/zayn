<?php
class ControllerAccountDraft extends Controller
{
	public function index()
	{
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/quotation', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->document->setTitle('Drafts');


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
			'text' => 'Save Drafts',
			'href' => $this->url->link('account/draft', '', true)
		);

		$data['heading_title'] = 'Drafts';

		$data['text_empty'] = $this->language->get('text_empty');

		$data['column_quotation_id'] = "S.no";
		$data['column_customer'] = "Title";
		$data['column_product'] = "Draft";

		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['button_view'] = $this->language->get('button_view');
		$data['button_continue'] = $this->language->get('button_continue');


		$data['drafts'] = array();

		$this->load->model('account/draft');

		$results = $this->model_account_draft->getDrafts();


		foreach ($results as $result) {
			$data['drafts'][] = array(
				'draft_id'   => $result['draft_id'],
				'title'       => $result['title'],
				'draft'       => $result['draft'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'       => "https://www.zaynjewels.com/cad-cam-services&draft_id=" . $result['draft_id'],
				'delete'       => $this->url->link('account/draft/delete', 'draft_id=' . $result['draft_id'], true),
			);
		}

		$data['continue'] = $this->url->link('account/account', '', true);

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('account/draft_list', $data));
	}

	public function add()
	{
		$this->load->model('account/draft');

		if (!isset($_POST['draft'])) {

			$json['error'] = true;
			$json['success'] = false;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			return;
		}
		$title = "";
		if (isset($_POST['title'])) {
			$title = $_POST['title'];
		}

		$result = $this->model_account_draft->addDraft($_POST['draft'], $title);

		if ($result) {

			$json['success'] = true;
			$json['error'] = false;
			$json['draft_id'] = $result;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			return;
		} else {
			$json['success'] = false;
			$json['error'] = true;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
			return;
		}
	}

	public function delete()
	{
		$this->load->model('account/draft');
		$this->model_account_draft->deleteDraft($_GET['draft_id']);

		$this->response->redirect($this->url->link('account/draft', '', true));
	}
}
