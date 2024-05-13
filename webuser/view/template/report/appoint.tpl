<style>
  .popup {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    padding-top: 5rem;
    margin-left: 8rem;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
  }

  .popup-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
  }

  .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
  }

  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
  }

  #editPopup label {
    font-size: 20px;
    padding: 10px 0;
  }

  input {
    font-size: 20px !important;
    margin-top: 5px;
    width: 100%;
    padding: 20px;
  }
</style>

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
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
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
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
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
                    <?php if (
                      $order_status['order_status_id'] ==
                      $filter_order_status_id
                    ) { ?>
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

        <h5>Event listing</h5>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Name</td>
                <td class="text-left">Description</td>
                <td class="text-right">Date</td>
                <td class="text-right">Action</td>
              </tr>
            </thead>
            <tbody>
              <?php if ($appoint_event) { ?>
                <?php foreach ($appoint_event as $order1) { ?>
                  <tr>
                    <td class="text-left">
                      <?php echo $order1['name']; ?>
                    </td>

                    <td class="text-left">
                      <?php echo $order1['dis']; ?>
                    </td>
                    <td class="text-right">
                      <?php echo $order1['date']; ?>
                    </td>

                    <td class="text-right">

                      <button class="btn btn-primary edit-button" onclick="openEditPopup(<?php echo $order1['id']; ?>)">Edit</button>

                      <span>
                        <div id="delete_Event_<?php echo $order1['id']; ?>" class="btn btn-danger delete-Event" data-order-id="<?php echo $order1['id']; ?>" style="display:none;">
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
        <h1>Appointments List</h1>
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
                        <button id="primary_button_<?php echo $order['ap_id']; ?>" class="btn btn-primary btn-pen">Pending</button>
                      <?php } elseif ($order['status'] == 1) { ?>
                        <button id="success_button_<?php echo $order['ap_id']; ?>" class="btn btn-success btn-app">Approve</button>
                      <?php } ?>

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
    // Function to open the edit popup and populate it with event details

    function openEditPopup(eventId) {
      // Show the popup form
      var popup = document.getElementById('editPopup');
      popup.style.display = 'block';

      // Optionally, you can perform additional actions based on the event ID
      console.log("Opening popup for event ID: " + eventId);
    }


    // Function to close the edit popup
    function closePopup() {
      // Hide the edit popup
      document.getElementById('editPopup').style.display = 'none';
    }

    // Add event listeners to all edit buttons
  </script>
  <div id="editPopup" class="popup">
    <div class="popup-content ">
      <div class="contianer p-4">
        <span class="close" onclick="closePopup()">&times;</span>
        <div class="col-md-12 text-start pb-3">
          <h2 class="bold">Event info</h2>
          <br>
        </div>

      </div>

      <form  action="index.php?route=report/appoint/updateevent&token=<?php echo $token; ?>" method="POST" >

        <!-- Hidden input field for user ID -->

        <?php foreach ($appoint_event as $order1) { ?>
          <!-- Input fields for editing user details -->
          <div class="row  d-flex justify-content-center py-3 m-0">
            <input type="hidden" id="orderId" name="orderId" value="<?php echo $order1['id']; ?>">

            <div class="col-md-8">
              <div class="col-md-12 " style="padding: 0;"><label for="name">Name:</label></div>
              <input type="text" id="name" name="name" value="<?php echo $order1['name']; ?>">
            </div>
            <br>
            <div class="col-md-8">
              <div class="col-md-12" style="padding: 0;"><label for="mobile_number">Description</label></div>
              <input type="text" name="dis" value="<?php echo $order1['dis']; ?>">
            </div>
            <div class="col-md-8">
              <div class="col-md-12" style="padding: 0;"><label for="date">Event Date</label></div>
              <input type="text" name="date" value="<?php echo $order1['date']; ?>">
            </div>
            
            <div class="col-md-8">
              <button type="submit" class="btn btn-primary save_event" style="padding: 10px 30px;    font-size: 18px;margin-top:20px">Save</button>
            </div>

          </div>
        <?php } ?>

      </form>
    </div>
  </div>

  <script>
    $(document).ready(function() {
      $('.delete-button').on('click', function() {
        var orderId = $(this).data('order-id');
        if (confirm('Are you sure you want to delete this data?')) {
          // Assuming AJAX request to delete data
          $.ajax({
            url: 'index.php?route=report/appoint/delete&token=<?php echo $token; ?>', // Update with your actual URL for deleting data
            type: 'POST',
            data: {
              orderId: orderId
            },
            dataType: 'json',
            success: function(response) {
              // Handle the response
              if (response.success) {
                // Update the UI or show a success message
                console.log(response.success);
                // Optionally, you can refresh the page or update the UI as needed
                //location.reload(true);
              } else {
                // Handle any errors or show an error message
                console.error(response.error);
              }
            },
            error: function(xhr, status, error) {
              // Handle AJAX errors
              console.error(error);
            }
          });
        }
      });
      $('.delete-Event').on('click', function() {
        var orderId = $(this).data('order-id');
        if (confirm('Are you sure you want to delete this event data?')) {
          // Assuming AJAX request to delete data
          $.ajax({
            url: 'index.php?route=report/appoint/deleteevent&token=<?php echo $token; ?>', // Update with your actual URL for deleting data
            type: 'POST',
            data: {
              orderId: orderId
            },
            dataType: 'json',
            success: function(response) {
              // Handle the response
              if (response.success) {
                // Update the UI or show a success message
                console.log(response.success);
                location.reload(true);
                // Optionally, you can refresh the page or update the UI as needed
                //location.reload(true);
              } else {
                // Handle any errors or show an error message
                console.error(response.error);
              }
            },
            error: function(xhr, status, error) {
              // Handle AJAX errors
              console.error(error);
            }
          });
        }
      });
    });
  </script>
  <script>
    $(document).ready(function() {
     
      $('.btn-pen').on('click', function() {
        // Get the button ID
        var buttonId = $(this).attr('id');

        // Extract the order ID from the button ID
        var orderId = buttonId.split('_')[2];

        // Assuming AJAX request to update status
        $.ajax({
          url: 'index.php?route=report/appoint/updatestatus&token=<?php echo $token; ?>', // Update with your actual URL
          type: 'POST',
          data: {
            orderId: orderId
          },
          dataType: 'json', // Expect JSON response
          success: function(response) {
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
          error: function(xhr, status, error) {
            // Handle AJAX errors
            console.error(error);
          }
        });
      });
      $('.btn-app').on('click', function() {
        // Get the button ID
        var buttonId = $(this).attr('id');

        // Extract the order ID from the button ID
        var orderId = buttonId.split('_')[2];

        // Assuming AJAX request to update status
        $.ajax({
          url: 'index.php?route=report/appoint/updatestatus&token=<?php echo $token; ?>', // Update with your actual URL
          type: 'POST',
          data: {
            orderId: orderId
          },
          dataType: 'json', // Expect JSON response
          success: function(response) {
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
          error: function(xhr, status, error) {
            // Handle AJAX errors
            console.error(error);
          }
        });
      });
    });
  </script>
  <script type="text/javascript">
    $('#button-filter').on('click', function() {
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
    //-->
  </script>
  <script type="text/javascript">
    $('.date').datetimepicker({
      pickTime: false
    });
    //-->
  </script>
</div>
<?php echo $footer; ?>