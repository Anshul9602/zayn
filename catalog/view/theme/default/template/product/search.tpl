<?php echo $header; ?>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1; border-bottom:thin solid #fff" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
                  <nav aria-label="breadcrumb">
                     <ul class="breadcrumb">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                           <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                        <?php } ?>
                     </ul>
                  </nav>
               </div>
      </div>
    </div>
  </div>
</div>
<br />
<style>
  .pagination li {
    margin: 0px 10px;
  }
</style>
<!-- breadcrumb area end -->

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" style="min-height:60vh" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 style="display:none"><?php echo $heading_title; ?></h1>
      <label style="display:none" class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div style="display: none;" class="row">
        <div style="display: none;" class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div style="display: none;" class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
              <?php if ($category_1['category_id'] == $category_id) { ?>
                <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
              <?php } else { ?>
                <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
              <?php } ?>
              <?php foreach ($category_1['children'] as $category_2) { ?>
                <?php if ($category_2['category_id'] == $category_id) { ?>
                  <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } else { ?>
                  <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                <?php } ?>
                <?php foreach ($category_2['children'] as $category_3) { ?>
                  <?php if ($category_3['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div style="display: none;" class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
              <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
              <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label style="display: none;" class="checkbox-inline">
          <?php if ($description) { ?>
            <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
            <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />

      <?php if ($products) { ?>
        <div style="display: none;" class="row">
          <div class="col-md-2 col-sm-6 hidden-xs">
            <div class="btn-group btn-group-sm">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-md-3 col-sm-6">
            <div class="form-group">
              <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
            </div>
          </div>
          <div class="col-md-4 col-xs-6">
            <div class="form-group input-group input-group-sm">
              <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
              <select id="input-sort" class="form-control" onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="col-md-3 col-xs-6">
            <div class="form-group input-group input-group-sm">
              <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
              <select id="input-limit" class="form-control" onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                  <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                  <?php } else { ?>
                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                  <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
        </div>
        <div class="row">

          <?php $k = 0;
          foreach ($products as $product) { ?>
            <!-- product single item start -->
            <div class="col-md-3 col-sm-6 col-6 p_box">
              <!-- product grid start -->
              <div class="product-item">
                <figure class="product-thumb">
                  <a href="<?php echo $product['href']; ?>">
                    <img class="pri-img" src="<?php echo $product['thumb']; ?>" alt="product">

                    <img class="sec-img" src="<?php print_r($images[$product['product_id']]['popup']); ?>" alt="product">
                  </a>


                </figure>
                <div class="product-caption">
                  <h6 class="product-name">
                    <a href="<?php echo $product['href']; ?>">
                      <?php echo $product['name']; ?>
                    </a>
                  </h6>
                  <?php if ($product['price']) { ?>
                    <?php if ($product['special']) { ?>
                      <div class="price-box">
                        <span class="price-regular"><?php echo $product['special']; ?></span>
                        <span class="price-old"><del><?php echo $product['price']; ?></del></span>
                      </div>
                    <?php } else { ?>
                      <div class="price-box">
                        <span style="display: inline-block; font-size:11px; color:#333; width:100%">
                          Available In :
                          <?php foreach ($product['option'] as $option) {
                            if ($option['option_id'] == "16") {
                              foreach ($product['option'] as $opp) {

                                foreach ($opp['product_option_value'] as $val) {
                          ?>
                                  <?php if (isset($val['image']) && strpos($val['image'], 'no_image') != 40 && strpos($val['image'], 'no_image') != 39) { ?>

                                    <img style="width: 20px; height:20px" class="color-option" src="<?php print_r($val['image']); ?>" alt="" />
                                  <?php } ?>

                                <?php  } ?>


                          <?php }
                            }
                          } ?>
                        </span>


                        <br /> <br />
                        <span class="price-regular">
                          Price: <?php echo preg_replace('~\.0+$~', '', $product['price']); ?>
                        </span>
                      </div>
                    <?php } ?>
                  <?php } ?>



                </div>
              </div>
              <!-- product grid end -->
            </div>
          <?php } ?>

        </div>
        <!-- start pagination area -->
        <div class="paginatoin-area text-center">
          <?php echo $pagination; ?>
        </div>
        <!-- end pagination area -->
      <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript">
  <!--
  $('#button-search').bind('click', function() {
    url = 'index.php?route=product/search';

    var search = $('#content input[name=\'search\']').prop('value');

    if (search) {
      url += '&search=' + encodeURIComponent(search);
    }

    var category_id = $('#content select[name=\'category_id\']').prop('value');

    if (category_id > 0) {
      url += '&category_id=' + encodeURIComponent(category_id);
    }

    var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

    if (sub_category) {
      url += '&sub_category=true';
    }

    var filter_description = $('#content input[name=\'description\']:checked').prop('value');

    if (filter_description) {
      url += '&description=true';
    }

    location = url;
  });

  $('#content input[name=\'search\']').bind('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#button-search').trigger('click');
    }
  });

  $('select[name=\'category_id\']').on('change', function() {
    if (this.value == '0') {
      $('input[name=\'sub_category\']').prop('disabled', true);
    } else {
      $('input[name=\'sub_category\']').prop('disabled', false);
    }
  });

  $('select[name=\'category_id\']').trigger('change');
  -->
</script>
<?php echo $footer; ?>