<script type="text/javascript">
(function($) {
    var html = '<div class="alert alert-info alert-dismissible"><i class="fa fa-info-circle"></i> <?php echo $text; ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>';

    $('#content > .container-fluid').prepend(html);
})(jQuery);
</script>