<?php echo $header; ?>
<style>
   #s_wrap{
   margin-left:-30px;
   padding:30px;
   }
   .slick-slide.slick-current.slick-active img{
   border-color:#a38129;
   }
   .magnify-lens{
   background-color:#fff !important;
   }
   .breadcrumb > li:after{width: 6px; top:7px;
   height: 6px;
   color:#9F9F9F;
   }
   .breadcrumb li{padding:0px 10px}
   .breadcrumb >li a{color: #9F9F9F; text-transform:uppercase}
   .breadcrumb li:nth-child(1){ display:none}
   .overlay1{width:100%; height:100vh; top:0px; left:0px; background-color:#000; z-index:99999; opacity:0.6; display:none; position:fixed; text-align:center}
   .confrim_pop{height:230px; background:#fff; width:400px; position:fixed; z-index:999999; display:none; top:50%; margin-top:-115px; left:50%; margin-left:-200px; text-align:center; border-radius:2px; box-shadow:0 12px 20px -10px rgba(0,0,0,.28), 0 4px 20px 0 rgba(0,0,0,.12), 0 7px 8px -5px rgba(0,0,0,.2)}
   .confrim_pop .fa {color:#44213B; font-size:44px}
   .slick-list.draggable{
   height:100% !important;
   }
   #product p {
      font-size:16px;
      margin-top:10px;
   }
   .product_description{
      text-align:left;
      font-size:14px;
   }
   .product_description * {
      font-size:16px !important;
      color:#000;
   }

    .product_description p:last-child, .product_description li:last-child{
       font-style: italic;
    }
    .product-list{
       max-width:350px;
       margin:auto;
       float:none;

    }
    .zoomImg{
       background-color:#fff;
    }
    .point_line{
       margin-left:20px;
    }
   
   @media screen and (min-width:1300px){
   #product{
padding:50px;
padding-top:0px;
   }   
      
  
   }

   @media screen and (max-width:650px){
         .breadcrumb{
            display:none !important;
         }
         
         .desktop_slider{
            display:none !important;
         }
         .slider-mob,.slider-mob-box{
            display:inline !important;
         }

   .slick-dots{
       margin-left:-40px !important;
    }
        
   }

@media screen and (min-width:651px){
     .desktop_slider{
           
             display:inline !important;
           
         }
         .slider-mob,.slider-mob-box{
            display:none !important;
         }
}   

.gemstone_heading{
  position:absolute;
  bottom:0px;
  color:#fff;
  text-align:center;
  margin:auto;
  width:100%;
  font-size:18px;
  line-height:24px;
  opacity:0;
  letter-spacing:1px;
   padding:0px 30px 0px 30px;
  
}

.hovereffect {
  width: 100%;
  height: 100%;
  float: left;
  overflow: hidden;
  position: relative;
  text-align: center;
  cursor: pointer;
 
  border:thin solid #ddd;
}

.hovereffect .overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
  /* background-color:rgb(255, 255, 255,0.7);*/
  background:rgba(182, 144, 46,0.9);
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

.hovereffect:hover .gem_image{
  opacity:0.9;
}
.slick-prev:before, .slick-next:before{
   color:#ccc !important;
}
.slick-prev{
   left:0px !important;
}
.slick-next{
   right:0px!important;
}
</style>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slick.css"/>
<script type="text/javascript" src="catalog/view/javascript/slick.min.js"></script>
<script src="catalog/view/javascript/jquery.zoom.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/slick-theme.css"/>
<link href="catalog/view/theme/default/stylesheet/magnify.css" rel="stylesheet" type="text/css">
<div style="padding-top:150px; min-height:80vh" class="container">
   <div class="row">
      <div class="col-sm-10 col-sm-offset-1">
         <ul style="display:inline-block; border:none; background:none; " class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
         </ul>
      </div>
   </div>



   <div class="row">
      <div class="col-sm-10 col-sm-offset-1" style="padding:0px">
         <div class="row">
            <div style="padding:0px; text-align:left" class="col-sm-2 desktop_slider">
               <ul class="slider slider-nav ">
                  <?php if ($thumb) { ?>
                  <li style="outline:none"><img class="img-responsive nav-list-li img-thumbnail" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                  <?php } ?>
                  <?php if ($images) { ?>
                  <?php foreach ($images as $image) { ?>
                  <li style="margin-top:20px; outline:none"><img class="img-responsive nav-list-li img-thumbnail" style="margin: auto" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                  <?php } ?>
                  <?php } ?>
               </ul>
            </div>
            <div class="col-sm-6 desktop_slider">
               <?php if ($thumb || $images) { ?>
               <div id="s_wrap">
                  <ul class="slider slider-for">
                     <?php if ($thumb) { ?>
                     <li class="zoom"><img class="img-responsive" src="<?php echo $thumb; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php } ?>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
                     <li class="zoom"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php } ?>
                     <?php } ?>
                  </ul>
               </div>
               <?php } ?>
            </div>
            <div class="col-xs-12 slider-mob-box">
             <div>
                  <ul class="slider-mob" style="z-index:99999">
                     <?php if ($thumb) { ?>
                     <li style="margin-left:-30px"><img class="img-responsive" src="<?php echo $thumb; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php } ?>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
                     <li style="margin-left:-30px"><img class="img-responsive" style="margin: auto; margin-right:-5px;" src="<?php echo $image['popup']; ?>"  title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></li>
                     <?php } ?>
                     <?php } ?>
                  </ul>
               </div>
            </div>
            <div style=" text-align:center" id="product" class="col-sm-4">
               <h3 style="text-transform: capitalize; color:#000; font-size:28px; margin-top:25px"><?php echo $heading_title; ?></h3>
               <h3 style="  color:#a38129; font-size:22px;"><?php echo preg_replace('~\.0+$~','',$price); ?></h3>
               <br />
               <div class="product_description">
               <?php $text= strip_tags($description,"<p><br>"); echo  preg_replace('#(<[a-z ]*)(style=("|\')(.*?)("|\'))([a-z ]*>)#', '\\1\\6', $text);?>
               </div>
               <br />
               <div style="margin-top:20px; display:none" class="row">
                  <div style="text-align: left; padding-left: 0px; width:120px">
                     <p style="fcolor:#000; font-size:16px">Quantity &nbsp;&nbsp;&nbsp;&nbsp;</p>
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
               <?php if ($options) { ?>
               <hr>
               <?php foreach ($options as $option) { ?>
               <?php if ($option['type'] == 'select') { ?>
               <div style="width:200px" class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                     <option value=""><?php echo $text_select; ?></option>
                     <?php foreach ($option['product_option_value'] as $option_value) { ?>
                     <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                     </option>
                     <?php } ?>
                  </select>
               </div>
               <?php } ?>
               <?php if ($option['type'] == 'textarea') { ?>
               <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                  <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
               </div>
               <?php }?>
               <?php }?>
               <?php }?>
               <div style="padding:0px; margin-top:30px" class="row">
                  <div style=" min-width:160px" id="addb" class="col-sm-12">
                     <a id="button-cart"  class="thar-three">ADD TO CART</a>
                     
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <?php if ($products) { ?>
   <div class="row">
      <div class="col-sm-10 col-sm-offset-1">
         <div class="row">
            <br />
            <div class="col-sm-12">
               <h3 style="text-align:center; font-size:20px; color:#b6902e">
                  
                  YOU MAY ALSO LIKE
                
               </h3>
            </div>
            <br /><br /><br /><br />
         </div>
          <div id="product_box" class="row">
         
       


            <?php foreach ($products as $product) { ?>
           <div class="col-sm-4 col-xs-6" style="padding:7.5px; height:350px">
      <a class="foo" href="<?php echo $product['href']; ?>">
        <div class="hovereffect">
        <img style="z-index:-1; margin:auto; margin-top:40px" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"  class="img-responsive pthumb" />
        <div class="overlay"></div>
           <h4 style="line-height:36px" class="gemstone_heading">
                        <?php echo preg_replace('/\s(\S*)$/', '&nbsp;$1', $product['name']); ?><br />
                      <font style="font-size:18px; margin-top:30px">
                      <?php if (!$product['special']) { ?>
                        <?php echo preg_replace('~\.0+$~','',$product['price']); ?>
                        <?php } else { ?>
                        <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?> </span>
                        <?php } ?>
                     </font>
                     </h4>
                     
                    
                     <?php if ($product['price']) { ?>
                     <?php } ?>
        </div>
      </a>
   </div>
            <?php } ?>
          
         </div>
      </div>
   </div>
   <br /><br /><br /><br />
   <?php } ?>
