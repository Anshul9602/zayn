<?php echo $header; ?>



<div style="padding-top:140px" class="container"><br /><br /><br />
  <div class="row">
    <div style="text-align:center" id="content" class="col-sm-8 offset-sm-2">
      <h1 style="font-family:raleway; letter-spacing:1.6px">Your order has been placed</h1>
      <p style="font-family:didot; font-size: 22px; letter-spacing:1.2px"><i>Thank you for choosing us
          and supporting our artisans!</i></p>
      <div class="buttons">
        <a href="<?php echo $continue; ?>" class="btn btn-hero"><?php echo $button_continue; ?></a>
      </div>
      <br /><br /><br />
    </div>
  </div>
</div>
<script>
 localStorage.removeItem('diamondsTable');
</script>



<?php echo $footer; ?>