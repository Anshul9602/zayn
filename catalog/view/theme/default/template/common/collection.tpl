<?php echo $header; ?>
<link href="
assets/css/home.css
" rel="stylesheet">
<div class="desk_dis">
  
    <?php foreach ($banner_main as $banner) { ?>
    
        <img src="<?php echo $banner['image']; ?>" alt="" class="img-response" style="width:100%;">


   
    <?php } ?>
    
</div>
<div class="mob_dis">
    <?php foreach ($banner_sub as $banner) { ?>
   
        <img src="<?php echo $banner['image']; ?>" alt="" class="img-response" style="width:100%;">

    
    <?php } ?>
    
</div>


<section class="section-padding pb-0 " style="padding-top: 60px;">
    <div style="padding: 0 5%;">
        <div class="row ">

            <div class="col-md-6 col-12 mb-md-0 mb-3" style="align-items: center;display: flex;justify-content: center;">
                <div class="serv-name3 text-center">

                    <h1 class="text-collection mb-3">Tennis Connection</h1>
                    <a href="index.php?route=product/category&path=99">
                        <button class="btn btn-primary">VIEW COLLECTION</button>
                    </a>


                </div>
                <a href="" style="width: 100%;overflow:hidden;    background: black;">

                    <img src="image/new/col2.jpg" alt="" style="width:100%;opacity: 0.6; transition: transform 8s;"
                        class="zoom1 serv-img" title="" />
                </a>
            </div>
            <div class="col-md-6  col-12 " style="align-items: center;display: flex;justify-content: center;">
                <div class="serv-name3 text-center">


                    <h1 class="text-collection mb-3">Zayn Lite</h1>
                    <a href="index.php?route=product/category&path=95">
                        <button class="btn btn-primary">VIEW COLLECTION</button>
                    </a>

                </div>
                <a href="" style="width: 100%;overflow:hidden;    background: black;">

                    <img src="image/new/col1.jpg" alt="" style="width:100%;opacity:0.6; transition: transform 8s;"
                        class="zoom1 serv-img" title="" />
                </a>
            </div>
          

        </div>
<br /><br />
        <div class="row">
        <div class="col-md-6 col-12 mb-md-0 mb-3" style="align-items: center;display: flex;justify-content: center;">
                <div class="serv-name3 text-center">

                    <h1 class="text-collection mb-3">Cross Collection</h1>
                    <a href="index.php?route=product/category&path=106">
                        <button class="btn btn-primary">VIEW COLLECTION</button>
                    </a>


                </div>
                <a href="" style="width: 100%;overflow:hidden;    background: black;">

                    <img src="image/new/col_cross.jpg" alt="" style="width:100%;opacity: 0.6; transition: transform 8s;"
                        class="zoom1 serv-img" title="" />
                </a>
            </div>
            <div class="col-md-6  col-12 " style="align-items: center;display: flex;justify-content: center;">
                <div class="serv-name3 text-center">


                    <h1 class="text-collection mb-3">Hoops Collection</h1>
                    <a href="index.php?route=product/category&path=107">
                        <button class="btn btn-primary">VIEW COLLECTION</button>
                    </a>

                </div>
                <a href="" style="width: 100%;overflow:hidden;    background: black;">

                    <img src="image/new/col-hoops.jpg" alt="" style="width:100%;opacity:0.6; transition: transform 8s;"
                        class="zoom1 serv-img" title="" />
                </a>
            </div>
        </div>
        
    </div>
<br>
</section>

<?php echo $footer; ?>


