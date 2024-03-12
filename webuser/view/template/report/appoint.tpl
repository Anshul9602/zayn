<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1>
        <?php echo $heading_title; ?>
      </h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>">
            <?php echo $breadcrumb['text']; ?>
          </a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i>
          <?php echo $text_list; ?>
        </h3>
      </div>
      <div class="panel-body">
        <div class="well d-none" style="display: none;">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start">
                  <?php echo $entry_date_start; ?>
                </label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>"
                    placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start"
                    class="form-control" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-end">
                  <?php echo $entry_date_end; ?>
                </label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>"
                    placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end"
                    class="form-control" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-group">
                  <?php echo $entry_group; ?>
                </label>
                <select name="filter_group" id="input-group" class="form-control">
                  <?php foreach ($groups as $group) { ?>
                  <?php if ($group['value'] == $filter_group) { ?>
                  <option value="<?php echo $group['value']; ?>" selected="selected">
                    <?php echo $group['text']; ?>
                  </option>
                  <?php } else { ?>
                  <option value="<?php echo $group['value']; ?>">
                    <?php echo $group['text']; ?>
                  </option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-status">
                  <?php echo $entry_status; ?>
                </label>
                <select name="filter_order_status_id" id="input-status" class="form-control">
                  <option value="0">
                    <?php echo $text_all_status; ?>
                  </option>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected">
                    <?php echo $order_status['name']; ?>
                  </option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>">
                    <?php echo $order_status['name']; ?>
                  </option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i>
                <?php echo $button_filter; ?>
              </button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Name</td>
                <td class="text-left">AppointmentDate</td>
                <td class="text-right">Time</td>
                <td class="text-right">User Time Zone</td>

                <td class="text-right">Date</td>
                <td class="text-right">Action</td>
              </tr>
            </thead>
            <tbody>
              <?php if ($appoint) { ?>
              <?php foreach ($appoint as $order) { ?>
              <tr>
                <td class="text-left">
                  <?php echo $order['userName']; ?>
                </td>
                <td class="text-left">
                  <?php echo $order['selected_date']; ?>
                </td>
                <td class="text-right">
                  <?php echo $order['selected_time']; ?>
                </td>
                <td class="text-right">
                  <?php echo $order['current_timezone']; ?>
                </td>



                <td class="text-right">
                  <?php echo $order['Date']; ?>
                </td>
                <td class="text-right">
                  <?php if ($order['status'] == 0) { ?>
                    <button id="primary_button_<?php echo $order['ap_id']; ?>" class="btn btn-primary">Pending</button>
                  <?php } elseif ($order['status'] == 1) { ?>
                    <button id="success_button_<?php echo $order['ap_id']; ?>" class="btn btn-success">Approve</button>
                  <?php } ?>
                  <span><div id="edit_button_<?php echo $order['ap_id']; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></div></span>
                  <span>
                    <div id="delete_button_<?php echo $order['ap_id']; ?>" class="btn btn-danger delete-button" data-order-id="<?php echo $order['ap_id']; ?>">
                      <i class="fa fa-trash-o"></i>
                    </div>
                  </span>
                </td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="6">
                  <?php echo $text_no_results; ?>
                </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left">
            <?php echo $pagination; ?>
          </div>
          <div class="col-sm-6 text-right">
            <?php echo $results; ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    $(document).ready(function () {
      $('.delete-button').on('click', function () {
        var orderId = $(this).data('order-id');
        if (confirm('Are you sure you want to delete this data?')) {
          // Assuming AJAX request to delete data
          $.ajax({
            url: 'index.php?route=report/appoint/delete&token=<?php echo $token; ?>', // Update with your actual URL for deleting data
            type: 'POST',
            data: { orderId: orderId },
            dataType: 'json',
            success: function (response) {
              // Handle the response
              if (response.success) {
                // Update the UI or show a success message
                console.log(response.success);
                // Optionally, you can refresh the page or update the UI as needed
                location.reload(true);
              } else {
                // Handle any errors or show an error message
                console.error(response.error);
              }
            },
            error: function (xhr, status, error) {
              // Handle AJAX errors
              console.error(error);
            }
          });
        }
      });
    });
  </script>
  <script>
    $(document).ready(function () {
      $('button').on('click', function () {
        // Get the button ID
        var buttonId = $(this).attr('id');

        // Extract the order ID from the button ID
        var orderId = buttonId.split('_')[2];

        // Assuming AJAX request to update status
        $.ajax({
          url: 'index.php?route=report/appoint/updatestatus&token=<?php echo $token; ?>', // Update with your actual URL
          type: 'POST',
          data: { orderId: orderId },
          dataType: 'json', // Expect JSON response
          success: function (response) {
            // Handle the response
            if (response.success) {
              // Update the UI or show a success message
              console.log(response.success);
              location.reload(true);
            } else {
              // Handle any errors or show an error message
              console.error(response.error);
            }
          },
          error: function (xhr, status, error) {
            // Handle AJAX errors
            console.error(error);
          }
        });
      });
    });
  </script>
  <script type="text/javascript">
    $('#button-filter').on('click', function () {
      url = 'index.php?route=report/sale_order&token=<?php echo $token; ?>';

      var filter_date_start = $('input[name=\'filter_date_start\']').val();

      if (filter_date_start) {
        url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
      }

      var filter_date_end = $('input[name=\'filter_date_end\']').val();

      if (filter_date_end) {
        url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
      }

      var filter_group = $('select[name=\'filter_group\']').val();

      if (filter_group) {
        url += '&filter_group=' + encodeURIComponent(filter_group);
      }

      var filter_order_status_id = $('select[name=\'filter_order_status_id\']').val();

      if (filter_order_status_id != 0) {
        url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
      }

      location = url;
    });
    //--></script>
  <script type="text/javascript">
    $('.date').datetimepicker({
      pickTime: false
    });
    //--></script>
</div>
<?php echo $footer; ?>