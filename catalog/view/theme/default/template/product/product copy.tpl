<?php echo $header; ?>
<style>
   .addthis_counter.addthis_pill_style {
      margin-left: 20px !important;
   }

   #s_wrap {
      margin-left: -30px;
      padding: 30px;
   }

   .btn-hero {
      color: #fff !important;
   }

   .slick-slide.slick-current.slick-active img {
      border-color: #a38129;
   }

   .fa.fa-star-o {
      color: #a38129;
      border-color: #a38129;

   }

   .magnify-lens {
      background-color: #fff !important;
   }

   .tab_options {
      border: thin solid #ccc;

      letter-spacing: 1.2px;
      text-transform: uppercase;
      font-size: 11.5px;

      display: inline-block;
      cursor: pointer;
      font-family: 'Open Sans', sans-serif;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      text-align: center;
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

   .confrim_pop.processing_order {
      z-index: 999999999999999999;
   }

   .confrim_pop.processed_order {
      z-index: 99999999999;
   }

   .confrim_pop .fa {
      color: #44213B;
      font-size: 44px
   }

   .slick-list.draggable {
      height: 100% !important;
   }

   #product p {
      font-size: 16px;
      margin-top: 10px;
   }

   .product_description {
      text-align: left;
      font-size: 14px;
   }

   .product_description * {
      font-size: 16px !important;
      color: #000;
   }

   .product_description p:last-child,
   .product_description li:last-child {
      font-style: italic;
   }

   .product-list {
      max-width: 350px;
      margin: auto;
      float: none;
   }

   .zoomImg {
      background-color: #fff;
   }

   .point_line {
      margin-left: 20px;
   }

   @media screen and (min-width:1300px) {
      #product {
         padding: 50px;
         padding-top: 0px;
      }
   }

   @media screen and (max-width:650px) {
      .desktop_slider {
         display: none !important;
      }

      .slider-mob,
      .slider-mob-box {
         display: inline !important;
      }

      .slick-dots {
         margin-left: -40px !important;
      }
   }

   @media screen and (min-width:651px) {
      .desktop_slider {
         display: inline !important;
      }

      .slider-mob,
      .slider-mob-box {
         display: none !important;
      }
   }

   .gemstone_heading {
      position: absolute;
      bottom: 0px;
      color: #fff;
      text-align: center;
      margin: auto;
      width: 100%;
      font-size: 18px;
      line-height: 24px;
      opacity: 0;
      letter-spacing: 1px;
      padding: 0px 30px 0px 30px;
   }

   .hovereffect {
      width: 100%;
      height: 100%;
      float: left;
      overflow: hidden;
      position: relative;
      text-align: center;
      cursor: pointer;
      border: thin solid #ddd;
   }

   .hovereffect .overlay {
      width: 100%;
      height: 100%;
      position: absolute;
      overflow: hidden;
      top: 0;
      left: 0;
      /* background-color:rgb(255, 255, 255,0.7);*/
      background: rgba(182, 144, 46, 0.9);
      opacity: 0;
      filter: alpha(opacity=0);
   }

   .hovereffect:hover .overlay {
      opacity: 1;
      filter: alpha(opacity=100);
      -webkit-transition-delay: 0s;
      transition-delay: 0s;
      -webkit-transform: translate(0px, 0px);
      -ms-transform: translate(0px, 0px);
      transform: translate(0px, 0px);
   }

   .hovereffect:hover .gem_image {
      opacity: 0.9;
   }

   .slick-prev:before,
   .slick-next:before {
      color: #ccc !important;
   }

   .slick-prev {
      left: 0px !important;
   }

   .slick-next {
      right: 0px !important;
   }

   .nav-tabs>li>a {
      color: #333;
   }

   .nav-tabs>li.active {
      border: none;
      border-bottom: 2px solid #333;

   }

   .nav-tabs>li.active>a {
      border: none;
      font-size: 16px;
   }

   .nav-tabs>li>a {
      border: none;
      text-transform: uppercase;
      font-size: 16px;
      margin: 0px 20px;
   }

   .nav-tabs>li {
      padding-bottom: 10px;
   }

   .radio label {
      float: left;
      margin: 5px;

   }

   .slick-list.draggable {
      max-height: 425px;
      overflow: hidden;
   }

   .slick-next {
      top: 0px;
      position: absolute;
   }

   /***********star rating *************/

   .star-rating {
      font-size: 0;
      white-space: nowrap;
      display: inline-block;
      /* width: 250px; remove this */
      height: 25px;
      overflow: hidden;
      position: relative;
      background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjREREREREIiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
      background-size: contain;
   }

   .star-rating i {
      opacity: 0;
      position: absolute;
      left: 0;
      top: 0;
      height: 100%;
      /* width: 20%; remove this */
      z-index: 1;
      background: url('data:image/svg+xml;base64,PHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4IiB3aWR0aD0iMjBweCIgaGVpZ2h0PSIyMHB4IiB2aWV3Qm94PSIwIDAgMjAgMjAiIGVuYWJsZS1iYWNrZ3JvdW5kPSJuZXcgMCAwIDIwIDIwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cG9seWdvbiBmaWxsPSIjRkZERjg4IiBwb2ludHM9IjEwLDAgMTMuMDksNi41ODMgMjAsNy42MzkgMTUsMTIuNzY0IDE2LjE4LDIwIDEwLDE2LjU4MyAzLjgyLDIwIDUsMTIuNzY0IDAsNy42MzkgNi45MSw2LjU4MyAiLz48L3N2Zz4=');
      background-size: contain;
   }

   .star-rating input {
      -moz-appearance: none;
      -webkit-appearance: none;
      opacity: 0;
      display: inline-block;
      /* width: 20%; remove this */
      height: 100%;
      margin: 0;
      padding: 0;
      z-index: 2;
      position: relative;
   }

   .star-rating input:hover+i,
   .star-rating input:checked+i {
      opacity: 1;
   }

   .star-rating i~i {
      width: 40%;
   }

   .star-rating i~i~i {
      width: 60%;
   }

   .star-rating i~i~i~i {
      width: 80%;
   }

   .star-rating i~i~i~i~i {
      width: 100%;
   }


   .star-rating.star-5 {
      width: 125px;
   }

   .star-rating.star-5 input,
   .star-rating.star-5 i {
      width: 20%;
   }

   .star-rating.star-5 i~i {
      width: 40%;
   }

   .star-rating.star-5 i~i~i {
      width: 60%;
   }

   .star-rating.star-5 i~i~i~i {
      width: 80%;
   }

   .star-rating.star-5 i~i~i~i~i {
      width: 100%;
   }

   .star-rating.star-3 {
      width: 150px;
   }

   .star-rating.star-3 input,
   .star-rating.star-3 i {
      width: 33.33%;
   }

   .star-rating.star-3 i~i {
      width: 66.66%;
   }

   .star-rating.star-3 i~i~i {
      width: 100%;
   }

   .img-thumbnail,
   .slider-nav .slick-slide {
      width: 110px !important;
   }

   .product-boxes {
      padding: 10px;
   }

   /************star rating************/
