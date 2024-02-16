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
      <?php if ($drafts) { ?>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo 'S.no'; ?></td>
                <td class="text-left"><?php echo 'Title'; ?></td>
                <!-- <td class="text-right"><?php echo 'Draft'; ?></td> -->
                <td class="text-right"><?php echo $column_date_added; ?></td>
                <td class="text-right">Edit</td>
                <td class="text-right">Delete</td>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1;
              foreach ($drafts as $draft) { ?>
                <tr>
                  <td class="text-right">#<?php echo $i; ?></td>
                  <td class="text-left"><?php echo $draft['title']; ?></td>
                  <!-- <td class="text-right"><?php echo $draft['draft']; ?></td> -->
                  <td class="text-right"><?php echo $draft['date_added']; ?></td>
                  <td class="text-right"><a href="<?php echo $draft['edit']; ?>" data-toggle="tooltip" title="Edit" class="btn btn-info"><i class="fa fa-pencil"></i></a></td>
                  <td class="text-right"><a href="<?php echo $draft['delete']; ?>" data-toggle="tooltip" title="Edit" class="btn btn-info"><i class="fa fa-trash"></i></a></td>

                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>

      <?php } else { ?>
        <p>You don't have any saved drafts !</p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-hero"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>

  </div>
</div>
<?php echo $footer; ?>