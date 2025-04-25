<?php echo $header; ?>
<!-- breadcrumb area start -->
<div style="background:#f1f1f1;" class="breadcrumb-area">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <div class="breadcrumb-wrap">
          <nav aria-label="breadcrumb">
            <ul class="breadcrumb">
              <li class="breadcrumb-item"><a href="index.php?route=common/gallery"><i class="fa fa-home"></i></a></li>


              <li class="breadcrumb-item active" aria-current="page">
                <a href="index.php?route=account/register">register

                </a>
              </li>

            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- breadcrumb area end -->
<div class="container">
  <style>
    .nav-tabs .nav-link h6 {
      color: #423c9e;
      text-transform: uppercase;
    }

    .nav-tabs .nav-item {
      margin: 0px 15px;
    }

    .nav-tabs .nav-link {
      border: none;
      border-bottom: 2px solid transparent;
    }

    .nav-tabs .nav-item.show .nav-link,
    .nav-tabs .nav-link.active {
      border: none;
      border-bottom: 2px solid #423c9e;
    }

    .c1.form-group:nth-child(odd) {
      float: left;
    }

    .c1.form-group:nth-child(even) {
      float: right;
    }
    
    .g-recaptcha {
      margin: 20px auto;
      display: flex;
      justify-content: center;
    }
  </style>
  <br />

  <?php if ($error_warning) { ?>
    <div class="alert alert-danger">
      <i class="fa fa-exclamation-circle"></i>
      <?php echo $error_warning; ?>
    </div>
  <?php } ?>
  <div class="row">
    <div id="content" style="min-height: 350px;" class="col-sm-10 offset-sm-1">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">
              <h6>Your Details</h6>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">
              <h6>Business Details</h6>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">
              <h6>Password</h6>
            </a>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div class="tab-pane fade show active text-center" id="home" role="tabpanel" aria-labelledby="home-tab">
            <fieldset id="account">

              <div class="form-group required" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
                <label class="col-sm-2 control-label"><?php echo $entry_customer_group; ?></label>

                <div class="col-sm-10">
                  <?php foreach ($customer_groups as $customer_group) { ?>
                    <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                      <div class="radio">
                        <label>
                          <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                          <?php echo $customer_group['name']; ?></label>
                      </div>
                    <?php } else { ?>
                      <div class="radio">
                        <label>
                          <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                          <?php echo $customer_group['name']; ?></label>
                      </div>
                    <?php } ?>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <br />
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                    <?php if ($error_firstname) { ?>
                      <div class="text-danger"><?php echo $error_firstname; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                    <?php if ($error_lastname) { ?>
                      <div class="text-danger"><?php echo $error_lastname; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div class="form-group required">

                <div class="row">
                  <div class="col-sm-6">
                    <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                      <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">
                    <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                      <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>



              <div style="display: none;" class="form-group">
                <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                </div>
              </div>
              <?php foreach ($custom_fields as $custom_field) { ?>
                <?php if ($custom_field['location'] == 'account') { ?>
                  <?php if ($custom_field['type'] == 'select') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                          <option value=""><?php echo $text_select; ?></option>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                              <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected">
                                <?php echo $custom_field_value['name']; ?>
                              </option>
                            <?php } else { ?>
                              <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>">
                                <?php echo $custom_field_value['name']; ?>
                              </option>
                            <?php } ?>
                          <?php } ?>
                        </select>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'radio') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="radio">
                              <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                <label>
                                  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                                <label>
                                  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                          <?php } ?>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'checkbox') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="checkbox">
                              <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                                <label>
                                  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                                <label>
                                  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                          <?php } ?>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'text') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'textarea') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
          <?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'file') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default">
                          <i class="fa fa-upload"></i>
                          <?php echo $button_upload; ?>
                        </button>
                        <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'date') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group date">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'time') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group time">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'datetime') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group datetime">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            </fieldset>
            <button id="n1" class="btn btn-hero">Next</button>
            <a href="index.php?route=account/login">
              <button class="btn btn-hero">Register</button>
            </a>

          </div>

          <div class="tab-pane fade text-center" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <br />
            <fieldset id="address">

              <div class="form-group">
                <div class="row">
                  <div style="display: none;" class="col-sm-6">
                    <input type="text" name="company" value="<?php echo $company; ?>" placeholder="Company Name" id="input-company" class="form-control" />
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                    <?php if ($error_address_1) { ?>
                      <div class="text-danger"><?php echo $error_address_1; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
                  </div>

                </div>

              </div>

              <div class="form-group">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                    <?php if ($error_postcode) { ?>
                      <div class="text-danger"><?php echo $error_postcode; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">

                    <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                    <?php if ($error_city) { ?>
                      <div class="text-danger"><?php echo $error_city; ?></div>
                    <?php } ?>

                  </div>
                </div>

              </div>


              <div class="form-group required">
                <div class="row">
                  <div class="col-sm-6">
                    <select name="country_id" data-role="none" id="input-country" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($countries as $country) { ?>
                        <?php if ($country['country_id'] == $country_id) { ?>
                          <option value="<?php echo $country['country_id']; ?>" selected="selected">
                            <?php echo $country['name']; ?>
                          </option>
                        <?php } else { ?>
                          <option value="<?php echo $country['country_id']; ?>">
                            <?php echo $country['name']; ?>
                          </option>
                        <?php } ?>
                      <?php } ?>
                    </select>
                    <?php if ($error_country) { ?>
                      <div class="text-danger"><?php echo $error_country; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">
                    <select name="zone_id" id="input-zone" class="form-control">

                    </select>
                    <?php if ($error_zone) { ?>
                      <div class="text-danger"><?php echo $error_zone; ?></div>
                    <?php } ?>
                  </div>
                </div>


              </div>

              <!--Inert here below-->
              <hr />

            </fieldset>
            <fieldset style="text-align:left">
              <?php foreach ($custom_fields as $custom_field) { ?>
                <?php if ($custom_field['location'] == 'address') { ?>
                  <?php if ($custom_field['type'] == 'select') { ?>
                    <div style="width: 48%;" id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="c1 form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-12 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-12">
                        <select name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                          <option value=""><?php echo $text_select; ?></option>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                              <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected">
                                <?php echo $custom_field_value['name']; ?>
                              </option>
                            <?php } else { ?>
                              <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>">
                                <?php echo $custom_field_value['name']; ?>
                              </option>
                            <?php } ?>
                          <?php } ?>
                        </select>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>

                  <?php } ?>

                  <?php if ($custom_field['type'] == 'radio') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-12 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-12">
                        <div>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="radio">
                              <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $register_custom_field[$custom_field['custom_field_id']]) { ?>
                                <label>
                                  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                                <label>
                                  <input type="radio" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                          <?php } ?>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'checkbox') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div>
                          <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                            <div class="checkbox">
                              <?php if (isset($register_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $register_custom_field[$custom_field['custom_field_id']])) { ?>
                                <label>
                                  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } else { ?>
                                <label>
                                  <input type="checkbox" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                                  <?php echo $custom_field_value['name']; ?></label>
                              <?php } ?>
                            </div>
                          <?php } ?>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'text') { ?>

                    <div style=" width: 48%;" id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group c1 custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <div class="row">
                        <div class="col-sm-12">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                            <div class="text-danger">
                              <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                            </div>
                          <?php } ?>
                        </div>
                      </div>

                    </div>



                  <?php } ?>
                  <?php if ($custom_field['type'] == 'textarea') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-12 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-12">
                        <textarea name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
              <?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'file') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default">
                          <i class="fa fa-upload"></i>
                          <?php echo $button_upload; ?>
                        </button>
                        <input type="hidden" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'date') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group date">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'time') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group time">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                  <?php if ($custom_field['type'] == 'datetime') { ?>
                    <div id="custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-group custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                      <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                      <div class="col-sm-10">
                        <div class="input-group datetime">
                          <input type="text" name="custom_field[<?php echo $custom_field['location']; ?>][<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($register_custom_field[$custom_field['custom_field_id']]) ? $register_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-calendar"></i>
                            </button>
                          </span>
                        </div>
                        <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                          <div class="text-danger">
                            <?php echo $error_custom_field[$custom_field['custom_field_id']]; ?>
                          </div>
                        <?php } ?>
                      </div>
                    </div>
                  <?php } ?>
                <?php } ?>
              <?php } ?>
            </fieldset>
            <button id="n2" class="btn btn-hero">Next</button>
            <br /> <br />
          </div>


          <div class="tab-pane fade text-center" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <br />
            <fieldset id="pass">

              <div class="form-group required">
                <div class="row">
                  <div class="col-sm-6">
                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                    <?php if ($error_password) { ?>
                      <div class="text-danger"><?php echo $error_password; ?></div>
                    <?php } ?>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                    <?php if ($error_confirm) { ?>
                      <div class="text-danger"><?php echo $error_confirm; ?></div>
                    <?php } ?>
                  </div>

                </div>

              </div>

            </fieldset>

            <?php echo $captcha; ?>
            <?php if ($text_agree) { ?>
              <div class="buttons">
                <div class="pull-right">
                  <?php echo $text_agree; ?>
                  <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked" />
                  <?php } else { ?>
                    <input type="checkbox" name="agree" value="1" />
                  <?php } ?>
                  &nbsp;
                  <div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>
                  <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                </div>
              </div>
            <?php } else { ?>
              <div class="buttons">
                <div class="g-recaptcha" data-sitekey="YOUR_SITE_KEY"></div>
                <button class="btn btn-hero">
                  <?php echo $button_continue; ?>
                </button>
              </div>
            <?php } ?>
          </div>
        </div>


      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
  $("fieldset").each(function() {

    if ($(this).find('.text-danger').length > 0) {

      $('.nav-link[href="#' + $(this).parent().attr('id') + '"]').click();
      return false;
    }
  })
  $("#account .form-group[data-sort]")
    .detach()
    .each(function() {
      if (
        $(this).attr("data-sort") >= 0 &&
        $(this).attr("data-sort") <= $("#account .form-group").length
      ) {
        $("#account .form-group").eq($(this).attr("data-sort")).before(this);
      }

      if ($(this).attr("data-sort") > $("#account .form-group").length) {
        $("#account .form-group:last").after(this);
      }

      if ($(this).attr("data-sort") == $("#account .form-group").length) {
        $("#account .form-group:last").after(this);
      }

      if ($(this).attr("data-sort") < -$("#account .form-group").length) {
        $("#account .form-group:first").before(this);
      }
    });

  $("#address .form-group[data-sort]")
    .detach()
    .each(function() {
      if (
        $(this).attr("data-sort") >= 0 &&
        $(this).attr("data-sort") <= $("#address .form-group").length
      ) {
        $("#address .form-group").eq($(this).attr("data-sort")).before(this);
      }

      if ($(this).attr("data-sort") > $("#address .form-group").length) {
        $("#address .form-group:last").after(this);
      }

      if ($(this).attr("data-sort") == $("#address .form-group").length) {
        $("#address .form-group:last").after(this);
      }

      if ($(this).attr("data-sort") < -$("#address .form-group").length) {
        $("#address .form-group:first").before(this);
      }
    });

  $("input[name='customer_group_id']").on("change", function() {
    $.ajax({
      url: "index.php?route=account/register/customfield&customer_group_id=" +
        this.value,
      dataType: "json",
      success: function(json) {
        $(".custom-field").hide();
        $(".custom-field").removeClass("required");

        for (i = 0; i < json.length; i++) {
          custom_field = json[i];

          $("#custom-field" + custom_field["custom_field_id"]).show();

          if (custom_field["required"]) {
            $("#custom-field" + custom_field["custom_field_id"]).addClass(
              "required"
            );
          }
        }
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(
          thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
        );
      },
    });
  });

  $("input[name='customer_group_id']:checked").trigger("change");
