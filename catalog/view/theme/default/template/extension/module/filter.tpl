 <?php foreach ($filter_groups as $filter_group) { ?>
   <style>
     .custom-control-input {
       position: absolute;
       z-index: 1;
       opacity: 1;
       margin-left: -20px;
     }
.checks{
  margin-top:-21px;
}


     @media screen and (max-width:650px) {
       .sidebar-wrapper {
         position: fixed;
         background: #fff;
         width: 260px;
         left: -260px;
         height: 100vh;
         overflow-y: auto;
         padding: 20px;
         z-index: 999999999999;
         top: -62px;

       }



     }
   </style>

   <!-- single sidebar start -->
   <div class="sidebar-single">
     <h5 style="color:#423c9e" class="sidebar-title"><?php echo $filter_group['name']; ?></h5>
     <div class="sidebar-body">
       <ul class="checkbox-container categories-list">
         <?php foreach ($filter_group['filter'] as $filter) { ?>

           <li class="filter1">
             <div class="custom-control custom-checkbox">
               <label for=""> <?php echo $filter['name']; ?> </label>
                 <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                   <input type="checkbox" class="custom-control-input checks" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
                  
                 <?php } else { ?>
                   <input type="checkbox" name="filter[]" class="custom-control-input checks" value="<?php echo $filter['filter_id']; ?>" />
                  
                 <?php } ?>

              
             </div>
           </li>

         <?php } ?>
       </ul>
     </div>
   </div>
   <!-- single sidebar end -->

 <?php } ?>

 <button style="margin-top: 0px; display: none;" class="btn btn-hero" id="button-filter">FILTER</button>
 <script type="text/javascript">
   var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};
   
   $(".filter1 label").click(function() {
   
     var checkBoxes = $(this).parent().find("input");
     checkBoxes.prop("checked", !checkBoxes.prop("checked"));
     $("#button-filter").click();
   });

   $('.checks').click(function(){
    $("#button-filter").click();
   })

   $('#button-filter').on('click', function() {
     filter = [];

     $('input[name^=\'filter\']:checked').each(function(element) {
       filter.push(this.value);
     });
     var path = getUrlParameter('path');
     if(path==107 && filter.length>0){
      filter.push('25');
     }

     if(path==106 && filter.length>0){
      filter.push('27');
     }
     location = '<?php echo $action; ?>&filter=' + filter.join(',');
   });
   //
 </script>
