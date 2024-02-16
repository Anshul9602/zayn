<?php echo $header; ?>

<style>
  .ac_menu .col-sm-3 {
    padding: 20px;
    margin: 0px;
    text-align: center;
  }

  .ac_menu .col-sm-3 .col-sm-12 {
    border: thin solid #ccc;
    padding: 10px;
    height: 228px
  }

  .col-sm-12 .atag {
    font-size: 18px;
    color: #525252
  }

  .ac_description {
    margin-top: 12px;
    font-weight: 300 !important;
    color: #333
  }
</style>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- breadcrumb area start -->
<div style="background:#f1f1f1; border-bottom:thin solid #fff" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.php?route=common/home"><i class="fa fa-home"></i></a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">account</li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->


<div style=" width:100%; min-height: 600px;" class="container">



  <div style="margin:60px 0px" class="row text-center">

    <h1 style="text-align: center; margin: auto;" class="big">My Account</h1>


  </div>



  <div class="row">
    <div id="content" class="col-sm-12">

      <?php echo $content_top; ?>



      <div class="row ac_menu">




        <div class="col-sm-3">
          <a class="col-sm-12" href="index.php?route=account/address/edit&address_id=<?php echo $address_id; ?>" style="display:block;">
            <img width="120" src="image/icons/Icon1.png" /><br />
            <p class="atag">Account
              Details</p>
            <p class="ac_description">Review your personal information.</p> <br />
          </a>
        </div>


        <div class="col-sm-3">
          <a class="col-sm-12" href="<?php echo $wishlist; ?>" style="display:block;">
            <img width="120" src="image/icons/Icon3.png" /><br />
            <p class="atag">Wishlist</p>
            <p class="ac_description">Don't lose sight of the articles you like most, access your wishlist here.
            </p>
          </a>
        </div>


        <div class="col-sm-3">
          <a class="col-sm-12" href="<?php echo $order; ?>" style="display:block;">
            <img width="120" src="image/icons/Icon2.png" /><br />
            <p class="atag">Order History</p>
            <p class="ac_description">Check the history and current status of your orders.</p>

          </a>

        </div>

        
        <div class="col-sm-3">
          <a class="col-sm-12" href="index.php?route=account/draft" style="display:block;">
            <img width="120" src="image/icons/Icon5.png" /><br />
            <p class="atag">Saved Drafts</p>
            <p class="ac_description">Check your saved drafts.</p>

          </a>

        </div>







      </div>






    </div>
  </div>

</div>
<?php echo $footer; ?>
