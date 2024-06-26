<?php if ($error_currency) { ?>
    <div class="alert-danger warning text-danger squareup_spacer_10">
        <i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $error_currency; ?>
    </div>
<?php } ?>
<?php if ($warning_currency) { ?>
    <div class="alert-warning attention squareup_spacer_10">
        <i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $warning_currency; ?>
    </div>
<?php } ?>
<div id="squareup-notification">
    <div class="text-center alert information squareup_spacer_10"><i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;<?php echo $text_loading; ?></div>
</div>
<form class="form-horizontal" action="<?php echo $action; ?>" method="POST" id="squareup_card_details_form" style="display: none;">
    <fieldset id="sq-walletbox">
        <legend><?php echo $text_pay_with_wallet; ?></legend>
        <div class="form-group">
            <div class="col-sm-12">
                <a href="javascript:void(0)" id="sq-apple-pay" class="btn btn-inverse btn-block btn-lg"><?php echo $text_pay_with_applepay; ?></a>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend><?php echo $text_card_details; ?></legend>
        <?php if ($cards) { ?>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="squareup_select_card"><?php echo $text_saved_card; ?></label>
            <div class="col-sm-10">
                <select class="form-control" name="squareup_select_card" id="squareup_select_card">
                    <option <?php echo !$has_selected_card ? 'selected' : ''; ?> value><?php echo $text_new_card; ?></option>
                    <?php foreach ($cards as $card) { ?>
                        <option value="<?php echo $card['id']; ?>"<?php echo ($card['selected'] ? 'selected' : ''); ?>><?php echo $card['text']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <?php } ?>
    </fieldset>
    <fieldset id="hide-card-details" <?php echo ($has_selected_card ? 'style="display: none;"' : ''); ?>>
        <?php if ($accepted_cards_status) { ?>
            <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $text_accepted_cards; ?></label>
                <div class="col-sm-10">
                    <img id="squareup-accepted-cards" src="data:image/png;base64,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" alt="<?php echo $text_accepted_cards; ?>" />
                </div>
            </div>
        <?php } ?>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="id_card_number"><?php echo $text_card_number; ?></label>
            <div class="col-sm-10"><div id="id_card_number"></div></div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="id_card_expiry"><?php echo $text_card_expiry; ?></label>
            <div class="col-sm-10"><div id="id_card_expiry"></div></div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="id_cvc"><?php echo $text_card_cvc; ?></label>
            <div class="col-sm-10"><div id="id_cvc"></div></div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="id_card_zip_code"><?php echo $text_card_zip; ?></label>
            <div class="col-sm-10"><div id="id_card_zip_code"></div></div>
        </div>
        <?php if ($is_logged) { ?>
            <?php if ($has_recurring_products) { ?>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="squareup_save_card"><?php echo $text_card_save; ?></label>
                    <div class="col-sm-5">
                        <input type="checkbox" id="squareup_save_card" value="1" name="squareup_save_card" checked disabled />
                        <input type="hidden" id="squareup_save_card" value="1" name="squareup_save_card" />
                    </div>
                </div>
                <div class="alert alert-warning">
                    <i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $text_card_save_warning; ?>
                </div>
            <?php } else{ ?>
            <div class="form-group">
                <label class="col-sm-2 control-label" for="squareup_save_card"><?php echo $text_card_save; ?></label>
                <div class="col-sm-5">
                    <input type="checkbox" id="squareup_save_card" value="1" name="squareup_save_card"/>
                </div>
            </div>
            <?php } ?>
        <?php } ?>
        <?php if ($icon_status) { ?>
            <div class="form-group">
                <div class="col-sm-10 col-sm-offset-3">
                    <img src="data:image/png;base64,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" alt="<?php echo $text_secured; ?>" />
                </div>
            </div>
        <?php } ?>
    </fieldset>



    <input type="hidden" name="squareup_nonce" id="squareup_nonce"/>
    <input type="hidden" name="squareup_digital_wallet_type" id="squareup_digital_wallet_type"/>
</form>
<style style="text/css">
    .squareup_spacer_10 {
        margin: 10px 0;
        padding: 10px;
    }

    .control-label {
        cursor: pointer;
    }

    .form-control--focus {
        /* Indicates how form inputs should appear when they have focus */
        outline: 5px auto rgb(59, 153, 252);
    }
    .form-control--error {
        /* Indicates how form inputs should appear when they contain invalid values */
        outline: 5px auto rgb(255, 97, 97);
    }

    #squareup-accepted-cards {
        max-width: 100%;
    }

    #squareup_card_details_form .form-control {
        border: 1px solid #CCCCCC;
        padding: 0px 10px 0px 0px;
        margin-left: 0px;
        margin-right: 0px;
        margin-top: 5px;
        min-height: 1.7em;
    }

    #squareup_save_card {
        margin-top: 10px;
        cursor: pointer;
    }

    #sq-apple-pay:focus,
    #sq-apple-pay:hover,
    #sq-apple-pay:active {
        color: white;
    }

    #sq-walletbox {
        margin-bottom: 20px;
    }
