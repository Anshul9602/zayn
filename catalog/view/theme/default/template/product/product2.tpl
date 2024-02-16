<?php echo $header; ?>
<style>
   .p-10{
   padding:10px;
   }
   .similar-product-caption{
      font-size:16px;
      position: absolute;
      top:390px;
      margin-left:10px;
   }
</style>

<link href="catalog/view/theme/default/stylesheet/product.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/javascript/jquery.zoom.js"></script>
<link href="catalog/view/theme/default/stylesheet/magnify.css" rel="stylesheet" type="text/css">


<!-- breadcrumb area start -->
<div style="background:#f1f1f1;" class="breadcrumb-area">
   <div class="container">
      <div class="row">
         <div class="col-12">
            <div class="breadcrumb-wrap">
               <nav aria-label="breadcrumb">
                  <ul class="breadcrumb">
                     <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                     <li class="breadcrumb-item">
                        <a href="<?php echo $breadcrumb['href']; ?>">
                        <?php echo $breadcrumb['text']; ?>
                        </a>
                     </li>
                     <?php
                        } ?>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- breadcrumb area end -->
<div class="overlay1"></div>
<div class="confrim_pop">
   <br>
   <li style="color:#423c9e" class="fa fa-check-circle-o"></li>
   <h3>Item added to cart</h3>
   <br>
   <a href="index.php?route=checkout/cart"><button class="btn btn-hero">Checkout</button></a>
   <button id="continue_shopping" class="btn btn-hero">Continue Shopping</button>
