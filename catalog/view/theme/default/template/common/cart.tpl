<div id="cart" class="row cart_icon" style=" padding:0px;  width:380px; top: 30px; z-index:99999999; box-shadow:1px 1px 1px grey; position:absolute; right:10px;">
  <div id="product_mark">
    <?php if(sizeof($products)){?>
    <div style="background-color:#fff; padding:30px;  border: thick solid #a5a7da" class="col-sm-12">
   
        
       <div style="max-height:260px; overflow:auto; overflow-x:hidden">
      <?php foreach ($products as $product) { ?>
           <div style="border-bottom:thin solid #f1f1f1; padding-bottom:7.5px; padding-top: 7.5px" class="row product_row">
              <div style="text-align:right; padding-left:0px; padding-right:0px" class="col-sm-3">
                <?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img style="float:right" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                   <?php } ?> 
              </div>
          
              <div style="text-align:left" class="col-sm-6">
                <a style="font-size:13px; color:#333; text-transform:uppercase" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <br />
                <?php if ($product['option']) { ?>
                <?php foreach ($product['option'] as $option) { ?>
                <font style="text-transform:uppercase; font-size:12px"><?php echo $option['name']; ?></font> : <font><?php echo $option['value']; ?></font>
                <?php } ?>
                <?php } ?>
                <font>QTY : <?php echo $product['quantity']; ?></font><br />
              </div>
          
              <div style="text-align:right; padding-right:0px" class="col-sm-2">
                <font style="color:#333"><?php echo $product['total']; ?></font>
              </div>
            </div>     
        <?php } ?>
     </div>
      <div style=" padding-top: 20px; padding-bottom: 20px" class="row">
       
       <div style="text-align:left" class="col-sm-6">
       <h4>Total :</h4>
       </div> 
       
       <div class="col-sm-6" style="text-align:right">
      <?php foreach($totals as $total){?>
        <?php if(strtolower($total['title'])=="total"){?>
        
         <h4> <?php echo($total['text']);?></h4>
        
        <?php }?>
      <?php }?>
       </div>
        
        </div>
       
      <div style="text-align: center; padding-top: 10px;" class="row">
           <a style="text-align: center" href="<?php echo $cart; ?>"><button style="display:inherit;background-color:#a5a7da; width:70%; margin:auto" class="btn btn-primary">View Cart & Checkout</button></a>
 
  
       </div>
        
        
       
  </div>
  
 <?php } else{?>
 <div style="background-color:#fff; padding:30px; text-align:left;  border: thick solid #B1E0E3;" class="col-sm-12 cart_up">
 <h4 style="color:#ccc">Your shopping cart is empty</h4>
 
 </div>
 </div>
 <?php }?>
</div>



<div id="cart" class="btn-group btn-block row cart_icon" >
  
  <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <table class="table table-striped">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
            <?php } ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="text-center"></td>
          <td class="text-left"><?php echo $voucher['description']; ?></td>
          <td class="text-right">x&nbsp;1</td>
          <td class="text-right"><?php echo $voucher['amount']; ?></td>
          <td class="text-center text-danger"><button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
    </li>
    <li>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><a href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
      </div>
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>
</div>
