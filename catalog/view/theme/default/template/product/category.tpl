<?php echo $header; ?>
<style>
   .pagination li {
      margin: 0px 10px;
   }

   .sub-cate-list ul {
      max-width: 850px;
      margin: auto;
      color: #fff;
      text-transform: uppercase;
   }

   .sub-cate-list ul a {
      color: #333;
      font-size: 12px;
   }

   .sub-cate-list ul li {

      color: #333;
      list-style: none;
      margin: 10px;
      text-align: center;
      padding: 10px;
      float: left;

   }

   .paginatoin-area {
      overflow: auto;
   }

   .overlayx {
      width: 100%;
      height: 100vh;
      background: rgb(0, 0, 0, 0.3);
      position: fixed;
      top: 0px;
      left: 0px;
      display: none;
      z-index: 9999;
   }

   @media screen and (min-width:650px) {
      .filter {
         display: none;
      }
   }
   @media screen and (max-width:650px) {
      .p_box {
         padding:0 20px !important;
      }
   }

   @media screen and (min-width: 1401px) {
      .p_box {
         max-width: 25%;
      }
   }

   .sub-cate-list ul li img {
      border-radius: 50%;
   }

   .color-option {
      width: 16px;
      height: 16px;
      border-radius: 50%;

      bottom: -10px;

      margin: 0px 1.5px;

   }

   .option-tab {
      opacity: 0;
      position: absolute;
      width: 100%;
      text-align: center;
      bottom: 0px;
   }

   .p_box:hover .option-tab {
      opacity: 1;
   }
</style>

<main>
   <!-- breadcrumb area start -->
   <div style="background:#f8f8f8;" class="breadcrumb-area">
      <div class="container">
         <div class="row">
            <div class="col-6 col-sm-9">
               <div class="breadcrumb-wrap">
                  <nav aria-label="breadcrumb">
                     <ul class="breadcrumb">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                           <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php } ?>
                     </ul>
                  </nav>
               </div>
            </div>
            <div class="col-6 col-sm-3 d-flex justify-content-end">
               <div style="width: 80%; float:left" class="form-group input-group input-group-sm">

                  <select style="margin-top: 20px;" id="input-sort" class="form-control" onchange="location = this.value;">
                     <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                           <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?>
                           </option>
                        <?php } else { ?>
                           <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                     <?php } ?>
                  </select>
               </div>
               <div style="width: 20%; padding-left:10%; cursor:pointer;  float:right" class="filter">
                  <li style="margin-top: 30px;" class="fa fa-filter"></li>
               </div>

            </div>
         </div>
      </div>
   </div>
   <!-- breadcrumb area end -->


   <!-- page main wrapper start -->
   <div style="background:#f8f8f8;" class="shop-main-wrapper section-padding">
      <div class="container">
      <?php if($description){?>
      <br />
           <div class="row">
               <div style="text-align: center;" class="col-sm-8 offset-sm-2">
                  <h3 style="text-align: center; margin-top:-55px; text-transform: uppercase;">
                     <?php echo $heading_title; ?>
                  </h3> <br/>
                  <p style="text-align: center;"> <?php echo $description; ?></p>
               </div>
            </div>
            <br /><br />
            <?php }?>
         <?php if ($categories) { ?>
            <div class="row">
               <div class="col-sm-12">
                  <h3 style="text-align: center; margin-top:-55px; text-transform: uppercase;">
                     <?php echo $heading_title; ?>
                  </h3>
               </div>
            </div>

            <?php if (count($categories) <= 5) { ?>
               <div class="row">
                  <div class=" sub-cate-list">
                  
                     <ul>
                        <?php foreach ($categories as $category) { ?>

                           <a href="<?php echo $category['href']; ?>">

                              <li>
                                 <img style="max-width: 130px;" src="<?php echo $category['image']; ?>" alt="" class="img-responsive">
                                 <br />
                                 <?php echo $category['name']; ?>
                              </li>
                           </a>
                        <?php } ?>
                     </ul>

                  </div>

               </div>
               <div class="row">
                  <div class="col-sm-12">
                     <br />
                  </div>
               </div>
            <?php } else { ?>
               <div style="margin-bottom: 30px; max-width:1100px; margin:auto;" class="row <?php if ($_GET['path'] == '79') {
                                                                                                echo "d-none";
                                                                                             }  ?>">
                  <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
                     <div class="sub-cate-list">
                        <ul>
                           <?php foreach ($categories as $category) { ?>
                              <a href="<?php echo $category['href']; ?>">

                                 <li>
                                    <img style="max-width: 130px;" src="<?php echo $category['image']; ?>" alt="" class="img-responsive">
                                    <br /> <br />
                                    <span style="font-size: 13px; margin-top:10px; margin-top:10px; padding:10px 22.5px">
                                       <?php echo $category['name']; ?>
                                    </span>
                                 </li>
                              </a><?php } ?>
                        </ul>
                     </div>
                  <?php } ?>

               </div>
               <div class="row">
                  <div class="col-sm-12">
                     <hr /> <br />
                  </div>
               </div>

            <?php } ?>
         <?php } ?>
         <div class="row">
            <!-- sidebar area start -->
            <div class="col-lg-3 order-2 order-lg-1">
               <aside class="sidebar-wrapper">
                  <?php echo $column_right; ?>

               </aside>
            </div>
            <!-- sidebar area end -->
            <!-- shop main wrapper start -->
            <div class="col-lg-9 order-1 order-lg-2">
               <div class="shop-product-wrapper">
                  <div class="shop-product-wrap grid-view row mbn-30">



                     <?php $k = 0;
                     foreach ($products as $product) {
                     ?>

                        <!-- product single item start -->
                        <div class="col-md-4 col-sm-6 col-6 p_box">
                           <!-- product grid start -->
                           <div class="product-item">
                              <figure class="product-thumb">
                                 <a href="<?php echo $product['href']; ?>">
                                    <img class="pri-img" src="<?php echo $product['thumb']; ?>" alt="product">

                                    <img class="sec-img" src="<?php print_r($images[$product['product_id']]['popup']); ?>" alt="product">
                                 </a>


                              </figure>
                              <div class="product-caption">
                                 <h6 class="product-name">
                                    <a href="<?php echo $product['href']; ?>">
                                       <?php echo $product['name']; ?>

                                    </a>
                                 </h6>
                                 <?php if ($product['price']) { ?>
                                    <?php if ($product['special']) { ?>
                                       <div class="price-box">
                                          <span class="price-regular"><?php echo $product['special']; ?></span>
                                          <span class="price-old"><del><?php echo $product['price']; ?></del></span>
                                       </div>
                                    <?php } else { ?>
                                       <div class="price-box">
                                          <span style="display: inline-block; font-size:11px; color:#333; width:100%">
                                             Available In :
                                             <?php foreach ($product['option'] as $option) {
                                                if ($option['option_id'] == 16) {
                                                      foreach ($option['product_option_value'] as $val) {
                                             ?>
                                                         <?php if (isset($val['image']) && strpos($val['image'], 'no_image') != 40 && strpos($val['image'], 'no_image') != 39) { ?>

                                                            <img style="width: 20px; height:20px" class="color-option" src="<?php print_r($val['image']); ?>" alt="" />
                                                         <?php } ?>

                                                      <?php  } ?>


                                             <?php }
                                                }
                                              ?>
                                          </span>


                                          <br /> <br />
                                          <span class="price-regular">
                                             Price: <?php echo preg_replace('~\.0+$~', '', $product['price']); ?>
                                          </span>
                                       </div>
                                    <?php } ?>
                                 <?php } ?>



                              </div>
                           </div>
                           <!-- product grid end -->
                        </div>
                     <?php }

                     ?>

                  </div>
                  <!-- start pagination area -->
                  <?php if ($pagination) { ?>
                  <div class="paginatoin-area text-center">
                     <?php echo $pagination; ?>
                  </div>
                  <?php } else { } ?>
                  <!-- end pagination area -->
                     <?php if (!$categories && !$products) { ?>
                        <div class="row text-center" style="padding-top:120px">
                           <h3>No products found meeting your search.</h3>
                           
                        </div>
                     <?php } ?>
               </div>
            </div>
            <!-- shop main wrapper end -->
         </div>

      </div>
   </div>
   <!-- page main wrapper end -->
  
  
  
