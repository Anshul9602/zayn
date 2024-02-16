<?php echo $header; ?>
<style>
    h5 {
        font-size: 17px;
    }

    li a {
        color: #333;
    }
    .brochure_btn{
        margin-top:15px;
        margin-bottom:10px;
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

                            <li class="breadcrumb-item active" aria-current="page">
                                <a onclick="return false;" href="#">EDUCATIONAL RESOURCE
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <a href="index.php?route=common/g1">Brochures & Catalogue
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
<section class="about-us section-padding pb-0">

    <div class="container">
        <div class="row">
           
   <?php for($i=0; $i<sizeof($pdfs); $i++){ ?>
        <div class="col-sm-3 text-center" style="padding:15px">
        <div style="border:thin solid #f1f1f1; padding:5px;" class="box-line">
           <img src="<?php echo 'image/'.$pdfs[$i]['image']; ?>" alt="" class="img-responsive">
            
           <a target="_blank" href="https://www.zaynjewels.com/image/catalog/catalogs/<?php echo $pdfs[$i]['link']; ?>">
              <button class="btn btn-hero brochure_btn">View</button>
            </a>
            <a target="_blank" download="<?php echo $pdfs[$i]['title'];?>" href="https://www.zaynjewels.com/image/catalog/catalogs/<?php echo $pdfs[$i]['link']; ?>">
           
            <button class="btn btn-hero brochure_btn">Download</button>
            </a>
        
        </div>   
          
        </div>
    <?php   }?>
    </div>
    
    
    
        
       

    </div>
</section>

<script src="assets/js/src/html2canvas.min.js"></script>
<script src="assets/js/src/three.min.js"></script>
<script src="assets/js/src/pdf.min.js"></script>

<script src="assets/js/src/3dflipbook.min.js"></script>

<?php echo $footer; ?>