</script>
<script type="text/javascript">
  $("button[id^='button-custom-field']").on("click", function() {
    var node = this;

    $("#form-upload").remove();

    $("body").prepend(
      '<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>'
    );

    $("#form-upload input[name='file']").trigger("click");

    if (typeof timer != "undefined") {
      clearInterval(timer);
    }

    timer = setInterval(function() {
      if ($("#form-upload input[name='file']").val() != "") {
        clearInterval(timer);

        $.ajax({
          url: "index.php?route=tool/upload",
          type: "post",
          dataType: "json",
          data: new FormData($("#form-upload")[0]),
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            $(node).button("loading");
          },
          complete: function() {
            $(node).button("reset");
          },
          success: function(json) {
            $(node).parent().find(".text-danger").remove();

            if (json["error"]) {
              $(node)
                .parent()
                .find("input")
                .after('<div class="text-danger">' + json["error"] + "</div>");
            }

            if (json["success"]) {
              alert(json["success"]);

              $(node).parent().find("input").val(json["code"]);
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(
              thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
            );
          },
        });
      }
    }, 500);
  });
</script>
<script type="text/javascript">
  $(".date").datetimepicker({
    pickTime: false,
  });

  $(".time").datetimepicker({
    pickDate: false,
  });

  $(".datetime").datetimepicker({
    pickDate: true,
    pickTime: true,
  });
