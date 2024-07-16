<?php echo $header; ?>

<style>
    .location-card{
        background-color: white;
    width: 400px;
    text-align: left;
    border: thin solid #ccc;
    padding: 10px;
    margin: 10px;
    border-radius: 8px;
   margin-top:30px;
    }
    .location-card{
        display:none;

    }
</style>

<section style="min-height:50vh" class="about-us section-padding pb-0">

    <div class="container">
   
<div class="row">
    <div class="col-sm-12 text-center"> <h2>Store Directory</h2> 
<br />
</div>
<div class="row" style="width:100%">
    <div class="col-10 offset-1 col-sm-4 offset-sm-4 text-center">
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

        <h4><?php echo $bs['link'][0];?></h4>
       
       <p style="margin-top:10px">
     <b>Location:   <?php echo $bs['link'][3];?></b>    <br />
       <b>Address: </b> <?php echo $bs['link'][1];?>
      
     <br />  <b>Phone Number: </b>  <?php echo $bs['link'][2];?>
   
     <br />  <b>Time: </b>  <?php echo $bs['link'][4];?>
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
$(document).ready(function() {
    // Remove duplicates
    var seen = {};
    $('select option').each(function() {
        var txt = $(this).text();
        if (seen[txt]) {
            $(this).remove();
        } else {
            seen[txt] = true;
        }
    });

    // Sort remaining options
    var options = $('select option');
    options.sort(function(a, b) {
        var textA = $(a).text().toUpperCase(); // case-insensitive comparison
        var textB = $(b).text().toUpperCase(); // case-insensitive comparison
        return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
    });

    $('select').empty().append(options);
});


</script>


<?php echo $footer; ?>