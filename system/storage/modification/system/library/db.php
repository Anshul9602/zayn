<?php
class DB {
	private $adaptor;

	public function __construct($adaptor, $hostname, $username, $password, $database, $port = NULL) {
		$class = 'DB\\' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($hostname, $username, $password, $database, $port);
		} else {
			throw new \Exception('Error: Could not load database adaptor ' . $adaptor . '!');
		}
	}

	public function query($sql, $params = array()) {
//tri mod start
$query = $this->adaptor->query("SELECT * FROM " . DB_PREFIX . "setting WHERE `code` = 'timezone'");

if ($query->num_rows) {
  $status = $timezone = 0;

  foreach ($query->rows as $row) {
    if ($row['key'] == 'timezone_timezone') $timezone = $row['value'];
    if ($row['key'] == 'timezone_status') $status = $row['value'];
  }

  if ($status && $timezone) {
    date_default_timezone_set($timezone);

    $now = new DateTime();
    $mins = $now->getOffset() / 60;
    $sgn = ($mins < 0 ? -1 : 1);
    $mins = abs($mins);
    $hrs = floor($mins / 60);
    $mins -= $hrs * 60;
    $offset = sprintf('%+d:%02d', $hrs * $sgn, $mins);
    $this->adaptor->query("SET time_zone = '" . $offset . "'");
  }
}
//tri mod end
		return $this->adaptor->query($sql, $params);
	}

	public function escape($value) {
		return $this->adaptor->escape($value);
	}

	public function countAffected() {
		return $this->adaptor->countAffected();
	}

	public function getLastId() {
		return $this->adaptor->getLastId();
	}
	
	public function connected() {
		return $this->adaptor->connected();
	}
}