<?php
class ModelAccountConsulting extends Model {
    public function saveConsultingData($currentTime, $currentTimezone, $selectedTime, $selectedDate, $userEmail) {
        // Your logic to save the consulting data to the database
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "consulting_data` 
            (`current_time`, `current_timezone`, `selected_time`, `selected_date`, `user_email`) 
            VALUES ('$currentTime', '$currentTimezone', '$selectedTime', '$selectedDate', '$userEmail')"
        );
    }
    public function getAllConsultingData() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "consulting_data`");
    
        return $query->rows;
    }
}