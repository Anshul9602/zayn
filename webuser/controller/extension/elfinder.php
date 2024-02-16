<?php
class ControllerExtensionElfinder extends Controller {
	private $el_setting = array();
	public $version;

	public function __construct($registry) {
		parent::__construct($registry);

		$this->el_setting = $this->getSetting();
	}

	public function getSetting() {
		$this->el_setting = $this->config->get('module_elfinder_setting');

		if (!empty($_SERVER['HTTPS'])) {
			$catalog_url = HTTPS_CATALOG;
		} else {
			$catalog_url = HTTP_CATALOG;
		}

		$lang_files = glob(DIR_APPLICATION . 'view/javascript/elfinder/js/i18n/*.js', GLOB_NOSORT);
		$lang_titles = array('en' => 'English');
		if ($lang_files) {
			foreach ($lang_files as $filename) {
				$filename = basename($filename);
				//$filename = utf8_strtolower($filename);
				$filename = str_replace('elfinder.', '', $filename);
				$filename = str_replace('.js', '', $filename);

				if (in_array($filename, array('fallback', 'LANG'))) continue;

				$lang_titles[$filename] = $filename; // TODO parse language file to get name
			}

			asort($lang_titles);
		}

		$el_default_setting = array(
			'debug' => 0,
			'search_autofocus' => 1,
			'path_custom' => 0,
			'trash' => 0,
			'watermark_enable' => 0,
			'watermark_source' => 'elfinder_watermark.png',
			'js_loadTmbs' => 15,
			'js_showFiles' => 60,
			'js_showThreshold' => 200,
			'hidden_prefix' => '_elf_',
			'lang' => 'en',
			'lang_files' => $lang_titles,
		);

		foreach ($el_default_setting as $idx => $value) {
			if (!isset($this->el_setting[$idx])) $this->el_setting[$idx] = $value;
		}

		if (isset($this->el_setting['path_custom']) && $this->el_setting['path_custom'] == 0) {
			$this->el_setting['path'] = DIR_IMAGE . 'catalog';
			$this->el_setting['URL'] = $catalog_url . 'image/catalog';
			$this->el_setting['tmpPath'] = DIR_IMAGE . 'cache/catalog/.tmp';
			$this->el_setting['tmbPath'] = DIR_IMAGE . 'cache/catalog/'. $this->el_setting['hidden_prefix'] .'tmb';
			$this->el_setting['tmbURL'] = $catalog_url . 'image/cache/catalog/'. $this->el_setting['hidden_prefix'] .'tmb';
		}
		if (!empty($this->el_setting['path_custom']) && $this->el_setting['path_custom'] == 1) {
			$this->el_setting['path'] = DIR_IMAGE . '';
			$this->el_setting['URL'] = $catalog_url . 'image';
			$this->el_setting['tmpPath'] = DIR_IMAGE . 'cache/.tmp';
			$this->el_setting['tmbPath'] = DIR_IMAGE . 'cache/'. $this->el_setting['hidden_prefix'] .'tmb';
			$this->el_setting['tmbURL'] = $catalog_url . 'image/cache/'. $this->el_setting['hidden_prefix'] .'tmb';
		}

		return $this->el_setting;
	}

	public function index() {
		$data = $this->load->language('common/filemanager');
		$data = array_merge($data, $this->load->language('extension/elfinder'));

		if (version_compare(VERSION, '3.0.0') >= 0) {
			$data['token_name'] = 'user_token';
			$data['user_token'] = $this->session->data[$data['token_name']];
		} else {
			$data['token_name'] = 'token';
			$data['user_token'] = $this->session->data[$data['token_name']];
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', $data['token_name'] . '=' . $data['user_token'], true),
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/elfinder', $data['token_name'] . '=' . $data['user_token'], true),
		);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['connector_url'] = $this->url->link('extension/elfinder/connector', $data['token_name'] . '=' . $data['user_token'], true);
		$data['setting_url'] = $this->url->link('extension/elfinder/setting', $data['token_name'] . '=' . $data['user_token'], true);

		$data['version'] = $this->getVersion();
		$data['oc_version'] = defined('VERSION') ? VERSION : 0;
		$data['el_setting'] = $this->el_setting;

		$data['modal'] = false;
		$data['iframe'] = false;
		$data['multiple'] = '';
		$data['thumb_image'] = '';
		$data['target_image'] = '';
		$data['CKEditor'] = '';
		$data['CKEditorFuncNum'] = '';

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/elfinder', $data));
	}

