<?php echo $header; ?>

<style>
  .mob-padding {
    padding: 0px 230px;
  }

  .half-row {
    width: 50%;
  }

  @media screen and (max-width:650px) {
    .mob-padding {
      padding: 0px 20px;
    }

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
<h2 style="text-align:center; color:#423c9e;">Spot Jewelry According to your Birthstone</h2>

<div class="banner-statistics-area ptb-30">
  <div class="container ptb-30">
    <div class="row">
      <div class="col-sm-12">
        <div class="row row-20 mtn-20" style=" padding:20px">
          <div class="col-12">
            <figure class="banner-statistics mt-20">

              <img src="assets/img/banner/imgb1_7.jpg" alt="product banner">

            </figure>
          </div>
        </div><br />
      </div>
    </div>
  </div>
</div>

<div class="col-12 container mob-padding" style=" justify-content:center">
  <p class="para1 "> We are very connected with our birth month, and jewels with your birthstone are the new way to
    flaunt who you really are.

    <br /><br /> Each piece of jewelry tells the story of the wearer, and adding a touch of personalisation is now
    turning out to be a given for every jewelry buyer.<br /><br />

    Birthstones are generally associated with the astrological sign or the month in which a person is born. They have
    healing properties and are associated with personal growth. Many cultures also believe that birthstones have magical
    prowess and are harbingers of good luck. <br /><br />

    Zayn Jewels has a handy guide curated for you to shop jewelry according to the corresponding birthstone. Scroll to
    the month of your birth to know more.

  </p>
</div>
<br /><br />
<section style="background:#F8F8F8 ;">
  <div class="container-fluid">
    <h2 class="textcenter">BIRTHSTONES BY MONTH</h2>
    <br />
    <br />
    <div class="grid2">

      <div class="griditem2 jan">
        <div class=" container bottombr text20" id="imgjs">JANUARY</div>
        Garnet
        <br />
        <div class="circle-image">
          <img src="assets/img/blog/stones/Garnet.png" alt="" class="gridimg " onclick="change1()" />
        </div>
      </div>

      <div class="griditem2 feb">
        <div class="container bottombr text20">FEBRUARY</div>
        Amethyst
        <br />
        <div class="circle-image1">
          <img src="assets/img/blog/stones/Amethyst.png" alt="" class="gridimg " onclick="change2()" />
        </div>
      </div>
      <div class="griditem2 march">
        <div class="container bottombr text20">MARCH</div>
        Aquamarine
        <br />
        <div class="circle-image2">
          <img src="assets/img/blog/stones/Aquamarine.png" alt="" class="gridimg " onclick="change3()" />
        </div>
      </div>
      <div class="griditem2 april">
        <div class="container bottombr text20">APRIL</div>
        Diamond
        <br />
        <div class="circle-image4">
          <img src="assets/img/blog/stones/Diamond-Crystal.png" alt="" class="gridimg " onclick="change4()" />
        </div>
      </div>
      <div class="griditem2 may">
        <div class="container bottombr text20">MAY</div>
        Emerald
        <br />
        <div class="circle-image5">
          <img src="assets/img/blog/stones/Emarald.png" alt="" class="gridimg" onclick="change5()" />
        </div>
      </div>
      <div class="griditem2 june">
        <div class="container bottombr text20">JUNE</div>
        Pearl
        <br />
        <div class="circle-image6">
          <img src="assets/img/blog/stones/Pearl.png" alt="" class="gridimg" onclick="change6()" />
        </div>
      </div>
      <div class="griditem2 july">
        <div class="container bottombr text20">JULY</div>
        Ruby
        <br />
        <div class="circle-image7">
          <img src="assets/img/blog/stones/Ruby.png" alt="" class="gridimg" onclick="change7()" />
        </div>
      </div>
      <div class="griditem2 aug">
        <div class="container bottombr text20">AUGUST</div>
        Peridot
        <br />
        <div class="circle-image8">
          <img src="assets/img/blog/stones/Peridot.png" alt="" class="gridimg" onclick="change8()" />
        </div>
      </div>
      <div class="griditem2 sep">
        <div class="container bottombr text20">SEPTEMBER</div>
        Sapphire
        <br />
        <div class="circle-image9">
          <img src="assets/img/blog/stones/Sapphire.png" alt="" class="gridimg" onclick="change9()" />
        </div>
      </div>
      <div class="griditem2 oct">
        <div class="container bottombr text20">OCTOBER</div>
        Tourmaline
        <br />
        <div class="circle-image10">
          <img src="assets/img/blog/stones/Tourmaline.png" alt="" class="gridimg" onclick="change10()" />
        </div>
      </div>

      <div class="griditem2 nov">
        <div class="container bottombr text20">NOVEMBER</div>
        Citrine
        <br />
        <div class="circle-image11">
          <img src="assets/img/blog/stones/Citrine.png" alt="" class="gridimg" onclick="change11()" />
        </div>
      </div>

      <div class="griditem2 dec">
        <div class="container bottombr text20">DECEMBER</div>
        Topaz
        <br />
        <div class="circle-image12">
          <img src="assets/img/blog/stones/Blue-Topaz.png" alt="" class="gridimg" onclick="change12()" />
        </div>
      </div>
    </div>
  </div>

</section>
<br /> <br />


<div class="container-fluid">
  <div class="row" id="data_blog">
    <div class="col-12 d-flex justify-content-center">
      <h2 id="heading2" style="color:#d54a4a"> January </h2>
    </div>
    <div class="col-12 d-flex justify-content-center">
      <h6 id="stone" style="color:#d54a4a"> Garnet </h6>
    </div>
    <div class="col-12 d-flex justify-content-center">
      <div class="img-container">
        <img src="assets/img/blog/stones/Garnet.png" style="margin-left:0px;" alt="" class="redrubby" id="changeimg" />
      </div>
    </div>
    <div class="col-12 d-flex justify-content-center flex-wrap">
      <div class="row half-row">
        <div class="col-12" style=" margin:10px; 0px">
          <h5 id="birth" style="color:#d54a4a; font-weight:normal">Birthstone - Garnet</h5>
        </div>
        <div class="col-12" style=" margin:8px; 0px">
          <p class="para1 " id="para1"> Garnet is one of the most ancient gemstones in human history and is ideal for
            the January-born wearer
            who is seeking loyalty and consistency. You can choose from a variety of colors and this gemstone is best
            known for its healing properties.
            Old patterns can sometimes get in your way and this gemstone removes all energetic blocks preventing you
            from gushing forward.
            Wear this to attract and activate passion and success.
          </p>
        </div>
        <div class="col-12" style="padding:20px;">
          <div class="content" style="background-color:rgb(169, 196, 201); margin:10px 0px; padding:20px 20px"
            id="fact">
            FACT: In addition to being the January birthstone, the Garnet is also the state gemstone for New York,
            Connecticut, and Idaho.
          </div>
          <br /><br />
        </div>
        <!-- <a href="index.php?route=common/g1" id="atag">
        <div class="col-12 margin:10px; padding:10px;" id="link">
        
         In addition to being the January birthstone, the Garnet is also the state gemstone for New York, Connecticut, and Idaho. 
        </div></a> -->
        <br /><br />
      </div>
    </div>
  </div>
</div>

<!-- <div class="container" id="">

  <div class="januarydiv">
    <div class="griditem">
      <img src="assets/img/blog/red.png" alt="" class="redrubby" id="changeimg" />
    </div>
    <div class="griditem textcenter1"><br />

      <h3 id="heading2">JANUARY: GARNET</h3>
      <p class="para1 " id="para1">
      Garnet is one of the most ancient gemstones in human history and is ideal for the January-born wearer who is seeking loyalty and consistency. You can choose from a variety of colors and this gemstone is best known for its healing properties. Old patterns can sometimes get in your way and this gemstone removes all energetic blocks preventing you from gushing forward. Wear this to attract and activate passion and success.
      </p>

    </div>
  </div>
</div> -->

<script type="text/javascript" src="assets/js/birthstone.js?v1.1"></script>


<?php echo $footer; ?>