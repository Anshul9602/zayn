<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8">
   <![endif]-->
<!--[if IE 9 ]>
   <html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9">
      <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        <?php echo $title; ?>
    </title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">



    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/vendor/font-awesome.min.css">

    <!-- jQuery JS -->
    <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="assets/js/vendor/popper.min.js"></script>


    <script src="assets/js/vendor/bootstrap.min.js"></script>

    <!-- Pe-icon-7-stroke CSS -->
    <link rel="stylesheet" href="assets/css/vendor/pe-icon-7-stroke.css">
    <!-- Slick slider css -->
    <link rel="stylesheet" href="assets/css/plugins/slick.min.css">
    <!-- animate css -->
    <link rel="stylesheet" href="assets/css/plugins/animate.css">

    <!-- jquery UI css -->
    <link rel="stylesheet" href="assets/css/plugins/jqueryui.min.css">
    <!-- main style css -->
    <link href="assets/css/style.css?v1.15266" rel="stylesheet">
    <script type="text/javascript" src="catalog/view/javascript/js.cookie.min.js"></script>
    <link href="https://fonts.cdnfonts.com/css/trajan" rel="stylesheet">
    <!-- jquery UI JS -->
    <script src="assets/js/plugins/jqueryui.min.js"></script>
    <script src="catalog/view/javascript/ajaxchimp.js"></script>

    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
        media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script src="catalog/view/javascript/common.js?v1.1343" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>

    <script>
        function setCookie(key, value, expiry) {
            var expires = new Date();
            expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
            document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
        }

        function getCookie(key) {
            var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
            return keyValue ? keyValue[2] : null;
        }

        function eraseCookie(key) {
            var keyValue = getCookie(key);
            setCookie(key, keyValue, '-1');
        }
    </script>

    <style>
        .about-us ul li {
            list-style: none;
        }

        .main-menu ul.header-style-4>li a {
            margin: 10px 25px;
            font-size: 16px;
        }

        @media screen and (min-width: 1140px) and (max-width:1400px) {
            .container {
                max-width: 1140px;
            }

            .main-menu ul.header-style-4>li a {
                margin: 10px 15px;
                font-size: 14px;
            }
        }

        @media screen and (min-width: 1451px) {
            .container {
                max-width: 1400px;
            }
        }




        .sticky.is-sticky .main-menu li a {
            padding: 20px 0px;
        }

        .subbox,
        .thanksbox {
            width: 360px;
            z-index: 99999;
            background-color: #EAE2D7;
            padding: 60px 40px;
            border: 12.5px solid #b2b0df;
            position: fixed;
            top: 20%;
            left: 50%;
            display: none;
            margin-left: -180px;
        }

        .subover {
            width: 100%;
            height: 100vh;
            display: none;
            position: fixed;
            top: 0px;
            left: 0px;
            z-index: 9999;
            background: rgb(0, 0, 0, 0.4);
        }

        .mobile-navigation {
            max-height: none;
        }
    </style>


</head>

