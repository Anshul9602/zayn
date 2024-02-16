<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <title><?php echo $title; ?></title>
   </head>
   <body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
      <div style="width: 680px;">
         <a style="width:100%; text-align:center" href="<?php echo $store_url; ?>" title="<?php echo $store_name; ?>">
         <img src="https://www.zaynjewels.com/image/catalog/New%20Project%20(27).png" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; width:90px; margin:auto; border: none;" />
         </a>
         
         <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_greeting; ?></p>
         <?php if ($customer_id) { ?>
         <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_link; ?></p>
         <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $link; ?>"><?php echo $link; ?></a></p>
         <?php } ?>
         <?php if ($download) { ?>
         <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_download; ?></p>
         <p style="margin-top: 0px; margin-bottom: 20px;"><a href="<?php echo $download; ?>"><?php echo $download; ?></a></p>
         <?php } ?>
         <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
            <thead>
               <tr>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;" colspan="2"><?php echo $text_order_detail; ?></td>
               </tr>
            </thead>
            <tbody>
               <tr>
                   <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><b><?php echo $text_order_id; ?></b> <?php echo $order_id; ?><br />
                     <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?><br />
                     <b><?php echo $text_payment_method; ?></b> <?php echo $payment_method; ?><br />
                     <?php if ($shipping_method) { ?>
                     <b><?php echo $text_shipping_method; ?></b> <?php echo $shipping_method; ?>
                     <?php } ?>
                  </td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><b><?php echo $text_email; ?></b> <?php echo $email; ?><br />
                     <b><?php echo $text_telephone; ?></b> <?php echo $telephone; ?><br />
                     <b><?php echo $text_ip; ?></b> <?php echo $ip; ?><br />
                     <b><?php echo $text_order_status; ?></b> <?php echo $order_status; ?><br />
                  </td>
               </tr>
            </tbody>
         </table>
         <?php if ($comment) { ?>
         <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
            <thead>
               <tr>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_instruction; ?></td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $comment; ?></td>
               </tr>
            </tbody>
         </table>
         <?php } ?>
         <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
            <thead>
               <tr>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_payment_address; ?></td>
                  <?php if ($shipping_address) { ?>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_shipping_address; ?></td>
                  <?php } ?>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $payment_address; ?></td>
                  <?php if ($shipping_address) { ?>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $shipping_address; ?></td>
                  <?php } ?>
               </tr>
            </tbody>
         </table>
         <table style="border-collapse: collapse; width: 100%; border-top: 1px solid #DDDDDD; border-left: 1px solid #DDDDDD; margin-bottom: 20px;">
            <thead>
               <tr>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;">Image</td>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_product; ?></td>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_model; ?></td>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_quantity; ?></td>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_price; ?></td>
                  <td style="font-size: 12px; border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; background-color: #EFEFEF; font-weight: bold; text-align: center; padding: 7px; color: #222222;"><?php echo $text_total; ?></td>
               </tr>
            </thead>
            <tbody>
             
                <?php foreach ($products as $product) { ?>
                  <?php if (in_array($product['product_id'], $diamondProducts)) {
                           $x = "";  ?>
                    <tr>
                     <td style="border-bottom: 1px solid #DDDDDD;">
                     <img src="<?php echo $product['image']; ?>" width="80" class="img-responsive img-thumbnail" />
                     </td>
                    <td style="border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD;" class="text-center">
                      <a href="<?php echo $product['href']; ?>">
                        <?php echo $product['name']; ?>
                      </a>
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
                      <?php if ($option['type'] != 'file') { ?>
                        &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } else { ?>
                        &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                      <?php } ?>
                    <?php } ?>

                    </td>
                    <td style="border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD;" class="text-center"> - </td>
                    <td style="border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD;" class="text-center">
                    <?php if ($x == "") {
                            $qty = substr(
                                $product["quantity"] / 10000,
                                0,
                                strpos($product["quantity"] / 10000, ".") + 4
                            );
                            echo $qty;
                            if (strpos($qty, ".") === false) {
                                echo ".000";
                            } else {
                                for ($zi = 0; $zi < 4 - strlen($qty) + strpos($qty, "."); $zi++) {
                                    echo "0";
                                }
                            }
                            echo " Carats";
                        } else {
                            echo $x;
                            echo " Pieces";
                        } ?>
                    </td>
                    <td style="border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD;" class="text-center">$<?php echo (substr($product['price'], 1) * 10000); ?>/Carat</td>
                    <td style="border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD;" class="text-center">$<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00</td>
  
                  </tr>
               <?php } else { ?>
               <tr>
                  <td style="border-bottom: 1px solid #DDDDDD;">
                     <img src="<?php echo str_replace(' ','%20',$product['image']); ?>" width="80" class="img-responsive img-thumbnail" />
                  </td>
                     
                    <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;">
                     <font style="text-transform:uppercase"><?php echo $product['name']; ?></font>
                      <?php foreach ($product['option'] as $option) { ?>
                     <br />
                     &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                     <?php } ?>
                  </td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $product['model']; ?></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $product['quantity']; ?></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo substr($product['price'], 0, -2); ?></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;" class="text-center">$<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00
                     </h4>
                  </td>
               </tr>
               <?php }
                  } ?>
               <?php foreach ($vouchers as $voucher) { ?>
               <tr>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $voucher['description']; ?></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;">1</td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $voucher['amount']; ?></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;"><?php echo $voucher['amount']; ?></td>
               </tr>
               <?php } ?>
            </tbody>
            <tfoot>
               <?php foreach ($totals as $total) { ?>
               <tr>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;" colspan="5"><b><?php echo $total['title']; ?>:</b></td>
                  <td style="font-size: 12px;	border-right: 1px solid #DDDDDD; border-bottom: 1px solid #DDDDDD; text-align: center; padding: 7px;">$<?php echo number_format(ceil(str_replace(",", "", substr($total['text'], 1)))); ?>.00</td>
               </tr>
               <?php } ?>
            </tfoot>
         </table>
         <p style="margin-top: 0px; margin-bottom: 20px;"><?php echo $text_footer; ?></p>
      </div>
   </body>
</html>