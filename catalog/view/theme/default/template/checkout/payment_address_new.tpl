<?php echo $header; ?>
<style>
  label {
    font-size: 12px;
    text-transform: uppercase
  }

  select {
    -webkit-border-radius: 0px;
  }

  select option {
    border-radius: 0px
  }

  .address_card {
    padding: 10px;
  }

  .card_body {
    border: thin solid #f1f1f1;
    min-height: 148px;
    box-shadow: 1px 1px 1px #f1f1f1;
    padding: 10px;
    cursor: pointer;
    transition-duration: 100ms;
    -webkit-transition-duration: 100ms
  }

  .card_body:hover {
    -webkit-transform: scale(1.03);
    box-shadow: 2px 2px 2px #f1f1f1;
    transition-duration: 100ms;
    -webkit-transition-duration: 100ms
  }

  .card_body .fa-check-circle {
    color: green;
    position: absolute;
    top: 20px;
    right: 20px;
    display: none;
    list-style: none
  }
</style>

<div style="margin-top:100px; min-height:70vh" class="container">
  <div class="row">
    <div class="col-sm-10 offset-sm-1 col-xs-10 offset-xs-1">
      <div class="row text-center">
        <div class="col-sm-12">
          <h3 style="text-transform:uppercase">Billing Information</h3>
          <h5>Please select address</h5>
          <hr />
        </div>
      </div>



      <div class="row">
        <div class="col-sm-12">



          <form class="form-horizontal">
            <div style="display:none" class="radio">
              <label>
                <input type="radio" id="exising_btn" name="payment_address" value="existing" checked />
                <?php echo $text_address_existing; ?></label>
            </div>
            <div id="payment-existing">
              <div class="row">
                <?php foreach ($addresses as $address) { ?>
                  <?php if ($address['postcode'] && $address['city']) { ?>

                    <div class="col-sm-4 address_card">
                      <div class="card_body">
                        <li class="fa fa-check-circle"></li>
                        <input type="hidden" class="address_id" value="<?php echo $address['address_id']; ?>" />
                        <h4 style="text-transform:capitalize"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?></h4>
                        <p><?php echo $address['address_1']; ?>,<br /> <?php echo $address['city']; ?>,<?php echo $address['postcode']; ?>,<br /> <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></p>
                      </div>
                    </div>
                  <?php } ?>
                <?php } ?>

                <div class="col-sm-4 address_card">
                  <div style="text-align:center" id="add_new" class="card_body">
                    <li style="text-align:center; font-size:32px; margin-top:30px" class="fa fa-plus-circle"></li>
                    <h4 style="text-align:center">Add New Addess</h4>
                  </div>
                </div>

              </div>

              <input type="text" style="display:none" name="address_id" id="a_id" class="form-control">



            </div>
            <div style="display:none" class="radio">
              <label>
                <input id="new_address_radio" type="radio" name="payment_address" value="new" />
                <?php echo $text_address_new; ?></label>
            </div>
            <br />
            <div style="display:none" id="payment-new">

              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group required">
                      <label class="control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
                      <input type="text" name="firstname" value="" placeholder="" id="input-payment-firstname" class="form-control" />
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group required">
                      <label class="control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
                      <input type="text" name="lastname" value="" placeholder="" id="input-payment-lastname" class="form-control" />
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group required">
                      <label class="control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
                      <select name="country_id" id="input-payment-country" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($countries as $country) { ?>
                          <?php if ($country['country_id'] == $country_id) { ?>
                            <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                          <?php } else { ?>
                            <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                          <?php } ?>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">

                    <div class="form-group required">
                      <label class="control-label" for="input-payment-address-1">Address</label>
                      <input type="text" name="address_1" value="" id="input-payment-address-1" class="form-control" />
                    </div>
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-8">
                    <div class="form-group required">
                      <label class="control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
                      <input type="text" name="city" value="" placeholder="" id="input-payment-city" class="form-control" />
                    </div>
                  </div>

                  <div style="padding-right:0px" class="col-sm-4">
                    <label class="control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
                    <input type="text" name="postcode" value="" placeholder="" id="input-payment-postcode" class="form-control" />
                  </div>
                </div>

                <div class="row">
                  <div class="col-sm-12">
                    <div class="form-group required">
                      <label class="control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
                      <select name="zone_id" id="input-payment-zone" class="form-control">
                      </select>
                    </div>
                  </div>
                </div>
              </div>

              <div style="display:none" class="form-group">
                <label class="col-sm-2 control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="company" value="" placeholder="<?php echo $entry_company; ?>" id="input-payment-company" class="form-control" />
                </div>
              </div>
              <div style="display:none" class="form-group">
                <label class="col-sm-2 control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="address_2" value="" placeholder="<?php echo $entry_address_2; ?>" id="input-payment-address-2" class="form-control" />
                </div>
                <input type="text" name="custom_field[1]" style="display:none" value="default">
                <input type="text" name="custom_field[2]" style="display:none" value="default">
                <input type="text" name="custom_field[3]" style="display:none" value="default">
                <input type="text" name="custom_field[4]" style="display:none" value="default">
                <input type="text" name="custom_field[5]" style="display:none" value="default">
                <input type="text" name="custom_field[6]" style="display:none" value="default">
                <input type="text" name="custom_field[7]" style="display:none" value="default">
                <input type="text" name="custom_field[8]" style="display:none" value="default">
                <input type="text" name="custom_field[9]" style="display:none" value="default">
              </div>






            </div><br /><br />
            <div class="buttons clearfix">
              <div class="text-center"><br />
                <button type="button" id="button-payment-address" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-hero">
                  <?php echo $button_continue; ?>
                </button>

                <a style="cursor: pointer;" onclick="window.history.back();">
                  <button class="btn btn-hero" type="button">
                    Back
                  </button>
                </a>

              </div>
            </div>
          </form>

        </div>
      </div>



    </div>
  </div>
</div><br /><br />


<script type="text/javascript">
  <!--
  $('input[name=\'payment_address\']').on('change', function() {
    if (this.value == 'new') {
      $('#payment-existing').hide();
      $('#payment-new').show();
    } else {
      $('#payment-existing').show();
      $('#payment-new').hide();
    }
  });

  $(".sticky-header").addClass("header_disabled");
  $(".sticky-header").css("background-color", '#fff');
  $(".sticky-header").css("border-bottom", '#f1f1f1 thin solid');
  $(".sticky-header #navigation a").css("color", "#181818");
  $(".main_logo").attr("src", "img/logo-blue.png");


  //
  -->
</script>

<script type="text/javascript">
  <!--
  $('select[name=\'country_id\']').on('change', function() {
    $.ajax({
      url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
      dataType: 'json',
      beforeSend: function() {
        $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
      },
      complete: function() {
        $('.fa-spin').remove();
      },
      success: function(json) {
        if (json['postcode_required'] == '1') {
          $('input[name=\'postcode\']').parent().parent().addClass('required');
        } else {
          $('input[name=\'postcode\']').parent().parent().removeClass('required');
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json['zone'] && json['zone'] != '') {
          for (i = 0; i < json['zone'].length; i++) {
            html += '<option value="' + json['zone'][i]['zone_id'] + '"';

            if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
              html += ' selected="selected"';
            }

            html += '>' + json['zone'][i]['name'] + '</option>';
          }
        } else {
          html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $('select[name=\'zone_id\']').html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $('select[name=\'country_id\']').trigger('change');

  $(document).delegate('#button-payment-address', 'click', function() {

    $.ajax({
      url: 'index.php?route=checkout/registered_payment/save',
      type: 'post',
      data: $('input[type=\'text\'],input[type=\'checkbox\']:checked, input[type=\'radio\']:checked, input[type=\'hidden\'], select'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-payment-address').button('loading');
      },
      complete: function() {
        $('#button-payment-address').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['redirect']) {
          location = json['redirect'];
        } else if (json['error']) {
          if (json['error']['warning']) {
            $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          }

          for (i in json['error']) {
            var element = $('#input-payment-' + i.replace('_', '-'));

            if ($(element).parent().hasClass('input-group')) {
              $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
            } else {
              $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
            }
          }

          // Highlight any found errors
          $('.text-danger').parent().parent().addClass('has-error');
        } else {
          window.location = 'index.php?route=checkout/registered_shipping';
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  $(".card_body").not(".card_body#add_new").click(function() {
    $("#button-payment-address").prop("disabled", false);

    $("#a_id").val($(this).find('.address_id').val());

    $(".card_body").not(".card_body#add_new").find(".fa").fadeOut();

    $(this).find(".fa").fadeIn();
  })

  $(".card_body#add_new").click(function() {
    $("#button-payment-address").prop("disabled", false);
    $("#exising_btn").prop("disabled", false);


    $("#new_address_radio").prop("checked", true);
    $('#payment-existing').hide();
    $('#payment-new').show();
  })



  //
  -->
</script>
<?php echo $footer; ?>