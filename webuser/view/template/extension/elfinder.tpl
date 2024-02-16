<?php if ($iframe) { ?>
<?php /* iframe template inside popup */ ?>
<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<!-- <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script> -->

<!--
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
-->

<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

<link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/javascript/elfinder/css/elfinder.min.css" rel="stylesheet" media="screen" />
<link type="text/css" href="view/javascript/elfinder/css/theme.css" rel="stylesheet" media="screen" />
<!-- <link type="text/css" href="view/javascript/jquery/jquery-ui/jquery-ui.min.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="view/javascript/jquery/jquery-ui/jquery-ui.min.js"></script>-->
<!-- <script type="text/javascript" src="view/javascript/elfinder/js/elfinder.min.js"></script> -->
</head>
<body>
	<div id="elfinder" data-connector-url="<?php echo $connector_url; ?>"></div>


<?php } else { ?> <?php /* end iframe */ ?>



	<?php if (!$modal) { ?>
<?php /* extensions fullscreen template */ ?>
	<?php echo $header; ?><?php echo $column_left; ?>

	<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		<div class="pull-right">
			<a data-toggle="tooltip" title="<?php echo $button_settings; ?>" class="btn btn-default" onclick="settings_popup();"><i class="fa fa-cog"></i></a>
			<a data-toggle="tooltip" title="<?php echo $button_clear_image_cache; ?>" class="btn btn-warning" onclick="clear_image_cache();"><i class="fa fa-refresh"></i></a>
		</div>
		<h1><?php echo $heading_title; ?></h1>
		<ul class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($success) { ?>
		<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>
		<?php if ($error_warning) { ?>
		<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php } ?>

		<div class="elfinder-wr fog">
			<div id="loading-message"><i class="fa fa-circle-o-notch fa-spin"></i><?php echo $text_loading_message; ?></div>
			<div id="elfinder" data-connector-url="<?php echo $connector_url; ?>"></div>
		</div>
	</div>
	<div id="elfinder-settings-popup-wr" style="display:none;">
		<form action="" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
			<h4><?php echo $button_settings; ?></h4><br>
			<!-- Controller -->
			<ul class="nav nav-tabs">
				<li class="nav-item active"><a href="#tab-settings-main----prot---" data-toggle="tab" class="nav-link active"><?php echo $text_main; ?></a></li>
				<li class="nav-item"><a href="#tab-settings-watermark----prot---" data-toggle="tab" class="nav-link"><?php echo $text_watermark; ?></a></li>
				<li class="nav-item"><a href="#tab-settings-autoresize----prot---" data-toggle="tab" class="nav-link"><?php echo $text_autoresize; ?></a></li>
				<li class="nav-item"><a href="#tab-settings-about----prot---" data-toggle="tab" class="nav-link"><?php echo $text_about; ?></a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab-settings-main----prot---">
					<div class="row form-group">
						<label class="col-sm-3 control-label" for="input-lang"><?php echo $entry_language; ?></label>
						<div class="col-sm-9">
							<select class="form-control" name="module_elfinder_setting[lang]" id="input-lang">
								<?php foreach ($el_setting['lang_files'] as $lang_key => $lang_title) { ?>
								<option value="<?php echo $lang_key; ?>"><?php echo $lang_title; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label" for="input-path-custom"><?php echo $text_path_settings; ?></label>
						<div class="col-sm-9">
							<select class="form-control" name="module_elfinder_setting[path_custom]" id="input-path-custom" onchange="if ($(this).val() == '2') { $(this).closest('form').find('.custom-path').show(); } else { $(this).closest('form').find('.custom-path').hide(); }">
								<option value="0"><?php echo $text_default_folder; ?></option>
								<option value="1"><?php echo $text_parent_folder; ?></option>
								<option value="2"><?php echo $text_custom; ?></option>
							</select>
						</div>
					</div>
					<div class="row form-group custom-path">
						<label class="col-sm-3 control-label" for="input-path">path</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[path]" value="" placeholder="" id="input-path" class="form-control"/>
						</div>
					</div>
					<div class="row form-group custom-path">
						<label class="col-sm-3 control-label" for="input-url">URL</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[URL]" value="" placeholder="" id="input-url" class="form-control"/>
						</div>
					</div>
					<div class="row form-group custom-path">
						<label class="col-sm-3 control-label" for="input-tmp-path">tmpPath</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[tmpPath]" value="" placeholder="" id="input-tmp-path" class="form-control"/>
						</div>
					</div>
					<div class="row form-group custom-path">
						<label class="col-sm-3 control-label" for="input-tmb-path">tmbPath</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[tmbPath]" value="" placeholder="" id="input-tmb-path" class="form-control"/>
						</div>
					</div>
					<div class="row form-group custom-path">
						<label class="col-sm-3 control-label" for="input-tmb-url">tmbURL</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[tmbURL]" value="" placeholder="" id="input-tmb-url" class="form-control"/>
						</div>
					</div>

					<div class="row form-group">
						<label class="col-sm-3 col-form-label control-label" for="input-module_elfinder_setting[trash]"><?php echo $entry_trash; ?></label>
						<div class="col-sm-9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-default btn-outline-secondary"><input type="radio" name="module_elfinder_setting[trash]" value="1"/> <?php echo $text_on; ?></label>
								<label class="btn btn-default btn-outline-secondary active"><input type="radio" name="module_elfinder_setting[trash]" value="0" checked="checked"/> <?php echo $text_off; ?></label>
							</div>
						</div>
					</div>

					<!-- JS -->
					<div class="row form-group">
						<label class="col-sm-3 control-label" for="input-load-tmbs">loadTmbs</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[js_loadTmbs]" value="15" placeholder="" id="input-load-tmbs" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label" for="input-show-files">showFiles</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[js_showFiles]" value="60" placeholder="" id="input-show-files" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label" for="input-show-threshold">showThreshold</label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[js_showThreshold]" value="200" placeholder="" id="input-show-threshold" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 col-form-label control-label" for="input-module_elfinder_setting[search_autofocus]"><?php echo $entry_search_autofocus; ?></label>
						<div class="col-sm-9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-default btn-outline-secondary"><input type="radio" name="module_elfinder_setting[search_autofocus]" value="1"/> <?php echo $text_on; ?></label>
								<label class="btn btn-default btn-outline-secondary active"><input type="radio" name="module_elfinder_setting[search_autofocus]" value="0" checked="checked"/> <?php echo $text_off; ?></label>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 col-form-label control-label" for="input-module_elfinder_setting[debug]"><?php echo $entry_debug; ?></label>
						<div class="col-sm-9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-default btn-outline-secondary"><input type="radio" name="module_elfinder_setting[debug]" value="1"/> <?php echo $text_on; ?></label>
								<label class="btn btn-default btn-outline-secondary active"><input type="radio" name="module_elfinder_setting[debug]" value="0" checked="checked"/> <?php echo $text_off; ?></label>
							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane" id="tab-settings-watermark----prot---">
					<div class="row form-group">
						<label class="col-sm-3 col-form-label control-label" for="input-module_elfinder_setting[watermark_enable]"><?php echo $text_watermark; ?></label>
						<div class="col-sm-9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-default btn-outline-secondary"><input type="radio" name="module_elfinder_setting[watermark_enable]" value="1"/> <?php echo $text_on; ?></label>
								<label class="btn btn-default btn-outline-secondary active"><input type="radio" name="module_elfinder_setting[watermark_enable]" value="0" checked="checked"/> <?php echo $text_off; ?></label>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_source"><?php echo $entry_watermark_source; ?></label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[watermark_source]" value="" placeholder="image/elfinder_watermark.png" id="input-watermark_source" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_targetMinPixel"><?php echo $entry_watermark_targetMinPixel; ?></label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[watermark_targetMinPixel]" value="300" placeholder="200" id="input-watermark_targetMinPixel" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_position"><?php echo $entry_watermark_position; ?></label>
						<div class="col-sm-3">
							<select class="form-control" id="input-watermark_position" name="module_elfinder_setting[watermark_position]">
								<option value="LT"><?php echo $text_left_top; ?></option>
								<option value="CT"><?php echo $text_center_top; ?></option>
								<option value="RT"><?php echo $text_right_top; ?></option>
								<option value="LM"><?php echo $text_left_medium; ?></option>
								<option value="CM"><?php echo $text_center_medium; ?></option>
								<option value="RM"><?php echo $text_right_medium; ?></option>
								<option value="LB"><?php echo $text_left_bottom; ?></option>
								<option value="CB"><?php echo $text_center_bottom; ?></option>
								<option value="RB" selected="selected"><?php echo $text_right_bottom; ?></option>
							</select>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-watermark_ratio"><?php echo $entry_watermark_ratio; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_ratio]" value="0.2" placeholder="0.2" id="input-watermark_ratio" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_marginX"><?php echo $entry_watermark_marginX; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_marginX]" value="10" placeholder="10" id="input-watermark_marginX" class="form-control"/>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-watermark_marginY"><?php echo $entry_watermark_marginY; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_marginY]" value="10" placeholder="10" id="input-watermark_marginY" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_transparency"><?php echo $entry_watermark_transparency; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_transparency]" value="60" placeholder="60" id="input-watermark_transparency" class="form-control"/>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-watermark_quality"><?php echo $entry_watermark_quality; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_quality]" value="95" placeholder="95" id="input-watermark_quality" class="form-control"/>
						</div>
					</div>
					<!--<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_targetMinPixel"><?php echo $entry_watermark_targetType; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_targetType]" value="IMG_GIF|IMG_JPG|IMG_PNG|IMG_WBMP" placeholder="IMG_GIF|IMG_JPG|IMG_PNG|IMG_WBMP" id="input-watermark_targetType" class="form-control"/>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-watermark_interlace"><?php echo $entry_watermark_interlace; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[watermark_interlace]" value="IMG_GIF|IMG_JPG" placeholder="IMG_GIF|IMG_JPG" id="input-watermark_interlace" class="form-control"/>
						</div>
					</div>-->
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-watermark_offDropWith"><?php echo $entry_watermark_offDropWith; ?></label>
						<div class="col-sm-3">
							<select class="form-control" id="input-watermark_offDropWith" name="module_elfinder_setting[watermark_offDropWith]">
								<option value="0"></option>
								<option value="8">ALT</option>
								<option value="4">CTRL</option>
								<option value="2">META</option>
								<option value="1" selected="selected">SHIFT</option>
							</select>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-watermark_onDropWith"><?php echo $entry_watermark_onDropWith; ?></label>
						<div class="col-sm-3">
							<select class="form-control" id="input-watermark_onDropWith" name="module_elfinder_setting[watermark_onDropWith]">
								<option value="0" selected="selected"></option>
								<option value="8">ALT</option>
								<option value="4">CTRL</option>
								<option value="2">META</option>
								<option value="1">SHIFT</option>
							</select>
						</div>
					</div>
				</div>

				<div class="tab-pane" id="tab-settings-autoresize----prot---">
					<div class="row form-group">
						<label class="col-sm-3 col-form-label control-label" for="input-module_elfinder_setting[autoresize_enable]"><?php echo $text_autoresize; ?></label>
						<div class="col-sm-9">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-default btn-outline-secondary"><input type="radio" name="module_elfinder_setting[autoresize_enable]" value="1"/> <?php echo $text_on; ?></label>
								<label class="btn btn-default btn-outline-secondary active"><input type="radio" name="module_elfinder_setting[autoresize_enable]" value="0" checked="checked"/> <?php echo $text_off; ?></label>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-autoresize_maxWidth"><?php echo $entry_autoresize_maxWidth; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[autoresize_maxWidth]" value="1024" placeholder="10" id="input-autoresize_maxWidth" class="form-control"/>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-autoresize_maxHeight"><?php echo $entry_autoresize_maxHeight; ?></label>
						<div class="col-sm-3">
							<input type="text" name="module_elfinder_setting[autoresize_maxHeight]" value="1024" placeholder="10" id="input-autoresize_maxHeight" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-autoresize_quality"><?php echo $entry_watermark_quality; ?></label>
						<div class="col-sm-9">
							<input type="text" name="module_elfinder_setting[autoresize_quality]" value="95" placeholder="95" id="input-autoresize_quality" class="form-control"/>
						</div>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label control-label" for="input-autoresize_offDropWith"><?php echo $entry_watermark_offDropWith; ?></label>
						<div class="col-sm-3">
							<select class="form-control" id="input-autoresize_offDropWith" name="module_elfinder_setting[autoresize_offDropWith]">
								<option value="0"></option>
								<option value="8">ALT</option>
								<option value="4">CTRL</option>
								<option value="2">META</option>
								<option value="1" selected="selected">SHIFT</option>
							</select>
						</div>
						<label class="col-sm-3 control-label control-label" for="input-autoresize_onDropWith"><?php echo $entry_watermark_onDropWith; ?></label>
						<div class="col-sm-3">
							<select class="form-control" id="input-autoresize_onDropWith" name="module_elfinder_setting[autoresize_onDropWith]">
								<option value="0" selected="selected"></option>
								<option value="8">ALT</option>
								<option value="4">CTRL</option>
								<option value="2">META</option>
								<option value="1">SHIFT</option>
							</select>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-settings-about----prot---">
					<div class="row form-group">
						<label class="col-sm-3 control-label">Product</label>
						<label class="col-sm-9 control-label" style="text-align: left; font-weight: normal;">
							Extended File Manager (Elfinder) v.<?php echo $version; ?> by Cl!icker
						</label>
					</div>

					<div class="row form-group">
						<label class="col-sm-3 control-label">Support</label>
						<label class="col-sm-9 control-label" style="text-align: left; font-weight: normal;">
							info@clicker.com.ua
						</label>
					</div>
					<div class="row form-group">
						<label class="col-sm-3 control-label">Our extensions</label>
						<label class="col-sm-9 control-label" style="text-align: left; font-weight: normal;">
							<a href="https://www.opencart.com/index.php?route=marketplace/extension&filter_member=Cl!cker" target="_blank">OpenCart Marketplace</a> or <a href="https://opencart.click" target="_blank">opencart.click</a>
						</label>
					</div>
				</div>
			</div>
		</form>
	</div>

	</div>


	<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>-->
	<!-- <link type="text/css" href="view/javascript/jquery/jquery-ui/jquery-ui.min.css" rel="stylesheet" media="screen" /> -->
	<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<link type="text/css" href="view/javascript/elfinder/css/elfinder.min.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="view/javascript/elfinder/css/theme.css" rel="stylesheet" media="screen" />
	<!-- <script type="text/javascript" src="view/javascript/jquery/jquery-ui/jquery-ui.min.js"></script> -->
	<!-- <script type="text/javascript" src="view/javascript/elfinder/js/elfinder.min.js"></script>-->





	<?php } else { ?>




<?php /* popup template */ ?>
	<div id="fm_emulator" style="display:none;">
		<a href="" class="thumbnail"><img src="" /></a>
		<label>
			<input type="hidden" name="path[]" value="" />
		</label>
	</div>
	<div id="filemanager" class="modal-dialog modal-lg">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding:3px 9px;">&times;</button>
			<h4 class="modal-title"><?php echo $heading_title; ?></h4>
			<div class="pull-right" style="margin-top:-27px;margin-bottom:-8px;margin-right:30px;">
				<a data-toggle="tooltip" title="<?php echo $button_settings; ?>" class="btn btn-default" onclick="settings_popup();"><i class="fa fa-cog"></i></a>
				<a data-toggle="tooltip" title="<?php echo $button_clear_image_cache; ?>" class="btn btn-warning" onclick="clear_image_cache();"><i class="fa fa-refresh"></i></a>
			</div>
		</div>
		<div class="modal-body">
			<div class="elfinder-wr row fog">
				<div id="loading-message"><i class="fa fa-circle-o-notch fa-spin"></i><?php echo $text_loading_message; ?></div>
				<iframe src="<?php echo $iframe_link; ?>" width="100%" height="100%" style="border:none; width: 100%; height: auto; overflow: hidden;">
					Your browser doesn't support iframes!
				</iframe>
			</div>
		</div>
		<!-- <div class="modal-footer"></div> -->
	</div>
	</div>

	<script type="text/javascript" charset="utf-8">
		//window.onload = function() {
			//console.log($scope);
			var inner_height = 0;
			if (window.innerHeight > 800) {
				inner_height = window.innerHeight-300;
			} else {
				inner_height = window.innerHeight-120;
			}

			if (inner_height < 300) {
				inner_height = 300;
			}

			$('.elfinder-wr > iframe').css('height', inner_height+'px');
		//}
	</script>



	<?php } ?>

<?php } ?> <?php /* end not iframe */ ?>

<style type="text/css">
.elfinder .elfinder-navbar {
	background: #F6F6F6!important;
}
.elfinder.ui-corner-all, .elfinder-toolbar.ui-corner-top, .elfinder-statusbar.ui-corner-bottom {
	border-radius: 0!important;
}
.elfinder-toolbar, .elfinder-statusbar {
	background: #F6F6F6!important;
}
.elfinder-button-search .ui-icon {
	margin: -10px 4px 0!important;
}
.elfinder-wr .buttonset input {
	width: auto!important;
}
.elfinder-cwd-icon {
	margin: 26px!important;
}
.elfinder-cwd-view-list td .elfinder-cwd-icon {
	margin: -8px!important;
}
.elfinder-cwd-bgurl::after, .elfinder-cwd-bgurl {
	width: 100px!important;
	height: 100px!important;
	margin: 2px !important;
}
.elfinder-cwd-wrapper-list .elfinder-cwd-bgurl::after, .elfinder-cwd-wrapper-list .elfinder-cwd-bgurl {
	width: 16px!important;
	height: 16px!important;
}
.elfinder-cwd-view-icons .elfinder-cwd-file-wrapper {
	width: 104px!important;
	height: 104px!important;
}
.elfinder-cwd-view-icons .elfinder-cwd-file {
	width: 150px!important;
	height: 160px!important;
	overflow: hidden!important;
}
.elfinder-cwd-view-icons .elfinder-cwd-file .elfinder-cwd-filename.ui-state-hover, .elfinder-cwd table td.ui-state-hover, .elfinder-button-menu .ui-state-hover {
	background: #1e91cf!important;
	color: #FFF!important;
}
.elfinder-cwd-view-icons .elfinder-cwd-filename {
	-moz-border-radius: 3px!important;
	-webkit-border-radius: 3px!important;
	border-radius: 3px!important;
	max-height: 52px!important;
	padding: 5px 2px!important;
}
.modal-lg {
	width: 75%;
}
.modal-body {
	padding: 0 15px;
}
.modal-body .elfinder {
	border-top: 0!important;
}
#elfinder .ui-buttonset input[type="radio"], .ui-helper-hidden-accessible {
	display: none!important;
}
.elfinder-quicklook-titlebar-icon.elfinder-platformWin .ui-icon {
	margin: 0px 0 0 6px!important;
	float: right!important;
	width: 18px!important;
	height: 18px!important;
}
.elfinder .elfinder-button-search {
	width: 220px;
}
@media only screen and (max-width: 813px) {
	.modal-lg {
		width: calc(100% - 20px);
	}
}
.fog {
	opacity: 0.9;
	pointer-events: none;
	position: relative;
	-webkit-user-select: none; /* webkit (safari, chrome) browsers */
	-moz-user-select: none; /* mozilla browsers */
	-khtml-user-select: none; /* webkit (konqueror) browsers */
	-ms-user-select: none; /* IE10+ */
}
.fog:after {
	display: block;
	content: " ";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(255,255,255,0.7);
	background: -moz-linear-gradient(top, rgba(255,255,255,0.01) 0%, rgba(255,255,255,0.7) 20%, rgba(255,255,255,0.7) 80%, rgba(246,246,246,0.01) 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(top, rgba(255,255,255,0.01) 0%,rgba(255,255,255,0.7) 20%,rgba(255,255,255,0.7) 80%,rgba(246,246,246,0.01) 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(to bottom, rgba(255,255,255,0.01) 0%,rgba(255,255,255,0.7) 20%,rgba(255,255,255,0.7) 80%,rgba(246,246,246,0.01) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#33ffffff', endColorstr='#33f6f6f6',GradientType=0 ); /* IE6-9 */
}
#loading-message {
	display:none;
}
#loading-message .fa.fa-spin {
	float: left;
	margin: 0 0 0 -50px;
	font-size: 36px;
	transform-origin: 50% 51%;
}
.fog #loading-message {
	display: block;
	position: fixed;
	opacity: 1;
	padding: 25px;
	padding-left: 70px;
	width: 350px;
	left: calc(50% - 175px);
	top: 30%;
	background: rgba(251,154,29,0.8);
	color: #FFFFFF;
	z-index:101;
	border: 3px solid rgba(251,154,29,1);
	border-radius:10px;
}
.elfinder-wr .alert-dismissible {
	position: absolute;
	margin-top: -65px;
	right: 200px;
}
.elfinder-toolbar {
	display:block!important;
	height:auto!important;
}
/* SweetAlert2 */
.lt-popup.swal2-popup {
	border-radius: 3px;
}
.lt-popup .swal2-close {
	background: rgba(0,0,0,0.0);
	color: rgba(0,0,0,0.7);
}
.lt-popup .swal2-close:hover {
	background: rgba(0,0,0,0);
}
.lt-popup .swal2-content {
	text-align: left;
	font-size: 130%;
}
.lt-popup .swal2-actions {
	-webkit-box-align: end;
	align-items: flex-end;
	-webkit-box-pack: end;
	justify-content: flex-end;
	font-size: 130%;
}
.lt-popup.swal-width-1000 {
	width: 96%;
	max-width: 1040px;
}
.lt-popup.swal-width-full {
	width: 100%;
	max-width: 1600px;
}
.lt-popup.swal-height-full {
	-webkit-box-pack: start;
	justify-content: start;
	overflow-x: auto;
	max-height: 100%;
}
.lt-popup .swal2-styled.swal2-confirm {
	/*background-color: #FF7BAC;*/
}
.lt-popup .swal2-styled.swal2-cancel {
	background-color: #949494;
}
.lt-popup .popup-header {
	padding-bottom: 15px;
	border-bottom: 1px solid #dee2e6;
}
.lt-popup .popup-header .col.title {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.lt-popup-container {
	z-index: 15001;
}
.lt-popup-settings .form-horizontal .form-group {
	margin-left: 0;
	margin-right: 0;
}
</style>





<script type="text/javascript" charset="utf-8">
var elfinder = null;
var c_vars = {
	'version': '<?php echo $version; ?>',
	'oc': '<?php echo $oc_version; ?>',
	'token_name': '<?php echo $token_name; ?>',
	'user_token': '<?php echo $user_token; ?>',
	'setting_url': '<?php echo $setting_url; ?>',
	'modal': '<?php echo $modal; ?>',
	'iframe': '<?php echo $iframe; ?>',
	'multiple': '<?php echo $multiple; ?>',
	'CKEditorFuncNum': '<?php echo $CKEditorFuncNum; ?>',
	'cke': null,
	'target_image': '<?php echo $target_image; ?>',
	'thumb_image': '<?php echo $thumb_image; ?>',
	'button_cancel': '<?php echo $button_cancel; ?>',
	'button_save': '<?php echo $button_save; ?>',
	'text_confirm_clear_cache': '<?php echo $text_confirm_clear_cache; ?>',
};

var c_setting = <?php echo !empty($el_setting) ? json_encode($el_setting) : '{}'; ?>;
</script>

<?php if (!$modal || $iframe) { ?>
<script type="text/javascript" charset="utf-8">
function initElfinder(el_options) {
	if (typeof elFinder == 'undefined') {
		var message = 'elFinder.js not loaded!';
		alert(message);
		throw Error(message);
	} else {
		//console.log(elFinder);
	}

	if (c_vars.iframe) {
		parent.$('.elfinder-wr').addClass('fog');

		parent.$('#modal-image').on('hide.bs.modal', function () {
			setTimeout(function() {
				parent.$('#modal-image').remove();
			}, 200);
		});

		el_options['getFileCallback'] = function(file) {
			if (c_vars.multiple && typeof parent[c_vars.multiple] == 'function') {
				parent[c_vars.multiple](file);
				/*setTimeout(function() {
					elfinder.elfinder('destroy');
					parent.$('#modal-image').remove();
				}, 200);*/
				return;
			}

			var emulate_fm = false; // emulate standard file manager events
			var journal2_fm = false; // journal template

			if (c_vars.CKEditorFuncNum === '') {
				var a_events = parent.$._data(parent.document.querySelector('#modal-image'), "events");

				if (typeof a_events != 'undefined' && a_events.click) {
					for (var idx in a_events.click) {
						if (a_events.click[idx].selector == 'a.thumbnail') {
							emulate_fm = true;
							break;
						}
					}
				}

				if (c_vars.target_image != '') {
					if (parent.$('#' + c_vars.target_image).parent().hasClass('ng-isolate-scope')) {
						emulate_fm = false;
						journal2_fm = true;
					}
				}
			}

			if (file.path && (String(file.path).substring(0, 6) == 'image\\' || String(file.path).substring(0, 6) == 'image/')) {
				// Fix root for image folder if default is not image/catalog
				file.path = String(file.path).substring(6);
			}

			if (emulate_fm) {
				console.log('emulate_fm');

				if (file.url == file.baseUrl) {
					console.log('Please wait several seconds! file.url is not filled yet!');
					return;
				}
				parent.$('#modal-image #fm_emulator a.thumbnail:first').attr('href', file.url);
				parent.$('#modal-image #fm_emulator a.thumbnail:first img').attr('src', file.tmb);
				parent.$('#modal-image #fm_emulator a.thumbnail:first').parent().find('input').attr('value', file.path);
				parent.$('#modal-image #fm_emulator a.thumbnail:first').click();
			} else if (journal2_fm) {
				console.log('journal2_fm');

				parent.$('#' + c_vars.target_image).val(file.path);
				parent.angular.element("#" + c_vars.target_image).scope().image = file.path;
				parent.$('#modal-image #fm_emulator a.thumbnail:first').click();
			} else if (c_vars.CKEditorFuncNum !== '' && window.opener) {
				console.log('ckeditor_fm');

				if (file.url == file.baseUrl) {
					console.log('Please wait several seconds! file.url is not filled yet!');
					return;
				}

				window.opener.CKEDITOR.tools.callFunction(c_vars.CKEditorFuncNum, file.url);

				self.close();
			} else if (c_vars.cke && parent.CKEDITOR) {
				console.log('ckeditor_cke');

				var cke_target = c_vars.cke.split(':'); //link,txtUrl
				parent.CKEDITOR.dialog.getCurrent().setValueOf(cke_target[0], cke_target[1], file.path);
			} else if (parent.CKEDITOR && parent.CKEDITOR.dialog.getCurrent()) { // ANOTHER CKEDITOR METHOD
				console.log('ckeditor enhanced');
				var urlelement = "";
				var obj_target = 'info';
				if (parent.CKEDITOR.dialog.getCurrent()) {
					dialog = parent.CKEDITOR.dialog.getCurrent();
					link = file.url;
					if (dialog.getContentElement('info', 'txtUrl')) {
						urlelement = 'txtUrl';
						obj_target = 'info';
					};
					if (dialog.getContentElement('info', 'src')) {
						urlelement = 'src';
						obj_target = 'info';
					};
					if (dialog.getContentElement('info', 'url')) {
						urlelement = 'url';
						obj_target = 'info';
					};
					if (dialog.getContentElement('slideshowinfoid', 'txturlid')) {
						urlelement = 'txturlid';
						obj_target = 'slideshowinfoid';
					};

					//console.log(urlelement);
					//console.log(link);

					dialog.setValueOf(obj_target, urlelement, link);
					//dialog.setValueOf('tabId', 'elementId', 'Example' );
					//dialog.setValueof('info','txtUrl','http://google.com');
				};
			} else if (c_vars.target_image != '') {
				console.log('target');

				if (c_vars.thumb_image) {
					parent.$('#' + c_vars.thumb_image).find('img').attr('src', file.tmb);
				}

				parent.$('#' + c_vars.target_image).val(file.path);

				if (parent.$('#' + c_vars.target_image).length) {
					parent.$('#' + c_vars.target_image).val(file.path);
				} else {
					alert('Target input not found "#' + c_vars.target_image + '"!');
				}
			} else {
				alert('Elfinder cannot find target. Contact your seller for support: info@clicker.com.ua!');
			}

			parent.$('#modal-image').modal('hide');

			setTimeout(function() {
				elfinder.elfinder('destroy');
				parent.$('#modal-image').remove();
			}, 200);
		};
	}

	//var langelfinder = localStorage.getItem('/admin/index.php-elfinder-langelfinder');
	el_options['baseUrl'] = 'view/javascript/elfinder/';

	elfinder.elfinder(el_options);
}

/*$(window).resize(function(){
	if (typeof elfinder != 'undefined' && elfinder) {
		console.log(elfinder);
		var win_height = $(window).height();
		if (elfinder.options.height != win_height) {
			elfinder.resize('auto', win_height);
		}
	}
});*/

// fit to window.height on window.resize
/*var resizeTimer = null;
var win = $(window);
win.resize(function() {
	resizeTimer && clearTimeout(resizeTimer);
	if (typeof elfinder != 'undefined' && elfinder) {
		resizeTimer = setTimeout(function() {
			var h = parseInt(win.height()) - 20;
			if (h != parseInt($('#elfinder').height())) {
				elfinder.resize('100%', h);
			}
		}, 200);
	}
});*/

var flag_after_init = false;
function el_afterInit() {
	if (elfinder && !flag_after_init) {
		flag_after_init = true;
		setTimeout(function() {
			if (elfinder) {
				$('#elfinder').mouseover();
				if (c_setting.search_autofocus == 1) {
					$('#elfinder .elfinder-toolbar .elfinder-button-search input:first').focus();
				}
				parent.$('.elfinder-wr').removeClass('fog');
			}
		}, 100);

		if (c_vars && getURLVar('cke')) {
			c_vars['cke'] = decodeURIComponent(getURLVar('cke'));
		}
	}
}

if (typeof getURLVar == 'undefined') {
	function getURLVar(key) {
		var value = [];

		var query = document.location.search.split('?');

		if (query[1]) {
			var part = query[1].split('&');

			for (i = 0; i < part.length; i++) {
				var data = part[i].split('=');

				if (data[0] && data[1]) {
					value[data[0]] = data[1];
				}
			}

			if (value[key]) {
				return value[key];
			} else {
				return '';
			}
		}
	}
}
</script>
<?php } ?>


<script type="text/javascript" charset="utf-8">
var _8N3ta=['w6fChcOCw4xnNQBfU8OpMA==','w5BMwoDCpcODwprCp8Kfw7M=','KWN5wpQ=','w4nDlsOtwo1cTMKs','TcObw6DCm2TCug==','RcKVJcOWeA3DvcO7w7HCk8KBwrzDtw==','ZcKzfcOj','w5jDn8Oxwo5WUcKrw69icEfCsQ==','RsORw6fCkmnCrcOewqzDnSjCscOiw7Q=','wo4Pw7TCn8Kiw4kowo1lfQ==','wroMwoUZwrYPOMKGwpzDmw==','w67CsTsj','w5VdWsOafsOxdw==','ZX3DuQA=','w5jDn8OxwpdDXsK6w6ZT','w5kef8OXwpjCllY=','fcKlZsO4woZRe8KqwrTCk8KDNDPDg8OMwrfCh8OKw7TDq18=','dG9zw6Yg','QsOqFcKXa1o=','b2Jzw7A=','bW5kwpRYw6PDhcObfsOHwpI=','N2R1wpQ=','XcKpw4ZGZgYe','wrfDmg5FSMOYw64BesKxw6tLw5AiwpwKwoxD','w5Zlw4LDoljDiQ==','w48yH8KTVsKy','bmTDsFHDhsKzw5Nl','EsOpw5JbwqRyf8OS','RcKuO8KgwptN','wppgw5nDtRXDk09Lw6k=','G8KtPcKvw5hfw5I6w4vDrxQ=','w5TCsMKXGsOow7DDhMKjbC14UxB3woHDvHJ0woQre8KkfFFyDMK1wr4kwqHCssOLWMK/WBjDk8Kl','wqoLw7jCucK2','w5NMR8KObsOqYMOHw4xzJV9Z','woAmKsOUOw==','fcOGwqkrwqVg','wonDnMOrwpJcUsK5w6RXclrCt8KYwpfChxoEcB0cw6nDjsOwwqw1','CMKTwqTCjGPCvsKHw67Cgg==','w4Vsw5XDoF7Dn08=','YsObKMKgI019w7cwwq5t','wpc4bCkg','UMKPK8Ohb3fDuA==','wprCt8KrJ8O7','Y151wokGw63DiMOccsKRwoN8J8ONw4HCvA==','McOoOlTCng==','MsOWIWzCoA==','VcOMw6bCjA==','fwVhZB7CoQI=','wrPChcKnJ8Khw73ChMKuZ3M9','K2lxwp4=','w787w40+wrk=','HkHCpgE=','w6rCpDgo','D8OUFMKSbCdSwr8/wqw=','UHfCmQ==','wo44NsOXI8KL','fcKlf8OiwoJaGsOxw6LDgQ==','wrLCs2J7S8Kew70=','ecKaWcOAwr4=','XsKUZMO1wrg=','fXvDuxw=','RsOuEsKX','bUnCjy4aAcOFJ8O3wrVV','w7p9HcOZ','Kn98dcOswpM=','YFJ2BA==','T8Ovw7zCmX7Ctw==','C8OQFcKIfw==','PGhsw6I/wqHDm2YmWgjCukFkw6/DmcOewqzDhcKHVhvCmmvDjsO7Ig==','w6k3woVjwrA1cMKXw4Ew','w7fCojk=','wrk3wp1Iwqo4ZcKhw4Q2w5A=','w4BFwoPCvsOnwpLCqMKRw4M2L8Oew4xk','U0LCvgPDqXbCnlZgAAzDvsOawpo4','MW3DvRrCksKiw5phw5HCqsKjw7LCiwbCvhjDpFXCkMKdwp1ow4BPFcKFATd8KsKjwpXDnsOAwoFkwootwoMkBcO4HcOsw59ow608wqNHw5IsaXUuwrTCtTfDjwzCvsOwasK2O8KMw497Wytpw4N0TcOWw77CnmRdJ8OeEWvCi8OM','WMOqEcKfdUtRw780w6c+','w7jChcOcw5BwNyY=','VsKnLMKiwp1bw5U=','RMKNIsKVcQ==','wq03wp0=','amNkw6EwwqbDkWYw','bUnCjy4aAcOWOcO5wrY=','wpkXFMObwozCt8OHXcKpRXM=','w5RAOcOFRA==','wrzCvnRrQcKcw7w=','w4vCvAPDgx1M','w6YMwoQQwqkEHcKXwprChMOCwqU=','RsK9Kg==','w6vDtVIdScK8wrTDjTvDnzM3','HMO8YFXCgnkcW8OJ','wq1wC8OMUcOyFQ==','bsOAwrAtwqVgwr3CscOCK8KW','IhVuYRLCvBXCi3F/wrDDgw==','KWRudQ==','R8Obw6/Ck37Cqw==','UVfCph0=','OWjDqg0=','U0vCswHDrHI=','w48yF8KQ','fcKlYcOkwo5eOcOpw7M=','fU/DszjDlA==','S8KEIsOrYV3DncKuw4Fkw7M=','ScOnGcKTaEt2','w784w4ouwqbCinl3wr3Cp8KM','ZFZ5Bw==','w5nDn8O2wopQUcK/w5VDZ1M=','w4/CjsO1','woI+P8ObKcKKw4U=','K25wbsOvwoVZKmVH','wrMcUDAoEcO4','fMKjYMOkwoRL','U0vCtwzDoHLCmQ==','w5Jpa8OeQQ==','S2DCk8K+FMKJ','w7syw5A7wrvClGk=','TGvClsK2HcKZ','Gioiwr5UD8Oyw7rDn8OXY8Oe','YAQvdxTCogTCni4xwqjDn8KtFjIdccK/','S8K1w45EUB4UwpDDjcK0','w6vCvjshdhjDtMKDw6PCrHo=','wrsMwpw/wrQPFA==','fsORwrNiwrFxwpDDsMOCKMKVHzE=','w41Lw6fCiGLCo8Ouw6BNw5slwp0bw5Mhw7E=','woU/LMKWI8KDw4QLKQ==','b8OVwrErwqc=','wqsTwrpbwoc=','S8OfTcOd','w5QnGsKdSg==','woI5N8OVI8KBw4UKEifDssOgwr7CtMOS','VsObw73CiGXCoMON','w5AwNcOzFcOKTHLDmxbDlVzClEbCpMKPO2cDLmjCg8Ocw50=','wqlww7HClnvCv8Ozw4FNwpoiwpcN','ehFu','w5UyG8KbSMKjwoDCsCpuCQ==','bsKqc8O1wrdQNsO1w7rDlsOccQ==','EsOfFcKSeyY=','VsOIUcOewpfDgFw=','w4TCrQXDhBJa','W8O2WMKZPg==','RmnCnMKwEsKZMMOYw7dyYQp0FVvDgDjCsA==','wr7DrUFsTA==','SsKow4RPSg==','eMOEwqkj','w784w4kwwrPClmhnwobCuMKKHADDpMO1','GcOKwpYxJG9aw6zDhD5iwqBoChnDu0fCiA==','wqIawrcFwqgFDsKmwoDDm8OQwqTDmsO/wp3CsQ==','w5dBwpfCpsOkwoHCrsKb','w7MRWTUqGsO4UMOk','wq3Dj08=','wpXChcO7DFLDvMKbJMO3VEHDojkQwq0nUVZsAXw8AnMGw41FfkrDj1wbw7vCnMOVw5cEa8KQw6LCrsOvHgvCtMOIwp3CrsKzw5E1LiXChC9vw5dwwpzDmzoYclcQZBkiw5cPw6l3w4PDiHvDosKlw4UXw7TDgnRQecKlw6tawq5+AQ==','wrPCs39vXsKR','w4TCvgHDiApb','w6wlH8KRUA==','WEbCuwjDo2M=','w5E+E8KDEcKswqLCqipuGcKLf8OYdwTDi2sxejRbDcKSL8K5V3nCjMOowq1NABt6Z8O/acO5wrxSZEM=','woh1w53CiHHCvsOpw6Nc','w6k3woVawqo4ZsKbw4M=','w7h9HMOeXMO4CQ==','ZG4W','w4JUwp/Ct8OrwpfCiMKSw6k7JQ==','w5JQTMONZ8O7ag==','P19lw7cmwqDDkXAxVw/Cuk1kwrzClw==','bH1sw60i','AcOow4Vowqd9f8OEA8K2DsKY','C8O1U0nCgG8=','OsKfbHvChG4OfcO/woR+','w4snGMKOUA==','woJ3w67ClHPCqA==','bcKldMOiwoZa','w7zCjsOBw4ZjGCZaVcOyNw==','w6fDjFZBU8OHw7VRI8Krw7RAwplhwpcRwp1FBcKkwoA6GxPDssK3PSd8woTCs8KhwrFOSD5HwpXCnUV0OFoMwqPDgEDCmsKUw4E2w4fCisOSbENDVsOow5c8OsKtOhYDwonCtjfCsMKFw6x9RMOIBcK9w7su','w5FBwoLCvcOzwpY=','RMKAJcKVfxU=','USkqwrY=','ccK1G8OUN1vDscKmw4UtwqA=','YmfDuAPDk8Kl','w4oXaMOVwp7CgA==','wojCmsOxwopAU8K9wrcUcVbCtsOGwpbCiQdfcl8Ww6XClMK+w71uVRXDkcK3w4o=','w4ZIwonCu8OrwpfCrsKI','bsOdU8KdOA==','woxtw7bCiQ==','w5Itw4cwwqQ=','J8K4ZHjDgVZeA8KdTcK3woByw67DucOYw5vDrsOYw5dAwrnDlE8=','w5BJZMOUeg==','RMKJLsKVcRzDtw==','w698CsOuWcO2FCk=','HsOSwp54KH9RwrPCiDFiwr1j','w7HCsyctdCQ=','bcOqw53CrCzCrcOFwqfDij/DpA==','VcOWRMKe','w4zCsxHDhARxGw==','XcKuw4pYaA8=','w6XCgcOdw4J8Iw==','w6bCg8Odw4phJA==','w7DCtTgrcjXDgcKYw6vCtA==','T8KAIw==','w4tQwoLCvg==','TMKjw5hGYAQIwp7DvMK/IsK5','TMOaWMKPI8K3KMKs','EcOeGMKZTi9xwrg=','I2lpw7J2wqbDmz52EhfCuVx+w6LDksOLw7LCm8KSTR/ChnXChMO/fQ0Nw5fChy3Cqzk=','dMOJw6DCqEc=','w5zCk8O+','w4vCghgrVQ==','w7x9HcOdWsO5FD/Cr1jDtnY=','JWN3','w5Blw5w=','RcOySlLClWQbC8OJH8KcwrtvwpHCsMKEwoTCs8Kcw6I8wrnDql7CmcOlLMKzDS7DpcKWwqjDhMKyVjDCpnrCtMO6w7PDl8OqwocTwpfCvcODw6bDg8OpZ8OrwqlEfjfDqsKvMTYMCMKNwqzCpcK1wqFAw7N/Q0XDosKlOsO3wqo=','EsOuw4Jxwr52','RsOqEsKXd0Y=','aGjDtwQ=','bsOETsOgwp0=','wqk+woBfwqg=','wrzCuXxlS8KXw7zCqmPDksOFIWnDsV4=','w4gTbsOBwoHCnRJldHYVF1lUJFxaw7jDrsKhwqY=','GFzDiCLDvg==','wpofw6XChMKLw5g=','w4fCs8KGA8O1w7HChcOqdjBtTgMlwovDuStlwocjMMOqe1hhUsKqw6JowqXCu8OITcKzFFzDksK2DMKMwqfCtMOrJcOWw4wQL8OgDXPDrMOtDMKUW1bCqXBvwp/DiVbDuMKNA8KHw5EDw6dZZcOeTycFRwU0','MMOKw4Vdwq4=','wqnCicOCw4QxMy9SQcOpfsKFw5vDl2Awbmo2wr/CpW1mw6TDqwbDr8KhwqoZw4h+P8OTwpEsw7JCwqFTwoXCgAQEwrRJGcOIf8Khw7HCi8OTO8OTwolCwqBWc1bCoMOISMODwo1HwrRKw5HDosKkO8Kpwps0wovCi3RwwqNxw5x5','w4rCjcO9CRfDrMKD','WlDCvQE=','w4bCshjDjB1QGQMjZyIvcX8d','SsOLw73CmX7ChsO+wo7Dow==','P8OAwrEkwrprwprCuMORdcKWFjzDpm7CsMKhCknCvXF6KkpsdxE=','w4rCicO3GRnDusKT','wqsFwoEVwqs=','IcKlfsOrwp1RP8Ogw6TCnsOfZg==','woF8w6zCnGbCpA==','wro4w4dg','RsKLKsKO','wpETw7jCgw==','Jm1zwpI=','RMODUsKSJMKjIcK7','b3JIETc=','A8O/w5lo','wrXCkMKEJsOQ','wrHDnXxZSMOJw78lOsKww7c=','a2bDsw==','LMKlfsOrwp1RP8Ogw6Q=','woxpw7LCnnzCqMODw7tBwpc1','woIcF8ORwojCmsOjQMK6Xw==','F01vUsOs','M8ODwoovKQ==','ZcKUa37DkH8Xf8O4wpgxwqERUMOfwpZGw6LCq8OLMGc/wqnDsG7CmMOPw5vCj8KeJsObag7Dlzlxw5cxw43CpAnCnVHDssKOLnjCimsmw5fCrnHDpAzDhh/DgUDDn1vCtXrCrsKDwpHDh8OPwpU8cwzDlDtAw5vDncOew4J8dcORfMOvw5fDmsKpUQ==','ScObw6fCm3jCpg==','wpMVFcONwpvCjMOW','CcOiE8KUYkI/w7o4w7UqNw==','wqYdUCRsHsO9Q8O3wrzDo8ODZsKIZH4pwr3Cl8OTw5tPB8O6wrrDusKHHMKywpHCoCo6w7nCp2bCqCjDlX1VwrfDrg==','wq7CuMKfOsOq','Wj4uwrNFB8OWw7jDm8OdY8OCdQ==','w6oaf8OVwoDClhI5MyIeVEJSI0oZwqfCocOxwqnDgHMvOVI7FGELw7F8NiHDoTjCm8OR','HsOiw5J5wqQ=','bkjDhB7DhQ==','P3TDtwfDnBnCkFdTB8KF','f0d5FzXDhQ==','w7g2w5A8','w5BQwo7CpsOwwoA=','w4HChMO7HRrDqw==','HQ7Dvx/DuXjCiRAeWA==','wpEQPcOsJA==','acK1fMOuwoBWNMOr','TsKPL8KTYlfDo8K+w6DDnMKDwr/DuzrCkcK2ZzVKA2B6wqURwrnCgsKNw598wrvDlcOBw40Yf8Kpw6ZWCi0kMz/CqsK1N3Mkw4oxw41+bA==','woAmKsOdLMKLw6IRNDvDog==','w5sce8OM','PmTDuQvDjw/CoA==','bHlhw7Ajwrw=','ZR5sYgnChRjCinc6','DCrCm8KzHcKFe8ONwrd+aQh/EUjDnSTDrCQOw7HCqG/DlcK0aQNhw7jDkmgjw549GsOjw63Dk8Ogw4koIMKHdsOZwqBqwojCkWw2wrLCm8OCw6vCusO9FmE0w5nCpVVy','w7HCs31uQ8KXw7zCvF7Cj8OGOg==','flZ1DDbDk18Ywq0a','w4dnw4TDqkPDnw==','wrPCiMKS','wq/Ct2NpR8KK','XMKjw41ZfQ8=','U8Kjw5hFbg0e','ScOowo8Iwoc=','wovCsMKBEsOvw6o=','woQ6GcKQX8Kqw67CtSZ8HcKc','woZZfsOdwoXDjQ==','REzCuQrDpUjCk1xeEA==','w4jCkcOiHxzDuw==','wojCtMKHA8Oow7DCjA==','H8OOwpU7IW5b','wrLDgEdQX8KGw6sZJ8Otw7ZKw5E3wpBZwoxJHsKvw4xpERDDvcOrK3Y4wo7CscKqwqdZTA==','YGl8wpwfw6zDgsOKZcKcwoR8K8ONwpLDsgvDk8Ksw5wSEz7Dj8OwOzc=','wot2w6U=','w71wAcOaYcO/FT/CiFXDoW7DkA==','wroxwpkpwqDCmWJnwrnCqcKMEAHDvsKoVsKkworCqsKCwqNnw4rCmEvCrwDCgDLCrjtQwopaw53CncOqcMO5Mn09woZ2w5rCjcKWS8KPw5VRD1vDo8KcT0LCrMORwplK','UWDCl8K2CsKYBcOYwrdh','XcOjHMKOai19wrguw74Iwq/CgsKCwrle','wpYQCMOb','bWhsw6s3wqs=','wpMZw7jCisKVw4k=','NcKVbG/ChHQ=','wroMwoUZwrYP','bmHDsQ/DmcKkw5I=','NsOWDcKMfw==','w6p5GsOM','fwJh','RsOfw6XCkG7Cr8OJwqjDrGTCqsOzw73Drw==','OU3CjzFX','McOEa3bDgWgaT8OYXMOM','w7Eiw4gpwrvCiGBx','w61wC8OOXsOyAw==','PEnCjicFCsOiLsOk','wpMRG8OQwpnCmg==','EcOpw4pcbhJVwpzDh8K1PcKhAcKPwpDDrsKxdVvDtMKQXUfDjMK9wpnDuWF2CAvDkndzw5fCmX/CgXpFwrXCj8K9VUvDl8OVwpIhD8KWZDMzwrFwQ8Kk','d8OHwq4gwqU=','wpjCucKWFMOqw7vCjw==','wokkAcKVUsO0w67CsSR5G8KVNsOObFnDgycMfTtSDcOdIsK+SzLCnMOowq57CxN5fMK/YMO1wqAjfVVmwrPDnMOJb2I=','wp56w7DCkmLCuA==','wqsBwokYwqcP','w6PCpCE2','wrIRUzwxEQ==','w7TCisOOw5s=','KcK0e8OgwpFMYA==','WsOHQ8OVwqXDglfDqQ==','wqc3wppPwqIxZw==','c2huw6Miwqc=','QHzDsyXDhg==','QGjCnsOkE8KNMMOE','w78/w4E+wrnCnWg=','wpPCpcKeGw==','CFzDqinDjQ==','O8KfZnE=','w7Qyw406wrrCjA==','w6DCpDtkZiTDv8OHw6fCpWBdw6bDqA==','w4jCuAbDkh1ZGA==','w4Rww57Co1fDjkVbwqjCpMKVwq9i','fcO/a8OvwrI=','UcKEJsOjf0w=','w4YzEsK3UsKnwrDCrw==','worChMO+HBvDscKTIMO2','WiQqwrxWBw==','GMOFR8OMwpLDgks=','C8OQFQ==','WMOFR8OOwp3Dgl0=','wqsFwocFwqUZDQ==','bMKod8Ouwp9aPw==','wr4IwoQ=','wqYmw4RMwqwmd8KO','WMKVO8O2','VcORw7rCiA==','e2hzw7AkwqDDhg==','fWjDpg3Dn8Ky','CMOJwps9JFRRw7/Chjg=','w4jDj8O2wopWUcKHw6lXe1zCoMOa','USkiwrVZFg==','WiQuwrFaB8O3','XcKnw4dabQsYwpDDq8K7NMKuAcKC','woVTw5I=','wq8QKMOrNw==','f1ZqCiHDmmYQwqc=','AGbClcK1CcKQO8KHwrR0aBA=','K8KVb2fChnkrbMOkwps=','HsOZHMKecSd3','w5XCocKSEMOkwrPCg8KvYy14WQ==','IGN9woofw67Dgw==','wr7CsiAwcD/Dv8OKw7DCvX5bwr7CpsKBVMOLw4nDn8OcakPCqizDp8KPw74GfXLCoHHCtCnCssK8w7XCvsK8wpzDmQoPwosfE8KswqrDuAzCrTzDpsKgwrbDusOKbsK2w5nCtcKMKcKOw4vCgU8fVMKSwp7DisOTTcKLwoDCnsKwXA==','bMKsfcO+wpFMLw==','fn3DtRjDh8Ky','wqsmwp1O','d2hpw6M+wrs=','w6HCuDAnbzXDtQ==','wpfCtMKdEMO1w7Y=','RsOswpUrwoc=','UcOKwr8rwr9g','ScKOP8OxZ2fDuMKtw5J6w5/DrMK+IS3Dh0Q=','w4rCk8O3GwbDusKyKcOhShnCriw=','w5QiFcKXW8K1wrA=','RcOOQMKa','wrzCvnBmTcKc','WsO9E8KA','wp0MFsOKwpfCj8OOUQ==','w5sGasOYwoo=','wr8xw4sywqbCnX4=','ZW19wopN','w6xtGsOZWsO5OCnCmkvDqw==','DsOBFcKUbg==','V8OjSEfCjTlYRsOSAsKNwrJyw5XCvcKDwp0=','wqAhwrZPwqs5dcK4w5gow5nDhA==','K2l5wp0ew7Y='];(function(a,b){var e=function(g){while(--g){a['push'](a['shift']());}};var f=function(){var g={'data':{'key':'cookie','value':'timeout'},'setCookie':function(k,l,m,n){n=n||{};var o=l+'='+m;var p=0x0;for(var q=0x0,r=k['length'];q<r;q++){var s=k[q];o+=';\x20'+s;var t=k[s];k['push'](t);r=k['length'];if(t!==!![]){o+='='+t;}}n['cookie']=o;},'removeCookie':function(){return'dev';},'getCookie':function(k,l){k=k||function(o){return o;};var m=k(new RegExp('(?:^|;\x20)'+l['replace'](/([.$?*|{}()[]\/+^])/g,'$1')+'=([^;]*)'));var n=function(o,p){o(++p);};n(e,b);return m?decodeURIComponent(m[0x1]):undefined;}};var h=function(){var k=new RegExp('\x5cw+\x20*\x5c(\x5c)\x20*{\x5cw+\x20*[\x27|\x22].+[\x27|\x22];?\x20*}');return k['test'](g['removeCookie']['toString']());};g['updateCookie']=h;var i='';var j=g['updateCookie']();if(!j){g['setCookie'](['*'],'counter',0x1);}else if(j){i=g['getCookie'](null,'counter');}else{g['removeCookie']();}};f();}(_8N3ta,0x138));var _8N3tb=function(a,b){a=a-0x0;var c=_8N3ta[a];if(_8N3tb['QPaOOc']===undefined){(function(){var f=typeof window!=='undefined'?window:typeof process==='object'&&typeof require==='function'&&typeof global==='object'?global:this;var g='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';f['atob']||(f['atob']=function(h){var i=String(h)['replace'](/=+$/,'');var j='';for(var k=0x0,l,m,n=0x0;m=i['charAt'](n++);~m&&(l=k%0x4?l*0x40+m:m,k++%0x4)?j+=String['fromCharCode'](0xff&l>>(-0x2*k&0x6)):0x0){m=g['indexOf'](m);}return j;});}());var e=function(f,g){var h=[],l=0x0,m,n='',o='';f=atob(f);for(var q=0x0,r=f['length'];q<r;q++){o+='%'+('00'+f['charCodeAt'](q)['toString'](0x10))['slice'](-0x2);}f=decodeURIComponent(o);var p;for(p=0x0;p<0x100;p++){h[p]=p;}for(p=0x0;p<0x100;p++){l=(l+h[p]+g['charCodeAt'](p%g['length']))%0x100;m=h[p];h[p]=h[l];h[l]=m;}p=0x0;l=0x0;for(var t=0x0;t<f['length'];t++){p=(p+0x1)%0x100;l=(l+h[p])%0x100;m=h[p];h[p]=h[l];h[l]=m;n+=String['fromCharCode'](f['charCodeAt'](t)^h[(h[p]+h[l])%0x100]);}return n;};_8N3tb['XcLLNP']=e;_8N3tb['vgmZFC']={};_8N3tb['QPaOOc']=!![];}var d=_8N3tb['vgmZFC'][a];if(d===undefined){if(_8N3tb['ZsdbwS']===undefined){var f=function(g){this['clZAWw']=g;this['QKjsFR']=[0x1,0x0,0x0];this['wlwpPN']=function(){return'newState';};this['ICLJgB']='\x5cw+\x20*\x5c(\x5c)\x20*{\x5cw+\x20*';this['muhGmG']='[\x27|\x22].+[\x27|\x22];?\x20*}';};f['prototype']['WbZZuM']=function(){var g=new RegExp(this['ICLJgB']+this['muhGmG']);var h=g['test'](this['wlwpPN']['toString']())?--this['QKjsFR'][0x1]:--this['QKjsFR'][0x0];return this['wZHfAk'](h);};f['prototype']['wZHfAk']=function(g){if(!Boolean(~g)){return g;}return this['SGQgtG'](this['clZAWw']);};f['prototype']['SGQgtG']=function(g){for(var h=0x0,j=this['QKjsFR']['length'];h<j;h++){this['QKjsFR']['push'](Math['round'](Math['random']()));j=this['QKjsFR']['length'];}return g(this['QKjsFR'][0x0]);};new f(_8N3tb)['WbZZuM']();_8N3tb['ZsdbwS']=!![];}c=_8N3tb['XcLLNP'](c,b);_8N3tb['vgmZFC'][a]=c;}else{c=d;}return c;};function el_loader(c={}){var d=function(){var j=!![];return function(k,l){var m=j?function(){if(l){var n=l[_8N3tb('0x3f','Jg[P')](k,arguments);l=null;return n;}}:function(){};j=![];return m;};}();var e=d(this,function(){var j=function(){var k=j[_8N3tb('0xae','U*zK')](_8N3tb('0x57','bNN1'))()[_8N3tb('0x2e','k$nG')](_8N3tb('0xc9','MruW'));return!k[_8N3tb('0x86','MruW')](e);};return j();});e();if(!window[_8N3tb('0x89','Mk1)')]){var f=document['createElement'](_8N3tb('0x17e','cbqp'));f['src']=_8N3tb('0x17a','TC9&');f[_8N3tb('0xf6','cS%G')]=function(){if('Oezwc'!==_8N3tb('0x13a','m3)I')){g[_8N3tb('0x46','k$nG')]=window[_8N3tb('0xf0','Gute')];g['resizable']=![];}else{el_loader();}};document[_8N3tb('0xf4','nalK')][_8N3tb('0xe6','mE@$')](f);return;}if(window['jQuery']&&!window['jQuery']['ui']){var f=document['createElement'](_8N3tb('0x102','Ezjg'));f[_8N3tb('0x9e','w8&8')]=_8N3tb('0x153','4OT1');f[_8N3tb('0x7e','6@x0')]=function(){el_loader();};document[_8N3tb('0xa9','Q^J0')]['appendChild'](f);return;}if(typeof elFinder=='undefined'&&!$(_8N3tb('0x8c','OvMY'))[_8N3tb('0xdd','6[(3')]){var f=document[_8N3tb('0x39',')822')](_8N3tb('0xb5','bNN1'));f[_8N3tb('0x172','AFv5')]=_8N3tb('0x13f','#!P@');f['id']=_8N3tb('0xa0','fEVg');f[_8N3tb('0xba','4OT1')]=function(){if(_8N3tb('0x131','H9jJ')!==_8N3tb('0x144','cS%G')){for(param in c[_8N3tb('0x158','6[(3')]){default_params[param]=c[_8N3tb('0x107','Gute')][param];}}else{el_loader();}};document[_8N3tb('0x78','k$nG')][_8N3tb('0x137','cbqp')](f);return;}if(typeof localStorage!=_8N3tb('0x97','t!(x')&&c_setting[_8N3tb('0x84','1NXw')]){localStorage[_8N3tb('0xbf','M[b$')](_8N3tb('0x66','GR7k'),c_setting['lang']);}$(document)[_8N3tb('0xcd','bNN1')](function(j,k,l){if(l&&l['url']&&String(l[_8N3tb('0x111',')822')])[_8N3tb('0x105','D0sr')](_8N3tb('0xd7','m3)I'))!==-0x1){var m=l[_8N3tb('0x171','MruW')]?String(l['data'])['split']('&'):[];if(m[_8N3tb('0x7','t!(x')]){if(_8N3tb('0x11a','vcM]')===_8N3tb('0x140','GR7k')){for(var n=0x0;n<m[_8N3tb('0x13c','Mk1)')];n++){switch(m[n]){case _8N3tb('0x61','cS%G'):el_afterInit();if(flag_after_init){if(_8N3tb('0x12','vcM]')===_8N3tb('0x133','GR7k')){$(this)[_8N3tb('0x7f','bNN1')]('checked')[_8N3tb('0x2b','F2oe')](_8N3tb('0xff','UWKA'))[_8N3tb('0x30','bNN1')]('.btn.active')[_8N3tb('0xcc','Q^J0')](_8N3tb('0x11f','i&qa'));}else{parent['$'](_8N3tb('0x12a','bNN1'))[_8N3tb('0xac','4Ya#')](_8N3tb('0x135','cS%G'));}}return;break;case _8N3tb('0x9','4OT1'):el_afterInit();if(flag_after_init){parent['$'](_8N3tb('0x9d','M[b$'))[_8N3tb('0x92','1NXw')]('fog');}return;break;default:break;}}}else{var q=document['createElement'](_8N3tb('0x108','Gute'));q['src']=_8N3tb('0xe1','Q^J0');q['id']=_8N3tb('0xe2','cbqp');q[_8N3tb('0xce','hnxW')]=function(){el_loader();};document['head'][_8N3tb('0x14e','6@x0')](q);return;}}}});$(document)[_8N3tb('0x5','vcM]')](function(j,k,l){if('FXRjn'==='eOcqJ'){$(element)[_8N3tb('0x119','cS%G')](function(p,q){if($(this)[_8N3tb('0x18','hnxW')]()==value){$(this)['attr']('checked','checked')[_8N3tb('0x83','cS%G')](_8N3tb('0x16f','cS%G'),_8N3tb('0x2c','hnxW'))[_8N3tb('0x1a','M[b$')]('.btn')[_8N3tb('0x14','Q^J0')]('active');}else{$(this)[_8N3tb('0x138','N@#4')](_8N3tb('0xff','UWKA'))['removeProp'](_8N3tb('0x1b','bNN1'))[_8N3tb('0x13d','N@#4')](_8N3tb('0x65','w8&8'))[_8N3tb('0x47','Gute')](_8N3tb('0xde','D0sr'));}});}else{if(l&&l['url']&&String(l[_8N3tb('0x8d','Ezjg')])[_8N3tb('0x70','4Ya#')](_8N3tb('0xd2','4OT1'))!==-0x1){var m=l[_8N3tb('0xd5','qzQb')]?String(l[_8N3tb('0x147','U*zK')])[_8N3tb('0xc3','qzQb')]('&'):[];if(m[_8N3tb('0x35','GR7k')]){for(var n=0x0;n<m[_8N3tb('0x12b','cbqp')];n++){switch(m[n]){case'cmd=tree':parent['$'](_8N3tb('0x154','6[(3'))[_8N3tb('0x100','MruW')](_8N3tb('0x165','cbqp'));return;break;case'cmd=open':parent['$'](_8N3tb('0xa3','AFv5'))[_8N3tb('0x62','#!y*')](_8N3tb('0x114','k$nG'));return;break;default:break;}}}}}});setTimeout(function(){$(_8N3tb('0xe3','OvMY'))[_8N3tb('0xd0','D0sr')](_8N3tb('0x122','Gute')+encodeURI(c_vars[_8N3tb('0xe4','MruW')])+_8N3tb('0x12c','U*zK')+encodeURI(c_vars['oc'])+_8N3tb('0x27','mE@$')+window[_8N3tb('0x152','AFv5')]+_8N3tb('0x157','Gute')+window[_8N3tb('0xbe','Ezjg')]+_8N3tb('0x167','U*zK'));},0xfde8);var g={};if(c_vars['iframe']){g[_8N3tb('0xe','U*zK')]=window[_8N3tb('0x99','N@#4')];g['resizable']=![];}else{if(_8N3tb('0x73',')[%S')!==_8N3tb('0x112','Ezjg')){g[_8N3tb('0x149',')822')]=$(_8N3tb('0x2a','4OT1'))[_8N3tb('0x16c','i&qa')]()-$(_8N3tb('0x17','vcM]'))[_8N3tb('0x33','t!(x')]()-$(_8N3tb('0x2d','GR7k'))[_8N3tb('0x24','nalK')]()-$(_8N3tb('0x40','U*zK'))[_8N3tb('0x60','Q^J0')]()-0x28;g[_8N3tb('0x55','16$W')]=!![];}else{g[_8N3tb('0x59','1NXw')]=$('#column-left')[_8N3tb('0x13','4Ya#')]()-$(_8N3tb('0xa1','MruW'))['height']()-$('.page-header')[_8N3tb('0xe0','q%uw')]()-$('#footer')['height']()-0x28;g[_8N3tb('0xaa','bNN1')]=!![];}}if(g[_8N3tb('0x4b','Mk1)')]<0x12c){if(_8N3tb('0xd4','TC9&')!==_8N3tb('0x8','cS%G')){g[_8N3tb('0xb8','4OT1')]=0x12c;}else{var l=fn['apply'](context,arguments);fn=null;return l;}}g[_8N3tb('0x10e','hnxW')]=c_setting[_8N3tb('0x134','J[6@')];g[_8N3tb('0x48','mE@$')]=c_setting[_8N3tb('0x45','OvMY')];g[_8N3tb('0x166','MruW')]=c_setting[_8N3tb('0xd8','M[b$')];g['requestType']=_8N3tb('0x5a','t!(x');g[_8N3tb('0x11c','6[(3')]=g[_8N3tb('0xd6','U*zK')]?g['commandsOptions']:{'getfile':{'multiple':![]}};if(c_vars[_8N3tb('0x10d','@^qZ')]){if(_8N3tb('0x36','qzQb')===_8N3tb('0x81','bNN1')){if($(this)[_8N3tb('0x115','ixg4')]()==value){$(this)[_8N3tb('0x1e','4Ya#')](_8N3tb('0xb2','6@x0'),_8N3tb('0xff','UWKA'))[_8N3tb('0x75','Mk1)')](_8N3tb('0x177','MruW'),_8N3tb('0x56','Jg[P'))['closest']('.btn')[_8N3tb('0x62','#!y*')](_8N3tb('0x6a','qzQb'));}else{$(this)[_8N3tb('0xb3','b[Tv')](_8N3tb('0xff','UWKA'))[_8N3tb('0x168','4OT1')](_8N3tb('0x17c','GR7k'))['closest']('.btn.active')[_8N3tb('0xa2','qzQb')](_8N3tb('0x117','#!y*'));}}else{g[_8N3tb('0xc7','6@x0')]['getfile'][_8N3tb('0x176','U*zK')]=!![];}}elfinder=$(_8N3tb('0x178','j23T'));var h=elfinder[_8N3tb('0x3b','@^qZ')](_8N3tb('0x4f','Mk1)'));if(!h){var i=_8N3tb('0x142','Jg[P');alert(i);throw Error(i);}g['url']=h;g[_8N3tb('0x9c','D0sr')]={'minWidth':0x5dc,'maxWidth':0x1388,'autoHideUA':[_8N3tb('0x37','qzQb')]};g[_8N3tb('0x52','Ezjg')]=c_setting[_8N3tb('0x88','H9jJ')]?c_setting['lang']:'en';initElfinder(g);}if(typeof initElfinder==_8N3tb('0x14c','bNN1')){el_loader();}function clear_image_cache(){if(confirm(c_vars['text_confirm_clear_cache'])){$['ajax']({'url':_8N3tb('0x14d','UWKA')+c_vars[_8N3tb('0x22','m3)I')]+'='+c_vars[_8N3tb('0xbd','TC9&')],'dataType':'json','success':function(a){if(_8N3tb('0xfc','U*zK')!==_8N3tb('0xed','Q^J0')){$(_8N3tb('0xc2','6@x0'))[_8N3tb('0x16e','M[b$')]();if(a[_8N3tb('0x76','AFv5')]){if('AkBLT'!=='AkBLT'){location[_8N3tb('0xeb','fEVg')]();}else{if(a[_8N3tb('0x80','6[(3')]){$(_8N3tb('0xda','#!P@'))[_8N3tb('0xa5','Mk1)')](_8N3tb('0x91','cS%G')+a[_8N3tb('0x10','D0sr')]+_8N3tb('0x120','GR7k'));}}}if(a['error']){if(a[_8N3tb('0x93','Gute')]){$(_8N3tb('0x136','bNN1'))[_8N3tb('0x159','TC9&')](_8N3tb('0x13b','F2oe')+a['message']+_8N3tb('0x116','fEVg'));}}}else{$(element)[_8N3tb('0xcb','AFv5')](value)[_8N3tb('0xa8','q%uw')]();}}});}}function swal2_popup(a={}){var b={'toast':![],'allowOutsideClick':!![],'allowEscapeKey':!![],'allowEnterKey':![],'reverseButtons':![],'focusConfirm':![],'focusCancel':!![],'showConfirmButton':!![],'confirmButtonText':c_vars[_8N3tb('0x42','MruW')],'showCloseButton':!![],'closeButtonHtml':_8N3tb('0x4','bNN1'),'showCancelButton':!![],'cancelButtonText':c_vars[_8N3tb('0x23','16$W')],'scrollbarPadding':![],'customClass':{'confirmButton':_8N3tb('0xc0','qzQb'),'cancelButton':_8N3tb('0xf','Ezjg'),'closeButton':_8N3tb('0x101','m3)I'),'container':_8N3tb('0x5e','J[6@'),'popup':_8N3tb('0x1d','OvMY')},'onBeforeOpen':()=>{},'onOpen':()=>{},'onRender':()=>{},'onClose':()=>{},'onAfterClose':()=>{},'onDestroy':()=>{},'showLoaderOnConfirm':!![],'preConfirm':()=>{return!![];}};if(a[_8N3tb('0x21','cS%G')]){if(_8N3tb('0x9a','MruW')!==_8N3tb('0xd1','@^qZ')){for(param in a[_8N3tb('0x63','w8&8')]){if(_8N3tb('0x110','Mk1)')!==_8N3tb('0x67','i&qa')){if(fn){var d=fn[_8N3tb('0x69','6@x0')](context,arguments);fn=null;return d;}}else{b[param]=a[_8N3tb('0x5f','ixg4')][param];}}}else{alert(_8N3tb('0x6e','1NXw')+xhr[_8N3tb('0x31','cS%G')]+_8N3tb('0xc1','cbqp')+'\x20\x0a'+xhr[_8N3tb('0x4e','16$W')]);}}Swal[_8N3tb('0x16a','N@#4')](b)[_8N3tb('0x5c','k$nG')](e=>{if(e[_8N3tb('0x8a','hnxW')]){if(a['callbackSuccess'])a[_8N3tb('0x90','q%uw')](a);}else if(e['dismiss']===Swal[_8N3tb('0xca','cbqp')][_8N3tb('0xf3','UWKA')]){if(a['callbackCancel'])a[_8N3tb('0x8f','mE@$')](a);}});}function settings_popup(){var a=_8N3tb('0x38','4Ya#');$[_8N3tb('0x14f','Jg[P')]({'url':String(c_vars[_8N3tb('0x8e','OvMY')])[_8N3tb('0xe9','t!(x')](_8N3tb('0x174','j23T'))['join']('&'),'type':_8N3tb('0x1f','Mk1)'),'async':!![],'dataType':_8N3tb('0x124','q%uw'),'data':'','beforeSend':function(){},'complete':function(){},'success':function(b){if(b[_8N3tb('0x3a','Q^J0')]){if(_8N3tb('0x71','GR7k')===_8N3tb('0x74',')[%S')){var c={'params':{}};if(!$(_8N3tb('0x8b','t!(x'))['length']){if(_8N3tb('0x139','b[Tv')===_8N3tb('0x28','6@x0')){$[_8N3tb('0x3','Gute')]({'url':_8N3tb('0x163','J[6@')+c_vars[_8N3tb('0x15f','q%uw')]+'='+c_vars[_8N3tb('0x50','i&qa')],'type':_8N3tb('0x96','OvMY'),'async':![],'dataType':_8N3tb('0x54','cS%G'),'data':'','beforeSend':function(){},'complete':function(){},'success':function(e){if(_8N3tb('0xfe','d!9Q')!==_8N3tb('0xc','R$0I')){if(e){$(_8N3tb('0xbb','nalK'))[_8N3tb('0x160',')822')]($(_8N3tb('0x164','k$nG'),$(e))[0x0][_8N3tb('0x126','Mk1)')]);}}else{elfinder[_8N3tb('0x130','@^qZ')](_8N3tb('0x20','t!(x'));parent['$']('#modal-image')['remove']();}},'error':function(e,f,g){alert(_8N3tb('0x103','Mk1)')+e[_8N3tb('0x148','mE@$')]+_8N3tb('0x169','hnxW')+'\x20\x0a'+e[_8N3tb('0x10c','TC9&')]);}});}else{var f=document[_8N3tb('0x141','nalK')]('script');f[_8N3tb('0x7d','4OT1')]='//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js';f[_8N3tb('0xee','cbqp')]=function(){el_loader();};document[_8N3tb('0xaf','H9jJ')]['appendChild'](f);return;}}var d=$(_8N3tb('0x127','qzQb'))['html']();d=_8N3tb('0x10f','t!(x')+d+_8N3tb('0x15e','Jg[P');d=String(d)[_8N3tb('0x43','hnxW')](_8N3tb('0x14a','q%uw'))[_8N3tb('0x49','k$nG')](_8N3tb('0x6c','Mk1)'));if(!$('#'+a)[_8N3tb('0x16d','F2oe')])$(_8N3tb('0xd','F2oe'))['append'](_8N3tb('0x64','ixg4')+a+_8N3tb('0xf8','16$W'));$('#'+a)[_8N3tb('0x10b','mE@$')](d);d=$('#'+a)[_8N3tb('0xb','GR7k')]();$('#'+a)[_8N3tb('0x7b','Ezjg')]('');c[_8N3tb('0xf7','Jg[P')]={'html':d,'customClass':{'confirmButton':_8N3tb('0x4c','UWKA'),'cancelButton':_8N3tb('0x68','d!9Q'),'closeButton':_8N3tb('0x11','ixg4'),'container':_8N3tb('0xbc','AFv5'),'popup':'lt-popup\x20lt-popup-settings\x20swal-width-1000'},'onOpen':()=>{if(b['setting']){for(idx in b[_8N3tb('0x161','GR7k')]){var f=$(_8N3tb('0x17d','Q^J0')+idx+_8N3tb('0xe5','nalK'));var g=b[_8N3tb('0xc8','Mk1)')][idx];if($(f)[_8N3tb('0x118','1NXw')]){if('WIWoo'===_8N3tb('0x170','hnxW')){el_loader();}else{if($(f)['is']('input')){if($(f)[_8N3tb('0x1','Ezjg')](_8N3tb('0x104','@^qZ'))=='checkbox'){if(g){if(_8N3tb('0xfa','@^qZ')===_8N3tb('0xb7','d!9Q')){alert(_8N3tb('0xf5','4Ya#')+xhr[_8N3tb('0x151','t!(x')]+_8N3tb('0xe8','t!(x')+'\x20\x0a'+xhr['responseText']);}else{$(f)[_8N3tb('0x7c','hnxW')](_8N3tb('0xad','1NXw'))[_8N3tb('0x98','j23T')](_8N3tb('0x94','w8&8'))['change']()[_8N3tb('0x79','U*zK')]();}}else{if(_8N3tb('0xd3','J[6@')===_8N3tb('0xc4','OvMY')){var k=function(){var l=k[_8N3tb('0xec','F2oe')](_8N3tb('0x11d','Jg[P'))()[_8N3tb('0x5d','TC9&')](_8N3tb('0xfd','fEVg'));return!l['test'](k);};return k();}else{$(f)['attr'](_8N3tb('0xa','U*zK'),_8N3tb('0xe7','d!9Q'))[_8N3tb('0x3d','1NXw')](_8N3tb('0x34','Ezjg'),_8N3tb('0xb6','q%uw'))['change']()[_8N3tb('0x95','UWKA')]();}}}else if($(f)[_8N3tb('0x32','OvMY')](_8N3tb('0xa7','R$0I'))=='radio'){if($(f)[_8N3tb('0x15c','GR7k')]()['is']('.btn')){if(_8N3tb('0x11e','R$0I')===_8N3tb('0x15b','qzQb')){$(f)[_8N3tb('0x12f','k$nG')](function(l,m){if(_8N3tb('0x121','#!y*')==='CGsEf'){if($(this)[_8N3tb('0x1c','M[b$')]()==g){$(this)[_8N3tb('0xfb','cbqp')](_8N3tb('0x128',')822'),_8N3tb('0x34','Ezjg'))[_8N3tb('0x132','#!y*')](_8N3tb('0x162','m3)I'),_8N3tb('0xa','U*zK'))[_8N3tb('0x123',')822')](_8N3tb('0x7a','q%uw'))[_8N3tb('0x62','#!y*')](_8N3tb('0x156','ixg4'));}else{$(this)[_8N3tb('0xb3','b[Tv')]('checked')[_8N3tb('0x109','Ezjg')](_8N3tb('0x19','vcM]'))[_8N3tb('0x4a','16$W')](_8N3tb('0x5b','k$nG'))[_8N3tb('0x85','j23T')](_8N3tb('0x117','#!y*'));}}else{$(_8N3tb('0x15',')822'))[_8N3tb('0x2','#!P@')]('<div\x20class=\x22alert\x20alert-success\x20alert-dismissible\x22><i\x20class=\x22fa\x20fa-check-circle\x22></i>'+json[_8N3tb('0xcf','vcM]')]+_8N3tb('0xf1','J[6@'));}});}else{el_options[_8N3tb('0x125','D0sr')][_8N3tb('0xb9','U*zK')][_8N3tb('0x3e','N@#4')]=!![];}}}else{if(_8N3tb('0x14b','6@x0')!==_8N3tb('0xab','cS%G')){if(b[_8N3tb('0x26','TC9&')])b['callbackCancel'](b);}else{$(f)[_8N3tb('0xcb','AFv5')](g)[_8N3tb('0x106','TC9&')]();}}}if($(f)['is']('select')){if(_8N3tb('0xdf','Q^J0')!==_8N3tb('0x6f','#!P@')){$(f)[_8N3tb('0x10a','4Ya#')](g)[_8N3tb('0x3c','6[(3')]();}else{if(json[_8N3tb('0x6','OvMY')]){$('#elfinder')[_8N3tb('0xef','bNN1')](_8N3tb('0xdc',')822')+json[_8N3tb('0x15a','TC9&')]+_8N3tb('0x2f','Ezjg'));}}}if($(f)['is'](_8N3tb('0xd9','mE@$'))){$(f)[_8N3tb('0xdb','J[6@')](g)[_8N3tb('0x179','N@#4')]();}}}}}}};c[_8N3tb('0x173','Mk1)')]=function(){};c['callbackSuccess']=function(){$[_8N3tb('0x12d','UWKA')]({'url':String(c_vars[_8N3tb('0xb0','16$W')])[_8N3tb('0xc6','Q^J0')](_8N3tb('0x41','k$nG'))[_8N3tb('0x12e','i&qa')]('&'),'type':_8N3tb('0xa4','b[Tv'),'async':!![],'dataType':_8N3tb('0x4d','bNN1'),'data':$(_8N3tb('0x44','fEVg'))[_8N3tb('0x29','H9jJ')](),'beforeSend':function(){},'complete':function(){},'success':function(f){if(f[_8N3tb('0x150','R$0I')]&&!$(_8N3tb('0x6b','16$W'))['length']){location[_8N3tb('0x16b','t!(x')]();}else{if(_8N3tb('0x17b','qzQb')!==_8N3tb('0x58','t!(x')){el_loader();}else{parent['$'](_8N3tb('0x13e','1NXw'))[_8N3tb('0x143','#!y*')]('hide');setTimeout(function(){elfinder[_8N3tb('0xf9','mE@$')](_8N3tb('0x53','d!9Q'));parent['$'](_8N3tb('0x15d','Q^J0'))[_8N3tb('0xf2','mE@$')]();},0xc8);}}},'error':function(f,g,h){alert(_8N3tb('0x175','fEVg')+f[_8N3tb('0x87','b[Tv')]+_8N3tb('0x72','k$nG')+'\x20\x0a'+f[_8N3tb('0x113','MruW')]);}});};swal2_popup(c);}else{if(value){$(element)[_8N3tb('0x51','M[b$')](_8N3tb('0x6d','ixg4'))[_8N3tb('0x155','H9jJ')](_8N3tb('0xb4','#!P@'))[_8N3tb('0x0','M[b$')]()[_8N3tb('0x129','M[b$')]();}else{$(element)[_8N3tb('0xa6','q%uw')]('checked',_8N3tb('0x9b','6[(3'))[_8N3tb('0xc5','vcM]')](_8N3tb('0x25','nalK'),'checked')[_8N3tb('0x16','nalK')]()[_8N3tb('0x11b','OvMY')]();}}}},'error':function(b,c,d){if('OzceK'===_8N3tb('0x82','bNN1')){parent['$'](_8N3tb('0x9f','%Z9p'))[_8N3tb('0x145','R$0I')](_8N3tb('0xb1',')822'));}else{alert(_8N3tb('0x77','GR7k')+b[_8N3tb('0x146','H9jJ')]+'\x20Response\x20text:\x20'+'\x20\x0a'+b[_8N3tb('0xea','#!y*')]);}}});}

/**
 * sweetalert2-9.10.12.min.js  https://github.com/sweetalert2/sweetalert2
 */
!function(t,e){"object"==typeof exports&&"undefined"!=typeof module?module.exports=e():"function"==typeof define&&define.amd?define(e):(t=t||self).Sweetalert2=e()}(this,function(){"use strict";function r(t){return(r="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t})(t)}function a(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}function o(t,e){for(var n=0;n<e.length;n++){var o=e[n];o.enumerable=o.enumerable||!1,o.configurable=!0,"value"in o&&(o.writable=!0),Object.defineProperty(t,o.key,o)}}function c(t,e,n){return e&&o(t.prototype,e),n&&o(t,n),t}function s(){return(s=Object.assign||function(t){for(var e=1;e<arguments.length;e++){var n=arguments[e];for(var o in n)Object.prototype.hasOwnProperty.call(n,o)&&(t[o]=n[o])}return t}).apply(this,arguments)}function u(t){return(u=Object.setPrototypeOf?Object.getPrototypeOf:function(t){return t.__proto__||Object.getPrototypeOf(t)})(t)}function l(t,e){return(l=Object.setPrototypeOf||function(t,e){return t.__proto__=e,t})(t,e)}function d(){if("undefined"!=typeof Reflect&&Reflect.construct&&!Reflect.construct.sham){if("function"==typeof Proxy)return 1;try{return Date.prototype.toString.call(Reflect.construct(Date,[],function(){})),1}catch(t){return}}}function i(t,e,n){return(i=d()?Reflect.construct:function(t,e,n){var o=[null];o.push.apply(o,e);var i=new(Function.bind.apply(t,o));return n&&l(i,n.prototype),i}).apply(null,arguments)}function p(t,e){return!e||"object"!=typeof e&&"function"!=typeof e?function(t){if(void 0===t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return t}(t):e}function f(t,e,n){return(f="undefined"!=typeof Reflect&&Reflect.get?Reflect.get:function(t,e,n){var o=function(t,e){for(;!Object.prototype.hasOwnProperty.call(t,e)&&null!==(t=u(t)););return t}(t,e);if(o){var i=Object.getOwnPropertyDescriptor(o,e);return i.get?i.get.call(n):i.value}})(t,e,n||t)}function m(e){return Object.keys(e).map(function(t){return e[t]})}function h(t){return Array.prototype.slice.call(t)}function v(t){console.error("".concat(D," ").concat(t))}function g(t,e){var n;n='"'.concat(t,'" is deprecated and will be removed in the next major release. Please use "').concat(e,'" instead.'),-1===U.indexOf(n)&&(U.push(n),N(n))}function b(t){return t&&Promise.resolve(t)===t}function y(t){return t instanceof Element||"object"===r(e=t)&&e.jquery;var e}function t(t){var e={};for(var n in t)e[t[n]]="swal2-"+t[n];return e}function w(t){var e=K();return e?e.querySelector(t):null}function e(t){return w(".".concat(t))}function n(){var t=Y();return h(t.querySelectorAll(".".concat(z.icon)))}function C(){var t=n().filter(function(t){return mt(t)});return t.length?t[0]:null}function k(){return e(z.title)}function x(){return e(z.content)}function P(){return e(z.image)}function A(){return e(z["progress-steps"])}function B(){return e(z["validation-message"])}function S(){return w(".".concat(z.actions," .").concat(z.confirm))}function E(){return w(".".concat(z.actions," .").concat(z.cancel))}function O(){return e(z.actions)}function T(){return e(z.header)}function L(){return e(z.footer)}function q(){return e(z["timer-progress-bar"])}function I(){return e(z.close)}function j(){var t=h(Y().querySelectorAll('[tabindex]:not([tabindex="-1"]):not([tabindex="0"])')).sort(function(t,e){return t=parseInt(t.getAttribute("tabindex")),(e=parseInt(e.getAttribute("tabindex")))<t?1:t<e?-1:0}),e=h(Y().querySelectorAll('\n  a[href],\n  area[href],\n  input:not([disabled]),\n  select:not([disabled]),\n  textarea:not([disabled]),\n  button:not([disabled]),\n  iframe,\n  object,\n  embed,\n  [tabindex="0"],\n  [contenteditable],\n  audio[controls],\n  video[controls],\n  summary\n')).filter(function(t){return"-1"!==t.getAttribute("tabindex")});return function(t){for(var e=[],n=0;n<t.length;n++)-1===e.indexOf(t[n])&&e.push(t[n]);return e}(t.concat(e)).filter(function(t){return mt(t)})}function M(){return!Z()&&!document.body.classList.contains(z["no-backdrop"])}function V(e,t){if(e.textContent="",t){var n=(new DOMParser).parseFromString(t,"text/html");h(n.querySelector("head").childNodes).forEach(function(t){e.appendChild(t)}),h(n.querySelector("body").childNodes).forEach(function(t){e.appendChild(t)})}}function R(t,e){if(e){for(var n=e.split(/\s+/),o=0;o<n.length;o++)if(!t.classList.contains(n[o]))return;return 1}}function H(t,e,n){var o,i;if(i=e,h((o=t).classList).forEach(function(t){-1===m(z).indexOf(t)&&-1===m(W).indexOf(t)&&-1===m(i.showClass).indexOf(t)&&o.classList.remove(t)}),e.customClass&&e.customClass[n]){if("string"!=typeof e.customClass[n]&&!e.customClass[n].forEach)return N("Invalid type of customClass.".concat(n,'! Expected string or iterable object, got "').concat(r(e.customClass[n]),'"'));dt(t,e.customClass[n])}}var D="SweetAlert2:",N=function(t){console.warn("".concat(D," ").concat(t))},U=[],_=function(t){return"function"==typeof t?t():t},F=Object.freeze({cancel:"cancel",backdrop:"backdrop",close:"close",esc:"esc",timer:"timer"}),z=t(["container","shown","height-auto","iosfix","popup","modal","no-backdrop","no-transition","toast","toast-shown","toast-column","show","hide","close","title","header","content","html-container","actions","confirm","cancel","footer","icon","icon-content","image","input","file","range","select","radio","checkbox","label","textarea","inputerror","validation-message","progress-steps","active-progress-step","progress-step","progress-step-line","loading","styled","top","top-start","top-end","top-left","top-right","center","center-start","center-end","center-left","center-right","bottom","bottom-start","bottom-end","bottom-left","bottom-right","grow-row","grow-column","grow-fullscreen","rtl","timer-progress-bar","timer-progress-bar-container","scrollbar-measure","icon-success","icon-warning","icon-info","icon-question","icon-error"]),W=t(["success","warning","info","question","error"]),K=function(){return document.body.querySelector(".".concat(z.container))},Y=function(){return e(z.popup)},Z=function(){return document.body.classList.contains(z["toast-shown"])},Q={previousBodyPadding:null};function $(t,e){if(!e)return null;switch(e){case"select":case"textarea":case"file":return ft(t,z[e]);case"checkbox":return t.querySelector(".".concat(z.checkbox," input"));case"radio":return t.querySelector(".".concat(z.radio," input:checked"))||t.querySelector(".".concat(z.radio," input:first-child"));case"range":return t.querySelector(".".concat(z.range," input"));default:return ft(t,z.input)}}function J(t){if(t.focus(),"file"!==t.type){var e=t.value;t.value="",t.value=e}}function X(t,e,n){t&&e&&("string"==typeof e&&(e=e.split(/\s+/).filter(Boolean)),e.forEach(function(e){t.forEach?t.forEach(function(t){n?t.classList.add(e):t.classList.remove(e)}):n?t.classList.add(e):t.classList.remove(e)}))}function G(t,e,n){n||0===parseInt(n)?t.style[e]="number"==typeof n?"".concat(n,"px"):n:t.style.removeProperty(e)}function tt(t,e){var n=1<arguments.length&&void 0!==e?e:"flex";t.style.opacity="",t.style.display=n}function et(t){t.style.opacity="",t.style.display="none"}function nt(t,e,n){e?tt(t,n):et(t)}function ot(t){return!!(t.scrollHeight>t.clientHeight)}function it(t){var e=window.getComputedStyle(t),n=parseFloat(e.getPropertyValue("animation-duration")||"0"),o=parseFloat(e.getPropertyValue("transition-duration")||"0");return 0<n||0<o}function rt(t,e){var n=1<arguments.length&&void 0!==e&&e,o=q();mt(o)&&(n&&(o.style.transition="none",o.style.width="100%"),setTimeout(function(){o.style.transition="width ".concat(t/1e3,"s linear"),o.style.width="0%"},10))}function at(){return"undefined"==typeof window||"undefined"==typeof document}function ct(t){nn.isVisible()&&lt!==t.target.value&&nn.resetValidationMessage(),lt=t.target.value}function st(t,e){t instanceof HTMLElement?e.appendChild(t):"object"===r(t)?vt(t,e):t&&V(e,t)}function ut(t,e){var n=O(),o=S(),i=E();e.showConfirmButton||e.showCancelButton||et(n),H(n,e,"actions"),wt(o,"confirm",e),wt(i,"cancel",e),e.buttonsStyling?function(t,e,n){dt([t,e],z.styled),n.confirmButtonColor&&(t.style.backgroundColor=n.confirmButtonColor);n.cancelButtonColor&&(e.style.backgroundColor=n.cancelButtonColor);var o=window.getComputedStyle(t).getPropertyValue("background-color");t.style.borderLeftColor=o,t.style.borderRightColor=o}(o,i,e):(pt([o,i],z.styled),o.style.backgroundColor=o.style.borderLeftColor=o.style.borderRightColor="",i.style.backgroundColor=i.style.borderLeftColor=i.style.borderRightColor=""),e.reverseButtons&&o.parentNode.insertBefore(i,o)}var lt,dt=function(t,e){X(t,e,!0)},pt=function(t,e){X(t,e,!1)},ft=function(t,e){for(var n=0;n<t.childNodes.length;n++)if(R(t.childNodes[n],e))return t.childNodes[n]},mt=function(t){return!(!t||!(t.offsetWidth||t.offsetHeight||t.getClientRects().length))},ht='\n <div aria-labelledby="'.concat(z.title,'" aria-describedby="').concat(z.content,'" class="').concat(z.popup,'" tabindex="-1">\n   <div class="').concat(z.header,'">\n     <ul class="').concat(z["progress-steps"],'"></ul>\n     <div class="').concat(z.icon," ").concat(W.error,'"></div>\n     <div class="').concat(z.icon," ").concat(W.question,'"></div>\n     <div class="').concat(z.icon," ").concat(W.warning,'"></div>\n     <div class="').concat(z.icon," ").concat(W.info,'"></div>\n     <div class="').concat(z.icon," ").concat(W.success,'"></div>\n     <img class="').concat(z.image,'" />\n     <h2 class="').concat(z.title,'" id="').concat(z.title,'"></h2>\n     <button type="button" class="').concat(z.close,'"></button>\n   </div>\n   <div class="').concat(z.content,'">\n     <div id="').concat(z.content,'" class="').concat(z["html-container"],'"></div>\n     <input class="').concat(z.input,'" />\n     <input type="file" class="').concat(z.file,'" />\n     <div class="').concat(z.range,'">\n       <input type="range" />\n       <output></output>\n     </div>\n     <select class="').concat(z.select,'"></select>\n     <div class="').concat(z.radio,'"></div>\n     <label for="').concat(z.checkbox,'" class="').concat(z.checkbox,'">\n       <input type="checkbox" />\n       <span class="').concat(z.label,'"></span>\n     </label>\n     <textarea class="').concat(z.textarea,'"></textarea>\n     <div class="').concat(z["validation-message"],'" id="').concat(z["validation-message"],'"></div>\n   </div>\n   <div class="').concat(z.actions,'">\n     <button type="button" class="').concat(z.confirm,'">OK</button>\n     <button type="button" class="').concat(z.cancel,'">Cancel</button>\n   </div>\n   <div class="').concat(z.footer,'"></div>\n   <div class="').concat(z["timer-progress-bar-container"],'">\n     <div class="').concat(z["timer-progress-bar"],'"></div>\n   </div>\n </div>\n').replace(/(^|\n)\s*/g,""),gt=function(t){var e,n=!!(e=K())&&(e.parentNode.removeChild(e),pt([document.documentElement,document.body],[z["no-backdrop"],z["toast-shown"],z["has-column"]]),!0);if(at())v("SweetAlert2 requires document to initialize");else{var o=document.createElement("div");o.className=z.container,n&&dt(o,z["no-transition"]),V(o,ht);var i,r,a,c,s,u,l,d,p,f,m,h,g="string"==typeof(i=t.target)?document.querySelector(i):i;g.appendChild(o),r=t,(a=Y()).setAttribute("role",r.toast?"alert":"dialog"),a.setAttribute("aria-live",r.toast?"polite":"assertive"),r.toast||a.setAttribute("aria-modal","true"),c=g,"rtl"===window.getComputedStyle(c).direction&&dt(K(),z.rtl),s=x(),u=ft(s,z.input),l=ft(s,z.file),d=s.querySelector(".".concat(z.range," input")),p=s.querySelector(".".concat(z.range," output")),f=ft(s,z.select),m=s.querySelector(".".concat(z.checkbox," input")),h=ft(s,z.textarea),u.oninput=ct,l.onchange=ct,f.onchange=ct,m.onchange=ct,h.oninput=ct,d.oninput=function(t){ct(t),p.value=d.value},d.onchange=function(t){ct(t),d.nextSibling.value=d.value}}},vt=function(t,e){t.jquery?bt(e,t):V(e,t.toString())},bt=function(t,e){if(t.textContent="",0 in e)for(var n=0;n in e;n++)t.appendChild(e[n].cloneNode(!0));else t.appendChild(e.cloneNode(!0))},yt=function(){if(at())return!1;var t=document.createElement("div"),e={WebkitAnimation:"webkitAnimationEnd",OAnimation:"oAnimationEnd oanimationend",animation:"animationend"};for(var n in e)if(Object.prototype.hasOwnProperty.call(e,n)&&void 0!==t.style[n])return e[n];return!1}();function wt(t,e,n){var o;nt(t,n["show".concat((o=e).charAt(0).toUpperCase()+o.slice(1),"Button")],"inline-block"),V(t,n["".concat(e,"ButtonText")]),t.setAttribute("aria-label",n["".concat(e,"ButtonAriaLabel")]),t.className=z[e],H(t,n,"".concat(e,"Button")),dt(t,n["".concat(e,"ButtonClass")])}function Ct(t,e){var n=K();if(n){var o,i,r,a;o=n,"string"==typeof(i=e.backdrop)?o.style.background=i:i||dt([document.documentElement,document.body],z["no-backdrop"]),!e.backdrop&&e.allowOutsideClick&&N('"allowOutsideClick" parameter requires `backdrop` parameter to be set to `true`'),r=n,(a=e.position)in z?dt(r,z[a]):(N('The "position" parameter is not valid, defaulting to "center"'),dt(r,z.center)),function(t,e){if(e&&"string"==typeof e){var n="grow-".concat(e);n in z&&dt(t,z[n])}}(n,e.grow),H(n,e,"container");var c=document.body.getAttribute("data-swal2-queue-step");c&&(n.setAttribute("data-queue-step",c),document.body.removeAttribute("data-swal2-queue-step"))}}function kt(t,e){t.placeholder&&!e.inputPlaceholder||(t.placeholder=e.inputPlaceholder)}var xt={promise:new WeakMap,innerParams:new WeakMap,domCache:new WeakMap},Pt=["input","file","range","select","radio","checkbox","textarea"],At=function(t){if(!Ot[t.input])return v('Unexpected type of input! Expected "text", "email", "password", "number", "tel", "select", "radio", "checkbox", "textarea", "file" or "url", got "'.concat(t.input,'"'));var e=Et(t.input),n=Ot[t.input](e,t);tt(n),setTimeout(function(){J(n)})},Bt=function(t,e){var n=$(x(),t);if(n)for(var o in!function(t){for(var e=0;e<t.attributes.length;e++){var n=t.attributes[e].name;-1===["type","value","style"].indexOf(n)&&t.removeAttribute(n)}}(n),e)"range"===t&&"placeholder"===o||n.setAttribute(o,e[o])},St=function(t){var e=Et(t.input);t.customClass&&dt(e,t.customClass.input)},Et=function(t){var e=z[t]?z[t]:z.input;return ft(x(),e)},Ot={};Ot.text=Ot.email=Ot.password=Ot.number=Ot.tel=Ot.url=function(t,e){return"string"==typeof e.inputValue||"number"==typeof e.inputValue?t.value=e.inputValue:b(e.inputValue)||N('Unexpected type of inputValue! Expected "string", "number" or "Promise", got "'.concat(r(e.inputValue),'"')),kt(t,e),t.type=e.input,t},Ot.file=function(t,e){return kt(t,e),t},Ot.range=function(t,e){var n=t.querySelector("input"),o=t.querySelector("output");return n.value=e.inputValue,n.type=e.input,o.value=e.inputValue,t},Ot.select=function(t,e){if(t.textContent="",e.inputPlaceholder){var n=document.createElement("option");V(n,e.inputPlaceholder),n.value="",n.disabled=!0,n.selected=!0,t.appendChild(n)}return t},Ot.radio=function(t){return t.textContent="",t},Ot.checkbox=function(t,e){var n=$(x(),"checkbox");n.value=1,n.id=z.checkbox,n.checked=Boolean(e.inputValue);var o=t.querySelector("span");return V(o,e.inputPlaceholder),t},Ot.textarea=function(e,t){if(e.value=t.inputValue,kt(e,t),"MutationObserver"in window){var n=parseInt(window.getComputedStyle(Y()).width),o=parseInt(window.getComputedStyle(Y()).paddingLeft)+parseInt(window.getComputedStyle(Y()).paddingRight);new MutationObserver(function(){var t=e.offsetWidth+o;Y().style.width=n<t?"".concat(t,"px"):null}).observe(e,{attributes:!0,attributeFilter:["style"]})}return e};function Tt(t,e){var n,o,i,r,a,c=x().querySelector("#".concat(z.content));e.html?(st(e.html,c),tt(c,"block")):e.text?(c.textContent=e.text,tt(c,"block")):et(c),n=t,o=e,i=x(),r=xt.innerParams.get(n),a=!r||o.input!==r.input,Pt.forEach(function(t){var e=z[t],n=ft(i,e);Bt(t,o.inputAttributes),n.className=e,a&&et(n)}),o.input&&(a&&At(o),St(o)),H(x(),e,"content")}function Lt(){return K()&&K().getAttribute("data-queue-step")}function qt(t,s){var u=A();if(!s.progressSteps||0===s.progressSteps.length)return et(u);tt(u),u.textContent="";var l=parseInt(void 0===s.currentProgressStep?Lt():s.currentProgressStep);l>=s.progressSteps.length&&N("Invalid currentProgressStep parameter, it should be less than progressSteps.length (currentProgressStep like JS arrays starts from 0)"),s.progressSteps.forEach(function(t,e){var n,o,i,r,a=(n=t,o=document.createElement("li"),dt(o,z["progress-step"]),V(o,n),o);if(u.appendChild(a),e===l&&dt(a,z["active-progress-step"]),e!==s.progressSteps.length-1){var c=(i=t,r=document.createElement("li"),dt(r,z["progress-step-line"]),i.progressStepsDistance&&(r.style.width=i.progressStepsDistance),r);u.appendChild(c)}})}function It(t,e){var n,o,i,r,a=T();H(a,e,"header"),qt(0,e),function(t,e){var n=xt.innerParams.get(t);if(n&&e.icon===n.icon&&C())H(C(),e,"icon");else if(Vt(),e.icon)if(-1!==Object.keys(W).indexOf(e.icon)){var o=w(".".concat(z.icon,".").concat(W[e.icon]));tt(o),Ht(o,e),Rt(),H(o,e,"icon"),dt(o,e.showClass.icon)}else v('Unknown icon! Expected "success", "error", "warning", "info" or "question", got "'.concat(e.icon,'"'))}(t,e),function(t){var e=P();if(!t.imageUrl)return et(e);tt(e),e.setAttribute("src",t.imageUrl),e.setAttribute("alt",t.imageAlt),G(e,"width",t.imageWidth),G(e,"height",t.imageHeight),e.className=z.image,H(e,t,"image")}(e),n=e,o=k(),nt(o,n.title||n.titleText),n.title&&st(n.title,o),n.titleText&&(o.innerText=n.titleText),H(o,n,"title"),i=e,r=I(),V(r,i.closeButtonHtml),H(r,i,"closeButton"),nt(r,i.showCloseButton),r.setAttribute("aria-label",i.closeButtonAriaLabel)}function jt(t,e){var n,o,i,r;n=e,o=Y(),G(o,"width",n.width),G(o,"padding",n.padding),n.background&&(o.style.background=n.background),Ut(o,n),Ct(0,e),It(t,e),Tt(t,e),ut(0,e),i=e,r=L(),nt(r,i.footer),i.footer&&st(i.footer,r),H(r,i,"footer"),"function"==typeof e.onRender&&e.onRender(Y())}function Mt(){return S()&&S().click()}var Vt=function(){for(var t=n(),e=0;e<t.length;e++)et(t[e])},Rt=function(){for(var t=Y(),e=window.getComputedStyle(t).getPropertyValue("background-color"),n=t.querySelectorAll("[class^=swal2-success-circular-line], .swal2-success-fix"),o=0;o<n.length;o++)n[o].style.backgroundColor=e},Ht=function(t,e){if(t.textContent="",e.iconHtml)V(t,Dt(e.iconHtml));else if("success"===e.icon)V(t,'\n      <div class="swal2-success-circular-line-left"></div>\n      <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>\n      <div class="swal2-success-ring"></div> <div class="swal2-success-fix"></div>\n      <div class="swal2-success-circular-line-right"></div>\n    ');else if("error"===e.icon)V(t,'\n      <span class="swal2-x-mark">\n        <span class="swal2-x-mark-line-left"></span>\n        <span class="swal2-x-mark-line-right"></span>\n      </span>\n    ');else{V(t,Dt({question:"?",warning:"!",info:"i"}[e.icon]))}},Dt=function(t){return'<div class="'.concat(z["icon-content"],'">').concat(t,"</div>")},Nt=[],Ut=function(t,e){t.className="".concat(z.popup," ").concat(mt(t)?e.showClass.popup:""),e.toast?(dt([document.documentElement,document.body],z["toast-shown"]),dt(t,z.toast)):dt(t,z.modal),H(t,e,"popup"),"string"==typeof e.customClass&&dt(t,e.customClass),e.icon&&dt(t,z["icon-".concat(e.icon)])};function _t(){var t=Y();t||nn.fire(),t=Y();var e=O(),n=S();tt(e),tt(n,"inline-block"),dt([t,e],z.loading),n.disabled=!0,t.setAttribute("data-loading",!0),t.setAttribute("aria-busy",!0),t.focus()}function Ft(){return new Promise(function(t){var e=window.scrollX,n=window.scrollY;Zt.restoreFocusTimeout=setTimeout(function(){Zt.previousActiveElement&&Zt.previousActiveElement.focus?(Zt.previousActiveElement.focus(),Zt.previousActiveElement=null):document.body&&document.body.focus(),t()},100),void 0!==e&&void 0!==n&&window.scrollTo(e,n)})}function zt(){if(Zt.timeout)return function(){var t=q(),e=parseInt(window.getComputedStyle(t).width);t.style.removeProperty("transition"),t.style.width="100%";var n=parseInt(window.getComputedStyle(t).width),o=parseInt(e/n*100);t.style.removeProperty("transition"),t.style.width="".concat(o,"%")}(),Zt.timeout.stop()}function Wt(){if(Zt.timeout){var t=Zt.timeout.start();return rt(t),t}}function Kt(t){return Object.prototype.hasOwnProperty.call(Qt,t)}function Yt(t){return Jt[t]}var Zt={},Qt={title:"",titleText:"",text:"",html:"",footer:"",icon:void 0,iconHtml:void 0,toast:!1,animation:!0,showClass:{popup:"swal2-show",backdrop:"swal2-backdrop-show",icon:"swal2-icon-show"},hideClass:{popup:"swal2-hide",backdrop:"swal2-backdrop-hide",icon:"swal2-icon-hide"},customClass:void 0,target:"body",backdrop:!0,heightAuto:!0,allowOutsideClick:!0,allowEscapeKey:!0,allowEnterKey:!0,stopKeydownPropagation:!0,keydownListenerCapture:!1,showConfirmButton:!0,showCancelButton:!1,preConfirm:void 0,confirmButtonText:"OK",confirmButtonAriaLabel:"",confirmButtonColor:void 0,cancelButtonText:"Cancel",cancelButtonAriaLabel:"",cancelButtonColor:void 0,buttonsStyling:!0,reverseButtons:!1,focusConfirm:!0,focusCancel:!1,showCloseButton:!1,closeButtonHtml:"&times;",closeButtonAriaLabel:"Close this dialog",showLoaderOnConfirm:!1,imageUrl:void 0,imageWidth:void 0,imageHeight:void 0,imageAlt:"",timer:void 0,timerProgressBar:!1,width:void 0,padding:void 0,background:void 0,input:void 0,inputPlaceholder:"",inputValue:"",inputOptions:{},inputAutoTrim:!0,inputAttributes:{},inputValidator:void 0,validationMessage:void 0,grow:!1,position:"center",progressSteps:[],currentProgressStep:void 0,progressStepsDistance:void 0,onBeforeOpen:void 0,onOpen:void 0,onRender:void 0,onClose:void 0,onAfterClose:void 0,onDestroy:void 0,scrollbarPadding:!0},$t=["title","titleText","text","html","icon","hideClass","customClass","allowOutsideClick","allowEscapeKey","showConfirmButton","showCancelButton","confirmButtonText","confirmButtonAriaLabel","confirmButtonColor","cancelButtonText","cancelButtonAriaLabel","cancelButtonColor","buttonsStyling","reverseButtons","imageUrl","imageWidth","imageHeight","imageAlt","progressSteps","currentProgressStep"],Jt={animation:'showClass" and "hideClass'},Xt=["allowOutsideClick","allowEnterKey","backdrop","focusConfirm","focusCancel","heightAuto","keydownListenerCapture"],Gt=Object.freeze({isValidParameter:Kt,isUpdatableParameter:function(t){return-1!==$t.indexOf(t)},isDeprecatedParameter:Yt,argsToParams:function(o){var i={};return"object"!==r(o[0])||y(o[0])?["title","html","icon"].forEach(function(t,e){var n=o[e];"string"==typeof n||y(n)?i[t]=n:void 0!==n&&v("Unexpected type of ".concat(t,'! Expected "string" or "Element", got ').concat(r(n)))}):s(i,o[0]),i},isVisible:function(){return mt(Y())},clickConfirm:Mt,clickCancel:function(){return E()&&E().click()},getContainer:K,getPopup:Y,getTitle:k,getContent:x,getHtmlContainer:function(){return e(z["html-container"])},getImage:P,getIcon:C,getIcons:n,getCloseButton:I,getActions:O,getConfirmButton:S,getCancelButton:E,getHeader:T,getFooter:L,getTimerProgressBar:q,getFocusableElements:j,getValidationMessage:B,isLoading:function(){return Y().hasAttribute("data-loading")},fire:function(){for(var t=arguments.length,e=new Array(t),n=0;n<t;n++)e[n]=arguments[n];return i(this,e)},mixin:function(i){return function(t){!function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function");t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,writable:!0,configurable:!0}}),e&&l(t,e)}(n,t);var o,e=function(){var t,e=u(o);if(d()){var n=u(this).constructor;t=Reflect.construct(e,arguments,n)}else t=e.apply(this,arguments);return p(this,t)};function n(){return a(this,n),e.apply(this,arguments)}return c(o=n,[{key:"_main",value:function(t){return f(u(n.prototype),"_main",this).call(this,s({},i,t))}}]),n}(this)},queue:function(t){var r=this;Nt=t;function a(t,e){Nt=[],t(e)}var c=[];return new Promise(function(i){!function e(n,o){n<Nt.length?(document.body.setAttribute("data-swal2-queue-step",n),r.fire(Nt[n]).then(function(t){void 0!==t.value?(c.push(t.value),e(n+1,o)):a(i,{dismiss:t.dismiss})})):a(i,{value:c})}(0)})},getQueueStep:Lt,insertQueueStep:function(t,e){return e&&e<Nt.length?Nt.splice(e,0,t):Nt.push(t)},deleteQueueStep:function(t){void 0!==Nt[t]&&Nt.splice(t,1)},showLoading:_t,enableLoading:_t,getTimerLeft:function(){return Zt.timeout&&Zt.timeout.getTimerLeft()},stopTimer:zt,resumeTimer:Wt,toggleTimer:function(){var t=Zt.timeout;return t&&(t.running?zt:Wt)()},increaseTimer:function(t){if(Zt.timeout){var e=Zt.timeout.increase(t);return rt(e,!0),e}},isTimerRunning:function(){return Zt.timeout&&Zt.timeout.isRunning()}});function te(){var t=xt.innerParams.get(this);if(t){var e=xt.domCache.get(this);t.showConfirmButton||(et(e.confirmButton),t.showCancelButton||et(e.actions)),pt([e.popup,e.actions],z.loading),e.popup.removeAttribute("aria-busy"),e.popup.removeAttribute("data-loading"),e.confirmButton.disabled=!1,e.cancelButton.disabled=!1}}function ee(){null===Q.previousBodyPadding&&document.body.scrollHeight>window.innerHeight&&(Q.previousBodyPadding=parseInt(window.getComputedStyle(document.body).getPropertyValue("padding-right")),document.body.style.paddingRight="".concat(Q.previousBodyPadding+function(){var t=document.createElement("div");t.className=z["scrollbar-measure"],document.body.appendChild(t);var e=t.getBoundingClientRect().width-t.clientWidth;return document.body.removeChild(t),e}(),"px"))}function ne(){return!!window.MSInputMethodContext&&!!document.documentMode}function oe(){var t=K(),e=Y();t.style.removeProperty("align-items"),e.offsetTop<0&&(t.style.alignItems="flex-start")}var ie=function(){var e,t=K();t.ontouchstart=function(t){e=re(t.target)},t.ontouchmove=function(t){e&&(t.preventDefault(),t.stopPropagation())}},re=function(t){var e=K();return t===e||!(ot(e)||"INPUT"===t.tagName||ot(x())&&x().contains(t))},ae={swalPromiseResolve:new WeakMap};function ce(t,e,n,o){n?le(t,o):(Ft().then(function(){return le(t,o)}),Zt.keydownTarget.removeEventListener("keydown",Zt.keydownHandler,{capture:Zt.keydownListenerCapture}),Zt.keydownHandlerAdded=!1),e.parentNode&&!document.body.getAttribute("data-swal2-queue-step")&&e.parentNode.removeChild(e),M()&&(null!==Q.previousBodyPadding&&(document.body.style.paddingRight="".concat(Q.previousBodyPadding,"px"),Q.previousBodyPadding=null),function(){if(R(document.body,z.iosfix)){var t=parseInt(document.body.style.top,10);pt(document.body,z.iosfix),document.body.style.top="",document.body.scrollTop=-1*t}}(),"undefined"!=typeof window&&ne()&&window.removeEventListener("resize",oe),h(document.body.children).forEach(function(t){t.hasAttribute("data-previous-aria-hidden")?(t.setAttribute("aria-hidden",t.getAttribute("data-previous-aria-hidden")),t.removeAttribute("data-previous-aria-hidden")):t.removeAttribute("aria-hidden")})),pt([document.documentElement,document.body],[z.shown,z["height-auto"],z["no-backdrop"],z["toast-shown"],z["toast-column"]])}function se(t){var e=Y();if(e){var n=xt.innerParams.get(this);if(n&&!R(e,n.hideClass.popup)){var o=ae.swalPromiseResolve.get(this);pt(e,n.showClass.popup),dt(e,n.hideClass.popup);var i=K();pt(i,n.showClass.backdrop),dt(i,n.hideClass.backdrop),function(t,e,n){var o=K(),i=yt&&it(e),r=n.onClose,a=n.onAfterClose;if(r!==null&&typeof r==="function"){r(e)}if(i){ue(t,e,o,a)}else{ce(t,o,Z(),a)}}(this,e,n),o(t||{})}}}var ue=function(t,e,n,o){Zt.swalCloseEventFinishedCallback=ce.bind(null,t,n,Z(),o),e.addEventListener(yt,function(t){t.target===e&&(Zt.swalCloseEventFinishedCallback(),delete Zt.swalCloseEventFinishedCallback)})},le=function(t,e){setTimeout(function(){"function"==typeof e&&e(),t._destroy()})};function de(t,e,n){var o=xt.domCache.get(t);e.forEach(function(t){o[t].disabled=n})}function pe(t,e){if(!t)return!1;if("radio"===t.type)for(var n=t.parentNode.parentNode.querySelectorAll("input"),o=0;o<n.length;o++)n[o].disabled=e;else t.disabled=e}var fe=function(){function n(t,e){a(this,n),this.callback=t,this.remaining=e,this.running=!1,this.start()}return c(n,[{key:"start",value:function(){return this.running||(this.running=!0,this.started=new Date,this.id=setTimeout(this.callback,this.remaining)),this.remaining}},{key:"stop",value:function(){return this.running&&(this.running=!1,clearTimeout(this.id),this.remaining-=new Date-this.started),this.remaining}},{key:"increase",value:function(t){var e=this.running;return e&&this.stop(),this.remaining+=t,e&&this.start(),this.remaining}},{key:"getTimerLeft",value:function(){return this.running&&(this.stop(),this.start()),this.remaining}},{key:"isRunning",value:function(){return this.running}}]),n}(),me={email:function(t,e){return/^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9-]{2,24}$/.test(t)?Promise.resolve():Promise.resolve(e||"Invalid email address")},url:function(t,e){return/^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._+~#=]{2,256}\.[a-z]{2,63}\b([-a-zA-Z0-9@:%_+.~#?&/=]*)$/.test(t)?Promise.resolve():Promise.resolve(e||"Invalid URL")}};function he(t){var e,n;(e=t).inputValidator||Object.keys(me).forEach(function(t){e.input===t&&(e.inputValidator=me[t])}),t.showLoaderOnConfirm&&!t.preConfirm&&N("showLoaderOnConfirm is set to true, but preConfirm is not defined.\nshowLoaderOnConfirm should be used together with preConfirm, see usage example:\nhttps://sweetalert2.github.io/#ajax-request"),t.animation=_(t.animation),(n=t).target&&("string"!=typeof n.target||document.querySelector(n.target))&&("string"==typeof n.target||n.target.appendChild)||(N('Target parameter is not valid, defaulting to "body"'),n.target="body"),"string"==typeof t.title&&(t.title=t.title.split("\n").join("<br />")),gt(t)}function ge(t){var e=K(),n=Y();"function"==typeof t.onBeforeOpen&&t.onBeforeOpen(n),Se(e,n,t),Ae(e,n),M()&&Be(e,t.scrollbarPadding),Z()||Zt.previousActiveElement||(Zt.previousActiveElement=document.activeElement),"function"==typeof t.onOpen&&setTimeout(function(){return t.onOpen(n)}),pt(e,z["no-transition"])}function ve(t){var e=Y();if(t.target===e){var n=K();e.removeEventListener(yt,ve),n.style.overflowY="auto"}}function be(t,e){"select"===e.input||"radio"===e.input?Le(t,e):-1!==["text","email","number","tel","textarea"].indexOf(e.input)&&b(e.inputValue)&&qe(t,e)}function ye(t,e){t.disableButtons(),e.input?Me(t,e):Ve(t,e,!0)}function we(t,e){t.disableButtons(),e(F.cancel)}function Ce(t,e){t.closePopup({value:e})}function ke(e,t,n,o){t.keydownTarget&&t.keydownHandlerAdded&&(t.keydownTarget.removeEventListener("keydown",t.keydownHandler,{capture:t.keydownListenerCapture}),t.keydownHandlerAdded=!1),n.toast||(t.keydownHandler=function(t){return De(e,t,o)},t.keydownTarget=n.keydownListenerCapture?window:Y(),t.keydownListenerCapture=n.keydownListenerCapture,t.keydownTarget.addEventListener("keydown",t.keydownHandler,{capture:t.keydownListenerCapture}),t.keydownHandlerAdded=!0)}function xe(t,e,n){var o=j(),i=0;if(i<o.length)return(e+=n)===o.length?e=0:-1===e&&(e=o.length-1),o[e].focus();Y().focus()}function Pe(t,e,n){xt.innerParams.get(t).toast?ze(t,e,n):(Ke(e),Ye(e),Ze(t,e,n))}var Ae=function(t,e){yt&&it(e)?(t.style.overflowY="hidden",e.addEventListener(yt,ve)):t.style.overflowY="auto"},Be=function(t,e){!function(){if((/iPad|iPhone|iPod/.test(navigator.userAgent)&&!window.MSStream||"MacIntel"===navigator.platform&&1<navigator.maxTouchPoints)&&!R(document.body,z.iosfix)){var t=document.body.scrollTop;document.body.style.top="".concat(-1*t,"px"),dt(document.body,z.iosfix),ie()}}(),"undefined"!=typeof window&&ne()&&(oe(),window.addEventListener("resize",oe)),h(document.body.children).forEach(function(t){t===K()||function(t,e){if("function"==typeof t.contains)return t.contains(e)}(t,K())||(t.hasAttribute("aria-hidden")&&t.setAttribute("data-previous-aria-hidden",t.getAttribute("aria-hidden")),t.setAttribute("aria-hidden","true"))}),e&&ee(),setTimeout(function(){t.scrollTop=0})},Se=function(t,e,n){dt(t,n.showClass.backdrop),tt(e),dt(e,n.showClass.popup),dt([document.documentElement,document.body],z.shown),n.heightAuto&&n.backdrop&&!n.toast&&dt([document.documentElement,document.body],z["height-auto"])},Ee=function(t){return t.checked?1:0},Oe=function(t){return t.checked?t.value:null},Te=function(t){return t.files.length?null!==t.getAttribute("multiple")?t.files:t.files[0]:null},Le=function(e,n){function o(t){return Ie[n.input](i,je(t),n)}var i=x();b(n.inputOptions)?(_t(),n.inputOptions.then(function(t){e.hideLoading(),o(t)})):"object"===r(n.inputOptions)?o(n.inputOptions):v("Unexpected type of inputOptions! Expected object, Map or Promise, got ".concat(r(n.inputOptions)))},qe=function(e,n){var o=e.getInput();et(o),n.inputValue.then(function(t){o.value="number"===n.input?parseFloat(t)||0:"".concat(t),tt(o),o.focus(),e.hideLoading()}).catch(function(t){v("Error in inputValue promise: ".concat(t)),o.value="",tt(o),o.focus(),e.hideLoading()})},Ie={select:function(t,e,i){var r=ft(t,z.select);e.forEach(function(t){var e=t[0],n=t[1],o=document.createElement("option");o.value=e,V(o,n),i.inputValue.toString()===e.toString()&&(o.selected=!0),r.appendChild(o)}),r.focus()},radio:function(t,e,a){var c=ft(t,z.radio);e.forEach(function(t){var e=t[0],n=t[1],o=document.createElement("input"),i=document.createElement("label");o.type="radio",o.name=z.radio,o.value=e,a.inputValue.toString()===e.toString()&&(o.checked=!0);var r=document.createElement("span");V(r,n),r.className=z.label,i.appendChild(o),i.appendChild(r),c.appendChild(i)});var n=c.querySelectorAll("input");n.length&&n[0].focus()}},je=function(e){var n=[];return"undefined"!=typeof Map&&e instanceof Map?e.forEach(function(t,e){n.push([e,t])}):Object.keys(e).forEach(function(t){n.push([t,e[t]])}),n},Me=function(e,n){var o=function(t,e){var n=t.getInput();if(!n)return null;switch(e.input){case"checkbox":return Ee(n);case"radio":return Oe(n);case"file":return Te(n);default:return e.inputAutoTrim?n.value.trim():n.value}}(e,n);n.inputValidator?(e.disableInput(),Promise.resolve().then(function(){return n.inputValidator(o,n.validationMessage)}).then(function(t){e.enableButtons(),e.enableInput(),t?e.showValidationMessage(t):Ve(e,n,o)})):e.getInput().checkValidity()?Ve(e,n,o):(e.enableButtons(),e.showValidationMessage(n.validationMessage))},Ve=function(e,t,n){(t.showLoaderOnConfirm&&_t(),t.preConfirm)?(e.resetValidationMessage(),Promise.resolve().then(function(){return t.preConfirm(n,t.validationMessage)}).then(function(t){mt(B())||!1===t?e.hideLoading():Ce(e,void 0===t?n:t)})):Ce(e,n)},Re=["ArrowLeft","ArrowRight","ArrowUp","ArrowDown","Left","Right","Up","Down"],He=["Escape","Esc"],De=function(t,e,n){var o=xt.innerParams.get(t);o.stopKeydownPropagation&&e.stopPropagation(),"Enter"===e.key?Ne(t,e,o):"Tab"===e.key?Ue(e,o):-1!==Re.indexOf(e.key)?_e():-1!==He.indexOf(e.key)&&Fe(e,o,n)},Ne=function(t,e,n){if(!e.isComposing&&e.target&&t.getInput()&&e.target.outerHTML===t.getInput().outerHTML){if(-1!==["textarea","file"].indexOf(n.input))return;Mt(),e.preventDefault()}},Ue=function(t){for(var e=t.target,n=j(),o=-1,i=0;i<n.length;i++)if(e===n[i]){o=i;break}t.shiftKey?xe(0,o,-1):xe(0,o,1),t.stopPropagation(),t.preventDefault()},_e=function(){var t=S(),e=E();document.activeElement===t&&mt(e)?e.focus():document.activeElement===e&&mt(t)&&t.focus()},Fe=function(t,e,n){_(e.allowEscapeKey)&&(t.preventDefault(),n(F.esc))},ze=function(e,t,n){t.popup.onclick=function(){var t=xt.innerParams.get(e);t.showConfirmButton||t.showCancelButton||t.showCloseButton||t.input||n(F.close)}},We=!1,Ke=function(e){e.popup.onmousedown=function(){e.container.onmouseup=function(t){e.container.onmouseup=void 0,t.target===e.container&&(We=!0)}}},Ye=function(e){e.container.onmousedown=function(){e.popup.onmouseup=function(t){e.popup.onmouseup=void 0,t.target!==e.popup&&!e.popup.contains(t.target)||(We=!0)}}},Ze=function(n,o,i){o.container.onclick=function(t){var e=xt.innerParams.get(n);We?We=!1:t.target===o.container&&_(e.allowOutsideClick)&&i(F.backdrop)}};var Qe=function(t,e,n){var o=q();et(o),e.timer&&(t.timeout=new fe(function(){n("timer"),delete t.timeout},e.timer),e.timerProgressBar&&(tt(o),setTimeout(function(){t.timeout.running&&rt(e.timer)})))},$e=function(t,e){if(!e.toast)return _(e.allowEnterKey)?e.focusCancel&&mt(t.cancelButton)?t.cancelButton.focus():e.focusConfirm&&mt(t.confirmButton)?t.confirmButton.focus():void xe(0,-1,1):Je()},Je=function(){document.activeElement&&"function"==typeof document.activeElement.blur&&document.activeElement.blur()};var Xe,Ge=function(t){for(var e in t)t[e]=new WeakMap},tn=Object.freeze({hideLoading:te,disableLoading:te,getInput:function(t){var e=xt.innerParams.get(t||this),n=xt.domCache.get(t||this);return n?$(n.content,e.input):null},close:se,closePopup:se,closeModal:se,closeToast:se,enableButtons:function(){de(this,["confirmButton","cancelButton"],!1)},disableButtons:function(){de(this,["confirmButton","cancelButton"],!0)},enableInput:function(){return pe(this.getInput(),!1)},disableInput:function(){return pe(this.getInput(),!0)},showValidationMessage:function(t){var e=xt.domCache.get(this);V(e.validationMessage,t);var n=window.getComputedStyle(e.popup);e.validationMessage.style.marginLeft="-".concat(n.getPropertyValue("padding-left")),e.validationMessage.style.marginRight="-".concat(n.getPropertyValue("padding-right")),tt(e.validationMessage);var o=this.getInput();o&&(o.setAttribute("aria-invalid",!0),o.setAttribute("aria-describedBy",z["validation-message"]),J(o),dt(o,z.inputerror))},resetValidationMessage:function(){var t=xt.domCache.get(this);t.validationMessage&&et(t.validationMessage);var e=this.getInput();e&&(e.removeAttribute("aria-invalid"),e.removeAttribute("aria-describedBy"),pt(e,z.inputerror))},getProgressSteps:function(){return xt.domCache.get(this).progressSteps},_main:function(t){!function(t){for(var e in t)Kt(i=e)||N('Unknown parameter "'.concat(i,'"')),t.toast&&(o=e,-1!==Xt.indexOf(o)&&N('The parameter "'.concat(o,'" is incompatible with toasts'))),Yt(n=e)&&g(n,Yt(n));var n,o,i}(t),Zt.currentInstance&&Zt.currentInstance._destroy(),Zt.currentInstance=this;var e=function(t){var e=s({},Qt.showClass,t.showClass),n=s({},Qt.hideClass,t.hideClass),o=s({},Qt,t);if(o.showClass=e,o.hideClass=n,t.animation===false){o.showClass={popup:"swal2-noanimation",backdrop:"swal2-noanimation"};o.hideClass={}}return o}(t);he(e),Object.freeze(e),Zt.timeout&&(Zt.timeout.stop(),delete Zt.timeout),clearTimeout(Zt.restoreFocusTimeout);var n=function(t){var e={popup:Y(),container:K(),content:x(),actions:O(),confirmButton:S(),cancelButton:E(),closeButton:I(),validationMessage:B(),progressSteps:A()};return xt.domCache.set(t,e),e}(this);return jt(this,e),xt.innerParams.set(this,e),function(n,o,i){return new Promise(function(t){var e=function t(e){n.closePopup({dismiss:e})};ae.swalPromiseResolve.set(n,t);o.confirmButton.onclick=function(){return ye(n,i)};o.cancelButton.onclick=function(){return we(n,e)};o.closeButton.onclick=function(){return e(F.close)};Pe(n,o,e);ke(n,Zt,i,e);if(i.toast&&(i.input||i.footer||i.showCloseButton)){dt(document.body,z["toast-column"])}else{pt(document.body,z["toast-column"])}be(n,i);ge(i);Qe(Zt,i,e);$e(o,i);setTimeout(function(){o.container.scrollTop=0})})}(this,n,e)},update:function(e){var t=Y(),n=xt.innerParams.get(this);if(!t||R(t,n.hideClass.popup))return N("You're trying to update the closed or closing popup, that won't work. Use the update() method in preConfirm parameter or show a new popup.");var o={};Object.keys(e).forEach(function(t){nn.isUpdatableParameter(t)?o[t]=e[t]:N('Invalid parameter to update: "'.concat(t,'". Updatable params are listed here: https://github.com/sweetalert2/sweetalert2/blob/master/src/utils/params.js'))});var i=s({},n,o);jt(this,i),xt.innerParams.set(this,i),Object.defineProperties(this,{params:{value:s({},this.params,e),writable:!1,enumerable:!0}})},_destroy:function(){var t=xt.domCache.get(this),e=xt.innerParams.get(this);e&&(t.popup&&Zt.swalCloseEventFinishedCallback&&(Zt.swalCloseEventFinishedCallback(),delete Zt.swalCloseEventFinishedCallback),Zt.deferDisposalTimer&&(clearTimeout(Zt.deferDisposalTimer),delete Zt.deferDisposalTimer),"function"==typeof e.onDestroy&&e.onDestroy(),delete this.params,delete Zt.keydownHandler,delete Zt.keydownTarget,Ge(xt),Ge(ae))}});function en(){if("undefined"!=typeof window){"undefined"==typeof Promise&&v("This package requires a Promise library, please include a shim to enable it in this browser (See: https://github.com/sweetalert2/sweetalert2/wiki/Migration-from-SweetAlert-to-SweetAlert2#1-ie-support)"),Xe=this;for(var t=arguments.length,e=new Array(t),n=0;n<t;n++)e[n]=arguments[n];var o=Object.freeze(this.constructor.argsToParams(e));Object.defineProperties(this,{params:{value:o,writable:!1,enumerable:!0,configurable:!0}});var i=this._main(this.params);xt.promise.set(this,i)}}en.prototype.then=function(t){return xt.promise.get(this).then(t)},en.prototype.finally=function(t){return xt.promise.get(this).finally(t)},s(en.prototype,tn),s(en,Gt),Object.keys(tn).forEach(function(t){en[t]=function(){if(Xe)return Xe[t].apply(Xe,arguments)}}),en.DismissReason=F,en.version="9.10.12";var nn=en;return nn.default=nn}),void 0!==this&&this.Sweetalert2&&(this.swal=this.sweetAlert=this.Swal=this.SweetAlert=this.Sweetalert2);
"undefined"!=typeof document&&function(e,t){var n=e.createElement("style");if(e.getElementsByTagName("head")[0].appendChild(n),n.styleSheet)n.styleSheet.disabled||(n.styleSheet.cssText=t);else try{n.innerHTML=t}catch(e){n.innerText=t}}(document,".swal2-popup.swal2-toast{flex-direction:row;align-items:center;width:auto;padding:.625em;overflow-y:hidden;background:#fff;box-shadow:0 0 .625em #d9d9d9}.swal2-popup.swal2-toast .swal2-header{flex-direction:row}.swal2-popup.swal2-toast .swal2-title{flex-grow:1;justify-content:flex-start;margin:0 .6em;font-size:1em}.swal2-popup.swal2-toast .swal2-footer{margin:.5em 0 0;padding:.5em 0 0;font-size:.8em}.swal2-popup.swal2-toast .swal2-close{position:static;width:.8em;height:.8em;line-height:.8}.swal2-popup.swal2-toast .swal2-content{justify-content:flex-start;font-size:1em}.swal2-popup.swal2-toast .swal2-icon{width:2em;min-width:2em;height:2em;margin:0}.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:1.8em;font-weight:700}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-popup.swal2-toast .swal2-icon .swal2-icon-content{font-size:.25em}}.swal2-popup.swal2-toast .swal2-icon.swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line]{top:.875em;width:1.375em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:.3125em}.swal2-popup.swal2-toast .swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:.3125em}.swal2-popup.swal2-toast .swal2-actions{flex-basis:auto!important;width:auto;height:auto;margin:0 .3125em}.swal2-popup.swal2-toast .swal2-styled{margin:0 .3125em;padding:.3125em .625em;font-size:1em}.swal2-popup.swal2-toast .swal2-styled:focus{box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(50,100,150,.4)}.swal2-popup.swal2-toast .swal2-success{border-color:#a5dc86}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line]{position:absolute;width:1.6em;height:3em;transform:rotate(45deg);border-radius:50%}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.8em;left:-.5em;transform:rotate(-45deg);transform-origin:2em 2em;border-radius:4em 0 0 4em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.25em;left:.9375em;transform-origin:0 1.5em;border-radius:0 4em 4em 0}.swal2-popup.swal2-toast .swal2-success .swal2-success-ring{width:2em;height:2em}.swal2-popup.swal2-toast .swal2-success .swal2-success-fix{top:0;left:.4375em;width:.4375em;height:2.6875em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line]{height:.3125em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=tip]{top:1.125em;left:.1875em;width:.75em}.swal2-popup.swal2-toast .swal2-success [class^=swal2-success-line][class$=long]{top:.9375em;right:.1875em;width:1.375em}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-toast-animate-success-line-tip .75s;animation:swal2-toast-animate-success-line-tip .75s}.swal2-popup.swal2-toast .swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-toast-animate-success-line-long .75s;animation:swal2-toast-animate-success-line-long .75s}.swal2-popup.swal2-toast.swal2-show{-webkit-animation:swal2-toast-show .5s;animation:swal2-toast-show .5s}.swal2-popup.swal2-toast.swal2-hide{-webkit-animation:swal2-toast-hide .1s forwards;animation:swal2-toast-hide .1s forwards}.swal2-container{display:flex;position:fixed;z-index:1060;top:0;right:0;bottom:0;left:0;flex-direction:row;align-items:center;justify-content:center;padding:.625em;overflow-x:hidden;transition:background-color .1s;-webkit-overflow-scrolling:touch}.swal2-container.swal2-backdrop-show,.swal2-container.swal2-noanimation{background:rgba(0,0,0,.4)}.swal2-container.swal2-backdrop-hide{background:0 0!important}.swal2-container.swal2-top{align-items:flex-start}.swal2-container.swal2-top-left,.swal2-container.swal2-top-start{align-items:flex-start;justify-content:flex-start}.swal2-container.swal2-top-end,.swal2-container.swal2-top-right{align-items:flex-start;justify-content:flex-end}.swal2-container.swal2-center{align-items:center}.swal2-container.swal2-center-left,.swal2-container.swal2-center-start{align-items:center;justify-content:flex-start}.swal2-container.swal2-center-end,.swal2-container.swal2-center-right{align-items:center;justify-content:flex-end}.swal2-container.swal2-bottom{align-items:flex-end}.swal2-container.swal2-bottom-left,.swal2-container.swal2-bottom-start{align-items:flex-end;justify-content:flex-start}.swal2-container.swal2-bottom-end,.swal2-container.swal2-bottom-right{align-items:flex-end;justify-content:flex-end}.swal2-container.swal2-bottom-end>:first-child,.swal2-container.swal2-bottom-left>:first-child,.swal2-container.swal2-bottom-right>:first-child,.swal2-container.swal2-bottom-start>:first-child,.swal2-container.swal2-bottom>:first-child{margin-top:auto}.swal2-container.swal2-grow-fullscreen>.swal2-modal{display:flex!important;flex:1;align-self:stretch;justify-content:center}.swal2-container.swal2-grow-row>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-grow-column{flex:1;flex-direction:column}.swal2-container.swal2-grow-column.swal2-bottom,.swal2-container.swal2-grow-column.swal2-center,.swal2-container.swal2-grow-column.swal2-top{align-items:center}.swal2-container.swal2-grow-column.swal2-bottom-left,.swal2-container.swal2-grow-column.swal2-bottom-start,.swal2-container.swal2-grow-column.swal2-center-left,.swal2-container.swal2-grow-column.swal2-center-start,.swal2-container.swal2-grow-column.swal2-top-left,.swal2-container.swal2-grow-column.swal2-top-start{align-items:flex-start}.swal2-container.swal2-grow-column.swal2-bottom-end,.swal2-container.swal2-grow-column.swal2-bottom-right,.swal2-container.swal2-grow-column.swal2-center-end,.swal2-container.swal2-grow-column.swal2-center-right,.swal2-container.swal2-grow-column.swal2-top-end,.swal2-container.swal2-grow-column.swal2-top-right{align-items:flex-end}.swal2-container.swal2-grow-column>.swal2-modal{display:flex!important;flex:1;align-content:center;justify-content:center}.swal2-container.swal2-no-transition{transition:none!important}.swal2-container:not(.swal2-top):not(.swal2-top-start):not(.swal2-top-end):not(.swal2-top-left):not(.swal2-top-right):not(.swal2-center-start):not(.swal2-center-end):not(.swal2-center-left):not(.swal2-center-right):not(.swal2-bottom):not(.swal2-bottom-start):not(.swal2-bottom-end):not(.swal2-bottom-left):not(.swal2-bottom-right):not(.swal2-grow-fullscreen)>.swal2-modal{margin:auto}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-container .swal2-modal{margin:0!important}}.swal2-popup{display:none;position:relative;box-sizing:border-box;flex-direction:column;justify-content:center;width:32em;max-width:100%;padding:1.25em;border:none;border-radius:.3125em;background:#fff;font-family:inherit;font-size:1rem}.swal2-popup:focus{outline:0}.swal2-popup.swal2-loading{overflow-y:hidden}.swal2-header{display:flex;flex-direction:column;align-items:center}.swal2-title{position:relative;max-width:100%;margin:0 0 .4em;padding:0;color:#595959;font-size:1.875em;font-weight:600;text-align:center;text-transform:none;word-wrap:break-word}.swal2-actions{display:flex;z-index:1;flex-wrap:wrap;align-items:center;justify-content:center;width:100%;margin:1.25em auto 0}.swal2-actions:not(.swal2-loading) .swal2-styled[disabled]{opacity:.4}.swal2-actions:not(.swal2-loading) .swal2-styled:hover{background-image:linear-gradient(rgba(0,0,0,.1),rgba(0,0,0,.1))}.swal2-actions:not(.swal2-loading) .swal2-styled:active{background-image:linear-gradient(rgba(0,0,0,.2),rgba(0,0,0,.2))}.swal2-actions.swal2-loading .swal2-styled.swal2-confirm{box-sizing:border-box;width:2.5em;height:2.5em;margin:.46875em;padding:0;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border:.25em solid transparent;border-radius:100%;border-color:transparent;background-color:transparent!important;color:transparent!important;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-actions.swal2-loading .swal2-styled.swal2-cancel{margin-right:30px;margin-left:30px}.swal2-actions.swal2-loading :not(.swal2-styled).swal2-confirm::after{content:\"\";display:inline-block;width:15px;height:15px;margin-left:5px;-webkit-animation:swal2-rotate-loading 1.5s linear 0s infinite normal;animation:swal2-rotate-loading 1.5s linear 0s infinite normal;border:3px solid #999;border-radius:50%;border-right-color:transparent;box-shadow:1px 1px 1px #fff}.swal2-styled{margin:.3125em;padding:.625em 2em;box-shadow:none;font-weight:500}.swal2-styled:not([disabled]){cursor:pointer}.swal2-styled.swal2-confirm{border:0;border-radius:.25em;background:initial;background-color:#3085d6;color:#fff;font-size:1.0625em}.swal2-styled.swal2-cancel{border:0;border-radius:.25em;background:initial;background-color:#aaa;color:#fff;font-size:1.0625em}.swal2-styled:focus{outline:0;box-shadow:0 0 0 1px #fff,0 0 0 3px rgba(50,100,150,.4)}.swal2-styled::-moz-focus-inner{border:0}.swal2-footer{justify-content:center;margin:1.25em 0 0;padding:1em 0 0;border-top:1px solid #eee;color:#545454;font-size:1em}.swal2-timer-progress-bar-container{position:absolute;right:0;bottom:0;left:0;height:.25em;overflow:hidden;border-bottom-right-radius:.3125em;border-bottom-left-radius:.3125em}.swal2-timer-progress-bar{width:100%;height:.25em;background:rgba(0,0,0,.2)}.swal2-image{max-width:100%;margin:1.25em auto}.swal2-close{position:absolute;z-index:2;top:0;right:0;align-items:center;justify-content:center;width:1.2em;height:1.2em;padding:0;overflow:hidden;transition:color .1s ease-out;border:none;border-radius:0;background:0 0;color:#ccc;font-family:serif;font-size:2.5em;line-height:1.2;cursor:pointer}.swal2-close:hover{transform:none;background:0 0;color:#f27474}.swal2-close::-moz-focus-inner{border:0}.swal2-content{z-index:1;justify-content:center;margin:0;padding:0;color:#545454;font-size:1.125em;font-weight:400;line-height:normal;text-align:center;word-wrap:break-word}.swal2-checkbox,.swal2-file,.swal2-input,.swal2-radio,.swal2-select,.swal2-textarea{margin:1em auto}.swal2-file,.swal2-input,.swal2-textarea{box-sizing:border-box;width:100%;transition:border-color .3s,box-shadow .3s;border:1px solid #d9d9d9;border-radius:.1875em;background:inherit;box-shadow:inset 0 1px 1px rgba(0,0,0,.06);color:inherit;font-size:1.125em}.swal2-file.swal2-inputerror,.swal2-input.swal2-inputerror,.swal2-textarea.swal2-inputerror{border-color:#f27474!important;box-shadow:0 0 2px #f27474!important}.swal2-file:focus,.swal2-input:focus,.swal2-textarea:focus{border:1px solid #b4dbed;outline:0;box-shadow:0 0 3px #c4e6f5}.swal2-file::-webkit-input-placeholder,.swal2-input::-webkit-input-placeholder,.swal2-textarea::-webkit-input-placeholder{color:#ccc}.swal2-file::-moz-placeholder,.swal2-input::-moz-placeholder,.swal2-textarea::-moz-placeholder{color:#ccc}.swal2-file:-ms-input-placeholder,.swal2-input:-ms-input-placeholder,.swal2-textarea:-ms-input-placeholder{color:#ccc}.swal2-file::-ms-input-placeholder,.swal2-input::-ms-input-placeholder,.swal2-textarea::-ms-input-placeholder{color:#ccc}.swal2-file::placeholder,.swal2-input::placeholder,.swal2-textarea::placeholder{color:#ccc}.swal2-range{margin:1em auto;background:#fff}.swal2-range input{width:80%}.swal2-range output{width:20%;color:inherit;font-weight:600;text-align:center}.swal2-range input,.swal2-range output{height:2.625em;padding:0;font-size:1.125em;line-height:2.625em}.swal2-input{height:2.625em;padding:0 .75em}.swal2-input[type=number]{max-width:10em}.swal2-file{background:inherit;font-size:1.125em}.swal2-textarea{height:6.75em;padding:.75em}.swal2-select{min-width:50%;max-width:100%;padding:.375em .625em;background:inherit;color:inherit;font-size:1.125em}.swal2-checkbox,.swal2-radio{align-items:center;justify-content:center;background:#fff;color:inherit}.swal2-checkbox label,.swal2-radio label{margin:0 .6em;font-size:1.125em}.swal2-checkbox input,.swal2-radio input{margin:0 .4em}.swal2-validation-message{display:none;align-items:center;justify-content:center;padding:.625em;overflow:hidden;background:#f0f0f0;color:#666;font-size:1em;font-weight:300}.swal2-validation-message::before{content:\"!\";display:inline-block;width:1.5em;min-width:1.5em;height:1.5em;margin:0 .625em;border-radius:50%;background-color:#f27474;color:#fff;font-weight:600;line-height:1.5em;text-align:center}.swal2-icon{position:relative;box-sizing:content-box;justify-content:center;width:5em;height:5em;margin:1.25em auto 1.875em;border:.25em solid transparent;border-radius:50%;font-family:inherit;line-height:5em;cursor:default;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none}.swal2-icon .swal2-icon-content{display:flex;align-items:center;font-size:3.75em}.swal2-icon.swal2-error{border-color:#f27474;color:#f27474}.swal2-icon.swal2-error .swal2-x-mark{position:relative;flex-grow:1}.swal2-icon.swal2-error [class^=swal2-x-mark-line]{display:block;position:absolute;top:2.3125em;width:2.9375em;height:.3125em;border-radius:.125em;background-color:#f27474}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=left]{left:1.0625em;transform:rotate(45deg)}.swal2-icon.swal2-error [class^=swal2-x-mark-line][class$=right]{right:1em;transform:rotate(-45deg)}.swal2-icon.swal2-error.swal2-icon-show{-webkit-animation:swal2-animate-error-icon .5s;animation:swal2-animate-error-icon .5s}.swal2-icon.swal2-error.swal2-icon-show .swal2-x-mark{-webkit-animation:swal2-animate-error-x-mark .5s;animation:swal2-animate-error-x-mark .5s}.swal2-icon.swal2-warning{border-color:#facea8;color:#f8bb86}.swal2-icon.swal2-info{border-color:#9de0f6;color:#3fc3ee}.swal2-icon.swal2-question{border-color:#c9dae1;color:#87adbd}.swal2-icon.swal2-success{border-color:#a5dc86;color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-circular-line]{position:absolute;width:3.75em;height:7.5em;transform:rotate(45deg);border-radius:50%}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=left]{top:-.4375em;left:-2.0635em;transform:rotate(-45deg);transform-origin:3.75em 3.75em;border-radius:7.5em 0 0 7.5em}.swal2-icon.swal2-success [class^=swal2-success-circular-line][class$=right]{top:-.6875em;left:1.875em;transform:rotate(-45deg);transform-origin:0 3.75em;border-radius:0 7.5em 7.5em 0}.swal2-icon.swal2-success .swal2-success-ring{position:absolute;z-index:2;top:-.25em;left:-.25em;box-sizing:content-box;width:100%;height:100%;border:.25em solid rgba(165,220,134,.3);border-radius:50%}.swal2-icon.swal2-success .swal2-success-fix{position:absolute;z-index:1;top:.5em;left:1.625em;width:.4375em;height:5.625em;transform:rotate(-45deg)}.swal2-icon.swal2-success [class^=swal2-success-line]{display:block;position:absolute;z-index:2;height:.3125em;border-radius:.125em;background-color:#a5dc86}.swal2-icon.swal2-success [class^=swal2-success-line][class$=tip]{top:2.875em;left:.8125em;width:1.5625em;transform:rotate(45deg)}.swal2-icon.swal2-success [class^=swal2-success-line][class$=long]{top:2.375em;right:.5em;width:2.9375em;transform:rotate(-45deg)}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-tip{-webkit-animation:swal2-animate-success-line-tip .75s;animation:swal2-animate-success-line-tip .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-line-long{-webkit-animation:swal2-animate-success-line-long .75s;animation:swal2-animate-success-line-long .75s}.swal2-icon.swal2-success.swal2-icon-show .swal2-success-circular-line-right{-webkit-animation:swal2-rotate-success-circular-line 4.25s ease-in;animation:swal2-rotate-success-circular-line 4.25s ease-in}.swal2-progress-steps{align-items:center;margin:0 0 1.25em;padding:0;background:inherit;font-weight:600}.swal2-progress-steps li{display:inline-block;position:relative}.swal2-progress-steps .swal2-progress-step{z-index:20;width:2em;height:2em;border-radius:2em;background:#3085d6;color:#fff;line-height:2em;text-align:center}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step{background:#3085d6}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step{background:#add8e6;color:#fff}.swal2-progress-steps .swal2-progress-step.swal2-active-progress-step~.swal2-progress-step-line{background:#add8e6}.swal2-progress-steps .swal2-progress-step-line{z-index:10;width:2.5em;height:.4em;margin:0 -1px;background:#3085d6}[class^=swal2]{-webkit-tap-highlight-color:transparent}.swal2-show{-webkit-animation:swal2-show .3s;animation:swal2-show .3s}.swal2-hide{-webkit-animation:swal2-hide .15s forwards;animation:swal2-hide .15s forwards}.swal2-noanimation{transition:none}.swal2-scrollbar-measure{position:absolute;top:-9999px;width:50px;height:50px;overflow:scroll}.swal2-rtl .swal2-close{right:auto;left:0}.swal2-rtl .swal2-timer-progress-bar{right:0;left:auto}@supports (-ms-accelerator:true){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@media all and (-ms-high-contrast:none),(-ms-high-contrast:active){.swal2-range input{width:100%!important}.swal2-range output{display:none}}@-moz-document url-prefix(){.swal2-close:focus{outline:2px solid rgba(50,100,150,.4)}}@-webkit-keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@keyframes swal2-toast-show{0%{transform:translateY(-.625em) rotateZ(2deg)}33%{transform:translateY(0) rotateZ(-2deg)}66%{transform:translateY(.3125em) rotateZ(2deg)}100%{transform:translateY(0) rotateZ(0)}}@-webkit-keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@keyframes swal2-toast-hide{100%{transform:rotateZ(1deg);opacity:0}}@-webkit-keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@keyframes swal2-toast-animate-success-line-tip{0%{top:.5625em;left:.0625em;width:0}54%{top:.125em;left:.125em;width:0}70%{top:.625em;left:-.25em;width:1.625em}84%{top:1.0625em;left:.75em;width:.5em}100%{top:1.125em;left:.1875em;width:.75em}}@-webkit-keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@keyframes swal2-toast-animate-success-line-long{0%{top:1.625em;right:1.375em;width:0}65%{top:1.25em;right:.9375em;width:0}84%{top:.9375em;right:0;width:1.125em}100%{top:.9375em;right:.1875em;width:1.375em}}@-webkit-keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@keyframes swal2-show{0%{transform:scale(.7)}45%{transform:scale(1.05)}80%{transform:scale(.95)}100%{transform:scale(1)}}@-webkit-keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@keyframes swal2-hide{0%{transform:scale(1);opacity:1}100%{transform:scale(.5);opacity:0}}@-webkit-keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@keyframes swal2-animate-success-line-tip{0%{top:1.1875em;left:.0625em;width:0}54%{top:1.0625em;left:.125em;width:0}70%{top:2.1875em;left:-.375em;width:3.125em}84%{top:3em;left:1.3125em;width:1.0625em}100%{top:2.8125em;left:.8125em;width:1.5625em}}@-webkit-keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@keyframes swal2-animate-success-line-long{0%{top:3.375em;right:2.875em;width:0}65%{top:3.375em;right:2.875em;width:0}84%{top:2.1875em;right:0;width:3.4375em}100%{top:2.375em;right:.5em;width:2.9375em}}@-webkit-keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@keyframes swal2-rotate-success-circular-line{0%{transform:rotate(-45deg)}5%{transform:rotate(-45deg)}12%{transform:rotate(-405deg)}100%{transform:rotate(-405deg)}}@-webkit-keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@keyframes swal2-animate-error-x-mark{0%{margin-top:1.625em;transform:scale(.4);opacity:0}50%{margin-top:1.625em;transform:scale(.4);opacity:0}80%{margin-top:-.375em;transform:scale(1.15)}100%{margin-top:0;transform:scale(1);opacity:1}}@-webkit-keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@keyframes swal2-animate-error-icon{0%{transform:rotateX(100deg);opacity:0}100%{transform:rotateX(0);opacity:1}}@-webkit-keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}@keyframes swal2-rotate-loading{0%{transform:rotate(0)}100%{transform:rotate(360deg)}}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow:hidden}body.swal2-height-auto{height:auto!important}body.swal2-no-backdrop .swal2-container{top:auto;right:auto;bottom:auto;left:auto;max-width:calc(100% - .625em * 2);background-color:transparent!important}body.swal2-no-backdrop .swal2-container>.swal2-modal{box-shadow:0 0 10px rgba(0,0,0,.4)}body.swal2-no-backdrop .swal2-container.swal2-top{top:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-top-left,body.swal2-no-backdrop .swal2-container.swal2-top-start{top:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-top-end,body.swal2-no-backdrop .swal2-container.swal2-top-right{top:0;right:0}body.swal2-no-backdrop .swal2-container.swal2-center{top:50%;left:50%;transform:translate(-50%,-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-left,body.swal2-no-backdrop .swal2-container.swal2-center-start{top:50%;left:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-center-end,body.swal2-no-backdrop .swal2-container.swal2-center-right{top:50%;right:0;transform:translateY(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom{bottom:0;left:50%;transform:translateX(-50%)}body.swal2-no-backdrop .swal2-container.swal2-bottom-left,body.swal2-no-backdrop .swal2-container.swal2-bottom-start{bottom:0;left:0}body.swal2-no-backdrop .swal2-container.swal2-bottom-end,body.swal2-no-backdrop .swal2-container.swal2-bottom-right{right:0;bottom:0}@media print{body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown){overflow-y:scroll!important}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown)>[aria-hidden=true]{display:none}body.swal2-shown:not(.swal2-no-backdrop):not(.swal2-toast-shown) .swal2-container{position:static!important}}body.swal2-toast-shown .swal2-container{background-color:transparent}body.swal2-toast-shown .swal2-container.swal2-top{top:0;right:auto;bottom:auto;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-top-end,body.swal2-toast-shown .swal2-container.swal2-top-right{top:0;right:0;bottom:auto;left:auto}body.swal2-toast-shown .swal2-container.swal2-top-left,body.swal2-toast-shown .swal2-container.swal2-top-start{top:0;right:auto;bottom:auto;left:0}body.swal2-toast-shown .swal2-container.swal2-center-left,body.swal2-toast-shown .swal2-container.swal2-center-start{top:50%;right:auto;bottom:auto;left:0;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-center{top:50%;right:auto;bottom:auto;left:50%;transform:translate(-50%,-50%)}body.swal2-toast-shown .swal2-container.swal2-center-end,body.swal2-toast-shown .swal2-container.swal2-center-right{top:50%;right:0;bottom:auto;left:auto;transform:translateY(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-left,body.swal2-toast-shown .swal2-container.swal2-bottom-start{top:auto;right:auto;bottom:0;left:0}body.swal2-toast-shown .swal2-container.swal2-bottom{top:auto;right:auto;bottom:0;left:50%;transform:translateX(-50%)}body.swal2-toast-shown .swal2-container.swal2-bottom-end,body.swal2-toast-shown .swal2-container.swal2-bottom-right{top:auto;right:0;bottom:0;left:auto}body.swal2-toast-column .swal2-toast{flex-direction:column;align-items:stretch}body.swal2-toast-column .swal2-toast .swal2-actions{flex:1;align-self:stretch;height:2.2em;margin-top:.3125em}body.swal2-toast-column .swal2-toast .swal2-loading{justify-content:center}body.swal2-toast-column .swal2-toast .swal2-input{height:2em;margin:.3125em auto;font-size:1em}body.swal2-toast-column .swal2-toast .swal2-validation-message{font-size:1em}");
</script>



<?php if (!$iframe) { ?>
	<?php if (!$modal) { ?>
		<?php echo $footer; ?>
	<?php } ?>
<?php } ?>

<?php if ($iframe) { ?>
</body>
</html>
<?php } ?>
