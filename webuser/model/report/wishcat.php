<?php
class ModelReportWishcat extends Model
{
    public function getAllCatalogData()
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "catalog_req`");

        return $query->rows;
    }
    public function getTotalcat()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "catalog_req`");

        return $query->row['total'];
    }
    public function updateStatus($Id, $pdf)
{
    // Ensure the PDF path is properly escaped and quoted
    $pdf = $this->db->escape($pdf);

    // Update the status and PDF path in the database
    $this->db->query("
        UPDATE `" . DB_PREFIX . "catalog_req`
        SET `status` = IF(`status` = 1, 0, 1), `pdf` = '" . $pdf . "'
        WHERE `id` = '" . (int)$Id . "'
    ");
}
public function updateproduct($Id, $product_data)
{
    // echo $product_data;
    // die();

    $this->db->query("
        UPDATE `" . DB_PREFIX . "catalog_req`
        SET `product_data` = '" . $product_data . "'
        WHERE `id` = '" . (int)$Id . "'
    ");
}

    public function delete($orderId)
    {
        // Your database deletion logic goes here
        // For example:
        $this->db->query("DELETE FROM `" . DB_PREFIX . "catalog_req` WHERE `id` = '" . (int)$orderId . "'");

        // Check if the deletion was successful
        return $this->db->countAffected() > 0;
    }
    public function getcatalogDataById($Id)
    {
        $query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "catalog_req`
			WHERE `id` = '" . (int)$Id . "'
		");

        return $query->rows;
    }
    // events

    
}
