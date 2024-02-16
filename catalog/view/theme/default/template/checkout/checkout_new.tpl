<?php echo $header; ?>
<style>
  h3 {
    text-transform: uppercase
  }

  .checkout_heading {
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 2px
  }

  #checkout_block .col-sm-3 {
    min-height: 150px
  }

  p {
    font-size: 14px;
  }


  .overlay1 {
    width: 100%;
    height: 100vh;
    top: 0px;
    left: 0px;
    background-color: #000;
    z-index: 99999;
    opacity: 0.6;
    display: none;
    position: fixed;
    text-align: center
  }

  .confrim_pop {
    height: 230px;
    background: #fff;
    width: 400px;
    position: fixed;
    z-index: 999999;
    display: none;
    top: 50%;
    margin-top: -115px;
    left: 50%;
    margin-left: -200px;
    text-align: center;
    border-radius: 2px;
    box-shadow: 0 12px 20px -10px rgba(0, 0, 0, .28), 0 4px 20px 0 rgba(0, 0, 0, .12), 0 7px 8px -5px rgba(0, 0, 0, .2)
  }

  .confrim_pop .fa {
    color: #44213B;
    font-size: 44px
  }
</style>

<div style=" margin-bottom:40px; padding-top:100px; min-height:60vh" class="container">
  <div class="row">
    <div class="col-sm-12">

      <div class="row">
        <div style="background-color:#fff; padding-top:25px" class="col-sm-12">

          <h3 style="text-transform:uppercase;  text-align:center; letter-spacing:2.6px">Secure Checkout</h3>
          <hr />

          <div style="padding-left:30px" id="checkout_block" class="row">
            <div class="col-sm-3">
              <span style="padding:10px">

                <p class="checkout_heading">Billing Address &nbsp;<?php if (!$logged) { ?><a style="font-size:14px" href="index.php?route=checkout/guest_new">Edit</a><?php } ?></p>
                <p style="text-transform:capitalize; letter-spacing:1px; font-size:14px">
                  <?php echo $order_data['payment_firstname'] . ' ' . $order_data['payment_lastname']; ?><br />
                  <?php echo $order_data['payment_address_1'] . ' ' . $order_data['payment_address_2']; ?><br />
                  <?php echo $order_data['payment_city'] . ', ' . $order_data['payment_zone']; ?><br />
                  <?php echo $order_data['payment_country'] . ' ' . $order_data['payment_postcode']; ?>
                </p>
              </span>
            </div>

            <div class="col-sm-3">
              <span style="padding:10px">

                <p class="checkout_heading">Shipping Address <?php if (!$logged) { ?>
                    <a style="font-size:12px" href="index.php?route=checkout/guest_shipping_new">Edit</a>
                  <?php } ?></p>

                <p style="text-transform:capitalize; font-size:14px; letter-spacing:1px">
                  <?php echo $order_data['shipping_firstname'] . ' ' . $order_data['shipping_lastname']; ?><br />
                  <?php echo $order_data['shipping_address_1'] . ' ' . $order_data['shipping_address_2']; ?><br />
                  <?php echo $order_data['shipping_city'] . ', ' . $order_data['shipping_zone']; ?><br />
                  <?php echo $order_data['shipping_country'] . ' ' . $order_data['shipping_postcode']; ?>
                </p>
              </span>
            </div>

            <div class="col-sm-3">
              <span style="padding:10px">
                <h5 class="checkout_heading">Shipping method</h5>
                <p style="text-transform:capitalize; font-size:14px; letter-spacing:1px">Standard Shipping</p>
              </span>
            </div>

            <div class="col-sm-3">
              <span style="padding:10px" id="payment_appen">

              </span>
            </div>

          </div>


        </div>
      </div>

      <div class="row">
        <div style="margin-top:30px; padding-right:20px" class="col-sm-4">
          <div class="col-sm-12" style="background-color:#f1f1f1">
            <hr style="margin:0" />
            <p style="padding:20px; font-size:14px">
              NEED HELP ORDERING?<br />
              EMAIL: info@zaynjewels.com</p>
            <hr style="margin:0" />
            <p style="padding:20px; font-size:14px">
              SHIPPING & FULFILLMENT<br />
              EXPECTED DELIVERY TIME -<BR />
              2-3 DAYS FOR IN STOCK PRODUCTS<BR /><br />
              <a HREF="index.php?route=information/contact">CONTACT US</a> FOR OUT OF STOCK PRODUCTS
            </p>
          </div>
        </div>
        <div style="margin-top:30px; background-color:#fff; padding:10px" class="col-sm-8 col-xs-12">
          <span id="confirm_box">

          </span>
        </div>
      </div>

      <div class="row">


        <div class="col-sm-4">
          <textarea style="display:none" name="comment"></textarea>
          <div style="display:none" class="row">
            <div class="col-sm-12">
              <?php if ($shipping_methods) { ?>
                <?php foreach ($shipping_methods as $shipping_method) { ?>
                  <p>Shipping Charges</p>
                  <?php if (!$shipping_method['error']) { ?>
                    <?php foreach ($shipping_method['quote'] as $quote) { ?>
                      <div class="radio">
                        <label>
                          <?php if ($quote['code'] == $code || !$code) { ?>
                            <?php $code = $quote['code']; ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" checked="checked" />
                          <?php } else { ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" />
                          <?php } ?>
                          <?php echo $quote['title']; ?> - <?php echo $quote['text']; ?></label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            </div>
          </div>

        </div>
      </div>
    </div>

  </div>
</div>


<div class="overlay1"></div>
<div class="processing_order confrim_pop">
  <br>
  <img src="assets/time-moving.gif" alt="" style="width: 250px; margin:auto">
  <h4>Please wait ..<br />Placing Your Order Securely</h4>

</div>



<script>
  $(document).ready(function(e) {
    $.ajax({
      url: 'index.php?route=checkout/shipping_method/save',
      type: 'post',
      data: $('input[name=\'shipping_method\']:checked, textarea'),
      dataType: 'json',
      success: function(data) {
        console.log("api1");
        console.log(data);
        $.ajax({
          url: 'index.php?route=checkout/payment_method',
          dataType: 'html',
          complete: function() {
            $('#button-shipping-method').button('reset');
          },
          success: function(html) {
            console.log(html);
            $('#payment_appen').html(html);

            $.ajax({
              url: 'index.php?route=checkout/payment_method/save',
              type: 'post',
              data: $('input[name=\'payment_method\']:checked, textarea'),
              dataType: 'json',
              beforeSend: function() {
                $('#button-payment-method').button('loading');
              },
              success: function(json) {
                $.ajax({
                  url: 'index.php?route=checkout/confirm',
                  dataType: 'html',
                  complete: function() {
                    $('#button-payment-method').button('reset');
                  },
                  success: function(html) {
                    $('#confirm_box').html(html);
                  },
                  error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr
                      .responseText);
                  }
                })
                console.log(json);
              },
              error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
              }

            })


          }
        })
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }

    })
  });

  $("body").on("change", "input[name=\'payment_method\']", function() {
    $.ajax({
      url: 'index.php?route=checkout/payment_method/save',
      type: 'post',
      data: $('input[name=\'payment_method\']:checked, textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-payment-method').button('loading');
      },
      success: function(json) {
        $.ajax({
          url: 'index.php?route=checkout/confirm',
          dataType: 'html',
          complete: function() {
            $('#button-payment-method').button('reset');
          },
          success: function(html) {
            $('#confirm_box').html(html);
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        })
        console.log(json);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }

    })

  })
</script>
<?php echo $footer; ?>