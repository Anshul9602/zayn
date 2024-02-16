<?php
class ModelAccountDraft extends Model
{
	public function addDraft($draft, $title)
	{

		$this->db->query("INSERT INTO " . DB_PREFIX . "cadform_drafts SET customer_id = '" . (int)$this->customer->getId() . "', draft = '" . $this->db->escape($draft) . "', title ='" . $this->db->escape($title) . "', `date_added` = NOW()");

		return $this->db->getLastId();
	}

	public function getDraft($draft = false)
	{
		if (!$draft) {
			$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "cadform_drafts WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY draft_id DESC LIMIT 1");
		} else {
			$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "cadform_drafts WHERE customer_id = '" . (int)$this->customer->getId() . "' AND draft_id = '" . (int)$draft . "' ORDER BY draft_id DESC LIMIT 1");
		}

		if ($q->num_rows) {
			return $q->row['draft'];
		} else {
			return "";
		}
	}

	public function getDrafts()
	{
		$q = $this->db->query("SELECT * FROM " . DB_PREFIX . "cadform_drafts WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY draft_id");

		if ($q->num_rows) {
			return $q->rows;
		} else {
			return [];
		}
	}

	public function deleteDraft($draft_id)
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . "cadform_drafts WHERE draft_id = '" . (int)$draft_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
	}
}
