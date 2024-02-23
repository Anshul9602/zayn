<?php echo $header; ?>

<style>
  .mob-padding {
    padding: 0px 230px;
  }

  .half-row {
    width: 50%;
  }
.mob{
display: none;
}

.slote div{
cursor: pointer;
}

  @media screen and (max-width:650px) {
    .mob-padding {
      padding: 0px 20px;
    }
.desk{
display: none;}
.mob{
display: block;}
    .half-row {
      width: 100%;
    }


  }

  /* Birthstone section start  */
  .heading1 {

    font-family: "Lato", sans-serif;
    ;
    font-weight: 400;
    color: #100e31;
    line-height: 1em;
    letter-spacing: .7px;
    border-bottom: 1px solid #100e31;
    margin-bottom: 0.7em;
    padding-bottom: 0.7em;
    text-align: left;
  }

  .banner-statistics:hover img {
    opacity: 1 !important;
  }

  .heading3 {
    font-weight: 400;
    font: gray;
    font-family: 'brown std regular alt', sans-serif;
  }

  #heading2 {
    font-family: "Lato", sans-serif;
    ;
    letter-spacing: .7px;
    display: inline-block;
    font-size: 21px;
    text-transform: uppercase;
    text-align: center;
    padding-top: 8px;
  }

  .birthstone {
    margin-left: 15%;
    padding: 3%;
    background-color: #e7e7f5;
    height: 42vh;
    width: 70%;
  }

  .one {
    width: 80%;
    text-align: justify;
    font-size: small;
    font-family: "Lato", sans-serif;
    ;
    line-height: 1.5;

  }

  .grid1 {
    display: grid;
    grid-template-columns: 75% auto;
    /* grid-template-columns: repeat(6); */
  }

  .img1 {
    position: absolute;
    width: 20%;
    height: 30%;
  }

  .januarydiv {
    margin-top: 18vh;
    display: grid;
    grid-template-columns: 40% auto;
    padding-bottom: 15px;
    text-align: center;
  }

  .redrubby {
    margin-left: 15%;
    padding-bottom: 15px;
    width: 250px;
  }

  .textcenter1 {
    font-size: 21px;
    font-family: "Lato", sans-serif;
    ;
    color: #4a4a4a;
    padding-top: 8px;
    padding-bottom: 6px;
  }

  .textcenter {
    font-size: 21px;
    text-transform: uppercase;
    font-family: "Lato", sans-serif;
    ;
    color: #4a4a4a;
    text-align: center;
    padding-top: 8px;
    padding-bottom: 6px;
    line-height: 40px;
    font-weight: 400;
  }

  .textcenter p {
    line-height: 1.5;
    text-align: center;

  }

  .shopbtn {
    margin-top: 2vh;
    padding: 1.5vh;
    border: 0px;
    background-color: #2D2E4A;
    color: white;
  }

  .grid2 {
    display: grid;
    grid-template-columns: 171px 171px 171px 171px 171px 171px;
    grid-gap: 30px;
    justify-content: center;
  }

  .griditem2 {
    text-align: center;
    /* border: 1px rgb(212, 209, 209) solid; */
  }

  .bottombr {
    border-bottom: 1px rgb(212, 209, 209) solid;
    padding-top: 20px;
  }

  .circle-image:hover {
    background-color: #f1d9ce;
  }

  .circle-image1:hover {
    background-color: #e6d5e6;
  }

  .circle-image2:hover {
    background-color: #b8d0da;
  }

  .circle-image4:hover {
    background-color: #e9eef3;
  }

  .circle-image5:hover {
    background-color: #99b7ac;
  }

  .circle-image6:hover {
    background-color: #d0d3d1;
  }

  .circle-image7:hover {
    background-color: #cab0af;
  }

  .circle-image8:hover {
    background-color: #bed07d;
  }

  .circle-image9:hover {
    background-color: #93a9d0;
  }

  .circle-image10:hover {
    background-color: #e2aec6;
  }

  .circle-image11:hover {
    background-color: #efd77f;
  }

  .circle-image12:hover {
    background-color: #cedada;
  }

  .text20 {
    font-size: 25px;
  }

  .gridimg {
    width: 100%;
  }

  .circle-image {
    border-radius: 100%;
    overflow: hidden;
    position: relative;
    width: 100%;
    border: 1px rgb(212, 209, 209) solid;
    margin-top: 10px;
  }

  .circle-image1 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image2 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image4 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image5 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image6 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image7 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image8 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image9 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image10 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image11 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .circle-image12 {
    border-radius: 60%;
    overflow: hidden;
    position: relative;
    width: 100%;
    margin-top: 10px;
    border: 1px rgb(212, 209, 209) solid;
  }

  .para {
    font-family: "Lato", sans-serif;
    ;
    text-align: justify;
    font-size: 2.5vh;
    line-height: 2;
  }

  .para1 {
    font-family: "Lato", sans-serif;
    font-weight: 400;
    font-size: 15px;
    line-height: 1.8;
    padding-bottom: 12px;
    text-align: justify;
  }

  .footer1 {
    background-repeat: no-repeat;
    background-size: cover;
    position: center;
  }

  .grid3 {
    margin-top: 0;
    display: grid;
    grid-template-columns: 50% auto;
  }

  .griditem3 {
    padding-top: 40%;
    margin-bottom: 0;
  }

  .shopall {
    width: 100%;
    margin-top: 2vh;
    padding: 1.5vh;
    border: 0px;
    background-color: #2D2E4A;
    color: white;
  }

  .ringimg {
    margin-top: 0%;
    width: 100%;
    position: auto;

  }

  @media (max-width: 480px) {

    .main {
      margin: 0%;
    }

    .navimg {
      display: none;
    }

    .header {
      width: 100%;
      color: black;
      height: 3vh;
      padding: 2% 0% 2% 0%;
      background-color: transparent;
      text-align: center;
      border-bottom: 1px solid black;

    }

    .tag {
      display: none;
    }

    .navul {
      padding: 2%;
      margin: 0% 5% 0% 5%;
    }

    .grid2 {
      display: grid;
      grid-template-columns: auto auto;
    }

    .ringimg {
      display: none;
    }

    .img1 {
      display: none;
    }

    .redrubby {
      margin: 0%;
    }

    .grid1 {
      display: inline-block;
    }

    .one {
      margin: 0%;
    }

    .heading1 {
      text-align: center;
      margin: 0%;
      font-size: medium;
    }

    .birthstone {
      background-color: rgb(201, 201, 201);
      height: 60vh;
      margin: 0% auto 0% auto;
      align-content: center;

    }

    .januarydiv {
      margin-top: 0%;
      display: grid;
      grid-template-columns: auto;
    }

    .grid3 {
      display: grid;
      grid-template-columns: auto;

    }

    .shopbtn {
      margin-top: 0%;
    }

    .one {
      margin: 0%;
      width: 100%;
    }

    .griditem .redrubby {
      margin: 0% auto 0% auto;
      width: 100%;
      margin-top: -40%;
    }

    .griditem3 {
      padding: 3%;
    }

    .bluenile {
      font-size: 150%;
      display: inline-block;
    }
  }

  .januarydiv {
    margin-top: 5vh;
  }

  /* Birthstone section end */
