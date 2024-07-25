<?php echo $header; ?>

<?php
$u = basename($_SERVER['REQUEST_URI']);
$cad = false;
if (strpos($u, 'cad-cam-services') !== false) {
    $cad = true;
}

if (isset($draft) && is_string($draft)) {
    $draft = json_decode($draft, true);
}

?>
<style>
   .btn-find-store {
      color: #423c9e;
      font-size: 15px;
      line-height: 1;
      padding: 14px 30px;
      display: inline-block;
      border-radius: 50px;
      border: thin solid #423c9e;
      margin-top: 38px;
   }

   @media (max-width:650px) {
      .font_mob {
         font-size: 20px !important;
      }

      .slick-prev {
         color: #423c9e !important;
      }

      .slick-next {
         color: #423c9e !important;
      }

      .new_font {
         font-size: 14px !important;
      }

      .addthis_toolbox {
         display: none;
      }

      .slick-dots {
         display: none !important;
      }

      .product_font {
         font-size: 24px !important;
      }
   }
</style>
<link href="catalog/view/theme/default/stylesheet/product.css" rel="stylesheet" type="text/css" />
<script src="catalog/view/javascript/jquery.zoom.js"></script>
<link href="catalog/view/theme/default/stylesheet/magnify.css" rel="stylesheet" type="text/css">

