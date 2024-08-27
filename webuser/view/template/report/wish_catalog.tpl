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


        <h1></h1>
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-left">Name</td>
                <td class="text-left">Company Name</td>
                <td class="text-right">PDF</td>


                <td class="text-right">Date</td>
                <td class="text-right">Action</td>
              </tr>
            </thead>
            <tbody>
              <?php 
            
              
              if ($appoint) { ?>
              <?php foreach ($appoint as $order) { ?>
              <tr>
                <td class="text-left">
                  <?php echo $order['name']; ?>
                </td>
                <td class="text-left">
                  <?php echo $order['company_name']; ?>
                </td>
                <td class="text-right">
                  <?php echo $order['pdf']; ?>
                  <?php 
                  if ($order['pdf']) { ?>
                    <a href="<?php echo $order['pdf']; ?>" download="<?php echo $order['pdf']; ?>"><button class="btn" style="width:20%"><i class="fa fa-download"></i> Download</button></a>
                    <?php } ?>
                </td>


                <td class="text-right">
                  <?php echo $order['date']; ?>
                </td>
                <td class="text-right">
                  <?php if ($order['status'] == 0) { ?>
                  <button id="primary_button_<?php echo $order['id']; ?>"
                    class="btn btn-primary btn-pen">Pending</button>
                  <?php } elseif ($order['status'] == 1) { ?>
                  <button id="success_button_<?php echo $order['id']; ?>" class="btn btn-success ">Approve</button>
                  <?php } ?>
                  <span><button id="success_button_<?php echo $order['id']; ?>" data-toggle="tooltip" title=""
                      class="btn btn-info" data-original-title="View"><i class="fa fa-eye"></i></button></span>
                  <span>
                    <div id="delete_button_<?php echo $order['id']; ?>" class="btn btn-danger delete-button"
                      data-order-id="<?php echo $order['id']; ?>">
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

  <style>
    .model .tabss {
      width: 100%;
      overflow-x: auto;
      -webkit-overflow-scrolling: touch;
      /* Smooth scrolling for mobile */
    }

    .nn .modal-dialog {
      width: 90%;
    }

    .model #productTable th,
    #productTable td {
      white-space: nowrap;
      /* Prevent text from wrapping */
    }
  </style>

  <!-- Modal Structure -->
  <div class="modal fade nn" id="infoModal" tabindex="-1" role="dialog" aria-labelledby="infoModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="infoModalLabel">Product Details</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <!-- Add a wrapper for scrolling -->
          <div class="table-responsive">
            <table class="table table-bordered" id="productTable">
              <thead>
                <tr>
                  <th>Image</th>
                  <th>Name</th>
                  <th>URL</th>
                  <th>Price</th>
                  <th>Style</th>
                  <th>Design</th>
                  <th>Size</th>
                  <th>Action</th> <!-- New Action column -->
                </tr>
              </thead>
              <tbody id="productTableBody">
                <!-- Data will be populated here -->
              </tbody>
            </table>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Edit Product Modal -->
<!-- Edit Price Modal -->
<!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="editProductForm">
          <div class="form-group">
            <label for="editProductName">Product Name</label>
            <input type="text" class="form-control" id="editProductName">
          </div>
          <div class="form-group">
            <label for="editProductPrice">Product Price</label>
            <input type="text" class="form-control" id="editProductPrice">
          </div>
          <!-- Add more fields as needed -->
          <input type="hidden" id="editProductId">
          <input type="hidden" id="orderId">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="saveProductChanges">Save changes</button>
      </div>
    </div>
  </div>
</div>




  <script type="text/javascript">
    var appoint = <?php echo json_encode($appoint); ?>;
</script>
  <script>
    $('.btn-info').on('click', function () {
      var buttonId = $(this).attr('id');
      var orderId = buttonId.split('_')[2];

      // Retrieve the relevant product data
      var order = appoint.find(order => order.id == orderId);
      var productData = JSON.parse(order.product_data); // Parse the JSON string into an array
    
      // Populate the product table
      var tableBody = $('#productTableBody');
      tableBody.empty(); // Clear previous content
    
      productData.forEach(function (product) {
        var row = `
          <tr>
            <td><img src="${product.productimg}" alt="${product.productname}" style="width: 50px; height: 50px;"></td>
            <td class="product-name_${product.productid}">${product.productname}</td>
            <td><a href="${product.producturl}" target="_blank">View Product</a></td>
            <td class="product-price_${product.productid}">${product.productprice}</td>
            <td>${product.productstyle}</td>
            <td>${product.productdesign}</td>
            <td>${product.productsize}</td>
            <td>
              <button class="btn btn-primary btn-edit" data-productprice="${product.productprice}" data-productname="${product.productname}" data-product-id="${product.productid}" data-orderid="${orderId}">Edit</button>
            </td>
          </tr>`;
        tableBody.append(row);
      });
    
      // Show the modal
      $('#infoModal').modal('show');
    });
    $(document).on('click', '.btn-edit', function () {
      var productId = $(this).data('product-id');
      var orderId = $(this).data('orderid');

     
      var productName = $(this).data('productname');
      var productPrice = $(this).data('productprice');



      
      // Populate the edit modal fields
      $('#editProductId').val(productId);
      $('#orderId').val(orderId);
      $('#editProductName').val(productName);
      $('#editProductPrice').val(productPrice);
  
      // Show the edit modal
      $('#editProductModal').modal('show');
    });
  
    // Save changes in the edit modal
    $('#saveProductChanges').on('click', function () {
      var productId = $('#editProductId').val();
      var orderId = $('#orderId').val();
      var updatedName = $('#editProductName').val();
      var updatedPrice = $('#editProductPrice').val();
  
      // Update the product data in the table
      var productRow = $('#productTableBody').find(`tr[data-product-id='${productId}']`);
      console.log(productRow);
      $('#productTableBody').find(`.product-name_${productId}`).text(updatedName);
      $('#productTableBody').find(`.product-price_${productId}`).text(updatedPrice);
      var order = appoint.find(order => order.id == orderId);
     
      var productData = JSON.parse(order.product_data);
      
      var product = productData.find(p => p.productid == productId);
      product.productname = updatedName;
      product.productprice = updatedPrice;
     order.product_data = JSON.stringify(productData);
     
      updated_data = order.product_data;

      $.ajax({
        url: 'index.php?route=report/wish_catalog/updateproduct&token=<?php echo $token; ?>', // Update with your actual URL
        type: 'POST',
        data: {
          orderId: orderId,
          product_data: updated_data
        },
      
        success: function (response) {
          // Handle the response
          if (response.success) {
            // Update the UI or show a success message
            console.log(response.success);
           alert(response.success);
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
      // Send the updated data to the server using AJAX
      
  
      // Close the modal after saving
     $('#editProductModal').modal('hide');
    });
    
  </script>


  <script>
    $(document).ready(function () {
      $('.delete-button').on('click', function () {
        var orderId = $(this).data('order-id');
        if (confirm('Are you sure you want to delete this data?')) {
          // Assuming AJAX request to delete data
          $.ajax({
            url: 'index.php?route=report/wish_catalog/delete&token=<?php echo $token; ?>', // Update with your actual URL for deleting data
            type: 'POST',
            data: {
              orderId: orderId
            },
            dataType: 'json',
            success: function (response) {
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

      $('.btn-pen').on('click', function () {
        // Get the button ID
        var buttonId = $(this).attr('id');

        // Extract the order ID from the button ID
        var orderId = buttonId.split('_')[2];

        // Assuming AJAX request to update status
        $.ajax({
          url: 'index.php?route=report/wish_catalog/updatestatus&token=<?php echo $token; ?>', // Update with your actual URL
          type: 'POST',
          data: {
            orderId: orderId
          },
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
      $('.btn-app').on('click', function () {
        // Get the button ID
        var buttonId = $(this).attr('id');

        // Extract the order ID from the button ID
        var orderId = buttonId.split('_')[2];

        // Assuming AJAX request to update status
        $.ajax({
          url: 'index.php?route=report/wish_catalog/updatestatus&token=<?php echo $token; ?>', // Update with your actual URL
          type: 'POST',
          data: {
            orderId: orderId
          },
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