</style>

<br /><br />
<h2 style="text-align:center; color:#423c9e;">History of Cross Jewelry</h2>

<div class="banner-statistics-area ptb-30">
  <div class="container ptb-30">
    <div class="row">
      <div class="col-sm-12">
        <div class="row row-20 mtn-20" style=" padding:20px">
          <div class="col-12">
            <figure class="banner-statistics mt-20">

              <img class="desk" src="image/blog24.jpg" alt="product banner">
              <img class="mob" src="image/blog221.jpg" alt="product banner">


            </figure>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="col-12 container mob-padding" style=" justify-content:center">
  <p class="para1 ">Cross necklaces have a long and varied history, deeply intertwined with religious, cultural, and
    fashion traditions. <br>
    The cross is a central symbol in Christianity, representing the crucifixion of Jesus Christ and his sacrifice for
    humanity's salvation. <br><br>
    In the early days of Christianity, wearing a cross as a necklace wasn't common due to the persecution of Christians.
    However, as Christianity gained acceptance and eventually became the state religion of the Roman Empire, the cross
    began to be displayed more openly.<br><br>
    Crosses can also be a symbol of sacrifice, faith, and victory over death. The wearing of a cross necklace can serve
    as a personal reminder of these beliefs and can also be worn as a symbol of one's faith.<br><br>
    During the medieval and Renaissance eras, crosses were typically simple and made of materials such as wood, bone, or
    metal. They were worn not just as jewelry but also as a visible declaration of religious allegiance.


  </p>
</div>


<div class="banner-statistics-area ptb-30">
  <div class="container ">
    <div class="row">
      <div class="col-sm-12">
        <div class="row row-20 mtn-20" style=" padding:20px">
          <div class="col-12">
            <figure class="banner-statistics mt-20" style="justify-content: center;display:flex;">

              <img src="image/blog25.jpg" alt="product banner" style="width: 800px;">

            </figure>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="col-12 container mob-padding" style=" justify-content:center">
  
  <p class="para1 ">In the 19th century, with the rise of sentimentality and romanticism, cross necklaces became popular
    fashion accessories, especially among women. These crosses were often ornate, featuring intricate designs and
    embellishments such as gemstones and filigree work. They were worn not only as symbols of faith but also as
    decorative pieces.<br><br>
    Cross necklaces remain popular in the modern era, worn by Christians as expressions of their religious beliefs and
    by others as fashion statements or symbols of spirituality. Cross necklaces come in various styles and materials,
    ranging from simple and understated to elaborate and luxurious.
    <br><br>
    <figure class="banner-statistics mt-20" style="margin: auto;justify-content: center;display: flex;">

      <img src="image/blog26.jpg" alt="product banner" style="width: 800px;margin:auto;">
  
    </figure>
    <br><br>
    Whatever your choice maybe, we have a cross for you!<br>
    Check out our <a href="/index.php?route=product/category&path=106" style="color: #423c9e;font-weight:600;">Cross
      Collection</a> Here!



  </p>
</div>
<div class="banner-statistics-area ptb-30">
  <div class="container ptb-30">
    <div class="row">
      <div class="col-sm-12">
        <div class="row row-20 mtn-20" style=" padding:20px">
          <div class="col-12">
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript" src="assets/js/birthstone.js?v1.1"></script>


<?php echo $footer; ?>