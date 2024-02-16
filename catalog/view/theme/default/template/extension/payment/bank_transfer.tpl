<div style="display:none" class="well well-sm">
    <p><?php echo $bank; ?></p>
	<p><?php echo $text_payment; ?></p>
</div>
<div style="float: right; width: 100%;" class="buttons">
	<div style="float: right;" class="pull-right">
		<button style="float: right;" type="button" id="button-confirm" class="btn btn-hero" data-loading-text="<?php echo $text_loading; ?>">
			<?php echo $button_confirm; ?>
		</button>
	</div>
</div>
<script type="text/javascript">
	<!--
	$('#button-confirm').on('click', function() {
		$.ajax({
			type: 'get',
			url: 'index.php?route=extension/payment/bank_transfer/confirm',
			cache: false,
			beforeSend: function() {
				$(".overlay1").fadeIn();
				$(".processing_order").fadeIn();
				$('#button-confirm').button('loading');
			},
			complete: function() {
				$('#button-confirm').button('reset');
			},
			success: function() {
				$(".overlay1").fadeOut();
				$(".processing_order").fadeOut();
				$(".processed_order").fadeIn();
				location = '<?php echo $continue; ?>';
			}
		});
	});
	//
	-->
</script>