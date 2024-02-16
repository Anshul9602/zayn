<?php echo $header; ?>
<style>
.slick-arrow{
    display:none !important;
}
.custom-slider{
    border:3px solid #423c9e;
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
    color:#333;
}
.p5 {
    padding: 15px;
    text-align:center;
}
.m1{
    width:100%;
    max-width:420px;
}

</style>
 <img src="assets/cad/195.jpg" class="img-fluid">
<br /><br /><br />
<div class="container">
    <div class="row" style="display:flex; align-items:center ">
        <div class="col-sm-6">
           <h3 style="color:#423c9e">CAD/CAM Services</h3><br />
           <p style="text-align:justify; font-size:16px">Create any piece of jewelry you like. Upload your ideas in the form of an image, art work , photo. Fill in the form with the details of the piece to be created and we will create a CAD and rendering.
<br /><br />
A one time fee of $35 is charged which includes 3 corrections. Any additional changes or corrections will be charged separately. Let our designers bring your vision to life.</p>
        </div>
        <div class="col-sm-2" style="margin-bottom:20px;"></div>
        <div class="col-sm-4">
           <div class="custom-slider">
            <img src="assets/cad/1.jpg"  class="img-fluid">
             <img src="assets/cad/2.jpg"  class="img-fluid">
              <img src="assets/cad/3.jpg"  class="img-fluid">
               <img src="assets/cad/4.jpg"  class="img-fluid">
           </div>
        </div>
    </div>

    <br /><br /><br /><br />
</div>

<section style="background-color:#F8F8F8">
<br /><br /><br />
<div class="container">
  <div class="row">
            <div class="col-sm-6 p5">
                <a href="cad-cam-services">
                    <h3 class="text-center">Sketch or Image</h3>
                    <p class="text-center text-black">Upload your sketch or image and receive a quote and
                    <br class="d-none d-lg-block" />render within 3-4 business days.</p>
                    <img src="assets/cad/6.jpg" alt="" class="img-responsive m1">
                    <p class="shop_link"> Start Creating &gt; </p>
                </a>
            </div>
            <div class="col-sm-6 p5">
                <a href="cad-cam-services" >
                    <h3 class="text-center">CAD Design</h3>
                    <p class="text-center text-black">Upload your digital CAD file and receive a quote <br class="d-none d-lg-block" />and render within 3-4 business day.</p>
                    <img src="assets/cad/7.jpg" alt="" class="img-responsive m1">
                    <p class="shop_link"> Start Creating &gt; </p>
                </a>
            </div>

        </div>
</div>
<br /><br /><br />
</section>


<?php echo $footer; ?>

<script>
$(".login-redirect-1").click(function(e) {
      e.preventDefault();
      setCookie('login_redirect', 'https://www.zaynjewels.com/cad-cam-services', '1'); //(key,value,expiry in days)
      window.location = "index.php?route=account/login";
   })
$('.custom-slider').slick({
  dots: false,
  infinite: true,
  speed: 300,
  navigation:false,
  slidesToShow: 1,
  autoplay: true,
  autoplaySpeed: 2000,
  adaptiveHeight: true
});
</script>
