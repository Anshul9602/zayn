<?php echo $header; ?>
<style>
   .cart_container{
   padding-top:150px;
   }
   @media screen and (max-width:650px) {
   .cart_container{
   padding-top:50px;
   }
   }
   .m-0{
   margin:0px;
   }
   .product_underline:last-child{
    display:none;
   }
   .table td, .table th{
      vertical-align:middle;
   }
</style>
<div style="width: 100%;" class="container cart_container">
   <style>
      .number {
      text-align: center;
      }
      .number span {
      width: 25px;
      height: 25px;
      padding-top: 2px;
      display: block;
      text-align: center;
      margin: auto;
      border-radius: 50%;
      background-color: #333;
      color: #fff
      }
      td h3 {
      font-size: 14px;
      text-transform: uppercase
      }
      h4{
         font-size:18px;
      }
      .size_list {
      list-style: none;
      float: left;
      margin-left: 0px;
      padding-left: 0px;
      margin-top: 20px
      }
      .size_list li {
      float: left;
      border: thin solid #ccc;
      width: 40px;
      height: 40px;
      padding-top: 10px;
      text-align: center
      }
      table tr td {
      letter-spacing: 1.5px !important
      }
      @media screen and (max-width:600px) {
      .size_list {
      list-style: none;
      float: left;
      margin-left: 0px;
      padding-left: 0px;
      margin-top: 5px
      }
      #desktop_table {
      display: none !important
      }
      }
      @media screen and (min-width:601px) {
      .size_list {
      list-style: none;
      float: left;
      margin-left: 0px;
      padding-left: 0px;
      margin-top: 20px
      }
      #mobile_table {
      display: none !important
      }
      }
      @media all and (device-width: 768px) and (device-height: 1024px) and (orientation:portrait) {
      #gck {
      margin-top: 40px;
      }
      }
      thead tr td p {
      letter-spacing: 3px;
      font-size: 11px;
      text-transform: uppercase
      }
      .overlay1 {
      width: 100%;
      height: 100vh;
      top: 0px;
      left: 0px;
      background-color: #000;
      z-index: 99999;
      opacity: 0.6;
      display: none;
      position: fixed;
      text-align: center
      }
      .confrim_pop {
      height: 230px;
      background: #fff;
      width: 400px;
      position: fixed;
      z-index: 999999;
      display: none;
      top: 50%;
      margin-top: -115px;
      left: 50%;
      margin-left: -200px;
      text-align: center;
      border-radius: 2px;
      box-shadow: 0 12px 20px -10px rgba(0, 0, 0, .28), 0 4px 20px 0 rgba(0, 0, 0, .12), 0 7px 8px -5px rgba(0, 0, 0, .2)
      }
      .confrim_pop .fa {
      color: #44213B;
      font-size: 44px
      }
      @media print {
      .no-print,
      .no-print * {
      display: none !important;
      }
      }
   </style>
   <div class="row">
      <div style=" margin-bottom: 80px; " id="content" class="col-sm-12">
         <?php echo $content_top; ?>
         <h3 style="text-align:center; letter-spacing:2px">SHOPPING CART</h3>
         <br />
         <div class="row">
            <div class="col-sm-12">
               <form style="margin-top: 20px" id="cf" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                  <div id="desktop_table" class="table-responsive">
                     <table class="table table-stripped">
                        <thead>
                           <tr>
                              <td class="text-center">
                                 <p>Image</p>
                              </td>
                              <td class="text-center">
                                 <p>Name</p>
                              </td>
                              <td class="text-center">
                                 <p><?php echo $column_quantity; ?></p>
                              </td>
                              <td class="text-center">
                                 <p>Price</p>
                              </td>
                              <td class="text-center">
                                 <p>Total</p>
                              </td>
                              <td class="text-center">
                                 <p>Remove</p>
                              </td>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $size_x = 1;
                              $is_cad = 0;
                              foreach ($products as $product) { ?>
                           <?php if (in_array($product['product_id'], $diamondProducts)) {
                              $x = "" ?>
                           <tr>
                              <td class="text-center">
                                 <?php if ($product['thumb']) { ?>
                                 <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                 <?php } ?>
                              </td>
                              <td class="text-center">
                                 <a href="<?php echo $product['href']; ?>">
                                    <h3 style="text-transform:uppercase "><?php echo $product['name']; ?></h3>
                                    <!-- <?php if (!$product['stock']) { ?>
                                       <span class="text-danger">*<i>(Out of stock)<br /></i></span>
                                       <?php } ?> -->
                                    <?php if ($product['option']) {
                                       ?>
                                    <?php foreach ($product['option'] as $option) {
                                       if ($option['name'] == "diamond by pieces") {
                                         $x = $option['value'];
                                         continue;
                                       }
                                       if (strtolower($option['value']) == "default") {
                                         continue;
                                       } ?>
                                    <span style="font-size:10px; color:#3c3c3c; margin-top:-10px; margin-left:-10px">
                                    <span style="text-transform:capitalize " class="product-option-name"><?php echo ucwords(str_replace('Choose ', '', str_replace('Upload ', '', $option['name']))); ?></span> :
                                    <span><?php echo $option['value']; ?></span></span> <br />
                                    <?php } ?>
                                    <?php } ?>
                                 </a>
                              </td>
                              <script>
                                 $('.product-option-name').each(function() {
                                   if ($(this).text() === 'Metal111') {
                                     if ($(this).next('span').text() === 'Platinum') {
                                       $(this).parent().next().next().remove();
                                       $(this).parent().next().remove();
                                     }
                                   }
                                 })
                              </script>
                              <td class="text-center">
                                 <div style="width:120px; margin:auto; margin-top:20px; " class="text-center">
                                    <?php if ($x == "") {
                                       $qty = substr($product['quantity'] / 10000, 0, strpos($product['quantity'] / 10000, ".") + 4);
                                       echo $qty;
                                       if (strpos($qty, ".") === false) {
                                         echo ".00";
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
                                 </div>
                              </td>
                              <td class="text-center">
                                 <h4 style="margin-top: 20px">$<?php echo (substr($product['price'], 1) * 10000); ?>/Carat
                                 </h4>
                              </td>
                              <td class="text-center">
                                 <h4 style="margin-top: 20px">
                                    $<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00
                                 </h4>
                              </td>
                              <td style="text-align:center; padding-right:30px">
                                 <button style="background-color: transparent; outline:none; margin:auto; margin-top:15px; text-align:center; margin-left:10px; border:none; box-shadow:none " type="button" data-product-id="<?php echo $product['product_id']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="btn remove-btn">
                                 <i style="color: #333" class="fa fa-times-circle"></i>
                                 </button>
                              </td>
                           </tr>
                           <?php } else { ?>
                           <tr>
                              <td class="text-center">
                                 <?php if ($product['thumb']) { ?>
                                 <a href="<?php echo $product['href']; ?>">
                                 <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                                 </a>
                                 <?php } ?>
                              </td>
                              <td class="text-center">
                                 <a href="<?php echo $product['href']; ?>">
                                    <h3 style="text-transform:uppercase "><?php echo $product['name']; ?></h3>
                                    <?php if (!$product['stock']) { ?>
                                    <span class="text-danger">*<i>(Out of stock)<br /></i></span>
                                    <?php } ?>
                                    <?php if ($product['option']) { ?>
                                    <?php foreach ($product['option'] as $option) {
                                       if (strtolower($option['value']) == "default") {
                                         continue;
                                       } ?>
                                    <span style="font-size:10px; color:#3c3c3c; margin-top:-10px; margin-left:-10px">
                                    <span style="text-transform:capitalize " class="product-option-name"><?php echo ucwords(str_replace('Choose ', '', str_replace('Upload ', '', $option['name']))); ?></span> :
                                    <span><?php echo $option['value']; ?></span></span> <br />
                                    <?php } ?>
                                    <?php } ?>
                                 </a>
                              </td>
                              <script>
                                 $('.product-option-name').each(function() {
                                   if ($(this).text() === 'Metal111') {
                                     if ($(this).next('span').text() === 'Platinum') {
                                       $(this).parent().next().next().remove();
                                       $(this).parent().next().remove();
                                     }
                                   }
                                 })
                              </script>
                              <td class="text-center">
                                 <div style="width:120px; margin:auto; margin-top:20px; " class="row">
                                    <div style="cursor: pointer; text-align:center; padding-left:0px; padding-right:0px; height:34px; border:thin solid #ccc" class="col-sm-4">
                                       <li style=" font-size:12px; margin:auto; text-align:center; margin-top:10px; width: 100%; height: 100%" class="fa fa-minus less_quantity"></li>
                                    </div>
                                    <div style=" padding-left:0px; padding-right:0px;" class="col-sm-4"><input style="box-shadow:none; height:34px; text-align:center; border-radius:0px; width:100%; cursor:default" class="input-quantity" readonly name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control" />
                                    </div>
                                    <div style=" cursor: pointer; padding-left:0px; padding-right:0px; height:34px; text-align:center; border:thin solid #ccc" class="col-sm-4 addqty">
                                       <li style="font-size:12px; text-align:center; margin-top:10px; width: 100%; height: 100%;" class="fa fa-plus add_quantity"></li>
                                    </div>
                                 </div>
                              </td>
                              <td class="text-center">
                                 <h4 style="margin-top: 20px"><?php echo substr($product['price'], 0, -2); ?>
                                 </h4>
                              </td>
                              <td class="text-center">
                                 <h4 style="margin-top: 20px">$<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00
                                 </h4>
                              </td>
                              <td style="text-align:center; padding-right:30px">
                                 <button style="background-color: transparent; outline:none; margin:auto; margin-top:15px;
                                    text-align:center; margin-left:10px; border:none; box-shadow:none " type="button" data-product-id="<?php echo $product['product_id']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="btn remove-btn">
                                 <i style="color: #333" class="fa fa-times-circle"></i>
                                 </button>
                              </td>
                           </tr>
                           <?php } ?>
                           <?php $size_x++;
                              } ?>
                           <?php foreach ($vouchers as $vouchers) { ?>
                           <tr>
                              <td></td>
                              <td class="text-center"><?php echo $vouchers['description']; ?></td>
                              <td class="text-center"></td>
                              <td class="text-center">
                                 <div class="input-group btn-block">
                                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span>
                                 </div>
                              </td>
                              <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                              <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                           </tr>
                           <?php } ?>
                        </tbody>
                     </table>
                  </div>
               </form>
               <form style="margin-top: 20px" id="cf1" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                  <div class="row no-print" style="margin:0px" id="mobile_table">
                     <div class="col-xs-12">
                        <?php $j = 0; ?>
                        <?php foreach ($products as $product) { ?>
                        <?php if (in_array($product['product_id'], $diamondProducts)) {
                           $x = "";  ?>
                        <div class="row m-0">
                           <div class="col-3">
                              <?php if ($product['thumb']) { ?>
                              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                              <?php } ?>
                           </div>
                           <div class="col-9">
                              <h4 style="text-transform:uppercase "><?php echo $product['name']; ?></h4>
                              <?php if (!$product['stock']) { ?>
                              <?php $j++; ?>
                              <!-- <span class="text-danger">*<i>(Out of stock) <br /></i>
                                 </span> -->
                              <?php } ?>
                              <?php if ($product['option']) {
                                 ?>
                              <?php foreach ($product['option'] as $option) {
                                 if ($option['name'] == "diamond by pieces") {
                                   $x = $option['value'];
                                   continue;
                                 } ?>
                              <p style=" color:#999; text-transform:capitalize">
                                 <?php echo $option['name']; ?> : <?php echo $option['value']; ?>
                              </p>
                              <?php } ?>
                              <?php } ?>
                              <p >
                                 Price: $ <?php echo (substr($product['price'], 1) * 10000); ?>/Carat
                              </p>
                              <p style="margin-top: -15px;">
                                 <button style="background-color: transparent; outline:none; margin:auto;  text-align:center; 
                                    border:none; box-shadow:none " type="button" class="btn" data-product-id="<?php echo $product['product_id']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="btn remove-btn">
                                 Remove
                                 </button>
                              </p>
                              <div class="row m-0 mt-20">
                                 <div class="col-xs-7">
                                    <div style="width:120px; margin:auto; margin-left:0px " class="row">
                                       <div class="col-xs-4">
                                          <?php if ($x == "") {
                                             $qty = substr($product['quantity'] / 10000, 0, strpos($product['quantity'] / 10000, ".") + 4);
                                             echo $qty;
                                             if (strpos($qty, ".") === false) {
                                               echo ".00";
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
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-xs-5">
                                    <h4 style="font-size:12px; margin-top:5px">Total : $<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00
                                    </h4>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <hr class="product_underline" />
                        <?php } else { ?>
                        <div class="row m-0">
                           <div class="col-3">
                              <?php if ($product['thumb']) { ?>
                              <a href="<?php echo $product['href']; ?>">
                              <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                              </a>
                              <?php } ?>
                           </div>
                           <div class="col-9">
                           <a href="<?php echo $product['href']; ?>">
                                 <h4 style="text-transform:uppercase "><?php echo $product['name']; ?></h4>
                                 <?php if (!$product['stock']) { ?>
                                 <?php $j++; ?>
                                 <span class="text-danger">*<i>(Out of stock) <br /></i>
                                 </span>
                                 <?php } ?>
                                 <?php if ($product['option']) { ?>
                                 <?php foreach ($product['option'] as $option) { ?>
                                 <p style=" color:#ccc; text-transform: capitalize">
                                    <?php echo $option['name']; ?> : <?php echo $option['value']; ?>
                                 </p>
                                 <?php } ?>
                                 <?php } ?>
                              </a>
                              <p >
                                 Price : <?php echo substr($product['price'], 0, -2); ?>
                              </p>
                              <p style="margin-top: -7px;">
                                 <button style="background-color: transparent; outline:none; margin:auto;  text-align:center; 
                                    border:none; box-shadow:none " type="button" class="btn" data-product-id="<?php echo $product['product_id']; ?>" data-cart-id="<?php echo $product['cart_id']; ?>" class="btn remove-btn">
                                 Remove
                                 </button>
                              </p>

                                <div style=" margin:auto; margin-top:20px; margin-left:0px " class="row">
                                    <div class="col-8">
                                      <div class="row">
                                      <div style="cursor: pointer; text-align:center; width:30px; padding-left:0px; padding-right:0px; height:34px; border:thin solid #ccc" class="col-xs-4">
                                       <li style=" font-size:12px; margin:auto; text-align:center; margin-top:10px;" class="fa fa-minus less_quantity1"></li>
                                    </div>
                                    <div style=" padding-left:0px; padding-right:0px;" class="col-xs-4">
                                       <input style="box-shadow:none; height:34px; text-align:center; border-radius:0px; width:60px; cursor:default" class="input-quantity1" readonly name="quantity[<?php echo $product['cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" class="form-control" />
                                    </div>
                                    <div style=" cursor: pointer; padding-left:0px; width:30px; padding-right:0px; height:34px; text-align:center; border:thin solid #ccc" class="col-xs-4">
                                       <li style="font-size:12px; text-align:center; margin-top:10px;" class="fa fa-plus add_quantity1"></li>
                                    </div>

                                      </div>
                                    </div>
                                    <div class="col-4">
                                      <h4 style="font-size:12px">Total : $<?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00
                                      </h4>
                                    </div>
                                   
                                 </div>
                                
                           </div>
                          
                        </div>
                        <hr class="product_underline" />
                        <?php } ?>
                        <?php } ?>
                     </div>
                  </div>
               </form>
               <hr />
               <div class="row">
                  <div class="col-md-6">
                     <div class="panel panel-default">
                        <div class="panel-heading">
                           <h4 class="panel-title mb-2"><a href="#collapse-coupon" class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" style="color:#000;">Use Coupon Code </a></h4>
                        </div>
                        <div id="collapse-coupon" class="panel-collapse  col-md-10 mb-3 p-0">
                           <div class="panel-body col-md-12">
                             
                              <div class="input-group row">
                                 <input type="text" name="coupon" value="" placeholder="Enter your coupon here" id="input-coupon" class="form-control col-md-8 col-8 " fdprocessedid="b9ezjk" style="line-height: 2.5;">
                                 <div class="input-group-btn col-md-4 col-4 p-0 spb">
                                    <input type="button" value="Apply Coupon" id="button-coupon" data-loading-text="Loading..." class="btn btn-primary btn-hero" fdprocessedid="uhals" style="    margin: 0;
    border-radius: 0;
    padding: 12px 20px;">
                                 </div>
                              </div>
                     
                     <script type="text/javascript">
                        
                     $('#button-coupon').on('click', function() {
                     $.ajax({
                     url: 'index.php?route=extension/total/coupon/coupon',
                     type: 'post',
                     data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
                     dataType: 'json',
                     beforeSend: function() {
                     $('#button-coupon').button('loading');
                     },
                     complete: function() {
                     $('#button-coupon').button('reset');
                     },
                     success: function(json) {
                     $('.alert-dismissible').remove();
                     
                     if (json['error']) {
                     $('.breadcrumb').after('<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                     
                     $('html, body').animate({ scrollTop: 0 }, 'slow');
                     }
                     
                     if (json['redirect']) {
                     location = json['redirect'];
                     }
                     },
                     error: function(xhr, ajaxOptions, thrownError) {
                     alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                     }
                     });
                     });
                     //--></script>
                           </div>
                        </div>
                     </div>
                     <br />
                  </div>
                  <div class="col-sm-1"></div>
                  <div class="col-sm-5">
                     <table style="width:100%" class="table">
                        <?php for ($i = 0; $i < sizeof($totals); $i++) { ?>
                        <?php if ($i == (sizeof($totals)) - 1) { ?>
                        <tr style="border:none">
                           <td style="border:none; text-transform:uppercase" class="text-center">
                              <strong><?php echo $totals[$i]['title']; ?>:</strong>
                           </td>
                           <td style="border:none; text-transform:uppercase" class="text-right">
                              $<?php echo number_format(ceil(str_replace(",", "", substr($totals[$i]['text'], 1)))); ?>.00
                           </td>
                        </tr>
                        <?php } else { ?>
                        <tr style="border:none">
                           <td style="border:none; text-transform:uppercase" class="text-center">
                              <strong><?php echo $totals[$i]['title']; ?>:</strong>
                           </td>
                           <td style="border:none; text-transform:uppercase" class="text-right">
                              $<?php echo number_format(ceil(str_replace(",", "", substr($totals[$i]['text'], 1)))); ?>.00
                           </td>
                        </tr>
                        <?php } ?>
                        <?php } ?>
                     </table>
                     <br />

                   

                     <div class="row">
                        <div class="col-sm-12">
                           <?php if (!$logged) { ?>
                           <div class="buttons clearfix">
                              <div class="pull-right">
                                 <a style="margin-bottom:30px" href="index.php?route=account/login"> <button class="btn btn-empty">Login</button></a>&nbsp;&nbsp;
                                 <a id="gck" class="thar-three" href="index.php?route=checkout/guest_new"> <a>Guest
                                 Checkout</a></a>
                              </div>
                           </div>
                           <?php } else { ?>
                           <div class="buttons clearfix">
                              <div class="pull-right">
                                 <?php $is_cad = 0; ?>
                                 <?php foreach ($products as $product) { ?>
                                 <?php if ($product['name'] == "CAD / CAM Service") { ?>
                                 <?php $is_cad = 1; ?>
                                 <?php }
                                    } ?>
                                 <?php if ($is_cad == 0 && 1 == 2) { ?>
                                 <a style="color: #fff;" href="index.php?route=account/quotation/add" class="btn btn-hero btn-quote">
                                 Generate Quotation</a>
                                 <?php }
                                    ?>
                                 <a style="color: #fff;" class="btn btn-hero btn-checkout">
                                 Checkout</a>
                              </div>
                           </div>
                           <?php } ?>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <form style="display:none" method="post" id="loginf">
               <input name="redirect" value="checkout/registered_payment">
            </form>
         </div>
         <?php echo $content_bottom; ?>
      </div>
      <?php echo $column_right; ?>
   </div>
</div>
<div class="overlay1"></div>
<div class="confrim_pop">
   <br>
   <li style="color:red" class="fa fa-check-circle-o"></li>
   <h3>Item/s are out of stock</h3>
   <br>
   <a href="index.php?route=information/contact"><button class="btn btn-hero">Contact Us</button></a>
   <a href="index.php?route=product/category&path=79">
   <button id="continue_shopping" class="btn btn-hero">Continue Shopping</button>
   </a>
</div>

<div class="hidden-for-retail-diamond" style="display: none"></div>

<script>
   var jxx = <?php echo $j; ?>;
   $(document).ready(function() {
   
     let diamonds = localStorage.getItem('diamondsTable');
     $(".hidden-for-retail-diamond").html(diamonds);
   
   })
   $('body').on('click', '.remove-btn', function() {
   
     let product_id_remove = $(this).attr('data-product-id');
     let cart_id = $(this).attr('data-cart-id');
   
     let diamonds = localStorage.getItem('diamondsTable');
     let it = parseInt($('tr[data-product-id="' + product_id_remove + '"]').find('.item-total').text());
   
     let st = parseInt($("#sub-total").text());
   
     $(".hidden-for-retail-diamond").html(diamonds);
     $('tr[data-product-id="' + product_id_remove + '"]').remove();
     $("#sub-total").text(st - it);
   
   
     localStorage.removeItem('diamondsTable');
     localStorage.setItem('diamondsTable', $('.hidden-for-retail-diamond').html());
   
     cart.remove(cart_id);
   })
   
   $("#continue_shopping").click(function() {
     $(".overlay1, .confrim_pop").fadeOut();
   
   })
   
   $(".overlay1").click(function() {
     $(".overlay1, .confrim_pop").fadeOut();
   })
   $(".btn-checkout").click(function() {
     if (jxx == 0) {
       window.location = "index.php?route=checkout/registered_payment";
     } else {
       $(".overlay1, .confrim_pop").fadeIn();
     }
   
   })
   $(".add_quantity").click(function() {
     var b = Number($(this).parent().siblings().find(".input-quantity").val()) + 1;
     $(this).parent().siblings().find(".input-quantity").val(b);
     $("#cf").submit();
   })
   
   $(".less_quantity").click(function() {
   
     var b = Number($(this).parent().siblings().find(".input-quantity").val()) - 1;
     if (b <= 0) {
       b = 1;
     }
     $(this).parent().siblings().find(".input-quantity").val(b);
     $("#cf").submit();
   })
   
   
   $(".add_quantity1").click(function() {
     var b = Number($(this).parent().siblings().find(".input-quantity1").val()) + 1;
     $(this).parent().siblings().find(".input-quantity1").val(b);
     $("#cf1").submit();
   })
   
   $(".less_quantity1").click(function() {
   
     var b = Number($(this).parent().siblings().find(".input-quantity1").val()) - 1;
     if (b <= 0) {
       b = 1;
     }
     $(this).parent().siblings().find(".input-quantity1").val(b);
     $("#cf1").submit();
   })
</script>

<?php echo $footer; ?>