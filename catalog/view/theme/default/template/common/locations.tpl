<?php echo $header; ?>

<style>
    .location-card{
    background-color:white;
        width: 300px;
    position: absolute;
    text-align: center;
    left: 50%;
    margin-left: -175px;
    margin-top: 50px;
    }
    .location-card{
        display:none;

    }
</style>

<section style="min-height:50vh" class="about-us section-padding pb-0">

    <div class="container">
   
<div class="row">
    <div class="col-sm-12 text-center"> <h2>Store Directory</h2> 
<hr />
</div>
<div class="row" style="width:100%">
    <div class="col-sm-4 offset-sm-4 text-center">
       <select name="country_id" id="input-country" class="form-control">
          <option value=""> --- Please Select --- </option>
        <?php foreach ($bannerstop as $bs) {?>
            <option value="<?php echo $bs['title'];?>"> <?php echo $bs['title'];?> </option>
            <?php }?>
       </select>
       <button id="search" class="btn btn-hero">Search</button>
    </div>
    
</div>
</div>
<div class="row">
  <?php foreach ($bannerstop as $bs) {?>
    <div class="<?php echo $bs['title'];?> location-card">
        <?php 
        $bs['link'] = explode('/',$bs['link']);
        ?>

        <h3><?php echo $bs['link'][0];?></h3>
        <p class="text-center"><?php echo $bs['link'][1];?>
     <br />    <?php echo $bs['link'][2];?>
    </p>
    </div>
    <?php }?>
</div>



    </div>
</section>


<script>
$(document).ready(function(){
    $("#search").click(function(){
        $(".location-card").css('display','none');
        $(".location-card").each(function(){
            var className = $('#input-country').find(":selected").val();
         
            if($(this).hasClass(className)){
                $(this).css('display','inline');
            }
        })
    })
})
</script>


<?php echo $footer; ?>