</style>
<script type="text/javascript">
    (function($) {
        var applePayIsAllowed = false;

        var paymentFormSettings = {
            applicationId: '<?php echo $app_id; ?>',
            locationId: '<?php echo $location_id; ?>',
            inputClass: 'form-control',
            inputStyles: [{
                fontSize: '15px'
            }],
            cardNumber: {
                elementId: 'id_card_number',
                placeholder: '<?php echo $text_card_placeholder; ?>'
            },
            cvv: {
                elementId: 'id_cvc',
                placeholder: '<?php echo $text_cvv; ?>'
            },
            expirationDate: {
                elementId: 'id_card_expiry',
                placeholder: '<?php echo $text_expiry; ?>'
            },
            postalCode: {
                elementId: 'id_card_zip_code',
                placeholder: '<?php echo $text_card_zip_placeholder; ?>'
            },
            applePay: {
                elementId: 'sq-apple-pay'
            },
            callbacks: {
                // Called when the SqPaymentForm completes a request to generate a card
                // nonce, even if the request failed because of an error.
                cardNonceResponseReceived: function(errors, nonce, cardData) {
                    if (errors) {
                        var message = '';

                        errors.forEach(function(error) {
                            message += error.message + '. ';
                        });

                        squareupError(message);
                    } else {
                        // No errors occurred. Extract the card nonce.
                        $('#squareup_nonce').val(nonce);
                        $('#squareup_digital_wallet_type').val(cardData.digital_wallet_type);

                        if (cardData.digital_wallet_type == 'APPLE_PAY') {
                            $('#sq-apple-pay').button('loading');
                        }

                        // If we have paid with digital wallet, we need to submit only the nonce, without squareup_save_card
                        submitForm();
                    }
                },

                unsupportedBrowserDetected: function() {
                    squareupError("<?php echo $error_browser_not_supported; ?>");
                    // Fill in this callback to alert buyers when their browser is not supported.
                },

                paymentFormLoaded: function() {
                    // Fill in this callback to perform actions after the payment form is
                    // done loading (such as setting the postal code field programmatically).
                    paymentForm.setPostalCode('<?php echo $payment_zip; ?>');
                    $('#squareup-notification').empty();
                    $('#squareup_card_details_form').slideDown();
                },

                methodsSupported: function (methods) {
                    // Only show the button if Apple Pay for Web is enabled
                    // Otherwise, display the wallet not enabled message.
                    if (methods.applePay === true && <?php echo $has_applepay_line_items; ?>) {
                        applePayIsAllowed = true;

                        displayWalletBox();
                    } else {
                        $('#sq-walletbox').hide();
                    }
                },

                /*
                 * callback function: createPaymentRequest
                 * Triggered when: a digital wallet payment button is clicked.
                 */
                createPaymentRequest: function () {
                    return <?php echo $apple_pay_line_items; ?>;
                }
            }
        };

        function displayWalletBox() {
            if (applePayIsAllowed) {
                $('#sq-walletbox').show();
            }
        }

        function submitForm() {
            var form = '#squareup_card_details_form';

            $.ajax({
                url : $(form).attr('action'),
                dataType : 'json',
                type : $(form).attr('method'),
                data : $(form).serialize(),
                beforeSend : function() {
                    $('#quick-checkout-button-confirm').button('loading');
                },
                success : function(json) {
                    if (json.error) {
                        squareupError(json.error);
                    } else if (json.redirect) {
                        document.location = json.redirect;
                    }
                },
                error : function(jqXHR, ajaxSettings, thrownError) {
                    squareupError(thrownError);
                },
                complete : function() {
                    $('#quick-checkout-button-confirm').button('reset');
                    $('#sq-apple-pay').button('reset');
                }
            });
        }

        function onScriptLoad() {
            // paymentForm must be global
            paymentForm = new SqPaymentForm(paymentFormSettings);
            paymentForm.build();

            $('#quick-checkout-button-confirm').unbind().click(function(e) {
                e.preventDefault();
                e.stopPropagation();

                if ($(this).attr('disabled')) {
                    return;
                }

                $('#squareup-notification').empty();
                $('#quick-checkout-button-confirm').button('loading');

                onConfirmCheckout();
            });

            <?php if ($error_currency) { ?>
                $('#quick-checkout-button-confirm').attr('disabled', true);
            <?php } ?>
        }

        function onConfirmCheckout() {
            if ($('#squareup_select_card').val()) {
                submitForm();
            } else {
                paymentForm.requestCardNonce();
            }
        }

        function squareupError(error) {
            $('#quick-checkout-button-confirm').button('reset');

            $('#squareup-notification').html('<div class="alert alert-danger warning text-danger squareup_spacer_10"><button type="button" class="close" data-dismiss="alert" aria-label="X"><span aria-hidden="true">&times;</span></button><i class="fa fa-exclamation-circle"></i>&nbsp;' + error + '</div>');
        }

        function toggleAjaxSetup(status) {
            $.ajaxSetup({
                cache: status
            });
        }

        function initSquareup(init_ajax_setup) {
            if (typeof paymentForm != 'undefined') {
                paymentForm.destroy();
                onScriptLoad();
                return;
            }

            toggleAjaxSetup(false);

            var script = document.createElement('script');
            script.type="text/javascript";
            script.onload = onScriptLoad;
            script.src="<?php echo $squareup_js_api; ?>";
            script.async = true;
            document.head.appendChild(script);
            toggleAjaxSetup(init_ajax_setup);
        }

        $('#squareup_select_card').change(function() {
            if ($(this).val()) {
                $('#hide-card-details').slideUp();
                displayWalletBox();
            } else {
                $('#hide-card-details').slideDown();
                $('#sq-walletbox').hide();
            }
        });

        function getLineItems(json) {
          var lineItems = [];

          if (json.totals) {
            for (var x = 0; x < json.totals.length; x++) {
              var line = json.totals[x];
              lineItems.push({type: "final", label: line.title, amount: line.value});
            }
          }

          return lineItems;
        }

        function getTotal(json) {
          var lineItems = [];

          if (json.totals) {
            for (var x = 0; x < json.totals.length; x++) {
              var line = json.totals[x];
              if (line.code == "total") {
                return line.value;
              }
            }
          }

          return lineItems;
        }

        initSquareup($.ajaxSetup().cache);
    })(jQuery);
</script>