</div>
<div class="overlay1"></div>
<div class="confrim_pop">
   <br>
   <li class="fa fa-check-circle-o"></li>
   <h3>Item added to cart</h3>
   <br>
   <a href="index.php?route=checkout/cart"><button class="btn btn-primary btn-sm">Checkout</button></a>
   <button id="continue_shopping" class="btn btn-primary btn-sm">Continue Shopping</button>
</div>
<script>
   $(document).ready(function(){
      var slides_to_show = $(".img-thumbnail").length;
   $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: false,
    asNavFor: '.slider-nav'
   });
   $('.slider-nav').slick({
    slidesToShow: slides_to_show,
    vertical: true,
    slidesToScroll: 1,
    asNavFor: '.slider-for',
    dots: false,
   
    centerMode: false,
    focusOnSelect: true,
    
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
   
   
   if($(".slick-track li").length < 7){
   	
   $(".slick-dots").css("display","none");
   	};
   
   
    

   $("#continue_shopping").click(function(){
     $(".overlay1, .confrim_pop").fadeOut();
          })
        
    $(".overlay1").click(function(){
      $(".overlay1, .confrim_pop").fadeOut();
          })
      
   })   
   
    $(document).ready(function(e) {
   $("#qtys option:selected").text("Qty ("+$("#qtys option:selected").val()+")");
   });
   
   $("#qtys").change(function(){
   $("#qtys option").each(function(index, element) {
   $(this).text($(this).val());
   });
   $("#qtys option:selected").text("Qty"+" "+"("+$("#qtys option:selected").val()+")");
      })
   
   $("#continue_shopping").click(function(){
      $(".overlay1, .confrim_pop").fadeOut();
   
    })
   
   $(".overlay1").click(function(){
    $(".overlay1, .confrim_pop").fadeOut();
    })
   
   
   $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
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
   
   $("#add_quantity").click(function(){
    var b= Number($("#input-quantity").val())+1;
    $("#input-quantity").val(b);  
    })
    
    
    $("#less_quantity").click(function(){
    var b= Number($("#input-quantity").val())-1;
      if(b<0){
        b=0;
      }
    $("#input-quantity").val(b);  
    })
    
   $('#button-cart').on('click', function() {
      $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
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
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }
   
          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }
   
          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }
   
        if (json['success']) {
        
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
        }
      },
   error: function(xhr, ajaxOptions, thrownError) {
   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
   }
    });
        
    
   });
   

   $(document).ready(function(){
      $(".product_description p").removeAttr("style");
      $(".product_description").html($(".product_description").html().replace(/\✢/g, '<font style="color:#BE9C00; margin-top: -1px; margin-left:-20px; position:absolute">◆ </font>'));
       $(".product_description font").parent().addClass("point_line");
      $('.zoom').zoom({magnify:'1.1'});


   })
   
   $(document).ready(function(){
  
  $(".hovereffect").hover(function(){
    $(this).find("h4").stop().animate({"opacity":"1","top":"40%"},200);
  },function(){
    $(this).find("h4").stop().animate({"opacity":"0","top":"100%"},200);
  })


})
</script>
<script>
$(".product-list").mouseenter(function(){
   $(this).find(".image-box").stop().fadeIn();
    $(this).find("img").css("opacity","0.8");
})

$(".product-list").mouseleave(function(){
   $(this).find(".image-box").stop().fadeOut();
   $(this).find("img").css("opacity","1");
  })

</script>
<script>
   $("body").on("mouseenter",".image-box",function(){
     $(this).find(".caption").stop().fadeIn();
   })
   $("body").on("mouseleave",".image-box",function(){
     $(this).find(".caption").stop().fadeOut();
   })
   
</script>
<?php echo $footer; ?>