</style>
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

                     <?php foreach ($breadcrumbs as $breadcrumb)
{ ?>
                        <li class="breadcrumb-item">
                           <a href="<?php echo $breadcrumb['href']; ?>">
                              <?php echo $breadcrumb['text']; ?></a></li>
                     <?php
} ?>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </div>
</div>


 <?php if (basename($_SERVER[REQUEST_URI]) === 'product&product_id=847')
{ ?>
<img src="assets/cad/pb1.jpg" class="img-fluid">
 <?php
} ?>

<!-- breadcrumb area end -->
<?php if (basename($_SERVER[REQUEST_URI]) !== 'product&product_id=847'){ ?>
<div style="max-width:1250px" class="container">
   <div class="row">
      <div class="col-sm-12">
         <div style="margin-bottom: 100px;" class="row">
            <div style="padding:0px; text-align:left" class="col-sm-2 desktop_slider">
               <ul class="slider slider-nav ">
                  <?php if ($thumb)
    { ?>
                     <li style="outline:none"><img class="img-responsive nav-list-li img-thumbnail" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                  <?php
    } ?>
                  <?php if ($images)
    { ?>
                     <?php foreach ($images as $image)
        { ?>
                        <li style="margin-top:20px; outline:none"><img class="img-responsive nav-list-li img-thumbnail" style="margin: auto" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php
        } ?>
                  <?php
    } ?>
               </ul>
            </div>
            <div class="col-sm-5 desktop_slider">
               <?php if ($thumb || $images)
    { ?>
                  <div id="s_wrap">
                     <ul class="slider slider-for">
                        <?php if ($thumb)
        { ?>
                           <li class="zoom"><img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                        <?php
        } ?>
                        <?php if ($images)
        { ?>
                           <?php foreach ($images as $image)
            { ?>
                              <li class="zoom"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
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
                        <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                        <?php if ($attribute_groups)
    { ?>
                           <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                        <?php
    } ?>
                        <?php if ($review_status)
    { ?>
                           <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                        <?php
    } ?>
                     </ul>
                     <div class="tab-content">
                        <div class="tab-pane active" id="tab-description">
                           <br />
                           <?php echo $description; ?>
                        </div>
                        <?php if ($attribute_groups)
    { ?>
                           <div class="tab-pane" id="tab-specification">
                              <table class="table table-bordered">
                                 <?php foreach ($attribute_groups as $attribute_group)
        { ?>
                                    <thead>
                                       <tr>
                                          <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <?php foreach ($attribute_group['attribute'] as $attribute)
            { ?>
                                          <tr>
                                             <td><?php echo $attribute['name']; ?></td>
                                             <td><?php echo $attribute['text']; ?></td>
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
                        <?php if ($review_status)
    { ?>
                           <div class="tab-pane" id="tab-review">
                              <form class="form-horizontal" id="form-review">
                                 <div id="review"></div>

                                 <?php if ($review_guest)
        { ?>
                                    <div class="form-group required">
                                       <div class="col-sm-12">
                                          <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                          <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                                       </div>
                                    </div>
                                    <div class="form-group required">
                                       <div class="col-sm-12">
                                          <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                          <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                       </div>
                                    </div>
                                    <div class="form-group required">
                                       <div class="col-sm-12">
                                          <span class="star-cb-group star-rating star-5">
                                             <label class="control-label"><?php echo $entry_rating; ?></label>
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
                                          <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-hero">Submit</button>
                                       </div>
                                    </div>
                                 <?php
        }
        else
        { ?>
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
            <div class="col-xs-12 slider-mob-box">
               <div>
                  <ul class="slider-mob" style="z-index:99999">
                     <?php if ($thumb)
    { ?>
                        <li style="margin-left:-30px"><img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php
    } ?>
                     <?php if ($images)
    { ?>
                        <?php foreach ($images as $image)
        { ?>
                           <li style="margin-left:-30px"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                        <?php
        } ?>
                     <?php
    } ?>
                  </ul>
               </div>
            </div>
            <div style=" text-align:left" id="product" class="col-sm-5">
               <h3 style="text-transform: capitalize; color:#000; font-size:28px; margin-top:25px">
                  <?php echo $heading_title; ?>
               </h3>
               <?php if ($review_status)
    { ?>
                  <div class="rating">
                     <p>
                        <?php for ($i = 1;$i <= 5;$i++)
        { ?>
                           <?php if ($rating < $i)
            { ?>
                              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                           <?php
            }
            else
            { ?>
                              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                           <?php
            } ?>
                        <?php
        } ?>
                        <a href="" class="writeme" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a>
                        / <a href="" class="writeme" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a>
                     </p>
                     <?php if (basename($_SERVER[REQUEST_URI]) !== 'product&product_id=847')
        { ?>
                     <hr>
                     <!-- AddThis Button BEGIN -->
                     <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
                     <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
                     <!-- AddThis Button END -->
                     <?php
        } ?>
                  </div>
               <?php
    } ?>
               <h3 id="p_pr" style="  color:#a38129; font-size:22px;"><?php echo preg_replace('~\.0+$~', '', $price); ?>
               </h3>
             <?php if (basename($_SERVER[REQUEST_URI]) !== 'product&product_id=847')
    { ?>
               <p style="line-height:36px">
                  Style No : <i><?php echo $style_no; ?></i>
                  <br />
                  Design No : <i><?php echo $design_no; ?></i>
                  <br />
                  Metal Purity: <i><?php echo $metal_purity; ?></i>
               </p>
               <?php
    } ?>
               
               <div style="margin-top:20px; display:none" class="row">
                  <div style="text-align: left; padding-left: 0px; width:120px">
                     <p style="color:#000; font-size:16px">Quantity &nbsp;&nbsp;&nbsp;&nbsp;</p>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-4">
                        <span class="minus-btn" id="less_quantity" style="height: 40px; text-align: center; padding:7px 10px; border:thin solid #333; cursor: pointer">
                           <input style="margin: 0px; padding: 2.5px;" type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                           <li style="color: #333; font-size: 12px" class="fa fa-minus"></li>
                        </span>
                     </div>
                     <div style="text-align: center; padding: 0px" class="col-sm-4 col-xs-2">
                        <input style="text-align: center; border-radius:0px; color:#000; width: auto; height: auto; box-shadow:none; border: none; background-color: transparent; padding: 0px" type="text" readonly name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                     </div>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-6">
                        <span class="pluse-btn" id="add_quantity" style="height: 40px; text-align: center; padding: 7px 10px; border:thin solid #000; cursor: pointer">
                           <li style="font-size: 12px; color:#000" class="fa fa-plus"></li>
                        </span>
                     </div>
                  </div>
               </div>
               <?php if ($options)
    { ?>
                  <hr>
                 
                  <?php foreach ($options as $option)
        { ?>
                   <?php if ($option['type'] == 'file')
            { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <hr /> 
            <?php
            } ?>
                     <?php if ($option['type'] == 'select')
            { ?>
                        <p style="display: none;">Metal Colors</p>
                        <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                           <div class="text-center" style="display: inline-block;">
                              <span style="background:url(<?php echo $option_value['image']; ?>)" data-sign="<?php echo $option_value['price_prefix']; ?>" data-money="<?php echo $option_value['price']; ?>" data-image="<?php echo $option_value['option_image']; ?>" data-val="<?php echo $option_value['product_option_value_id']; ?>" class="tab_options">

                              </span>
                              <p style="margin-top: 0px; font-size:12px"> <?php echo $option_value['name']; ?></p>
                           </div>

                        <?php
                } ?>
                        <div style="display: none;" style="width:200px;" class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                           <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                              <option value=""><?php echo $text_select; ?></option>
                              <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                                 <option data-sign="<?php echo $option_value['price_prefix']; ?>" data-link="<?php echo $option_value['link']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                    <?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price'])
                    { ?>
                                       (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
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
                     <?php if ($option['type'] == 'radio')
            { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label"><?php echo $option['name']; ?></label>
                           <div id="input-option<?php echo $option['product_option_id']; ?>">
                              <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                                 <div class="radio">
                                    <label>
                                       <input class="sizes" data-sign="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                       <?php if ($option_value['image'])
                    { ?>
                                          <img style="display: none;" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                       <?php
                    } ?>
                                       <?php echo $option_value['name']; ?>
                                       <?php if ($option_value['price'])
                    { ?>
                                          (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
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
                     <?php if ($option['type'] == 'textarea')
            { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                           <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                     <?php
            } ?>




                  <?php
        } ?>
               <?php
    } ?>

               <?php if ($price)
    { ?>
                  <div id="wishlist-msg">

                  </div>
                  <div style="padding:0px;" id="content" class="row">
                     <div style=" min-width:160px; margin-left:-15px" id="addb" class="col-sm-7">
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
    }
    else
    { ?>
                  <div style="padding:0px;" class="row">
                     <div style=" min-width:160px; margin-left:-15px" id="addb" class="col-sm-10">
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

<section style="background: #F8F8F8;">
   <div class="container">
      <?php if ($products)
    { ?>
         <br />
         <div class="row">
            <div class="col-sm-12 text-center">
               <h2>You May Also Like</h2>
            </div>
         </div>
         <br />

         <div class="slicker">


            <?php $i = 0; ?>
            <?php foreach ($products as $product)
        { ?>

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
                           <h6 class="product-name">
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



<!-- breadcrumb area end -->
<?php if (basename($_SERVER[REQUEST_URI]) === 'product&product_id=847'){ ?>
<div style="max-width:1250px" class="container">
   <div class="row">
      <div class="col-sm-12" style="padding:0px; ">
         <div style="margin-bottom: 50px; display:flex; align-items:center" class="row">
            
            <div class="col-sm-5 desktop_slider">
               <?php if ($thumb || $images)
    { ?>
                  <div id="s_wrap">
                     <?php if ($thumb)
        { ?>
                           <img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
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
               <p style="font-size:16px; text-align:justify"> <?php echo strip_tags($description); ?></p>
               <br />
               <h3 style="color:#a38129; font-size:22px;">
                 Price: <?php if($price){echo preg_replace('~\.0+$~', '', $price);}else{echo '<div style="padding:0px;" class="row pb-5">
                     <div style=" min-width:160px;" id="addb" class="col-sm-6 offset-sm-3">
                        <a style="width: 100%;" id="login-redirect" class="btn btn-hero">LOGIN FOR
                           PRICE</a>
                     </div>

                  </div>';} ?>
               </h3>
            </div>

            
            <div class="col-xs-12 slider-mob-box">
               <div>
                  <ul class="slider-mob" style="z-index:99999">
                     <?php if ($thumb)
    { ?>
                        <li style="margin-left:-30px"><img class="img-responsive" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php
    } ?>
                     <?php if ($images)
    { ?>
                        <?php foreach ($images as $image)
        { ?>
                           <li style="margin-left:-30px"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
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
<?php if ($price)
    { ?>
 <div class="row">
 <div class="col-sm-12">
  <h3 style="margin-bottom:30px;">Get Started</h3>
 </div>
            <div style=" text-align:left" id="product" class="col-sm-12 mb-3">

           
              
               
               <div style="margin-top:20px; display:none" class="row">
                  <div style="text-align: left; padding-left: 0px; width:120px">
                     <p style="color:#000; font-size:16px">Quantity &nbsp;&nbsp;&nbsp;&nbsp;</p>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-4">
                        <span class="minus-btn" id="less_quantity" style="height: 40px; text-align: center; padding:7px 10px; border:thin solid #333; cursor: pointer">
                           <input style="margin: 0px; padding: 2.5px;" type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                           <li style="color: #333; font-size: 12px" class="fa fa-minus"></li>
                        </span>
                     </div>
                     <div style="text-align: center; padding: 0px" class="col-sm-4 col-xs-2">
                        <input style="text-align: center; border-radius:0px; color:#000; width: auto; height: auto; box-shadow:none; border: none; background-color: transparent; padding: 0px" type="text" readonly name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
                     </div>
                     <div style="text-align: left; padding-left: 0px; " class="col-sm-4 col-xs-6">
                        <span class="pluse-btn" id="add_quantity" style="height: 40px; text-align: center; padding: 7px 10px; border:thin solid #000; cursor: pointer">
                           <li style="font-size: 12px; color:#000" class="fa fa-plus"></li>
                        </span>
                     </div>
                  </div>
               </div>
              
               <?php if ($options)
    { ?>
                  
                  <?php foreach ($options as $option)
        { ?>
                   <?php if ($option['type'] == 'file')
            { ?> 
            <div  class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button style="width:100px" type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
             <hr />
            <?php
            } ?>
                     <?php if ($option['type'] == 'select')
            { ?>
                        <p style="display: none;">Metal Colors</p>
                        <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                           <div class="text-center" style="display: inline-block;">
                              <span style="background:url(<?php echo $option_value['image']; ?>)" data-sign="<?php echo $option_value['price_prefix']; ?>" data-money="<?php echo $option_value['price']; ?>" data-image="<?php echo $option_value['option_image']; ?>" data-val="<?php echo $option_value['product_option_value_id']; ?>" class="tab_options">

                              </span>
                              <p style="margin-top: 0px; font-size:12px"> <?php echo $option_value['name']; ?></p>
                           </div>

                        <?php
                } ?>
                        <div style="display: none;" style="width:200px;" class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                           <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                              <option value=""><?php echo $text_select; ?></option>
                              <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                                 <option data-sign="<?php echo $option_value['price_prefix']; ?>" data-link="<?php echo $option_value['link']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>">
                                    <?php echo $option_value['name']; ?>
                                    <?php if ($option_value['price'])
                    { ?>
                                       (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
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
                     <?php if ($option['type'] == 'radio')
            { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label"><?php echo $option['name']; ?></label>
                           <div id="input-option<?php echo $option['product_option_id']; ?>">
                              <?php foreach ($option['product_option_value'] as $option_value)
                { ?>
                                 <div class="radio">
                                    <label>
                                       <input class="sizes" data-sign="<?php echo $option_value['price_prefix']; ?>" data-price="<?php echo $option_value['price']; ?>" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                                       <?php if ($option_value['image'])
                    { ?>
                                          <img style="display: none;" src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" />
                                       <?php
                    } ?>
                                       <?php echo $option_value['name']; ?>
                                       <?php if ($option_value['price'])
                    { ?>
                                          (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
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
                     <?php if ($option['type'] == 'textarea')
            { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                           <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                           <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                     <?php
            } ?>

            <?php if ($option['type'] == 'text') { ?>
               <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
               <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
               <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
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
                        <a id="button-cart" style="width: 100%; text-transform:uppercase" class="btn btn-hero">Proceed to pay</a>
                        <!--<button type="button" data-toggle="tooltip"
                        title="<?php echo $button_wishlist; ?>"
                        onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>-->
                     </div>
                     
                  </div>
               <?php
    }
    else
    { ?>
                  <div></div>
               <?php
    } ?>
  </div>
 </div>
</div>
</section>


<?php } ?>


<div class="overlay1"></div>
<div class="confrim_pop">
   <br>
   <li style="color:#423c9e" class="fa fa-check-circle-o"></li>
   <h3>Item added to cart</h3>
   <br>
   <a href="index.php?route=checkout/cart"><button class="btn btn-hero">Checkout</button></a>
   <button id="continue_shopping" class="btn btn-hero">Continue Shopping</button>
</div>
<script>
   $(".writeme").click(function() {
      $('html, body').animate({
         scrollTop: $("#review").offset().top - 250
      }, 2000);
   })
   eraseCookie('login_redirect');
   $("#login-redirect").click(function(e) {
      e.preventDefault();
      setCookie('login_redirect', window.location.href, '1'); //(key,value,expiry in days)
      window.location = "index.php?route=account/login";
   })


   var old_price = Number($("#p_pr").text().replace(/[`~!@#$%^&*()_|+\-=?;:'",<>\{\}\[\]\\\/]/gi, ''));
   <?php if ($price)
{ ?>
      $('.sizes').change(function() {
         var p = $(this).attr('data-price');
         var sig = $(this).attr('data-sign');
         var q = p.replace(/[`~!@#$%^&*()_|+\-=?;:'",<>\{\}\[\]\\\/]/gi, '');
         var x = Number(q);

         if (sig == "+") {
            var new_p = old_price + x;
         } else {
            var new_p = old_price - x;
         }


         $("#p_pr").text('$' + new_p);

      });
   <?php
} ?>

   $(".nav-tabs li").click(function() {
      $(".nav-tabs li").removeClass('active');
      $(this).addClass('active');
   })

   var getUrlParameter = function getUrlParameter(sParam) {
      var sPageURL = window.location.search.substring(1),
         sURLVariables = sPageURL.split('&'),
         sParameterName,
         i;

      for (i = 0; i < sURLVariables.length; i++) {
         sParameterName = sURLVariables[i].split('=');

         if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
         }
      }
   };
   $(document).ready(function(e) {
      var link = getUrlParameter('a');


      if (link) {
         $(".tab_options").each(function() {
            if ($.trim($(this).siblings().html()).toLocaleLowerCase() == link.toLocaleLowerCase()) {
               $(this).css('border', '2px solid #413B98');
               $(this).addClass('current');
               var val = $(this).attr("data-val");

               $("select option").each(function(index, element) {
                  if ($(this).val() == val) {
                     $(this).prop("selected", true);
                  }

               })

            }
         })
      } else {
         if ($(".tab_options").length > 0) {

            var val;

            $("select option").each(function(index, element) {
               if ($(this).attr("data-link") == "") {
                  $(this).prop("selected", true);
                  val = $(this).val();
               }
            })

            $(".tab_options").each(function() {
               if ($(this).attr("data-val") == val) {
                  $(this).css('border', '2px solid #413B98');
               }
            })
         }
      }
      $(".tab_options").click(function() {
         if (!$(this).hasClass('current')) {
            var val = $(this).attr("data-val");

            $("select option").each(function(index, element) {
               if ($(this).val() == val) {
                  if ($(this).attr("data-link")) {
                     $(this).prop("selected", true);
                     window.location = $(this).attr("data-link") + '?a=' + $.trim($(this).html());

                  }
               }
            });
         }

      })

   });




   $(document).ready(function() {


      $('#review').delegate('.pagination a', 'click', function(e) {
         e.preventDefault();

         $('#review').fadeOut('slow');

         $('#review').load(this.href);

         $('#review').fadeIn('slow');
      });

      $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

      $('#button-review').on('click', function() {
         $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
               $('#button-review').button('loading');
            },
            complete: function() {
               $('#button-review').button('reset');
            },
            success: function(json) {
               $('.alert-success, .alert-danger').remove();

               if (json['error']) {
                  $('#review').after(
                     '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +
                     json['error'] + '</div>');
               }

               if (json['success']) {
                  $('#review').after(
                     '<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                     json['success'] + '</div>');

                  $('input[name=\'name\']').val('');
                  $('textarea[name=\'text\']').val('');
                  $('input[name=\'rating\']:checked').prop('checked', false);
               }
            }
         });
      });


      var slides_to_show1 = $(".product-boxes").length;
      (slides_to_show1 > 3) ? slides_to_show1 = 3: null;

      $(".slicker").slick({
         dots: false,
         arrows: true,
         infinite: true,
         speed: 300,
         slidesToShow: 4,
         slidesToScroll: 1
      })

      var slides_to_show = $(".img-thumbnail").length;
      $('.slider-for').slick({
         slidesToShow: 1,
         slidesToScroll: 1,
         arrows: true,
         fade: false,
         asNavFor: '.slider-nav',
         nextArrow: '<button style="width: 25px;top: 150px;position: absolute;right: -25px;z-index: 99;" class="btn-round left"><svg viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow" transform="translate(100, 100) rotate(180) "></path></svg></button>',
         prevArrow: '<button style="width: 25px;top: 150px;position: absolute;left: -25px;z-index: 99;" class="btn-round right"><svg viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow"></path></svg></button>'

      });
      $('.slider-nav').slick({
         slidesToShow: slides_to_show,
         vertical: true,
         slidesToScroll: 1,
         asNavFor: '.slider-for',
         dots: false,
         focusOnSelect: true

      });

      $('.slider-mob').slick({
         slidesToShow: 1,
         slidesToScroll: 1,
         dots: true,
         infinite: true,
         speed: 500,
         fade: true,
         cssEase: 'linear',
         arrows: false,


      });


      if ($(".slick-track li").length < 7) {

         $(".slick-dots").css("display", "none");
      };




      $("#continue_shopping").click(function() {
         $(".overlay1, .confrim_pop").fadeOut();
      })

      $(".overlay1").click(function() {
         $(".overlay1, .confrim_pop").fadeOut();
      })

   })

   $(document).ready(function(e) {
      $("#qtys option:selected").text("Qty (" + $("#qtys option:selected").val() + ")");
   });

   $("#qtys").change(function() {
      $("#qtys option").each(function(index, element) {
         $(this).text($(this).val());
      });
      $("#qtys option:selected").text("Qty" + " " + "(" + $("#qtys option:selected").val() + ")");
   })

   $("#continue_shopping").click(function() {
      $(".overlay1, .confrim_pop").fadeOut();

   })

   $(".overlay1").click(function() {
      $(".overlay1, .confrim_pop").fadeOut();
   })


   $('select[name=\'recurring_id\'], input[name="quantity"]').change(function() {
      $.ajax({
         url: 'index.php?route=product/product/getRecurringDescription',
         type: 'post',
         data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
         dataType: 'json',
         beforeSend: function() {
            $('#recurring-description').html('');
         },
         success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['success']) {
               $('#recurring-description').html(json['success']);
            }
         }
      });
   });

   $("#add_quantity").click(function() {
      var b = Number($("#input-quantity").val()) + 1;
      $("#input-quantity").val(b);
   })


   $("#less_quantity").click(function() {
      var b = Number($("#input-quantity").val()) - 1;
      if (b < 0) {
         b = 0;
      }
      $("#input-quantity").val(b);
   })


   $('#button-cart').on('click', function() {
      $.ajax({
         url: 'index.php?route=checkout/cart/add',
         type: 'post',
         data: $(
            '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'
         ),
         dataType: 'json',
         beforeSend: function() {
            $('#button-cart').button('loading');
         },
         complete: function() {
            $('#button-cart').button('reset');
         },
         success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error']) {
               if (json['error']['option']) {
                  for (i in json['error']['option']) {
                     var element = $('#input-option' + i.replace('_', '-'));

                     if (element.parent().hasClass('input-group')) {
                        element.parent().after('<div class="text-danger">' + json['error']['option'][i] +
                           '</div>');
                     } else {
                        element.after('<div class="text-danger">' + json['error']['option'][i] +
                           '</div>');
                     }
                  }
               }

               if (json['error']['recurring']) {
                  $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error'][
                     'recurring'
                  ] + '</div>');
               }

               // Highlight any found errors
               $('.text-danger').parent().addClass('has-error');
            }

            /*if (json['success']) {


             $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');



             $('#cart #product_mark').load('index.php?route=common/cart/info #product_mark');
             $("#cart").slideDown();
             $('html, body').animate({scrollTop:0},500);

             if($(window).width()<650){
             $(".overlay1, .confrim_pop").fadeIn()

               }

             setTimeout(function () {
                  $('#cart').slideUp();
               }, 6000);
           }*/
            if (json['success']) {
               $(".overlay1, .confrim_pop").fadeIn();

               $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' +
                  json['total'] + '</span>');
               $("#cart_count").html((json['total'][0]));
               $("#qtys").val("1");
               $("#input-quantity").val("1");


               $('#cart #product_mark').load('index.php?route=common/cart/info #product_mark');
               $("#cart").slideDown();
               setTimeout(function() {
                  $('#cart').slideUp();
               }, 6000);
               $("#p_added").fadeIn().delay(3000).fadeOut();
            }
         },

         error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
         }
      });


   });


   $(document).ready(function() {
      $(".product_description p").removeAttr("style");
      $(".product_description").html($(".product_description").html().replace(/\✢/g,
         '<font style="color:#BE9C00; margin-top: -1px; margin-left:-20px; position:absolute">◆ </font>'));
      $(".product_description font").parent().addClass("point_line");
      $('.zoom').zoom({
         magnify: '1.1'
      });


   })

   $(document).ready(function() {

      $(".hovereffect").hover(function() {
         $(this).find("h4").stop().animate({
            "opacity": "1",
            "top": "40%"
         }, 200);
      }, function() {
         $(this).find("h4").stop().animate({
            "opacity": "0",
            "top": "100%"
         }, 200);
      })


   })
</script>
<script>

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
                  $(node).parent().find('.filename').remove()
						$(node).parent().find('input').after('<div class="text-danger filename">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
                  $(node).parent().find('.filename').remove()
                  $(node).parent().find('input').after('<div class="text-success filename">' + json['filename'] + '</div>');
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
   $(".product-list").mouseenter(function() {
      $(this).find(".image-box").stop().fadeIn();
      $(this).find("img").css("opacity", "0.8");
   })

   $(".product-list").mouseleave(function() {
      $(this).find(".image-box").stop().fadeOut();
      $(this).find("img").css("opacity", "1");
   })
</script>
<script>
   $("body").on("mouseenter", ".image-box", function() {
      $(this).find(".caption").stop().fadeIn();
   })

   $("body").on("mouseleave", ".image-box", function() {
      $(this).find(".caption").stop().fadeOut();
   })
</script>
<?php echo $footer; ?>
