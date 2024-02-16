<?php echo $header; ?>
<style>
    .banner-text2 {
        color: #423c9e;
        font-size: 22px;
    }

    .leaf {
        width: 160px;
        position: absolute;
        z-index: 9999;
        right: -50px;
        top: -50px;
        transform: rotate(20deg);
    }

    .demo-msg {
        display: none !important;
    }
</style>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1;" class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.php?route=common/gallery"><i class="fa fa-home"></i></a></li>
                            <li class="breadcrumb-item active" aria-current="page">Gallery</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->
<div class="banner-statistics-area ptb-30">
    <div class="container ptb-30">

        <div class="row">

            <div class="col-sm-12">
                <img src="image/leaf-2.png" alt="" class="img-responsive leaf">
                <div class="row row-20 mtn-20">
                    <div class="col-sm-6">
                        <figure class="banner-statistics mt-20">
                            <a href="index.php?route=common/g1">
                                <img src="assets/img/banner/imgb1.jpg" alt="product banner">
                            </a>
                            <div class="banner-content text-right">

                                <h2 class="banner-text2">Conflict Free <span>Diamonds</span></h2>
                                <a href="index.php?route=common/g1" class="btn btn-text">Learn more</a>
                            </div>
                        </figure>
                    </div>

                    <div class="col-sm-6">
                        <figure class="banner-statistics mt-20">
                            <a href="index.php?route=common/g3">
                                <img src="assets/img/banner/imgb2.JPG" alt="product banner">
                            </a>
                            <div class="banner-content text-center">
                                <h2 class="banner-text2">Metal <span>Education</span></h2>
                                <a href="index.php?route=common/g3" class="btn btn-text">Learn More</a>
                            </div>
                        </figure>
                    </div>


                    <div class="col-sm-6">
                        <figure class="banner-statistics mt-20">
                            <a href="index.php?route=common/g4">
                                <img src="assets/img/banner/imgb3.JPG" alt="product banner">
                            </a>
                            <div class="banner-content text-right">
                                <h2 class="banner-text2">Gemstone<span>Education</span></h2>
                                <a href="index.php?route=common/g4" class="btn btn-text">Learn More</a>
                            </div>
                        </figure>
                    </div>


                    <div class="col-sm-6">
                        <figure class="banner-statistics mt-20">
                            <a href="index.php?route=common/g2">
                                <img src="assets/img/banner/imgb4.jpg" alt="product banner">
                            </a>
                            <div class="banner-content text-center">

                                <h2 class="banner-text2">Diamond <span>Education</span></h2>
                                <a href="index.php?route=common/g2" class="btn btn-text">Learn more</a>
                            </div>
                        </figure>


                    </div>

                </div>



            </div><br />

        </div>


    </div>
    <div class="row">
        <div class="col-sm-10 offset-sm-1">

            <div style="height: 750px;" class="flip-book-container solid-container" src="assets/js/src/test.pdf">

            </div>


        </div>
    </div>


</div>
</div>

<script src="assets/js/src/html2canvas.min.js"></script>
<script src="assets/js/src/three.min.js"></script>
<script src="assets/js/src/pdf.min.js"></script>

<script src="assets/js/src/3dflipbook.min.js"></script>


<script type="text/javascript">
    $('.solid-container').FlipBook({
        pdf: 'assets/js/src/test.pdf'
    });

    $('.demo-msg').hide();
</script>

<?php echo $footer; ?>