</div>
<div style=" margin-top:30px" class="container">
   <div class="row">
      <div class="col-sm-12">
         <div style="margin-bottom: 100px;" class="row">
            <div style="padding:0px; max-width:200px; text-align:left" class="col-sm-2 desktop_slider">
               <ul class="slider slider-nav ">
               <?php array_pop($images);?> 
               <?php if ($thumb) { ?>
                  <li style="outline:none">
                  <img style="margin: auto -5px; " class="img-responsive nav-list-li"
                     src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                     alt="<?php echo $heading_title; ?>" />
                  </li>
                  <?php
                     } ?>
                  <?php if ($images) { ?>
                    
                  <?php foreach ($images as $image) { ?>
                  <li style="margin-top:20px; outline:none">
                  <img class="img-responsive nav-list-li"
                     style="margin: auto -5px" src="<?php echo $image['thumb']; ?>"
                     title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                  <?php
                     } ?>
                  <?php
                     } ?>
               </ul>
            </div>
            <div style="padding:0px" class="col-sm-5 desktop_slider">
               <?php if ($thumb || $images) { ?>
               <div id="s_wrap">
                  <ul class="slider slider-for">
                     <?php if ($thumb) { ?>
                     <li class="zoom">
                        <img 
                        class="img-responsive" 
                        style="margin: auto; max-width:400px; border:thin solid #ccc" 
                        src="<?php echo $thumb; ?>"
                        title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                     </li>
                     <?php
                        } ?>
                     <?php if ($images) { ?>
                        
                     <?php foreach ($images as $image) { ?>
                     <li class="zoom">
                        <img 
                        class="img-responsive" 
                        style="margin: auto; max-width:400px; border:thin solid #ccc"
                        src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"
                        alt="<?php echo $heading_title; ?>" />
                     </li>
                     <?php
                        } ?>
                     <?php
                        } ?>
                  </ul>
               </div>
               <?php
                  } ?>
            </div>
            <div class="col-xs-12 slider-mob-box" style="max-width:100%; overflow-x:hidden">
               <div>
                  <ul class="slider-mob" style="z-index:99999">
                     <?php if ($thumb) { ?>
                     <li><img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                        alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                        } ?>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
                     <li><img class="img-responsive" style="margin: auto;" src="<?php echo $image['popup']; ?>"
                        title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                        } ?>
                     <?php
                        } ?>
                  </ul>
               </div>
            </div>
            <div style=" text-align:left" id="product" class="col-xs-12 col-sm-5">
               <h3 style="text-transform: capitalize; color:#000; font-size:28px; margin-top:25px">
                 <?php echo $carat;?> Carat, <?php echo $shape;?> Diamond, <?php echo $color;?>, <?php echo $clarity;?> GIA Certified
               </h3>
               <?php if ($review_status) { ?>
               <div class="rating">
                  <p>
                     <?php for ($i = 1; $i <= 5; $i++) { ?>
                     <?php if ($rating < $i) { ?>
                     <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                     <?php
                        } else { ?>
                     <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i
                        class="fa fa-star-o fa-stack-1x"></i></span>
                     <?php
                        } ?>
                     <?php
                        } ?>
                     <a href="" class="writeme d-sm-none"
                        onclick="$('a[href=\'#tab-review-mob\']').trigger('click'); return false;">
                     <?php echo $reviews; ?>
                     </a>
                     / <a href="" class="writeme d-sm-none"
                        onclick="$('a[href=\'#tab-review-mob\']').trigger('click'); return false;">
                     <?php echo $text_write; ?>
                     </a>
                     <a href="" class="writeme d-none d-sm-inline"
                        onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">
                     <?php echo $reviews; ?>
                     </a>
                     / <a href="" class="writeme d-none d-sm-inline"
                        onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">
                     <?php echo $text_write; ?>
                     </a>
                  </p>
                  <?php if (!$cad) { ?>
                  <hr>
                  <!-- AddThis Button BEGIN -->
                  <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a
                     class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a
                     class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a
                     class="addthis_counter addthis_pill_style"></a></div>
                  <script type="text/javascript"
                     src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                  <!-- AddThis Button END -->
                  <?php
                     } ?>
               </div>
               <?php
                  } ?>
               <h3 id="p_pr" style="  color:#a38129; font-size:22px;">
                  <?php echo preg_replace('~\.0+$~', '', $price); ?>
               </h3>
              
               <div style="margin-top:20px; display:none" class="row">
                  <div style="text-align: left; padding-left: 0px; width:120px">
                     <p style="color:#000; font-size:16px">Quantity &nbsp;&nbsp;&nbsp;&nbsp;</p>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-4">
                        <span class="minus-btn" id="less_quantity"
                           style="height: 40px; text-align: center; padding:7px 10px; border:thin solid #333; cursor: pointer">
                           <input style="margin: 0px; padding: 2.5px;" type="hidden" name="product_id"
                              value="<?php echo $product_id; ?>" />
                           <li style="color: #333; font-size: 12px" class="fa fa-minus"></li>
                        </span>
                     </div>
                     <div style="text-align: center; padding: 0px" class="col-sm-4 col-xs-2">
                        <input
                           style="text-align: center; border-radius:0px; color:#000; width: auto; height: auto; box-shadow:none; border: none; background-color: transparent; padding: 0px"
                           type="text" readonly name="quantity" value="1" size="2" id="input-quantity"
                           class="form-control" />
                     </div>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-6">
                        <span class="pluse-btn" id="add_quantity"
                           style="height: 40px; text-align: center; padding: 7px 10px; border:thin solid #000; cursor: pointer">
                           <li style="font-size: 12px; color:#000" class="fa fa-plus"></li>
                        </span>
                     </div>
                  </div>
               </div>
               <?php if ($options) { ?>
               <hr>
               <?php foreach ($options as $option) { ?>
               <?php if ($option['type'] == 'file') { ?>
               <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label">
                  <?php echo $option['name']; ?>
                  </label>
                  <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
                     data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i
                     class="fa fa-upload"></i>
                  <?php echo $button_upload; ?>
                  </button>
                  <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value=""
                     id="input-option<?php echo $option['product_option_id']; ?>" />
               </div>
               <hr />
               <?php
                  } ?>
               <?php if ($option['type'] == 'select') { ?>
               <p style="display: none;">Metal Colors</p>
               <?php foreach ($option['product_option_value'] as $option_value) { ?>
               <div class="text-center" style="display: inline-block;">
                  <span style="background:url(<?php echo $option_value['image']; ?>)"
                     data-sign="<?php echo $option_value['price_prefix']; ?>"
                     data-money="<?php echo $option_value['price']; ?>"
                     data-image="<?php echo $option_value['option_image']; ?>"
                     data-val="<?php echo $option_value['product_option_value_id']; ?>" class="tab_options">
                  </span>
                  <p style="margin-top: 0px; font-size:12px">
                     <?php echo $option_value['name']; ?>
                  </p>
               </div>
               <?php
                  } ?>
               <div style="display: none;" style="width:200px;"
                  class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
                  <?php echo $option['name']; ?>
                  </label>
                  <select name="option[<?php echo $option['product_option_id']; ?>]"
                     id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                     <option value="">
                        <?php echo $text_select; ?>
                     </option>
                     <?php foreach ($option['product_option_value'] as $option_value) { ?>
                     <option data-sign="<?php echo $option_value['price_prefix']; ?>"
                        data-link="<?php echo $option_value['link']; ?>"
                        value="<?php echo $option_value['product_option_value_id']; ?>">
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (
                        <?php echo $option_value['price_prefix']; ?>
                        <?php echo $option_value['price']; ?>)
                        <?php
                           } ?>
                     </option>
                     <?php
                        } ?>
                  </select>
               </div>
               <hr style="margin-top: 30px;" />
               <?php
                  } ?>
               <?php if ($option['type'] == 'radio') { ?>
               <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label">
                  <?php echo $option['name']; ?>
                  </label>
                  <div id="input-option<?php echo $option['product_option_id']; ?>">
                     <?php foreach ($option['product_option_value'] as $option_value) { ?>
                     <div class="radio">
                        <label>
                        <input class="sizes" data-sign="<?php echo $option_value['price_prefix']; ?>"
                           data-price="<?php echo $option_value['price']; ?>" type="radio"
                           name="option[<?php echo $option['product_option_id']; ?>]"
                           value="<?php echo $option_value['product_option_value_id']; ?>" />
                        <?php if ($option_value['image']) { ?>
                        <img style="display: none;" src="<?php echo $option_value['image']; ?>"
                           alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                           class="img-thumbnail" />
                        <?php
                           } ?>
                        <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (
                        <?php echo $option_value['price_prefix']; ?>
                        <?php echo $option_value['price']; ?>)
                        <?php
                           } ?>
                        </label>
                     </div>
                     <?php
                        } ?>
                  </div>
               </div>
               <br />
               <hr />
               <?php
                  } ?>
               <?php if ($option['type'] == 'textarea') { ?>
               <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
                  <?php echo $option['name']; ?>
                  </label>
                  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5"
                     placeholder="<?php echo $option['name']; ?>"
                     id="input-option<?php echo $option['product_option_id']; ?>"
                     class="form-control"><?php echo $option['value']; ?></textarea>
               </div>
               <?php
                  } ?>
               <?php
                  } ?>
               <?php
                  } ?>
                      <p>This <b><?php echo $color;?></b> color, 
                      <b><?php echo $clarity;?></b> clarity, 
                      and <b><?php echo $cut;?></b> make (cut) 
                        certified loose diamond comes with a report from the GIA.</p>
                        <hr />
                        <span style="float:left; color:#423C9E">
                         <a style="color:#423C9E" target='_blank' href="<?php echo $certificate_link;?>">
                            <li class="fa fa-download"></li> &nbsp;Certificate: <?php echo $style_no; ?>
                          </a>
                        
                        </span>
                        <span style="float:right">
                         <b>Availability:</b> <font style='color:green'>In Stock</font> 
                        </span>
                        
                  <br />
               <?php if ($price) { ?>
               <div id="wishlist-msg">
               </div>
              <div style="padding:0px;" id="content" class="row">
                  <div style=" min-width:160px;" id="addb" class="col-sm-7">
                     <a id="button-cart" style="width: 100%;" class="btn btn-hero">ADD TO CART</a>
                     <!--<button type="button" data-toggle="tooltip"
                        title="<?php echo $button_wishlist; ?>"
                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>-->
                  </div>
                  <div class="col-sm-5">
                     <a class="btn btn-hero" onclick="wishlist.add(' <?php echo $product_id; ?> ');">
                        <li class="fa fa-heart"></li>
                     </a>
                  </div>
               </div>
               <?php
                  } else { ?>
               <div style="padding:0px;" class="row">
                  <div style=" min-width:160px;" id="addb" class="col-sm-10">
                     <a style="width: 100%;" id="login-redirect" class="btn btn-hero">LOGIN FOR
                     PRICE</a>
                  </div>
               </div>
               <?php
                  } ?>
          
            </div>
         </div>
      </div>
   </div>
