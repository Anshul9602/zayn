<?php echo $header; ?>
<style>
  .list-unstyled li {
    color: #333;
    font-size: 14px;
    letter-spacing: 1px;
    margin-top: 5px
  }

  .list-unstyled li a {
    color: #ccc
  }

  .list-unstyled li a:hover {
    color: #333
  }
</style>

<!-- breadcrumb area start -->
<div style="background:#f1f1f1; border-bottom:thin solid #fff" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
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
    </div>
  </div>
</div>
<!-- breadcrumb area end -->

<div style="min-height:50vh;" class="container">



  <div class="row mbn-30">
    <?php $k = 0;
    foreach ($products as $product) { ?>
      <!-- product single item start -->
      <div class="col-md-4 col-sm-6">
        <!-- product grid start -->
        <div class="product-item">
          <figure class="product-thumb">
            <a href="<?php echo $product['href']; ?>">
              <img class="pri-img" src="<?php echo $product['thumb']; ?>" alt="product">
              <img class="sec-img" src="<?php print_r($images[$product['product_id']]['popup']); ?>" alt="product">
            </a>

            <div class="cart-hover">
              <a href="<?php echo $product['href']; ?>">
                <button class="btn btn-cart">View Product</button>
              </a>
            </div>
          </figure>
          <div class="product-caption text-center">
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
                  <span class="price-regular">
                    <?php echo preg_replace('~\.0+$~', '', $product['price']); ?>
                  </span>
                </div>
              <?php } ?>
            <?php } ?>
            <a style="color:#333" href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>">Remove</a>

          </div>
        </div>
        <!-- product grid end -->
      </div>
    <?php } ?>
  </div>
  <br><br><br><br>

</div>



<?php echo $footer; ?>