</script>
<script type="text/javascript">
  $("select[name='country_id']").on("change", function() {
    $.ajax({
      url: "index.php?route=account/account/country&country_id=" + this.value,
      dataType: "json",
      beforeSend: function() {
        $("select[name='country_id']").after(
          ' <i class="fa fa-circle-o-notch fa-spin"></i>'
        );
      },
      complete: function() {
        $(".fa-spin").remove();
      },
      success: function(json) {
        if (json["postcode_required"] == "1") {
          $("input[name='postcode']").parent().parent().addClass("required");
        } else {
          $("input[name='postcode']").parent().parent().removeClass("required");
        }

        html = '<option value=""><?php echo $text_select; ?></option>';

        if (json["zone"] && json["zone"] != "") {
          for (i = 0; i < json["zone"].length; i++) {
            html += '<option value="' + json["zone"][i]["zone_id"] + '"';

            if (json["zone"][i]["zone_id"] == "<?php echo $zone_id; ?>") {
              html += ' selected="selected"';
            }

            html += ">" + json["zone"][i]["name"] + "</option>";
          }
        } else {
          html +=
            '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
        }

        $("select[name='zone_id']").html(html);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(
          thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText
        );
      },
    });
  });

  $("select[name='country_id']").trigger("change");

  $("#n1").click(function(e) {
    e.preventDefault();
    $("#profile-tab").click();
  })

  $("#n2").click(function(e) {
    e.preventDefault();
    $("#contact-tab").click();
  })
</script>
<script type="text/javascript">
  // Add reCAPTCHA script
  var script = document.createElement('script');
  script.src = 'https://www.google.com/recaptcha/api.js';
  document.head.appendChild(script);

  // Form submission validation
  $('form').on('submit', function(e) {
    if (grecaptcha.getResponse() === '') {
      e.preventDefault();
      alert('Please complete the reCAPTCHA verification');
    }
  });
</script>
<?php echo $footer; ?>