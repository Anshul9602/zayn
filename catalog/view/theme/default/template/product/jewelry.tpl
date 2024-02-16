<?php echo $header; ?>
<!-- slick Slider JS -->
<script src="assets/js/plugins/slick.min.js"></script>
<style>
    .v-center {
        display: flex;
        align-items: center;
    }

    .p5 {
        padding: 5px;
    }

    .p5 h3 {
        font-weight: 300;
        color: #423C9E;
        font-size: 28px;
    }

    .p5 p {
        font-weight: 300;
        margin-top: 10px;
        font-size: 18px;
    }

    .p5 .shop_link {
        font-weight: 400;
        font-size: 18px;
        color: #423C9E;

    }

    .img-row {
        margin-bottom: 40px;
    }

    .img-row .p5 h3 {
        font-size: 32px;
    }

    .img-row .p5 p {
        font-size: 20px;
    }
</style>
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

    @media screen and (min-width: 1401px) {
        .p_box {
            max-width: 25%;
        }
    }

    .sub-cate-list ul li img {
        border-radius: 50%;
    }

    .slick-slide {
        max-width: 350px !important;
    }

    .text-black {
        color: #333;
    }
</style>

<div style="background-image: url('image/jbanner.jpg'); height:350px; width:100%; background-size:cover; background-position:top">

</div>

<section class="about-us section-padding pb-0">

    <div class="container">
        <div class="row">
            <div class="col-sm-4 p5">
                <a href="index.php?route=product/category&path=79_80">
                    <h3 class="text-center">Rings</h3>
                    <p class="text-center text-black">Discover rings for every style.</p>
                    <img src="image/categories/rings.jpg" alt="" class="img-responsive">
                    <p class="shop_link"> Shop Now > </p>
                </a>
            </div>
            <div class="col-sm-4 p5">
                <a href="index.php?route=product/category&path=79_82">
                    <h3 class="text-center">Earrings</h3>
                    <p class="text-center text-black">A perfect gift for any occasion.</p>
                    <img src="image/categories/earrings.jpg" alt="" class="img-responsive">
                    <p class="shop_link"> Shop Now > </p>
                </a>
            </div>
            <div class="col-sm-4 p5">
                <a href="index.php?route=product/category&path=79_83">
                    <h3 class="text-center">Bangles</h3>
                    <p class="text-center text-black">From basic to high-end fashion.</p>
                    <img src="image/categories/braclet.jpg" alt="" class="img-responsive">
                    <p class="shop_link"> Shop Now > </p>
                </a>
            </div>
        </div>
        <br /><br />
        <div class="row v-center img-row">
            <div class="col-sm-6 p5">
                <h3 class="text-center">Pendents</h3>
                <p class="text-center">Shine with elegance,<br /> our exclusive pendents brings joy to all occasions of life.
                    <br />
                    <a href="index.php?route=product/category&path=79_85">
                        <button class="btn btn-hero">Shop Now</button>
                    </a>
                </p>
            </div>
            <div class="col-sm-6">
                <img src="image/categories/pendents.jpg" alt="" class="img-responsive">
            </div>
        </div>


        <div class="row v-center img-row">
            <div class="col-sm-6 p5">
                <img src="image/categories/bangle.jpg" alt="" class="img-responsive">
            </div>
            <div class="col-sm-6 p5" style="text-align: right;">
                <h3 class="text-center">Bracelets</h3>
                <p style="text-align: right;" class="text-center">A diamond bracelet adds elegance to any look, <br /> while a modern gold
                    bangle boldly expresses your unique style.
                    <br />
                    <a href="index.php?route=product/category&path=79_84">

                        <button class="btn btn-hero">Shop Now</button>
                    </a>
                </p>
            </div>
        </div>

        <div class="row v-center img-row">
            <div class="col-sm-6 p5">
                <h3 class="text-center">Necklace</h3>
                <p class="text-center">From basic to high-end fashion From basic to high-end fashion.
                    <br />
                    <a href="index.php?route=product/category&path=79_86">
                        <button class="btn btn-hero">Shop Now</button>

                    </a>
                </p>
            </div>
            <div class="col-sm-6">
                <img src="image/categories/nacklace.jpg" alt="" class="img-responsive">
            </div>
        </div>



    </div>
</section>


<section style="background-color: #F8F8F8" class="about-us section-padding">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center p5">
                <br />
                <h3>Zayn's Exclusive Picks</h3>
                <p style="text-align: center;">Bestseller products across the portal, specailly handpicked for you.</p>
                <br />
            </div>
        </div>

        <div class="row">

            <?php $k = 0;
            foreach ($products_featured as $product) { ?>

                <!-- product single item start -->
                <div class="p_box col-sm-3">
                    <!-- product grid start -->
                    <div class="product-item">
                        <figure class="product-thumb">
                            <a href="<?php echo $product['href']; ?>">
                                <img class="pri-img" src="<?php echo $product['thumb']; ?>" alt="product">
                                <img class="sec-img" src="<?php print_r($product['popup']); ?>" alt="product">

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

                        </div>
                    </div>
                    <!-- product grid end -->
                </div>
            <?php } ?>

        </div>
        <div class="row">
            <div class="col-sm-12 text-center">
                <a href="index.php?route=product/category&path=87">
                    <button class="btn btn-hero">Shop Now</button>
                </a>

            </div>
        </div>
    </div>
</section>


<?php echo $footer; ?>