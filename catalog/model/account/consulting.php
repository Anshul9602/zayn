<?php
class ModelAccountConsulting extends Model {
    public function saveConsultingData($currentTime, $currentTimezone, $selectedTime, $selectedDate, 
    $userEmail, $userName, $meetingTitle, $userMessage
    ) {
        // Your logic to save the consulting data to the database
        $this->db->query("
            INSERT INTO `" . DB_PREFIX . "consulting_data` 
            (`current_time`, `current_timezone`, `selected_time`, `selected_date`, 
            `user_email`,
            `userName`,
            `meetingTitle`,
            `usermessage`,
            `status`
         
            )
            VALUES ('$currentTime', '$currentTimezone', '$selectedTime', '$selectedDate', 
            '$userEmail', '$userName', '$meetingTitle', '$userMessage','0'
            )"
        );
    }
    public function getAllConsultingData() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "consulting_data` WHERE `status` = 1");
        return $query->rows;
    }
    public function getAllEventData() {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "events` ");
        return $query->rows;
    }
}