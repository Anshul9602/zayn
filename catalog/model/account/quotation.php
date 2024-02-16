<?php
class ModelAccountQuotation extends Model
{
	public function addQuotation($customer_id, $total, $status, $count, $data)
	{
		$query = $this->db->query("INSERT INTO `" . DB_PREFIX . "quotation` SET `customer_id` = '" . (int)$customer_id . "', `status` = 'active' , `total` = '" . (int)$total . "', `date_added` = NOW(), `date_valid` = (NOW() + INTERVAL 7 DAY) ,`num_products` = '" . (int)$count . "'");
		$q_id = $this->db->getLastId();

		if (isset($data['products'])) {
			foreach ($data['products'] as $product) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "quotation_product SET quotation_id = '" . (int)$q_id . "', product_id = '" . (int)$product['product_id'] . "', name = '" . $this->db->escape($product['name']) . "', model = '" . $this->db->escape($product['model']) . "', quantity = '" . (int)$product['quantity'] . "', price = '" . (float)$product['price'] . "', total = '" . (float)$product['total'] . "', tax = '" . (float)$product['tax'] . "', reward = '" . (int)$product['reward'] . "'");

				$quotation_product_id = $this->db->getLastId();

				foreach ($product['option'] as $option) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "quotation_option SET quotation_id = '" . (int)$q_id . "', quotation_product_id = '" . (int)$quotation_product_id . "', product_option_id = '" . (int)$option['product_option_id'] . "', product_option_value_id = '" . (int)$option['product_option_value_id'] . "', name = '" . $this->db->escape($option['name']) . "', `value` = '" . $this->db->escape($option['value']) . "', `type` = '" . $this->db->escape($option['type']) . "'");
				}
			}
		}
	}


	public function getTotalQuotation()
	{
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "quotation` q WHERE customer_id = '" . (int)$this->customer->getId() . "'");

		return $query->row['total'];
	}


	public function getQuotations($start = 0, $limit = 20)
	{
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

		$query = $this->db->query("SELECT q.quotation_id, c.firstname, c.lastname, q.date_added, q.date_valid, q.status, q.total FROM `" . DB_PREFIX . "quotation` q LEFT JOIN " . DB_PREFIX . "customer c ON (q.customer_id = c.customer_id) WHERE c.customer_id = '" . (int)$this->customer->getId() . "'  ORDER BY q.quotation_id DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}


	public function getTotalQuotationProductsByQuotationId($quotation_id)
	{
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "quotation_product WHERE quotation_id = '" . (int)$quotation_id . "'");

		return $query->row['total'];
	}

	public function getTotalQuotationVouchersByQuotationId($quotation_id)
	{
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "quotation_voucher` WHERE quotation_id = '" . (int)$quotation_id . "'");

		return $query->row['total'];
	}

	public function getQuotation($quotation_id)
	{
		$quotation_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "quotation` WHERE quotation_id = '" . (int)$quotation_id . "' AND customer_id = '" . (int)$this->customer->getId() . "'");

		if ($quotation_query->num_rows) {
			return $quotation_query->rows;
		}
	}


	public function getQuotationProducts($quotation_id)
	{
		$query = $this->db->query("SELECT *, qp.quantity AS quantity, p.image FROM " . DB_PREFIX . "quotation_product qp left join oc_product p ON (qp.product_id = p.product_id) WHERE quotation_id = '" . (int)$quotation_id . "'");

		return $query->rows;
	}

	public function getQuotationOptions($quotation_id, $quotation_product_id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "quotation_option WHERE quotation_id = '" . (int)$quotation_id . "' AND quotation_product_id = '" . (int)$quotation_product_id . "'");

		return $query->rows;
	}
}
