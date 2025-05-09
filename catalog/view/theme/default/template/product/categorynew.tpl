<?php echo $header; ?>
<link href="https://pagination.js.org/dist/2.6.0/pagination.css" rel="stylesheet">
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
   .product-thumb:hover .wishlist_link1{
   display:block;
}
.wishlist_link1{
   display:none;
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
               <select style="margin-top: 20px;" id="input-sort" class="form-control sort">
                                                                        <option value="" selected="selected">SORT</option>
                                                                        <option value="name_ASC">Name (A - Z)</option>
                                                                        <option value="name_DESC">Name (Z - A)</option>
                                                                        <option value="p_ASC">Price (Low &gt; High)</option>
                                                                      <option value="p_DESC">Price (High &gt; Low)</option>
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
               </h3>
               <br/>
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
         <?php } ?>
         <div class="row">
            <!-- sidebar area start -->
            <div class="col-lg-3 order-2 order-lg-1">
               <aside class="sidebar-wrapper">
                  <button id="clear-filters" class="btn btn-primary d-none" style="margin: 10px 0; width: 100%;">Clear All Filters</button>
                  <?php echo $column_right; ?>
               </aside>
            </div>
            <!-- sidebar area end -->
            <!-- shop main wrapper start -->
            <div class="col-lg-9 order-1 order-lg-2">
               <div class="shop-product-wrapper">
                  <div id="data-container" class="shop-product-wrap grid-view row mbn-30">
                  </div>
                  <div style="margin-top:30px" id="pagination-container"></div>
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
<script src="https://pagination.js.org/dist/2.6.0/pagination.min.js"></script>
<script src="catalog/view/javascript/filters.js?v1.12093"></script>

<script>
   //fetch products and show array
   var temp = <?php print_r(json_encode($products));?>;
   var items = shuffleArray([...temp]);
   window.originalData = items; // Store original data globally
   var filteredData = items;

   $(document).ready(function(){
      generatePage(items);
      
      $('input[type="checkbox"]').change(function() {
         debouncedGetFilters(function(filters) {
            // Reset filteredData to original items when all filters are empty
            if(filters.FilterByGemstone.length === 0 && 
               filters.FilterByMetalColor.length === 0 && 
               filters.FilterByType.length === 0) {
               filteredData = items;
            } else {
               // Start with original items for each filter application
               filteredData = [...items];
               
               //filter by gemstone
               if(filters.FilterByGemstone.length > 0){
                  let replacements = {'33': '01ZZZ', '4': '05ZZZ', '3': '09ZZZ', '5':'06ZZZ', '13':'07ZZZ','14':'08ZZZ','15':'10ZZZ'};
                  let newArray = filters.FilterByGemstone.map(item => replacements[item] || item);
                  filteredData = filterDataByModel(filteredData, newArray);         
               }
               
               //filter by colors
               if(filters.FilterByMetalColor.length > 0){
                  let replacements = {'1': '200', '2': '100', '12': '300'};
                  let newArray = filters.FilterByMetalColor.map(item => replacements[item] || item);
                  filteredData = filterDataByModel(filteredData, newArray);
               }

               //filter by type
               if(filters.FilterByType.length > 0){
                  filteredData = FilterByType(filteredData, filters.FilterByType);
               }
            }
            
            generatePage(filteredData);
         });
      });

      // Sort handler
      $("#input-sort").change(function(){
         if($("#input-sort").val()=="name_ASC"){
            filteredData = sortByNameA([...filteredData]);
         }
         if($("#input-sort").val()=="name_DESC"){
            filteredData = sortByNameD([...filteredData]);
         }
         if($("#input-sort").val()=="p_ASC"){
            filteredData = sortByPriceA([...filteredData]);
         }
         if($("#input-sort").val()=="p_DESC"){
            filteredData = sortByPriceD([...filteredData]);
         }
         generatePage(filteredData);
      });
   });
</script>   
<?php echo $footer; ?>