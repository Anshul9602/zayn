<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">

<head>
  <meta charset="UTF-8" />
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
  <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
  <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
  <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>

<body>
  <div class="container">
    <?php foreach ($orders as $order) { ?>
      <div style="page-break-after: always;">
        <h1><?php echo $text_invoice; ?> #<?php echo $order['order_id']; ?></h1>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td colspan="2"><?php echo $text_order_detail; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style="width: 50%;">
                <address>
                  <strong><?php echo $order['store_name']; ?></strong><br />
                  <?php echo $order['store_address']; ?>
                </address>
                <b><?php echo $text_telephone; ?></b> <?php echo $order['store_telephone']; ?><br />
                <?php if ($order['store_fax']) { ?>
                  <b><?php echo $text_fax; ?></b> <?php echo $order['store_fax']; ?><br />
                <?php } ?>
                <b><?php echo $text_email; ?></b> <?php echo $order['store_email']; ?><br />
                <b><?php echo $text_website; ?></b> <a href="<?php echo $order['store_url']; ?>"><?php echo $order['store_url']; ?></a>
              </td>
              <td style="width: 50%;"><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
                <?php if ($order['invoice_no']) { ?>
                  <b><?php echo $text_invoice_no; ?></b> <?php echo $order['invoice_no']; ?><br />
                <?php } ?>
                <b><?php echo $text_order_id; ?></b> <?php echo $order['order_id']; ?><br />
                <b><?php echo $text_payment_method; ?></b> <?php echo $order['payment_method']; ?><br />
                <?php if ($order['shipping_method']) { ?>
                  <b><?php echo $text_shipping_method; ?></b> <?php echo $order['shipping_method']; ?><br />
                <?php } ?>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td style="width: 50%;"><b><?php echo $text_payment_address; ?></b></td>
              <td style="width: 50%;"><b><?php echo $text_shipping_address; ?></b></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <address>
                  <?php echo $order['payment_address']; ?>
                </address>
              </td>
              <td>
                <address>
                  <?php echo $order['shipping_address']; ?>
                </address>
              </td>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td><b><?php echo $column_product; ?></b></td>
              <td><b><?php echo $column_model; ?></b></td>
              <td class="text-right"><b><?php echo $column_quantity; ?></b></td>
              <td class="text-right"><b><?php echo $column_price; ?></b></td>
              <td class="text-right"><b><?php echo $column_total; ?></b></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($order['product'] as $product) {

              if (in_array($product['product_id'], $diamondProducts)) {
                $x = "";

            ?>
                <tr>
                  <td><?php echo $product['name']; ?>
                    <?php foreach ($product['option'] as $option) {

                      if ($option['name'] == "diamond by pieces") {
                        $x = $option['value'];
                        continue;
                      }
                      if (strtolower($option['value']) == "default") {
                        continue;
                      }

                    ?>
                      <br />
                      &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <?php } ?>
                  </td>
                  <td><?php echo $product['name']; ?></td>
                  <td class="text-right"><?php if ($x == "") {
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
                                          } ?></td>
                  <td class="text-right">$<?php echo (substr($product['price'], 1) * 10000); ?>/Carat</td>
                  <td class="text-right">$<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00</td>
                </tr>
              <?php } else { ?>
                <tr>
                  <td><?php echo $product['name']; ?>
                    <?php foreach ($product['option'] as $option) { ?>
                      <br />
                      &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                    <?php } ?>
                  </td>
                  <td><?php echo $product['model']; ?></td>
                  <td class="text-right"><?php echo $product['quantity']; ?></td>
                  <td class="text-right"><?php echo substr($product['price'], 0, -2); ?></td>
                  <td class="text-right">$<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00</td>
                </tr>
            <?php }
            } ?>
            <?php foreach ($order['voucher'] as $voucher) { ?>
              <tr>
                <td><?php echo $voucher['description']; ?></td>
                <td></td>
                <td class="text-right">1</td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
            <?php } ?>
            <?php foreach ($order['total'] as $total) { ?>
              <tr>
                <td class="text-right" colspan="4"><b><?php echo $total['title']; ?></b></td>
                <td class="text-right">$<?php echo number_format(ceil(str_replace(",", "", substr($total['text'], 1)))); ?>.00</td>
              </tr>
            <?php } ?>
          </tbody>
        </table>
        <?php if ($order['comment']) { ?>
          <table class="table table-bordered">
            <thead>
              <tr>
                <td><b><?php echo $text_comment; ?></b></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><?php echo $order['comment']; ?></td>
              </tr>
            </tbody>
          </table>
        <?php } ?>
      </div>
    <?php } ?>
  </div>
</body>

</html>