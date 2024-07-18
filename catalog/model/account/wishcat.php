<?php
class ModelAccountWishcat extends Model {
    public function saveCatData($name, $company_name, $pdf, $product_data) {
        // Escape data to prevent SQL injection
        $name = $this->db->escape($name);
        $company_name = $this->db->escape($company_name);
        $pdf = $this->db->escape($pdf);
        $product_data = $this->db->escape($product_data);

        // Insert data into the database
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "catalog_req`
            (`name`, `company_name`, `pdf`, `product_data`, `status`)
            VALUES ('$name', '$company_name', '$pdf', '$product_data', '0')
        ");
    }

    public function getAllConsultingData() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "catalog_req` WHERE `status` = 1");
        return $query->rows;
    }
}