</main>
<!-- Scroll to top start -->
<div class="scroll-top not-visible">
   <i class="fa fa-angle-up"></i>
</div>
<!-- Scroll to Top End -->
<script>
   $(".filter").click(function() {
      $('.overlayx').fadeIn();
      $(".sidebar-wrapper").animate({
         'left': '0px'
      })
   });

   $("body").on('click', '.overlayx', function() {
      $(".sidebar-wrapper").animate({
         'left': '-260px'
      })
      $('.overlayx').fadeOut();
   });

   $('button').click(function() {
      $(this).children('i').removeClass('fa-heart-o').addClass('fa-heart');
   })
   $(".filter-open").click(function() {
      $(".filter-slider").animate({
         'left': 0
      })
      $(".overlay").fadeIn();
   })

   $(".overlay").click(function() {
      $(".filter-slider").animate({
         'left': -250
      })
      $(".overlay").fadeOut();
   })

 
</script>

<div class="overlayx">

</div>

<script type="text/javascript">
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
    return false;
};
   
   $(".filter1 label").click(function() {
   
     var checkBoxes = $(this).parent().find("input");
     checkBoxes.prop("checked", !checkBoxes.prop("checked"));
     $("#button-filter").click();
   });

   $('.checks').click(function(){
    $("#button-filter").click();
   })

   $('#button-filter').on('click', function() {
     filter = [];

     $('input[name^=\'filter\']:checked').each(function(element) {
       filter.push(this.value);
     });
     var path = getUrlParameter('path');
     if(path==107 && filter.length>0){
      filter.push('25');
     }

     if(path==106 && filter.length>0){
      filter.push('27');
     }
     location = 'index.php?route=product/category&path=' + path + '&filter=' + filter.join(',');
   });
   //
 </script>



<?php echo $footer; ?>