<?php echo $header; ?>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1;" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="index.php?route=common/home"><i class="fa fa-home"></i></a></li>


              <li class="breadcrumb-item active" aria-current="page">
                <a href="index.php?route=account/login">Login
                </a>
              </li>

            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->
<div style="width: 100%; margin-bottom:150px; padding-top:120px; min-height: 60vh;" class="container">
  <?php if ($error_warning) { ?>
  <style>
    .error_hand {
      border: thin solid #B15153
    }
  </style>
  <?php } ?>


  <div style="margin-top: 40px;" class="row">
    <div class="col-sm-12">


      <div style="text-align: center; background: #f1f1f1; padding: 30px;" class="col-sm-6 offset-sm-3">

        <div class="well">


          <h2 style=" padding-bottom:7.5px;   border-bottom:1px solid #f1f1f1">Sign
            in to your account</h2>

          <br />
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">

            <div class="form-group">
              <div class="row">
                <div class="col-sm-10 offset-sm-1">
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="Email *" id="input-email"
                    class="form-control error_hand" />
                </div>
              </div>
            </div>

            <div class="form-group">
              <div class="row">
                <div class="col-sm-10 offset-sm-1">
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="Password *"
                    id="input-password" class="form-control error_hand" />

                </div>
              </div>




            </div>
            <div class="row">
              <div class="col-sm-10 offset-sm-1">
                <button style="margin-top:5px; " class="btn btn-hero" type="submit">
                  LOGIN
                </button>
              </div>
            </div>

            <br /><a style="color:#333" href="<?php echo $forgotten; ?>"><u>FORGOTTEN YOUR PASSWORD ?</u></a>

            <?php if ($redirect) { ?>

            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />

            <?php } ?>

          </form>

        </div>

      </div>
    </div>

    <div style="margin: auto; margin-top:20px;" class="row">
      <div class="col-sm-12">
        <p style="text-transform:uppercase; letter-spacing:2px">Don't have an account?

          <a style="margin-top: 10px; text-decoration:underline; color:#4A4A4A" href="<?php echo $register; ?>">
            Register Here
          </a>
        </p>
      </div>



      <?php echo $content_bottom; ?>
    </div>


  </div>
  <?php if ($error_warning) { ?>
  <div style="text-align:center" class="row">
    <br />
    <div class="col-sm-6 offset-sm-3">
      <p style="color:#A44446">Your Email address or password is incorrect or not registered at Zayn Jewels.</p>

    </div>
  </div>
  <?php }?>
</div>



</div>

<?php echo $footer; ?>