<?php if ($cad) { ?>
<img src="assets/cad/pb1.jpg" class="img-fluid">
<?php } ?>
<?php if (!$cad) { ?>
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


<div style="margin-top:10px;" class="container mt-md-4">
   <div class="row">
      <div class="col-sm-12">
         <div style="margin-bottom: 100px;" class="row">
            <div style="padding:0px; max-width:200px; text-align:left" class="col-sm-2 desktop_slider">
               <ul class="slider slider-nav ">
                  <?php if ($thumb) { ?>
                  <li style="outline:none"><img style="margin: auto -5px" class="img-responsive nav-list-li"
                        src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                        alt="<?php echo $heading_title; ?>" /></li>
                  <?php
                     } ?>
                  <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                  <li style="margin-top:20px; outline:none">
                     <img class="img-responsive nav-list-li" style="margin: auto -5px; "
                        src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>"
                        alt="<?php echo $heading_title; ?>" />
                  </li>
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
                     <li class="zoom"><img class="img-responsive" style="margin: auto; max-width:370px"
                           src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                           alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                           } ?>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
                     <li class="zoom"><img class="img-responsive" style="margin: auto; max-width:370px"
                           src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"
                           alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                              } ?>
                     <?php
                           } ?>
                  </ul>
               </div>
               <?php
                  } ?>
               <div style="width:145%; margin-left:-45%" class="row">

                  <div class="col-sm-12">
                     <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-description" data-toggle="tab">
                              <?php echo strip_tags($tab_description); ?>
                           </a></li>
                        <?php if ($attribute_groups) { ?>
                        <li><a href="#tab-specification" data-toggle="tab">
                              <?php echo $tab_attribute; ?>
                           </a></li>
                        <?php
                           } ?>
                        <?php if ($review_status) { ?>
                        <li><a href="#tab-review" data-toggle="tab">
                              <?php echo $tab_review; ?>
                           </a></li>
                        <?php
                           } ?>
                     </ul>
                     <div class="tab-content">
                        <div class="tab-pane active" id="tab-description">
                           <br />
                           <?php echo strip_tags($description); ?>
                        </div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification">
                           <table class="table table-bordered">
                              <?php foreach ($attribute_groups as $attribute_group) { ?>
                              <thead>
                                 <tr>
                                    <td colspan="2"><strong>
                                          <?php echo $attribute_group['name']; ?>
                                       </strong></td>
                                 </tr>
                              </thead>
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


               <?php if ($stock == 0) { ?>


               <div classs="container p-5 ">
                  <div class="row no-gutters">
                     <div class="col-lg-6 col-md-12 m-auto">
                        <div class="alert alert-danger fade show" role="alert">
                           <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                              <span aria-hidden="True">&times;</span>
                           </button>
                           <h4 class="alert-heading">Out Of Stock</h4>

                        </div>
                     </div>
                  </div>
               </div>
               <?php } ?>

               <h3 class="product_font" style="text-transform: capitalize; color:#000; font-size:28px; margin-top:25px">
                  <?php echo $heading_title; ?>

               </h3>
               <div class="row">
                  <div class="col-md-10">
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
                  </div>

                  <?php                 
                        $wishlist_items1_array = json_decode($wishlist_items1, true);
                                 
                                    $product_in_wishlist = 0;
                                    foreach ($wishlist_items1_array as $item) {
                                  
                                        if ($item['productid'] == $product_id) {
                                            $product_in_wishlist = 1;
                                            break;
                                        }
                                    }
                                  
                                    ?>
                  <div class="col-md-2">
                     <?php if ($product_in_wishlist) { ?>

                     <a style="float:right;  padding:12px;    margin-top: 10px;" class="btn btn-find-store "><i class="fa fa-heart"></i> </a>
                     <?php } else { ?>
                     <a style="float:right;  padding:12px;    margin-top: 10px;"
                        class="btn btn-find-store wishlist_link" btnid="<?php echo $product_id; ?>"
                        btnname="<?php echo $heading_title; ?>" btnimg="<?php echo $thumb; ?>"
                        btnhref="<?php echo $href1; ?>"
                        btnstyle="<?php echo $style_no; ?>"
                        btndesign="<?php echo $design_no; ?>"
                        btnsize="<?php echo $metal_purity; ?>"
                         btnprice="<?php echo $wish_price; ?>"
                         
                        btnsprice="<?php echo $wish_special; ?>">

                        <i class="fa fa-heart-o"></i>

                     </a>
                     <?php } ?>

                  </div>

               </div>
               <hr style="    margin-top: 0px;">
               <h3 id="p_pr" style="  color:#a38129; font-size:22px;">
                  <?php echo preg_replace('~\.0+$~', '', $price); ?>
               </h3>
               <?php if (!$cad) { ?>
               <p style="line-height:36px">
                  Style No : <i>
                     <?php echo $style_no; ?>
                  </i>
                  <br />
                  Design No : <i>
                     <?php echo $design_no; ?>
                  </i>
                  <br />
                  Metal Purity: <i>
                     <?php echo $metal_purity; ?>
                  </i>
               </p>
               <?php
                  } ?>

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
                     data-image="<?php if(isset($option_value['option_image'])){ echo $option_value['option_image'];} ?>"
                     data-val="<?php if(isset($option_value)) echo $option_value['product_option_value_id']; ?>"
                     class="tab_options">

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
               <?php if ($price) { ?>
               <div id="wishlist-msg">

               </div>
               <div style="padding:0px;" id="content" class="row">
                  <div style=" min-width:160px;" id="addb" class="col-sm-7">
                     <a id="button-cart" style="width: 100%;" class="btn btn-hero">ADD TO CART</a>
                  </div>
                  <div class="col-sm-5">
                     <a class="btn btn-find-store" style=""
                        href="https://zaynjewels.com/index.php?route=common/locations">Find A Store</a>

                  </div>
               </div>

               <?php
                  } else { ?>
               <div style="padding:0px;" class="row">
                  <div style=" min-width:160px;" id="addb" class="col-sm-10">
                     <a style="width: 100%;" id="login-redirect" class="btn btn-hero">
                        Retailer Login</a>
                  </div>

               </div>
               <?php
                  } ?>
               <div class="row d-sm-none">
                  <div class="col-sm-12">
                     <ul class="nav nav-tabs"
                        style="overflow: auto; white-space: nowrap; display:block; padding-top:20px;">
                        <li style="display:inline-block" class="active"><a href="#tab-description-mob"
                              data-toggle="tab">
                              <?php echo strip_tags($tab_description); ?>
                           </a></li>
                        <?php if ($attribute_groups) { ?>
                        <li style="display:inline-block"><a href="#tab-specification-mob" data-toggle="tab">
                              <?php echo $tab_attribute; ?>
                           </a></li>
                        <?php
                           } ?>
                        <?php if ($review_status) { ?>
                        <li style="display:inline-block"><a href="#tab-review-mob" data-toggle="tab">
                              <?php echo $tab_review; ?>
                           </a></li>
                        <?php
                           } ?>
                     </ul>
                     <div class="tab-content">
                        <div class="tab-pane active" id="tab-description-mob">
                           <br />
                           <?php echo strip_tags($description); ?>
                        </div>
                        <?php if ($attribute_groups) { ?>
                        <div class="tab-pane" id="tab-specification-mob">
                           <table class="table table-bordered">
                              <?php foreach ($attribute_groups as $attribute_group) { ?>
                              <thead>
                                 <tr>
                                    <td colspan="2"><strong>
                                          <?php echo $attribute_group['name']; ?>
                                       </strong></td>
                                 </tr>
                              </thead>
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
                        <?php
                           } ?>
                        <?php if ($review_status) { ?>
                        <div class="tab-pane" id="tab-review-mob">
                           <div id="mob-review-msg"></div>
                           <form class="form-horizontal" id="form-review-mob">
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
                                    <button type="button" id="button-review-mob"
                                       data-loading-text="<?php echo $text_loading; ?>"
                                       class="btn btn-hero">Submit</button>
                                 </div>
                              </div>
                              <script>
                                 $('#button-review-mob').on('click', function () {
                                    $.ajax({
                                       url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
                                       type: 'post',
                                       dataType: 'json',
                                       data: $("#form-review-mob").serialize(),
                                       beforeSend: function () {
                                          $('#button-review-mob').button('loading');
                                       },
                                       complete: function () {
                                          $('#button-review-mob').button('reset');
                                       },
                                       success: function (json) {
                                          $('.alert-success, .alert-danger').remove();

                                          if (json['error']) {
                                             $('#mob-review-msg').after(
                                                '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +
                                                json['error'] + '</div>');
                                          }

                                          if (json['success']) {
                                             $('#mob-review-msg').after(
                                                '<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                                                json['success'] + '</div>');

                                             $('input[name=\'name\']').val('');
                                             $('textarea[name=\'text\']').val('');
                                             $('input[name=\'rating\']:checked').prop('checked', false);
                                          }
                                       }
                                    });
                                 });
                              </script>
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
         </div>
      </div>
   </div>
</div>

<section style="background: #F8F8F8;">
   <div class="container">
      <?php if ($products) { ?>
      <br />
      <div class="row">
         <div class="col-sm-12 text-center">
            <h2 class="font_mob">You May Also Like</h2>
         </div>
      </div>
      <br />

      <div class="slicker">


         <?php $i = 0; ?>
         <?php foreach ($products as $product) { ?>

         <div class="product-boxes">
            <!-- product grid start -->
            <a href="<?php print_r($product['href']); ?>">

               <div class="product-item">
                  <figure class="product-thumb">
                     <a href="<?php print_r($product['href']); ?>">
                        <img style="z-index:99999999" src="<?php print_r($product['thumb']); ?>" class="img-responsive">
                     </a>

                  </figure>
                  <p class="description" style="display: none;">
                     <?php print_r($product['description']); ?>
                     <input type="hidden" class="pid" value="<?php echo $product['product_id']; ?>">
                  </p>
                  <div class="product-caption text-center">
                     <h6 class="product-name new_font">
                        <?php print_r($product['name']); ?>
                     </h6>




                  </div>

               </div>
            </a>

            <!-- product grid end -->
         </div>

         <?php
               } ?>
      </div>
      <br /><br />
      <?php
         } ?>
   </div>

</section>

<?php } ?>
<?php if ($cad) { ?>
<div style="max-width:1250px" class="container">
   <div class="row">
      <div class="col-sm-12">
         <div style="margin-bottom: 50px; display:flex; align-items:center" class="row">

            <div class="col-sm-5 desktop_slider">
               <?php if ($thumb || $images) { ?>
               <div id="s_wrap">
                  <?php if ($thumb) { ?>
                  <img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                     alt="<?php echo $heading_title; ?>" />
                  <?php
                        } ?>
               </div>
               <?php
                  } ?>

            </div>
            <div class="col-sm-6">
               <h3 style="text-transform: capitalize; color:#423c9e; font-size:28px; margin-top:25px">
                  <?php echo $heading_title; ?>
               </h3>
               <br />
               <p style="font-size:16px; text-align:justify">
                  <?php echo strip_tags($description); ?>
               </p>
               <br />
               <h3 style="color:#a38129; font-size:22px;">
                  <?php if ($price) {
                        echo 'Price: ' . preg_replace('~\.0+$~', '', $price);
                     } else {
                        echo '<div style="padding:0px;" class="row pb-5">
                     <div style=" min-width:160px;" id="addb" class="col-sm-6 offset-sm-3">
                        <a style="width: 100%;" id="login-redirect" class="btn btn-hero">LOGIN</a>
                     </div>

                  </div>';
                     } ?>
               </h3>
            </div>


            <div class="col-12 slider-mob-box">
               <div>
                  <ul class="slider-mob" style="z-index:99999">
                     <?php if ($thumb) { ?>
                     <li style="margin-left:-30px"><img class="img-responsive" src="<?php echo $thumb; ?>"
                           title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                        } ?>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
                     <li style="margin-left:-30px"><img class="img-responsive" style="margin: auto; margin-right:-5px;"
                           src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"
                           alt="<?php echo $heading_title; ?>" /></li>
                     <?php
                           } ?>
                     <?php
                        } ?>
                  </ul>
               </div>
            </div>
         </div>

      </div>
   </div>
</div>

<section style="background:#f8f8f8">
   <div class="container">
      <br />
      <?php if ($price) { ?>
      <form class="row new-product-form" id="new-product-form">
         <div id="content" style="min-height: 350px;" class="col-sm-10 offset-sm-1">
            <div style=" text-align:left" id="product" class="col-sm-12 mb-3">

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
               <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                        aria-controls="home" aria-selected="true">
                        <h6>Your Details</h6>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab"
                        aria-controls="profile" aria-selected="false">
                        <h6>CAD Details</h6>
                     </a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab"
                        aria-controls="contact" aria-selected="false">
                        <h6>Upload Files</h6>
                     </a>
                  </li>
               </ul>
               <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active text-center" id="home" role="tabpanel"
                     aria-labelledby="home-tab">
                     <div class="row" style="margin-top:20px">
                        <?php if ($options) {
                $c = 1;
            ?>

                        <?php foreach ($options as $option) {
                if ($c == 5) {
                    break;
                }
            ?>
                        <div class="col-sm-6">

                           <?php if ($option['type'] == 'text') { ?>
                           <div class="form-group<?= $option['required'] ? ' required' : '' ?>">
                              <!-- <label class="control-label" for="input-option<?= $option['product_option_id'] ?>">
                        <?= $option['name'] ?></label> -->
                              <input type="text" name="option[<?= $option['product_option_id'] ?>]"
                                 value="<?= ($draft && isset($draft[" option[" . $option['product_option_id'] . "]" ]))
                                 ? $draft["option[" . $option['product_option_id'] . "]" ] : '' ?>"
                              placeholder="
                              <?= $option['name'] ?>" id="input-option
                              <?= $option['product_option_id'] ?>"
                              class="form-control" />
                           </div>
                           <?php } ?>

                        </div>

                        <?php $c++;
            } ?>
                        <?php } ?>

                     </div>
                     <button id="n1" class="btn btn-hero">Next</button>
                  </div>

                  <div class="tab-pane fade text-center" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                     <br />
                     <div class="row" style="margin-top:20px">
                        <?php if ($options) { ?>

                        <?php for ($i = 4; $i < sizeof($options); $i++) { ?>


                        <?php if ($options[$i]['type'] == 'select') { ?>
                        <div class="col-sm-6"
                           style="min-height:50px; margin-bottom:20px; border-bottom:1px solid #ccc; padding-bottom:20px">
                           <p style="display: none;">Metal Colors</p>
                           <?php foreach ($options[$i]['product_option_value'] as $option_value) { ?>
                           <div class="text-center" style="display: inline-block;">
                              <span style="background:url(<?= $option_value['image'] ?>)"
                                 data-sign="<?= $option_value['price_prefix'] ?>"
                                 data-money="<?= $option_value['price'] ?>"
                                 data-image="<?= $option_value['option_image'] ?>"
                                 data-val="<?= $option_value['product_option_value_id'] ?>" class="tab_options">

                              </span>
                              <p style="margin-top: 0px; font-size:12px">
                                 <?= $option_value['name'] ?>
                              </p>
                           </div>

                           <?php
                        } ?>
                           <div style="display: none;" style="width:200px;"
                              class="form-group<?= $options[$i]['required'] ? ' required' : '' ?>">
                              <label class="control-label" for="input-option<?= $options[$i]['product_option_id'] ?>">
                                 <?= $options[$i]['name'] ?>
                              </label>
                              <select name="option[<?= $options[$i]['product_option_id'] ?>]"
                                 id="input-option<?= $options[$i]['product_option_id'] ?>" class="form-control">
                                 <option value="">
                                    <?= $text_select ?>
                                 </option>
                                 <?php foreach ($options[$i]['product_option_value'] as $option_value) { ?>
                                 <option data-sign="<?= $option_value['price_prefix'] ?>"
                                    data-link="<?= $option_value['link'] ?>"
                                    value="<?= $option_value['product_option_value_id'] ?>">
                                    <?= $option_value['name'] ?>
                                    <?php if ($option_value['price']) { ?>
                                    (
                                    <?= $option_value['price_prefix'] ?>
                                    <?= $option_value['price'] ?>)
                                    <?php
                                } ?>
                                 </option>
                                 <?php
                                } ?>
                              </select>
                           </div>
                        </div>
                        <hr style="margin-top: 30px;" />
                        <?php
                    } ?>
                        <?php if ($options[$i]['type'] == 'radio') { ?>
                        <div class="col-sm-6"
                           style="min-height:50px; margin-bottom:20px; border-bottom:1px solid #ccc; padding-bottom:20px">
                           <div class="text-left form-group<?= $options[$i]['required'] ? ' required' : '' ?>">
                              <label class="control-label">
                                 <?= $options[$i]['name'] ?>
                              </label>
                              <div id="input-option<?= $options[$i]['product_option_id'] ?>">
                                 <?php foreach ($options[$i]['product_option_value'] as $option_value) { ?>
                                 <div class="radio">
                                    <label>
                                       <input class="sizes" data-sign="<?= $option_value['price_prefix'] ?>"
                                          data-price="<?= $option_value['price'] ?>" type="radio"
                                          name="option[<?= $options[$i]['product_option_id'] ?>]"
                                          value="<?= $option_value['product_option_value_id'] ?>" <?php if ($draft &&
                                          isset($draft["option[" . $options[$i]['product_option_id'] . "]" ]) &&
                                          $draft["option[" . $options[$i]['product_option_id'] . "]"
                                          ]==$option_value['product_option_value_id']) { echo "checked" ; } ?> />
                                       <?php if ($option_value['image']) { ?>
                                       <img style="display: none;" src="<?= $option_value['image'] ?>"
                                          alt="<?= $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>"
                                          class="img-thumbnail" />
                                       <?php
                                        } ?>
                                       <?= $option_value['name'] ?>

                                    </label>
                                 </div>
                                 <?php
                                } ?>
                              </div>
                           </div>
                        </div>
                        <br />

                        <?php
                    } ?>
                        <?php if ($options[$i]['type'] == 'textarea') { ?>
                        <div class="col-sm-12"
                           style="min-height:50px; margin-bottom:20px; border-bottom:1px solid #ccc; padding-bottom:20px">
                           <div class="text-left form-group<?= $options[$i]['required'] ? ' required' : '' ?>">
                              <!-- <label class="control-label"
                        for="input-option<?= $options[$i]['product_option_id'] ?>">
                        <?= $options[$i]['name'] ?></label> -->
                              <textarea name="option[<?= $options[$i]['product_option_id'] ?>]" rows="5"
                                 placeholder="<?= $options[$i]['name'] ?>"
                                 id="input-option<?= $options[$i]['product_option_id'] ?>"
                                 class="form-control"><?= ($draft && isset($draft["option[" . $options[$i]['product_option_id'] . "]"])) ? $draft["option[" . $options[$i]['product_option_id'] . "]"] : '' ?></textarea>
                           </div>
                        </div>
                        <?php
                    } ?>

                        <?php if ($options[$i]['type'] == 'text') { ?>
                        <div class="col-sm-6"
                           style="min-height:50px; margin-bottom:20px; border-bottom:1px solid #ccc; padding-bottom:20px">
                           <div class="text-left form-group<?= $options[$i]['required'] ? ' required' : '' ?>">
                              <label class="control-label" for="input-option<?= $options[$i]['product_option_id'] ?>">
                                 <?= $options[$i]['name'] ?>
                              </label>
                              <input type="text" name="option[<?= $options[$i]['product_option_id'] ?>]"
                                 value="<?= ($draft && isset($draft[" option[" . $options[$i]['product_option_id'] . "]"
                                 ])) ? $draft["option[" . $options[$i]['product_option_id'] . "]" ] : '' ?>"
                              id="input-option
                              <?= $options[$i]['product_option_id'] ?>" class="form-control" />
                           </div>
                        </div>
                        <?php } ?>



                        <?php
                } ?>
                        <?php
                } ?>
                     </div>

                     <button id="n2" class="btn btn-hero">Next</button>
                     <br /> <br />
                  </div>


                  <div class="tab-pane fade text-center" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                     <br />

                     <div class="row" style="margin-top:20px">
                        <?php if ($options) { ?>

                        <?php for ($i = 0; $i < sizeof($options); $i++) {  ?>

                        <?php if ($options[$i]['type'] == 'file') { ?>
                        <div class="col-sm-6" style="min-height:50px; margin-bottom:20px;">
                           <div class="text-left form-group<?= $options[$i]['required'] ? ' required' : '' ?>">
                              <label class="control-label">
                                 <?= $options[$i]['name'] ?>
                              </label>
                              <button style="width:100px" type="button" class="btn- btn-primary btn-block"
                                 id="button-upload<?= $options[$i]['product_option_id'] ?>"
                                 data-loading-text="<?= $text_loading ?>" class="btn btn-default btn-block"><i
                                    class="fa fa-upload"></i>
                                 <?= $button_upload ?>
                              </button>
                              <input type="hidden" name="option[<?= $options[$i]['product_option_id'] ?>]" value=""
                                 id="input-option<?= $options[$i]['product_option_id'] ?>" />
                              <span style="font-style:italic">(Maximum file size 5 MB Allowed)</span>
                              <div style="width:300px;" class="image-preview">
                                 <img alt="" style="width:100%;">
                              </div>
                           </div>
                        </div>

                        <?php
                } ?>

                        <?php
                } ?>
                        <?php
                } ?>

                     </div>

                     <?php if (0) { ?>

                     <?php } else { ?>
                     <div class="buttons">

                        <div id="wishlist-msg">

                        </div>
                        <div style="padding:0px;" id="content" class="row">
                           <div style=" min-width:160px; " id="addb" class="col-sm-6 offset-sm-3">
                              <a id="button-draft"
                                 style="width: 100%; text-transform:uppercase; display:inline-block; width:auto;"
                                 class="btn btn-hero">Save in Drafts</a>

                              <a id="button-cart1"
                                 style="width: 100%; text-transform:uppercase; display:inline-block; width:auto;"
                                 class="btn btn-hero">Proceed to pay</a>

                           </div>

                        </div>

                     </div>
                     <?php } ?>
                  </div>
               </div>


            </div>
         </div>
      </form>

      <script>
         $('#button-draft').on('click', function (e) {


            e.preventDefault();
            const formElement = document.getElementById('new-product-form');
            let fd = new FormData(formElement);
            let data = {};
            for (let [key, prop] of fd) {
               data[key] = prop;
            }
            fdata = JSON.stringify(data, null, 2);

            console.log(fdata);

            let dname = prompt('Please type draft name');

            $.ajax({
               url: 'index.php?route=account/draft/add',
               type: 'post',
               data: {
                  draft: fdata,
                  customer_id: "<?php echo $customer_id  ?>",
                  title: dname
               },
               dataType: 'json',
               beforeSend: function () {
                  $('#button-draft').button('loading');
               },
               complete: function () {
                  $('#button-draft').button('reset');
               },
               success: function (json) {
                  if (json['error']) {
                     alert('Unable to save draft!')
                  }

                  if (json['success']) {
                     alert("Draft saved successfully!")
                     //location.replace("https://www.w3schools.com");
                  }
               },

               error: function (xhr, ajaxOptions, thrownError) {
                  alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
               }
            });


         });


         function showValues() {
            var fields = $(":input").serializeArray();
            $("#results").empty();
            jQuery.each(fields, function (i, field) {
               $("#results").append(field.value + " ");
            });
         }

         $(":checkbox, :radio").click(showValues);
         $("select").change(showValues);
         showValues();
      </script>


      <div class="row d-none">
         <div class="col-sm-12">
            <h3 style="margin-bottom:30px;">Get Started</h3>
         </div>
         <div style=" text-align:left" id="product1" class="col-sm-12 mb-3">
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

            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
               <label class="control-label">
                  <?php echo $option['name']; ?> (Maximum file size 5 MB Allowed))
               </label>
               <button style="width:100px" type="button" id="button-upload<?php echo $option['product_option_id']; ?>"
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

            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
               <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>">
                  <?php echo $option['name']; ?>
               </label>
               <input type="text" name="option[<?php echo $option['product_option_id']; ?>]"
                  value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>"
                  id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>


            <?php
                     } ?>
            <?php
                  } ?>


            <div id="wishlist-msg">

            </div>
            <div style="padding:0px;" id="content" class="row">
               <div style=" min-width:160px; " id="addb" class="col-sm-6 offset-sm-3">
                  <a id="button-cart" style="width: 100%; text-transform:uppercase" class="btn btn-hero">Proceed to
                     pay</a>
                  <!--<button type="button" data-toggle="tooltip"
                                    title="<?php echo $button_wishlist; ?>"
                                    onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>-->
               </div>

            </div>
            <?php
            } else { ?>
            <div></div>
            <?php
            } ?>
         </div>







      </div>
   </div>
</section>


<?php } ?>

<script>
   var pid = "<?php echo $product_id; ?>";





</script>

<script src="catalog/view/javascript/product.js"></script>
<script src="catalog/view/javascript/cadcam.js"></script>


<?php echo $footer; ?>