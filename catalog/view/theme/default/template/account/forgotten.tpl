<?php echo $header; ?>
<style>
  @media only screen and (max-width: 900px) {
    .msg{
      text-align: center; font-weight: 700;
      font-size: 14px !important;
     }
     .modal-content1 {
      width: 80% !important;
      height: 50% !important;
     }
  }
  .modal1 {
    /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left:0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0,0,0); /* Fallback color */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
 }
 
 /* Modal Content */
 .modal-content1 {
   position: relative;
   background-color: #fefefe;
   margin: auto;
   padding: 0;
   border: 1px solid #888;
   width: 30%;
   height: 35%;
   box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
   -webkit-animation-name: animatetop;
   -webkit-animation-duration: 0.4s;
   animation-name: animatetop;
   animation-duration: 0.4s
 }
 
 /* Add Animation */

 .msg{
  text-align: center; font-weight: 700;
  font-size: 16px;
 }
 /* The Close Button */

 

 .modal-header {
   padding: 2px 16px;
   background-color: #5cb85c;
   color: white;
 }
 
 .modal-body {padding: 2px 16px;}
 

</style>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1;" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <?php foreach ($breadcrumbs as $breadcrumb) { ?>
              <li class="breadcrumb-item"><a
                  href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
              <?php } ?>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->

  


<div style="padding-top:150px; min-height:400px; padding-bottom:150px" class="container">
  <?php if ($send) { ?>
  <div id="myModal" class="modal1">

    <!-- Modal content -->
    <div class="modal-content1">
     
      <div class="modal-body mt-5">
        <p class="msg"><?php echo $send; ?></p>
       
      </div>
      <div class="modal-footer text-center mt-5" style="display: block;">
        <a href="<?php echo $redirct; ?>"><button type="button" class="btn btn-primary" style="padding:10px 20px;    background: #423c9e;color:#fff;">OK</button></a>
      </div>
    </div>
  
  </div> <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div id="content" class="col-sm-10 offset-sm-1"><?php echo $content_top; ?>
    <br />
    <div class="row">
      <div style="text-align:center" class="col-sm-12">
        <h3 style="text-transform:uppercase"><?php echo $heading_title; ?></h3>
      </div>
    </div>
    <div style="margin-top:30px" class="row">
      <div class="col-sm-6" style="margin: auto;">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <div class="form-group required">
              <div class="col-sm-12">
                <input type="email" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email"
                  class="form-control" />

              </div>
              <div style="margin-top:30px" class="col-sm-12">
                <div class="buttons clearfix">

                  <div class="pull-left">
                    <a href="<?php echo $back; ?>">
                      <button class="btn btn-hero">
                        <span>back</span>
                      </button>
                    </a>
                  </div>

                  <div class="pull-right">
                    <button type="submit" class="btn btn-hero"onclick="myFunction()">
                      <span><?php echo $button_continue; ?></span>
                    </button>
                  </div>
                </div>

              </div>

              <?php if(isset($success_password)){?>
              <div class="col-sm-10 col-sm-offset-1">
                <p><?php echo $success_password;?><a href="index.php?route=account/login">Login again</a>
                </p>
              </div>
              <?php }?>
            </div>
          </fieldset>
        </form>
      </div>
    </div>

    <?php echo $content_bottom; ?>
  </div>
</div>
</div>

<script>

</script>


<?php echo $footer; ?>