</div>

<section>
   <div class="container">
      <div class="row">
         <div class="col-sm-12">
            <ul class="nav nav-tabs">
               <?php if ($attribute_groups) { ?>
               <li class="active" ><a href="#tab-specification" data-toggle="tab">
                  <?php echo $tab_attribute; ?>
                  </a>
               </li>
               <?php
                  } ?>
               <?php if ($review_status) { ?>
               <li><a href="#tab-review" data-toggle="tab">
                  <?php echo $tab_review; ?>
                  </a>
               </li>
               <?php
                  } ?>
            </ul>
            <div class="tab-content">
               <?php if ($attribute_groups) { ?>
               <div  class="tab-pane active" id="tab-specification">
              <br />
               <div class="row">
                  <div class="col-sm-6">
                     <table style="width:100%" class="table table-bordered table-striped">
                        <tr>
                           <td>Certificate Number</td>
                           <td> <?php echo $style_no; ?></td>
                        </tr>
                        <tr>
                           <td>Carat Weight</td>
                           <td> <?php echo $carat; ?></td>
                        </tr>
                        <tr>
                           <td> Cut</td>
                           <td><?php echo $cut; ?></td>
                        </tr>
                        <tr>
                           <td> Color</td>
                           <td><?php echo $color; ?></td>
                        </tr>
                        <tr>
                           <td> Clarity</td>
                           <td><?php echo $clarity; ?></td>
                        </tr>
                     </table>
                  </div>
                  <div class="col-sm-6">
                  <table class="table table-bordered table-striped">
                     <?php foreach ($attribute_groups as $attribute_group) { ?>
                     <tbody>
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                           <td>
                              <?php echo $attribute['name']; ?>
                           </td>
                           <td>
                              <?php echo $attribute['text']; ?>
                           </td>
                        </tr>
                        <?php
                           } ?>
                     </tbody>
                     <?php
                        } ?>
                  </table>

                  </div>
               </div>   
               <br />   
                  
                 
               
               </div>
               <?php
                  } ?>
               <?php if ($review_status) { ?>
               <div class="tab-pane" id="tab-review">
                  <form class="form-horizontal" id="form-review">
                     <div id="review"></div>
                     <?php if ($review_guest) { ?>
                     <div class="form-group required">
                        <div class="col-sm-12">
                           <label class="control-label" for="input-name">
                           <?php echo $entry_name; ?>
                           </label>
                           <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name"
                              class="form-control" />
                        </div>
                     </div>
                     <div class="form-group required">
                        <div class="col-sm-12">
                           <label class="control-label" for="input-review">
                           <?php echo $entry_review; ?>
                           </label>
                           <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                        </div>
                     </div>
                     <div class="form-group required">
                        <div class="col-sm-12">
                           <span class="star-cb-group star-rating star-5">
                           <label class="control-label">
                           <?php echo $entry_rating; ?>
                           </label>
                           <input type="radio" name="rating" value="1" /><i></i>
                           &nbsp;
                           <input type="radio" name="rating" value="2" /><i></i>
                           &nbsp;
                           <input type="radio" name="rating" value="3" /><i></i>
                           &nbsp;
                           <input type="radio" name="rating" value="4" /><i></i>
                           &nbsp;
                           <input type="radio" name="rating" value="5" /><i></i>
                           </span>
                        </div>
                     </div>
                     <?php echo $captcha; ?>
                     <div class="buttons clearfix">
                        <div class="text-center">
                           <button type="button" id="button-review"
                              data-loading-text="<?php echo $text_loading; ?>"
                              class="btn btn-hero">Submit</button>
                        </div>
                     </div>
                     <?php
                        } else { ?>
                     <?php echo $text_login; ?>
                     <?php
                        } ?>
                  </form>
               </div>
               <?php
                  } ?>
            </div>
         </div>
      </div>
   </div>
</section>

<section style="background: #F8F8F8;">
   <div class="container">
      <?php if ($products) { ?>
      <br />
      <div class="row">
         <div class="col-sm-12 text-center">
            <h2>Similar Certificate Diamonds</h2>
         </div>
      </div>
      <br />
      <div class="slicker">
         <?php $i = 0; ?>
         <?php foreach ($products as $product) { ?>
         <!-- product grid start -->
         <div class=" p-10">
               <a href="<?php print_r($product['href']); ?>">
               <img style="z-index:99999999" src="<?php print_r($product['thumb']); ?>" class="img-responsive">
               </a>
               <p class='similar-product-caption'> <?php print_r($product['name']); ?></p>
       
            </div>
          <!-- product grid end -->
         <?php
            } ?>
      </div>
      <br /><br />
      <?php
         } ?>
   </div>
</section>

<script>
   var pid = "<?php echo $product_id; ?>";
</script>
<script src="catalog/view/javascript/product.js?v1.1"></script>
<?php echo $footer; ?>