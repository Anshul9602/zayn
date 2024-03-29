<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success squareup_spacer_10"><?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error) { ?>
  <div class="alert alert-warning warning text-danger squareup_spacer_10"><?php echo $error; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h2><?php echo $text_manage_cards; ?></h2>

        <?php if (empty($cards)) : ?>
            <div class="alert alert-warning attention squareup_spacer_10"><?php echo $text_no_cards; ?></div>
        <?php else: ?>
            <table class="table table-bordered">
                <?php foreach ($cards as $key => $card) { ?>
                <tr>
                    <td>
                        <?php echo $card['text']; ?>
                    </td>
                    <td class="text-right">
                        <a class="btn btn-danger" id="remove_card" href="<?php echo $card['delete']; ?>"><?php echo $text_delete; ?></a>
                    </td>
                </tr>
                <?php } ?>
            </table>
        <?php endif; ?>

        <div class="buttons">
            <a class="btn btn-default" href="<?php echo $back; ?>"><?php echo $text_back; ?></a>
        </div>

      <?php echo $content_bottom; ?></div>
    </div>
</div>
<style type="text/css">
    .squareup_spacer_10 {
        margin: 10px 0;
        padding: 10;
    }
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#remove_card').click(function(e) {
        return confirm('<?php echo $text_warning_card; ?>');
    });
});
</script>
<?php echo $footer; ?>