<body style="overflow-x: hidden;" class="<?php echo $class; ?>">
    <header class="header-area">
        <!-- main header start -->
        <div class="main-header d-none d-lg-block">
            <nav id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <span id="donate-msg">
                                <a style="color:#fff; text-transform: initial" href="mailto:info@zaynjewels.com">
                                    <li class="fa fa-envelope"></li> &nbsp;Info@zaynjewels.com
                                </a>
                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                <span>
                                    <li class="fa fa-phone"></li> +1 (949) 900-6910
                                </span>

                            </span>

                        </div>
                        <div class="col-sm-4 text-center">

                        </div>
                        <div class="col-sm-4 workshop-link">
                            <span id="donate-msg">

                                <?php if (!$logged) { ?>
                                <a style="color:#fff" href="index.php?route=account/register">
                                    Hello, There!
                                </a>
                                <?php } else { ?>
                                <a style="color:#fff" href="index.php?route=account/account">
                                    <?php echo $text_customer_name; ?>!
                                </a>
                                <?php } ?>

                            </span>

                        </div>
                    </div>
                </div>
            </nav>
            <!-- header middle area start -->
            <div class="header-main-area main-menu-area sticky">
                <div class="container">
                    <div class="row align-items-center ptb-10 ">
                        <!-- header social area start -->
                        <div class="col-lg-2">
                            <a href="<?php echo $home; ?>">
                                <img style="max-width:100px" src="<?php echo $logo; ?>" alt="Brand Logo">
                            </a>
                        </div>
                        <!-- header social area end -->

                        <!-- start logo area -->
                        <div class="col-lg-8 ">
                            <div class="text-center main-menu ">
                                <!-- main menu navbar start -->
                                <nav class="desktop-menu">
                                    <ul class="justify-content-center header-style-4">
                                       
                                        <li>
                                            <a href="index.php?route=common/jewelry">Jewelry</a>
                                            <ul class="dropdown">
                                                <li><a href="index.php?route=product/categorynew&path=79_80" style="padding: 20px 20px 10px 20px;">Rings</a></li>
                                                <li><a href="index.php?route=product/categorynew&path=79_82">Earrings</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=79_83">Bangles</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=79_85">Pendants</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=79_84">Bracelets</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=79_86">Necklaces</a>
                                                </li>
                                            </ul>
                                        </li>
                                        
                                        <li>
                                            <a href="index.php?route=common/collection">Collections</a>
                                            <ul class="dropdown">
                                                <li><a href="index.php?route=product/category&path=99">Tennis Connection</a></li>
                                                <li><a href="index.php?route=product/category&path=95">Zayn Lite</a>
                                                </li>
                                                <li><a href="index.php?route=product/category&path=106">Cross Collection</a>
                                                </li>
                                                <li><a href="index.php?route=product/category&path=107">Hoops Collection</a>
                                                </li>
                                               
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="index.php?route=common/diamondsdemo">Natural Diamonds</a>
                                            <ul class="dropdown">
                                                <li> <a href="index.php?route=common/diamondsdemo">Melee Diamonds</a>
                                                </li>
                                                <li> <a href="index.php?route=common/giadiamonds">GIA Certified
                                                        Diamonds</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a onclick="return false;" href="#">Catalog</a>
                                            <ul class="dropdown">
                                                <li><a href="index.php?route=common/catalogue" style="text-transform: inherit;">Brochures and Catalog
                                                    </a></li>
                                                <li><a
                                                        href="index.php?route=extension/d_blog_module/category1&category_id=1">Zayn
                                                        Blog </a></li>
                                               

                                            </ul>
                                        </li>
                                      
                                    </ul>
                                </nav>
                                <!-- main menu navbar end -->
                            </div>
                        </div>
                        <!-- start logo area -->

                        <!-- mini cart area start -->
                        <div class="col-lg-2">
                            <div class="header-right d-flex align-items-center justify-content-end">
                                <div class="header-configure-area">
                                    <ul class="nav justify-content-end">
                                        <li class="header-search-container mr-0">
                                            <button class="search-trigger d-block">
                                                <i class="pe-7s-search"></i>
                                            </button>
                                            <div class="header-search-box d-none animated fadeInLeft">
                                                <input type="text" id="search_top" placeholder="Search"
                                                    class="header-search-field">
                                                <button class="search_icon_top header-search-btn"><i
                                                        class="pe-7s-search"></i></button>
                                            </div>
                                        </li>
                                        <li class="user-hover">
                                            <a onClick="return false;" href="#">
                                                <i class="pe-7s-user"></i>
                                            </a>
                                            <ul class="dropdown-list">
                                                <?php if (!$logged) { ?>

                                                <li><a href="index.php?route=account/login">Login</a></li>
                                                <li><a href="index.php?route=account/register">Register</a></li>
                                                <?php } else { ?>
                                                <li><a href="index.php?route=account/account">My account</a></li>
                                                <li><a href="index.php?route=account/logout">Logout</a></li>

                                                <?php } ?>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="<?php echo $wishlist; ?>">
                                                <i class="pe-7s-like"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="index.php?route=checkout/cart" class="minicart-btn cart_icon">
                                                <i class="pe-7s-shopbag"></i>
                                                <div id="cart_count" class="notification">
                                                    <?php echo $text_items; ?>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- mini cart area end -->
                    </div>

                </div>
            </div>
            <!-- header middle area end -->
        </div>
        <!-- main header start -->
        <!-- mobile header start -->
        <!-- mobile header start -->
        <div class="mobile-header d-lg-none d-md-block sticky">
            <!--mobile header top start -->
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-12">
                        <div style="display: inline;" class="mobile-main-header">
                            <div style="display: inline;" class="mobile-menu-toggler">
                                <div class="row">
                                    <div class="col-3">
                                        <div style="margin-top: 20px;" class="mini-cart-wrap">
                                            <a href="index.php?route=checkout/cart">
                                                <i class="pe-7s-shopbag"></i>
                                                <div class="notification">
                                                    <?php echo $text_items; ?>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-6 text-center">

                                        <a href="index.php?route=common/home">
                                            <img style="width: 80px;" src="<?php echo $logo; ?>" alt="Brand Logo">
                                        </a>

                                    </div>
                                    <div class="col-3">
                                        <button style="margin-top: 20px;" class="mobile-menu-btn">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile header top start -->
        </div>
        <!-- mobile header end -->
        <!-- mobile header end -->

        <!-- offcanvas mobile menu start -->
        <!-- off-canvas menu start -->
        <aside class="off-canvas-wrapper">
            <div class="off-canvas-overlay"></div>
            <div class="off-canvas-inner-content">
                <div class="btn-close-off-canvas">
                    <i class="pe-7s-close"></i>
                </div>

                <div class="off-canvas-inner">
                    <!-- search box start -->
                    <div class="search-box-offcanvas">
                        <form>
                            <input type="text" placeholder="Search Here...">
                            <button class="search-btn search-btn-mobile"><i class="pe-7s-search"></i></button>
                            <script>
                                $('.search-btn-mobile').click(function (e) {
                                    e.preventDefault();
                                    if ($(this).prev().val() != "") {
                                        location = 'index.php?route=product/search' + '&search=' + encodeURIComponent($(this).prev().val()) + '&description=true';
                                    }
                                })
                            </script>
                        </form>
                    </div>
                    <!-- search box end -->

                    <!-- mobile menu start -->
                    <div class="mobile-navigation">

                        <!-- mobile menu navigation start -->
                        <nav>
                            <ul style="padding-left:30px" class="mobile-menu">
                               
                                <li>
                                    <a href="index.php?route=common/jewelry">Jewelry</a>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="index.php?route=common/collection">Collections</a>
                                    <ul class="dropdown">
                                    <li><a href="index.php?route=product/categorynew&path=99">Tennis Connection</a></li>
                                                <li><a href="index.php?route=product/categorynew&path=95">Zayn Lite</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=106">Cross Collection</a>
                                                </li>
                                                <li><a href="index.php?route=product/categorynew&path=107">Hoops Collection</a>
                                                </li>
                                                </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="index.php?route=common/diamondsdemo">Natural Diamonds</a>
                                    <ul class="dropdown">
                                        <li> <a href="index.php?route=common/diamondsdemo">Melee Diamonds</a>
                                        </li>
                                        <li> <a href="index.php?route=common/giadiamonds">GIA Certified Diamonds</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Catalog</a>
                                    <ul class="dropdown">
                                        <li><a href="index.php?route=common/catalogue" style="text-transform: inherit;">Brochures and Catalog </a></li>
                                        <li><a href="index.php?route=extension/d_blog_module/category1&category_id=1">Zayn
                                                Blog </a></li>
                                        
                                    </ul>
                                </li>
                                
                            </ul>
                        </nav>
                        <!-- mobile menu navigation end -->
                    </div>
                    <!-- mobile menu end -->

                    <div class="mobile-settings">
                        <ul class="nav">
                            <!-- <li>
                                <div class="dropdown mobile-top-dropdown">
                                    <a href="#" class="dropdown-toggle" id="currency" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <a class="dropdown-item" href="#">$ USD</a>
                                    </a>

                                </div>
                            </li> -->
                            <li>
                                <div class="dropdown mobile-top-dropdown">
                                    <a href="#" class="dropdown-toggle" id="myaccount" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                        My Account
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="myaccount">

                                        <?php if (!$logged) { ?>

                                        <a class="dropdown-item" href="index.php?route=account/login">Login</a>
                                        <a class="dropdown-item" href="index.php?route=account/register">Register</a>
                                        <?php } else { ?>
                                        <a class="dropdown-item" href="index.php?route=account/account">My account</a>
                                        <a class="dropdown-item" href="index.php?route=account/logout">Logout</a>

                                        <?php } ?>
                                    </div>

                            </li>
                        </ul>
                    </div>

                    <!-- offcanvas widget area start -->
                    <div class="offcanvas-widget-area">
                        <div class="off-canvas-contact-widget">
                            <ul>
                                <li><i class="fa fa-mobile"></i>
                                    <a href="#">+1 (949) 900-6910</a>
                                </li>
                                <li><i class="fa fa-envelope-o"></i>
                                    <a href="#">Info@zaynjewels.com</a>
                                </li>
                            </ul>
                        </div>
                        <div class="off-canvas-social-widget">
                            <a target="_blank" href="https://www.facebook.com/zaynjewels/"><i
                                    class="fa fa-facebook"></i></a>

                            <a target="_blank" href="https://www.instagram.com/zaynjewels/"><i
                                    class="fa fa-instagram"></i></a>
                            <a target="_blank" href="https://www.youtube.com/channel/UC0KmddVZ3BX4Ly5jjBRW7SA"><i
                                    class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                    <!-- offcanvas widget area end -->
                </div>
            </div>
        </aside>
        <!-- off-canvas menu end -->
        <!-- offcanvas mobile menu end -->

        <div class="subover">

        </div>

        <div class="subbox">
            <div style="margin-bottom:20px; position:relative;" class="col-sm-12 text-center">
                <p style="color: #333; font-size: 14px;">
                    Be the first to hear from us
                    <br />
                    New Launches | Sales | Surprises
                    <br /><br />
                    <i>Sign Up Today and get</i>
                    <br />
                <h2 style="font-family: noe;">Exclusive Deals</h2>
                </p>


                <div class="clear">
                    <form class="newsletter-inner" id="mc-form">
                        <input type="email" value="" id="mc-email" autocomplete="off" style="height:40px; width:100%"
                            name="EMAIL" class="required email mail_boxj form-control"
                            placeholder="Enter your email address">
                        <br />
                        <button style="width:100%;" id="mc-submit" class="btn btn-hero">
                            JOIN US
                        </button>
                    </form>
                </div>

                <span style="position:absolute; top:-60px; right:-35px; cursor:pointer"
                    class="thanksbox-close">Close</span>
            </div>



        </div>

        <div class="thanksbox">
            <div style="margin-bottom:20px;" class="col-sm-12 text-center">
                <h3 style="text-transform:uppercase; color: #2D2F21; font-family:noe;">Thank You. </h3>
                <p>You will receive <br />
                <h3>Exclusive Updates</h3><br />Right in your inbox soon.
                </p>

                <div class="clear">
                    <button style="width:100%;" class="btn btn-hero thanksbox-close">
                        CLOSE
                    </button>
                </div>
            </div>

        </div>


    </header>

    <script>
        $(document).ready(function () {
            if (Cookies.get("sub") != "1") {
                setTimeout(function () {
                    $(".subover,.subbox").fadeIn();
                    $("body,html").css("overflow-y", "hidden");
                }, 5000);
                Cookies.set("sub", "1", {
                    expires: 2,
                });
            }

            $(".subover, #close_sub").click(function () {
                $(".subover,.subbox").fadeOut();
                $("body,html").css("overflow-y", "auto");
            });
            $(".thanksbox-close").click(function () {
                $(".subover,.subbox,.thanksbox").fadeOut();
                $("body,html").css("overflow-y", "auto");
            });


        });


        // Mailchimp for dynamic newsletter
        $('#mc-form').ajaxChimp({
            language: 'en',
            callback: mailChimpResponse,
            // ADD YOUR MAILCHIMP URL BELOW HERE!
            url: 'https://bariindia.us2.list-manage.com/subscribe/post?u=ce056081903b77c94f5ce2dfa&amp;id=43b9b3c482'

        });

        // mailchimp active js
        function mailChimpResponse(resp) {
            if (resp.result === 'success') {
                $(".subover").fadeIn();
                $(".subbox").fadeOut();
                $(".thanksbox").fadeIn();
                $(".mail_boxj").val("");

            } else if (resp.result === 'error') {
                $(".subover").fadeIn();
                $(".subbox").fadeOut();
                $(".thanksbox").fadeIn();
                $(".mail_boxj").val("");
            }
        }
    </script>