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
       <ul data-filter-group="<?php echo str_replace(' ','',$filter_group['name']); ?>" class="checkbox-container categories-list">
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

 