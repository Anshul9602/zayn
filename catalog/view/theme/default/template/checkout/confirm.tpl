<?php if (!isset($redirect)) { ?>

  <style>
    @media screen and (max-width:650px) {

      #cssk table {
        display: inherit
      }
    }

    tr td,
    a,
    span {
      font-size: 14px;
    }
  </style>

  <div style="padding:20px 10px 20px 10px; overflow:auto" id="cssk" class="row">
    <table class="table" style="min-width:600px">
       <tr>
          <td colspan="2"><b>Product Detail</b></td>
          <td><b>Qty</b></td>
          <td><b>Price</b></td>
          <td style="text-align: right;"><b>Total</b></td>
        </tr>


        <?php foreach ($products as $product) { ?>
          <?php if (in_array($product['product_id'], $diamondProducts)) {
            $x = ""; ?>
            <tr>
              <td> <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
              </td>

              <td>
                <a style="color:#333; text-transform:uppercase " href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) {
                  if ($option['name'] == "diamond by pieces") {
                    $x = $option['value'];
                    continue;
                  }
                ?>
                  <br />
                  &nbsp;<small style="text-transform:capitalize "> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>
                <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                  <small><?php echo $product['recurring']; ?></small>
                <?php } ?>

              </td>
              <td style="">
                <br />
                <?php if ($x == "") {
                  $qty = substr($product['quantity'] / 10000, 0, strpos($product['quantity'] / 10000, ".") + 4);
                  echo $qty;
                  if (strpos($qty, ".") === false) {
                    echo ".000";
                  } else {
                    for ($zi = 0; $zi < 4 - (strlen($qty)) + strpos($qty, "."); $zi++) {
                      echo "0";
                    }
                  }
                  echo " Carats";
                } else {
                  echo ($x);
                  echo (" Pieces");
                } ?>
              </td>

              <td style="">
                <br />
                $ <?php echo (substr($product['price'], 1) * 10000); ?>/Carat

              </td>
              <td style="text-align:right">
                <br />
                $<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00

              </td>
            </tr>
          <?php } else { ?>
            <tr>
              <td width="120"> <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                <?php } ?>
              </td>

              <td>
                <a style="color:#333; text-transform:uppercase" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  &nbsp;<small style="text-transform:capitalize "> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>
                <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                  <small><?php echo $product['recurring']; ?></small>
                <?php } ?>

              </td>
              <td style="">
                <br />
                <?php echo $product['quantity']; ?>
              </td>

              <td style="">
                <br />
                <?php echo substr($product['price'], 0, -2); ?>

              </td>
              <td style="text-align:right">
                <br />
                $<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00

              </td>
            </tr>

          <?php } ?>

        <?php } ?>

        <?php foreach ($totals as $total) { ?>
          <tr>
            <td style="border:none" colspan="4" class="text-right span-break"><strong><?php echo $total['title']; ?></strong></td>
            <td style="border:none" class="text-right">$<?php echo number_format(ceil(str_replace(",", "", substr($total['text'], 1)))); ?>.00</td>
          </tr>
        <?php } ?>


     

    </table>
    <hr />
    <?php echo $payment; ?>

  </div>



<?php } else { ?>
  <script type="text/javascript">

    <!--
    location = '<?php echo $redirect; ?>';
    //
    -->
  </script>
<?php } ?>

<script>
  $(document).ready(function(){
    if ($(window).width() < 800) {
      $(".span-break").removeAttr('colspan');
      $(".span-break").removeClass('text-right');
    }
  })
</script>