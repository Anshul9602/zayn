<?php
class ModelReportConsulting extends Model
{
    public function getAllConsultingData()
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "consulting_data`");

        return $query->rows;
    }
    public function getTotalAppoint()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "consulting_data`");

        return $query->row['total'];
    }
    public function updateStatus($Id)
    {
        // Your database update logic goes here
        // For example, assuming you have a table named oc_appointments with a status column
        $this->db->query("
        UPDATE `" . DB_PREFIX . "consulting_data` 
        SET `status` = IF(`status` = 1, 0, 1) 
        WHERE `ap_id` = '" . (int)$Id . "'
    ");
    }
    public function delete($orderId)
    {
        // Your database deletion logic goes here
        // For example:
        $this->db->query("DELETE FROM `" . DB_PREFIX . "consulting_data` WHERE `ap_id` = '" . (int)$orderId . "'");

        // Check if the deletion was successful
        return $this->db->countAffected() > 0;
    }
    public function getConsultingDataById($apId)
    {
        $query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "consulting_data`
			WHERE `ap_id` = '" . (int)$apId . "'
		");

        return $query->rows;
    }
    // events

    public function getAllEventData()
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "events`");
        return $query->rows;
    }

    public function getTotalEvents()
    {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "events`");
        return $query->row['total'];
    }

    public function updateEvent($data)
    {
        // print_r($data);
        // die();
        $name = $data['name'];
        $dis = $data['des'];
        $date = $data['date'];

        $this->db->query("
        UPDATE `" . DB_PREFIX . "events` 
        SET `name` = '$name', `dis` = '$dis',`date` = '$date'
        WHERE `id` = '" . (int)$data['id'] . "'
    ");
    }

    public function deleteEvent($eventId)
    {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "events` WHERE `id` = '" . (int)$eventId . "'");
        return $this->db->countAffected() > 0;
    }

    public function getEventDataById($eventId)
    {
        $query = $this->db->query("
        SELECT *
        FROM `" . DB_PREFIX . "events`
        WHERE `id` = '" . (int)$eventId . "'
    ");
        return $query->row;
    }

    public function addEvent($data)
    {
        $this->db->query("
        INSERT INTO `" . DB_PREFIX . "events` 
        SET 
        `name` = '" . $this->db->escape($data['name']) . "',
        `dis` = '" . $this->db->escape($data['dis']) . "',
        `date` = '" . $this->db->escape($data['date']) . "'
    ");
        return $this->db->getLastId();
    }
}
