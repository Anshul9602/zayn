<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($payment_methods) { ?>
<p style="font-size: 14px;text-transform: uppercase;font-family: raleway;letter-spacing: 2px;" class="checkout_heading">
  Payment Mode</p>
<?php foreach ($payment_methods as $payment_method) { ?>

<style>
  input[type=radio]:checked {
    background-color: #44A0AF !important;
    border: thin solid #44A0AF !important;


  }
</style>

<div class="radio">
  <label>
    <?php if ($payment_method['code'] == $code || !$code) { ?>
    <?php $code = $payment_method['code']; ?>
    <input type="radio" class="" name="payment_method" value="<?php echo $payment_method['code']; ?>"
      checked="checked" />
    <?php } else { ?>
    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" />
    <?php } ?>
    <?php echo $payment_method['title']; ?>
    <?php if ($payment_method['terms']) { ?>
    (<?php echo $payment_method['terms']; ?>)
    <?php } ?>
  </label>
</div>
<?php } ?>
<?php } ?>
<?php if ($text_agree) { ?>
<div style="display:none" class="buttons">
  <div class="pull-right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } ?>
    &nbsp;
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
      data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary" />
  </div>
</div>
<?php } else { ?>
<div style="display:none" class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method"
      data-loading-text="<?php echo $text_loading; ?>" class="btn btn-hero" />
  </div>
</div>
<?php } ?>