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
<!-- breadcrumb area end -->
<div style="min-height:80vh; margin-top:50px" class="container">

  <div class="row">
    <div id="content" class="col-sm-10">
      <h1><?php echo $heading_title; ?></h1>
      <br />
      <?php if ($quotations) { ?>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo 'Quotation Id'; ?></td>
                <td class="text-left"><?php echo $column_customer; ?></td>
                <td class="text-right"><?php echo $column_product; ?></td>
                <td>Status</td>

                <td class="text-right"><?php echo $column_total; ?></td>
                <td class="text-right"><?php echo $column_date_added; ?></td>
                <td class="text-right">Valid Till</td>
                <td class="text-right">View</td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($quotations as $quotation) { ?>
                <tr>
                  <td class="text-right">#<?php echo $quotation['quotation_id']; ?></td>
                  <td class="text-left"><?php echo $quotation['name']; ?></td>
                  <td class="text-right"><?php echo $quotation['products']; ?></td>
                  <td>Active</td>
                  <td class="text-right"><?php echo $quotation['total']; ?></td>
                  <td class="text-right"><?php echo $quotation['date_added']; ?></td>

                  <td class="text-right"><?php echo $quotation['date_valid']; ?></td>
                  <td class="text-right"><a href="<?php echo $quotation['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      <?php } else { ?>
        <p>You have not requested any previous quotations !</p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-hero"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>

  </div>
</div>
<?php echo $footer; ?>