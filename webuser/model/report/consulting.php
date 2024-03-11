<?php
class ModelReportConsulting extends Model {
	public function getAllConsultingData() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "consulting_data`");
    
        return $query->rows;
    }
	public function getTotalAppoint() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "consulting_data`");

        return $query->row['total'];
    }
	public function updateStatus($Id) {
        // Your database update logic goes here
        // For example, assuming you have a table named oc_appointments with a status column
        $this->db->query("
            UPDATE `" . DB_PREFIX . "consulting_data` 
            SET `status` = IF(`status` = 1) 
            WHERE `ap_id` = '" . (int)$Id . "'
        ");
    }
	public function getConsultingDataById($apId) {
		$query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "consulting_data`
			WHERE `ap_id` = '" . (int)$apId . "'
		");
	
		return $query->rows;
	}
}