	public function getVersion() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "modification` WHERE `code` = 'clicker_elfinder'");
		$this->version = !empty($query->row['version']) ? trim($query->row['version']) : 0;
		return $this->version;
	}

	public function setting() {
		$json = array();

		$this->load->language('common/filemanager');
		$this->load->language('extension/elfinder');

		if (!isset($this->request->post['module_elfinder_setting'])) {
			$json['setting'] = $this->getSetting();
			$json['success'] = 1;
		} else {
			if ($this->user->hasPermission('modify', 'extension/elfinder')) {
				$this->load->model('setting/setting');
				$this->model_setting_setting->editSetting('module_elfinder', $this->request->post);
				$json['success'] = 1;
			} else {
				$json['error'] = 1;
				$json['message'] = $this->language->get('error_permission');
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function clear_image_cache() {
		$this->load->language('common/filemanager');
		$this->load->language('extension/elfinder');

		$json = array();

		$modify = $this->user->hasPermission('modify', 'extension/elfinder') && $this->user->hasPermission('modify', 'common/filemanager');

		if ($modify) {
			$imgfiles = glob(DIR_IMAGE . 'cache/*');

			if ($imgfiles) {
				foreach ($imgfiles as $imgfile) {
					$this->rmdir_recursive($imgfile);
				}
			}

			$json['message'] = $this->language->get('text_success_clear_cache');
			$json['success'] = 1;
		} else {
			$json['message'] = $this->language->get('error_permission');
			$json['error'] = 1;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	private function rmdir_recursive($dirname) {
		if (file_exists($dirname)) {
			if (is_dir($dirname)) {
				$dir = opendir($dirname);

				while ($filename = readdir($dir)){
					if ($filename != "." && $filename != "..") {
						$file = $dirname . "/" . $filename;
						$this->rmdir_recursive($file);
					}
				}

				closedir($dir);
				@rmdir($dirname);
			} else {
				@unlink($dirname);
			}
		}
	}

	public function connector() {
		if (!empty($_SESSION)) {
			session_write_close();
		}

		$autoload_path = 'model/extension/elfinder/autoload.php';
		$autoload_full_path = DIR_APPLICATION . $autoload_path;

		if (!is_file($autoload_full_path)) {
			die('Error! File ' . $autoload_path . ' is absent!');
		}

		require $autoload_full_path;

		$modify = /*$this->user->hasPermission('modify', 'extension/elfinder') &&*/ $this->user->hasPermission('modify', 'common/filemanager');

		$disabled = array();

		if (!$modify) {
			$disabled = array('rename','edit','upload','mkfile','mkdir','rm','cut','copy','duplicate','archive');
		}

		$upload_allow = trim($this->config->get('config_file_mime_allowed'));

		if (empty($upload_allow)) {
			$upload_allow = "
				text/plain
				image
				application/zip
				application/x-zip
				application/x-zip-compressed
				application/rar
				application/x-rar
				application/x-rar-compressed
				application/octet-stream
				application/vnd.ms-excel
				application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
				application/vnd.oasis.opendocument.spreadsheet
				application/msword
				application/vnd.openxmlformats-officedocument.wordprocessingml.document
				application/vnd.oasis.opendocument.text
				application/pdf
				audio/mpeg
				video/quicktime
			";
		}

		$upload_allow = html_entity_decode(str_replace(array("\n\r", "\r\n", "\r", "\n"), PHP_EOL, $upload_allow), ENT_QUOTES, 'UTF-8');
		$upload_allow = array_values(array_unique(array_filter(array_map('trim', explode(PHP_EOL, $upload_allow)))));

		$opts = array(
			'debug' => !empty($this->el_setting['debug']),
			'commonTempPath' => $this->el_setting['tmpPath'],
			'uploadTempPath' => $this->el_setting['tmpPath'],
			'bind' => array(
				'upload.presave' => array()
			),
			'plugins' => array(
			),
			'roots' => array(
				array(
					'driver'         => 'LocalFileSystem',
					'path'           => $this->el_setting['path'],
					'URL'            => $this->el_setting['URL'],
					'tmpPath'        => $this->el_setting['tmpPath'],
					'tmbPath'        => $this->el_setting['tmbPath'],
					'tmbURL'         => $this->el_setting['tmbURL'],
					'tmbCrop'        => false,
					'tmbSize'        => 100,
					'tmbBgColor'     => '#FFFFFF',
					'imgLib'         => 'auto', // auto, imagick, gd
					'mimeDetect'     => 'auto', // auto, internal, finfo, mime_content_type
					//'trashHash'      => 't1_Lw',                     // elFinder's hash of trash folder
					'winHashFix'     => DIRECTORY_SEPARATOR !== '/', // to make hash same to Linux one on windows too
					'utf8fix'        => true,
					'uploadDeny'     => array('all'),
					//'uploadAllow'  => array('image', 'text/plain'),
					'uploadAllow'    => $upload_allow,
					'uploadOrder'    => array('deny', 'allow'),
					'accessControl'  => array($this, 'access'),
					'disabled'       => $disabled,
				),
			),
		);

		if (!empty($this->el_setting['trash'])) {
			$opts['roots'][0]['trashHash'] = 't1_Lw';
			$opts['roots'][] = array(
				'id'              => '1',
				'driver'          => 'Trash',
				'path'            => $this->el_setting['path'] . '/'. $this->el_setting['hidden_prefix'] .'trash',
				'URL'             => $this->el_setting['URL'] . '/'. $this->el_setting['hidden_prefix'] .'trash',
				'tmbPath'         => $this->el_setting['path'] . '/'. $this->el_setting['hidden_prefix'] .'trash-tmb/',
				'tmbURL'          => $this->el_setting['URL'] . '/'. $this->el_setting['hidden_prefix'] .'trash-tmb/',
				'tmbCrop'         => false,
				'tmbSize'         => 100,
				'tmbBgColor'      => '#FFFFFF',
				'imgLib'          => 'auto', // auto, imagick, gd
				'mimeDetect'      => 'auto', // auto, internal, finfo, mime_content_type
				'winHashFix'      => DIRECTORY_SEPARATOR !== '/', // to make hash same to Linux one on windows too
				'utf8fix'         => true,
				'uploadDeny'      => array('all'),
				'uploadAllow'     => $upload_allow,
				'uploadOrder'     => array('deny', 'allow'),      // Same as above
				//'accessControl'   => array($this, 'access'),      // grant access to the dot named folder
				//'disabled'        => $disabled,
			);
		}

		if (!empty($opts['commonTempPath']) && !is_dir($opts['commonTempPath'])) {
			mkdir($opts['commonTempPath'], 0777, true);
		}

		if (!empty($opts['uploadTempPath']) && !is_dir($opts['uploadTempPath'])) {
			mkdir($opts['uploadTempPath'], 0777, true);
		}

		if (!empty($opts['roots'])) {
			foreach ($opts['roots'] as $root) {
				if (!empty($root['path']) && !is_dir($root['path'])) {
					mkdir($root['path'], 0777, true);
				}
				if (!empty($root['tmpPath']) && !is_dir($root['tmpPath'])) {
					mkdir($root['tmpPath'], 0777, true);
				}
				if (!empty($root['tmbPath']) && !is_dir($root['tmbPath'])) {
					mkdir($root['tmbPath'], 0777, true);
				}
			}
		}

		if (!empty($this->el_setting['watermark_enable']) && !empty($this->el_setting['watermark_source']) && is_file($this->el_setting['path'] . '/' . $this->el_setting['watermark_source'])) {
			$opts['bind']['upload.presave'][] = 'Plugin.Watermark.onUpLoadPreSave';

			$opts['plugin']['Watermark'] = array(
				'enable'         => !empty($this->el_setting['watermark_enable']),       // For control by volume driver
				'source'         => $this->el_setting['path'] . '/' . $this->el_setting['watermark_source'], // Path to Water mark image
				'ratio'          => isset($this->el_setting['watermark_ratio']) ? (float)$this->el_setting['watermark_ratio'] : 0.2,        // Ratio to original image (ratio > 0 and ratio <= 1)
				'position'       => isset($this->el_setting['watermark_position']) ? $this->el_setting['watermark_position'] : 'RB',       // Position L(eft)/C(enter)/R(ight) and T(op)/M(edium)/B(ottom)
				'marginX'        => isset($this->el_setting['watermark_marginX']) ? (int)$this->el_setting['watermark_marginX'] : 20,          // Margin horizontal pixel
				'marginY'        => isset($this->el_setting['watermark_marginY']) ? (int)$this->el_setting['watermark_marginY'] : 20,          // Margin vertical pixel
				'quality'        => isset($this->el_setting['watermark_quality']) ? (int)$this->el_setting['watermark_quality'] : 95,         // JPEG image save quality
				'transparency'   => isset($this->el_setting['watermark_transparency']) ? (int)$this->el_setting['watermark_transparency'] : 60,      // Water mark image transparency ( other than PNG )
				'targetType'     => IMG_GIF|IMG_JPG|IMG_PNG|IMG_WBMP, // Target image formats ( bit-field )
				'targetMinPixel' => isset($this->el_setting['watermark_targetMinPixel']) ? (int)$this->el_setting['watermark_targetMinPixel'] : 200, // Target image minimum pixel size
				'interlace'      => IMG_GIF|IMG_JPG, // Set interlacebit image formats ( bit-field )
				'offDropWith'    => !empty($this->el_setting['watermark_offDropWith']) ? (int)$this->el_setting['watermark_offDropWith'] : null,       // Enabled by default. To disable it if it is dropped with pressing the meta key
												// Alt: 8, Ctrl: 4, Meta: 2, Shift: 1 - sum of each value
												// In case of using any key, specify it as an array
				'onDropWith'     => !empty($this->el_setting['watermark_onDropWith']) ? (int)$this->el_setting['watermark_onDropWith'] : null        // Disabled by default. To enable it if it is dropped with pressing the meta key
												// Alt: 8, Ctrl: 4, Meta: 2, Shift: 1 - sum of each value
												// In case of using any key, specify it as an array
			);
		}

		if (!empty($this->el_setting['autoresize_enable'])) {
			$opts['bind']['upload.presave'][] = 'Plugin.AutoResize.onUpLoadPreSave';

			$opts['plugin']['AutoResize'] = array(
				'enable'         => !empty($this->el_setting['autoresize_enable']),       // For control by volume driver
				'maxWidth'       => isset($this->el_setting['autoresize_maxWidth']) ? (int)$this->el_setting['autoresize_maxWidth'] : 1024,   // MaxWidth
				'maxHeight'      => isset($this->el_setting['autoresize_maxHeight']) ? (int)$this->el_setting['autoresize_maxHeight'] : 1024, // MaxHeight
				'quality'        => isset($this->el_setting['autoresize_quality']) ? (int)$this->el_setting['autoresize_quality'] : 95,       // JPEG image save quality
				'preserveExif'   => false,      // Preserve EXIF data (Imagick only)
				'forceEffect'    => false,      // For change quality or make progressive JPEG of small images
				'targetType'     => IMG_GIF|IMG_JPG|IMG_PNG|IMG_WBMP, // Target image formats ( bit-field )
				'offDropWith'    => !empty($this->el_setting['autoresize_offDropWith']) ? (int)$this->el_setting['autoresize_offDropWith'] : null,       // Enabled by default. To disable it if it is dropped with pressing the meta key
												// Alt: 8, Ctrl: 4, Meta: 2, Shift: 1 - sum of each value
												// In case of using any key, specify it as an array
				'onDropWith'     => !empty($this->el_setting['autoresize_onDropWith']) ? (int)$this->el_setting['autoresize_onDropWith'] : null        // Disabled by default. To enable it if it is dropped with pressing the meta key
												// Alt: 8, Ctrl: 4, Meta: 2, Shift: 1 - sum of each value
												// In case of using any key, specify it as an array
			);
		}

		$connector = new elFinderConnector(new elFinder($opts));

		$connector->run();
	}

	/**
	 * Simple function to demonstrate how to control file access using "accessControl" callback.
	 * This method will disable accessing files/folders starting from '.' (dot)
	 *
	 * @param  string $attr attribute name (read|write|locked|hidden)
	 * @param  string $path file path relative to volume root directory started with directory separator
	 *
	 * @return bool|null
	 **/
	public function access($attr, $path, $data, $volume) {
		// if file/folder begins with '.' (dot)
		if (strpos(basename($path), '.') === 0) {
			// set read+write to false, other (locked+hidden) set to true
			return !($attr == 'read' || $attr == 'write');
		}

		// if file/folder begins with system '_elf_' prefix (dot)
		if (!empty($this->el_setting['hidden_prefix']) && strpos(basename($path), $this->el_setting['hidden_prefix']) === 0) {
			return !($attr == 'read' || $attr == 'write');
		}

		// elFinder decide it itself
		return null;
	}
}

/*
 * Elfinder 2.1.51n 2020-01-12
 * Fix Resize window
 * Add debug option in settings
 * Fix OCStore CKEditor compatibility
*/