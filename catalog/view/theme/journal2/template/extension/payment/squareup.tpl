<?php if ($error_currency) { ?>
    <div class="alert warning text-danger squareup_spacer_10">
        <i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $error_currency; ?>
    </div>
<?php } ?>
<?php if ($warning_currency) { ?>
    <div class="alert attention squareup_spacer_10">
        <i class="fa fa-exclamation-circle"></i>&nbsp;<?php echo $warning_currency; ?>
    </div>
<?php } ?>
<div id="squareup-notification">
    <div class="text-center alert information squareup_spacer_10"><i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;<?php echo $text_loading; ?></div>
</div>
<form id="payment-form" action="<?php echo $action; ?>">
	<ul id="tabs" class="nav nav-tabs htabs" style="display:none;">
		<?php if ($cards) { ?>
		<li id="card_details" class="active"><a href="#tab-card_details" data-toggle="tab"><?php echo $text_saved_card; ?></a></li>
		<li id="hide-card" style="display:none;"><a href="#hide-card-details" data-toggle="tab"><?php echo $text_card_details; ?></a></li>
		<?php } else{ ?>
		<li class="active"><a href="#hide-card-details" data-toggle="tab">Credit/Debit Card</a></li>
		<?php } ?>
		<?php if ($squareup_google_pay_status) { ?>
		<li id="gPay-tab" style="display:none;"><a href="#tab-gPay" data-toggle="tab">Pay with Google Pay</a></li>
		<?php } ?>
		<?php if ($squareup_apple_pay_status) { ?>
		<li id="apple-tab" style="display:none;"><a href="#tab-aPay" data-toggle="tab">Pay with Apple Pay</a></li>
		<?php } ?>
		<?php if ($squareup_after_pay_status) { ?>
		<li id="afterpay-tab" style="display:none;"><a href="#tab-afterpay" data-toggle="tab">Pay with After Pay</a></li>
		<?php } ?>
		<?php if ($squareup_gift_card_status) { ?>
		<li id="gift-card-tab" style="display:none;"><a href="#tab-gift-card" data-toggle="tab">Pay with Gift Card</a></li>
		<?php } ?>
	</ul>
	<div class="tabs-content">
	<fieldset class="tab-pane tab-content" id="tab-card_details">
        <?php if ($cards) { ?>
        <div class="form-group">
            <div class="col-sm-12">
                <select class="form-control" name="squareup_select_card" id="squareup_select_card">
                    <option <?php echo !$has_selected_card ? 'selected' : ''; ?> value onclick="$('a[href=\'#hide-card-details\']').trigger('click'); return false;"><?php echo $text_new_card; ?></option>
                    <?php foreach ($cards as $card) { ?>
                        <option tkn="<?php echo $card['token']; ?>" value="<?php echo $card['id']; ?>"<?php echo ($card['selected'] ? 'selected' : ''); ?>><?php echo $card['text']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <?php } ?>
    </fieldset>
	<fieldset <?php echo $has_selected_card ? 'class="tab-pane  tab-content"' : 'class="tab-pane  tab-content active"'; ?> id="hide-card-details">
	<div id="card-container" style="margin-top: 0"></div>
	<?php if ($is_logged) { ?>
		<div class="squareup_save_card" style="display: none;">
		<?php if ($has_recurring_products) { ?>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="squareup_save_card"><?php echo $text_card_save; ?></label>
			<div class="col-sm-5">
				<input type="checkbox" id="squareup_save_card" value="1" name="squareup_save_card" checked  />
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
		</div>
	<?php } ?>
	</fieldset>
	<?php if ($squareup_google_pay_status) { ?>
	<fieldset class="tab-pane tab-content" id="tab-gPay">
	<div id="google-pay-button"></div>
	</fieldset>
	<?php } ?>
	<?php if ($squareup_apple_pay_status) { ?>
    <fieldset class="tab-pane tab-content" id="tab-aPay">
	<div id="apple-pay-button"></div>
	</fieldset>
	<?php } ?>
	<?php if ($squareup_after_pay_status) { ?>
    <fieldset class="tab-pane tab-content" id="tab-afterpay">
	<div id="afterpay-button"></div>
	</fieldset>
	<?php } ?>
	<?php if ($squareup_gift_card_status) { ?>
    <fieldset class="tab-pane tab-content" id="tab-gift-card">
	<div id="gift-card-container"></div>
	</fieldset>
	<?php } ?>
    </div>
	<div class="buttons" style="display: none;">
        <div class="pull-right">
            <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm-order" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary">
        </div>
    </div>

    <input type="hidden" name="squareup_nonce" id="squareup_nonce"/>
    <input type="hidden" name="squareup_digital_wallet_type" id="squareup_digital_wallet_type"/>
    <input type="hidden" name="squareup_buyer_verification_token" id="squareup_buyer_verification_token"/>
</form>
<div id="payment-status-container"></div>

<script type="text/javascript">
	var lastExecution = 0;
	var delay = 50;
	function onScriptLoad() {
		var script = document.createElement('script');
		script.type="text/javascript";
		script.src="<?php echo $squareup_js_api; ?>";
		script.async = true;
		document.head.appendChild(script);
	}
	<?php if ($squareup_gift_card_status) { ?>
		document.querySelector('.nav-tabs #gift-card-tab').style.display = 'block';
	<?php } ?>
	
	<?php if ($squareup_after_pay_status) { ?>
		document.querySelector('.nav-tabs #afterpay-tab').style.display = 'block';
	<?php } ?>
	
	<?php if ($squareup_google_pay_status) { ?>
		document.querySelector('.nav-tabs #gPay-tab').style.display = 'block';
	<?php } ?>
	async function main() {
		if (lastExecution >= (Date.now() - delay))
    return;
		const payment_squareup_google_pay_status = '<?php echo $squareup_google_pay_status; ?>';
		const payment_squareup_apple_pay_status = '<?php echo $squareup_apple_pay_status; ?>';
		const payment_squareup_after_pay_status = '<?php echo $squareup_after_pay_status; ?>';
		const payment_squareup_gift_card_status = '<?php echo $squareup_gift_card_status; ?>';
		const appId = '<?php echo $app_id; ?>';
		const locationId = '<?php echo $location_id; ?>';
		const payments = Square.payments('<?php echo $app_id; ?>', '<?php echo $location_id; ?>');
		let lineItems = getLineItems();
		//let total = calculateTotal(lineItems);
		var billingContact = {};

		if('<?php echo $customer_family_name; ?>' != ""){
		  billingContact['familyName'] = '<?php echo $customer_family_name; ?>';
		}
		if('<?php echo $customer_given_name; ?>' != ""){
		  billingContact['givenName'] = '<?php echo $customer_given_name; ?>';
		}
		if('<?php echo $customer_email; ?>' != ""){
		  billingContact['email'] = '<?php echo $customer_email; ?>';
		}
		if('<?php echo $customer_country; ?>' != ""){
		  billingContact['country'] = '<?php echo $customer_country; ?>';
		}
		if('<?php echo $customer_city; ?>' != ""){
		  billingContact['city'] = '<?php echo $customer_city; ?>';
		}
		if('<?php echo $customer_address; ?>' != ""){
		  billingContact['addressLines'] = JSON.parse('<?php echo $customer_address; ?>');
		}
		if('<?php echo $customer_postal_code; ?>' != ""){
		  billingContact['postalCode'] = '<?php echo $customer_postal_code; ?>';
		}
		if('<?php echo $customer_phone; ?>' != ""){
		  billingContact['phone'] = '<?php echo $customer_phone; ?>';
		}
		
		function squareupError(error) {
            $('#button-confirm-order').button('reset');

            $('#squareup-notification').html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-label="X"><span aria-hidden="true">&times;</span></button><i class="fa fa-exclamation-circle"></i>&nbsp;' + error + '</div>');
        }
		let card;
		try {
		card = await initializeCard(payments);
			if (card) {
				$('#squareup-notification').empty();
				$('#payment-form').slideDown();
				$('#payment-form .buttons').slideDown();
				$('#payment-form .squareup_save_card').slideDown();
				$('#payment-form .nav-tabs').slideDown();
				<?php if ($cards) { ?>
					$('#payment-form #tab-card_details').addClass('active');
				<?php } ?>
				
			}
		} catch (e) {
			console.error('Initializing Card failed', e);
			return;
		}

		//await card.attach('#card-container');
		async function initializeCard(payments) {
			const darkModeCardStyle = {
				'.input-container': {
				borderColor: '#2D2D2D',
				borderRadius: '6px',
				},
				'.input-container.is-focus': {
				borderColor: '#006AFF',
				},
				'.input-container.is-error': {
				borderColor: '#ff1600',
				},
				'.message-text': {
				color: '#999999',
				},
				'.message-icon': {
				color: '#999999',
				},
				'.message-text.is-error': {
				color: '#ff1600',
				},
				'.message-icon.is-error': {
				color: '#ff1600',
				},
				input: {
				backgroundColor: '#2D2D2D',
				color: '#FFFFFF',
				fontFamily: 'helvetica neue, sans-serif',
				},
				'input::placeholder': {
				color: '#999999',
				},
				'input.is-error': {
				color: '#ff1600',
				},
			};
		const card = await payments.card({
			style: darkModeCardStyle
		});
		if ($('#card-container .sq-card-wrapper').length == 0) {
			await card.attach('#card-container'); 
				return card; 
			}
		}
		
		function buildPaymentRequest(payments) {
			return payments.paymentRequest({
			  countryCode: '<?php echo $customer_country; ?>',
			  currencyCode: '<?php echo $currency; ?>',
			  total: {
				amount: '<?php echo $amount_new; ?>',
				label: 'Total',
			  },
			});
		}
		
		function buildAfterPayPaymentRequest(payments) {
			
			const req = payments.paymentRequest({
			  countryCode: '<?php echo $customer_country; ?>',
			  currencyCode: '<?php echo $currency; ?>',
			  total: {
				amount: '<?php echo $amount_new; ?>',
				label: 'Total',
			  },
			  requestShippingContact: true,
			});

			req.addEventListener('afterpay_shippingaddresschanged', function () {
			  return {
				shippingOptions: [
				  {
					amount: '0.00',
					id: 'shipping-option-1',
					label: 'Free',
					taxLineItems: [
						{
							amount: '0.00',
							label: 'Tax',
						},
					],
					total: {
						amount: '<?php echo $amount_new; ?>',
						label: 'Total',
					},
				  },
				],
			  };
			});

			return req;
		}
		
		async function createPayment(token, squareup_save_card, squareup_select_card, verificationToken) {
			const form = '#payment-form';

			const bodyParameters = {
				locationId,
				sourceId: token,
				squareup_digital_wallet_type: 'NONE',
				squareup_nonce: token
			  
			};

			if (verificationToken !== undefined) {
				bodyParameters.squareup_buyer_verification_token = verificationToken;
			} else {
				bodyParameters.squareup_buyer_verification_token = '';
			}
			
			bodyParameters.squareup_save_card = squareup_save_card;
			bodyParameters.squareup_select_card = squareup_select_card;
			
			const body = JSON.stringify(bodyParameters);
			const paymentResponse = await fetch($(form).attr('action'), {
			  method: 'POST',
			  headers: {
				'Content-Type': 'application/json',
			  },
			  body,
			});

			if (paymentResponse.ok) {
			  return paymentResponse.json();
			}

			const errorBody = await paymentResponse.text();
			throw new Error(errorBody);
		}

		async function createDigitalWalletPayment(token, squareup_save_card, squareup_select_card, verificationToken) {
			const form = '#payment-form';

			const bodyParameters = {
				locationId,
				sourceId: token,
				squareup_digital_wallet_type: 'TRUE',
				squareup_nonce: token
			  
			};

			if (verificationToken !== undefined) {
				bodyParameters.squareup_buyer_verification_token = verificationToken;
			} else {
				bodyParameters.squareup_buyer_verification_token = '';
			}
			
			bodyParameters.squareup_save_card = squareup_save_card;
			bodyParameters.squareup_select_card = squareup_select_card;
			
			const body = JSON.stringify(bodyParameters);
			const paymentResponse = await fetch($(form).attr('action'), {
			  method: 'POST',
			  headers: {
				'Content-Type': 'application/json',
			  },
			  body,
			});

			if (paymentResponse.ok) {
			  return paymentResponse.json();
			}

			const errorBody = await paymentResponse.text();
			throw new Error(errorBody);
		}

		async function tokenize(paymentMethod) {
			const tokenResult = await paymentMethod.tokenize();
			if (tokenResult.status === 'OK') {
				return tokenResult.token;
			} else {
				let errorMessage = `Tokenization failed with status: ${tokenResult.status}`;
					if (tokenResult.errors) {
						errorMessage += ` and errors: ${JSON.stringify(
						tokenResult.errors
						)}`;
					}

				throw new Error(errorMessage);
			}
		}

		  // status is either SUCCESS or FAILURE;
		  function displayPaymentResults(status) {
			const statusContainer = document.getElementById(
			  'payment-status-container'
			);
			if (status === 'SUCCESS') {
			  statusContainer.classList.remove('is-failure');
			  statusContainer.classList.add('is-success');
			} else {
			  statusContainer.classList.remove('is-success');
			  statusContainer.classList.add('is-failure');
			}

			statusContainer.style.visibility = 'visible';
		  }
		async function verifyBuyer(payments, token) {
			const verificationDetails = {
				amount: '<?php echo $amount; ?>',
				intent: 'CHARGE',
				currencyCode: '<?php echo $currency; ?>',
				billingContact: billingContact
			};

			const verificationResults = await payments.verifyBuyer(
			  token,
			  verificationDetails
			);
			return verificationResults.token;
		  }
		async function handlePaymentMethodSubmission(
			  event,
			  paymentMethod,
			  shouldVerify = false
			) {
			  event.preventDefault();

			  try {
				// disable the submit button as we await tokenization and make a payment request.
				cardButton.disabled = true;
				$('#button-confirm-order').button('loading');
				const token = await tokenize(paymentMethod);
				const squareup_save_cardInput = document.getElementById('squareup_save_card');
				const squareup_select_cardInput = document.getElementById('squareup_select_card');
				const bodyParameters = {
				  squareup_nonce: token
				  
				};
				
				let verificationToken;
				let cardID;
				let squareup_save_card;
				let squareup_select_cardInput_value;

				if (shouldVerify) {
					if ($("#tab-card_details").hasClass("active") && squareup_select_cardInput !== null && squareup_select_cardInput.value) {
						cardID = squareup_select_cardInput.options[select.selectedIndex].car;
						squareup_select_cardInput_value = cardID;
					} else if ($("#hide-card-details").hasClass("active") && squareup_save_cardInput !== null && squareup_save_cardInput.checked) {
						if (squareup_save_cardInput.checked == true) {
							bodyParameters.squareup_digital_wallet_type = 'NONE';
							bodyParameters.squareup_save_card = squareup_save_cardInput.value;
							const bodys = JSON.stringify(bodyParameters);
							const body = bodys;
							
							const saveCardResponse = await fetch('<?php echo $save_card_action; ?>', {
							  method: 'POST',
							  headers: {
								'Content-Type': 'application/json',
							  },
							  body,
							});
							const saveCardResponseJson = await saveCardResponse.json();
							if (saveCardResponseJson.card_id) {
							  cardID = saveCardResponseJson.card_id;
							  squareup_save_card = saveCardResponseJson.card_id;
							}
						}
					}
					if (cardID) {
						verificationToken = await verifyBuyer(payments, cardID);
					} else {
						verificationToken = await verifyBuyer(payments, token);
					}
				}
				if ($("#tab-gPay").hasClass("active") || $("#tab-aPay").hasClass("active")) {
					const paymentResults = await createDigitalWalletPayment(
					  token,
					  squareup_save_card,
					  squareup_select_cardInput_value,
					  verificationToken
					);
					
					if (paymentResults.error) {
						squareupError(paymentResults.error);
					} else if (paymentResults.redirect) {
						document.location = paymentResults.redirect;
					}
				} else {
					const paymentResults = await createPayment(
					  token,
					  squareup_save_card,
					  squareup_select_cardInput_value,
					  verificationToken
					);
					
					if (paymentResults.error) {
						squareupError(paymentResults.error);
					} else if (paymentResults.redirect) {
						document.location = paymentResults.redirect;
					}
				}

			  } catch (e) {
				cardButton.disabled = false;
				$('#button-confirm-order').button('reset');
				displayPaymentResults('FAILURE');
				console.error(e.message);
			  }
		}
			
		async function handlePaymentWithCardOnFileMethodSubmission(
			  event,
			  tokenID,
			  cardId,
			) {
			  event.preventDefault();

			  try {
				// disable the submit button as we await tokenization and make a payment request.
				cardButton.disabled = true;
				$('#button-confirm-order').button('loading');
				let verificationToken = await verifyBuyer(payments, tokenID);
				let token;
				let squareup_save_card;
				const paymentResults = await createPayment(
				  tokenID,
				  squareup_save_card,
				  cardId,
				  verificationToken
				);

				if (paymentResults.error) {
					squareupError(paymentResults.error);
				} else if (paymentResults.redirect) {
					document.location = paymentResults.redirect;
				}
			  } catch (e) {
				cardButton.disabled = false;
				$('#button-confirm-order').button('reset');
				displayPaymentResults('FAILURE');
				console.error(e.message);
			  }
		}
		
		if (payment_squareup_gift_card_status == '1') {
			document.querySelector('.nav-tabs #gift-card-tab').style.display = 'block';
			let giftCard;
			var giftCardClicked;
			try {
				document.getElementById("gift-card-tab").onclick = function(event) {
					if (!giftCardClicked) {
						event.preventDefault();
						giftCard = initializeGiftCard(payments);
						console.log('=== gift-card-tab openned ===');
						giftCardClicked = true;
					}
				}
				
			} catch (e) {
				console.error('Initializing Gift Card failed', e);
			}

			async function initializeGiftCard(payments) {
				const giftCard = await payments.giftCard();
				await giftCard.attach('#gift-card-container');

				return giftCard;
			}
		}
		const activeCard = document.querySelector('.active #tab-card_details');
		const activeHideCard = document.querySelector('.active #hide-card-details');
		const activegiftCard = document.querySelector('.active #tab-gift-card');
		const cardButton = document.getElementById('button-confirm-order');
		
		cardButton.addEventListener('click', async function (event) {
			if (activeCard || activeHideCard) {
				cardButton.classList.toggle("activeCard");
			}

			if (activegiftCard) {
				cardButton.classList.toggle("activegiftCard");
			}

			//if (activeCard || activeHideCard) {
			if ($("#tab-gift-card").hasClass("active")) {
				await handlePaymentMethodSubmission(event, giftCard);
			}
			if ($("#hide-card-details").hasClass("active") || $("#tab-card_details").hasClass("active")) {
				const squareupcardInput = document.getElementById('squareup_select_card');
				if (squareupcardInput !== null && squareupcardInput.value) {
						tokenID = $('#squareup_select_card option:selected').attr("tkn");
						cardID = squareupcardInput.value;
						await handlePaymentWithCardOnFileMethodSubmission(event, tokenID, cardID);
				} else {
					await handlePaymentMethodSubmission(event, card, true);
				}
			}
		});

		if (payment_squareup_google_pay_status == '1') {
			let googlePay;
			let googlePayClicked;
			try {
				document.getElementById("gPay-tab").onclick = function(event) {
					if (!googlePayClicked) {
					event.preventDefault();
					googlePay = initializeGooglePay(payments);
					console.log('=== gPay-tab openned ===');
					googlePayClicked = true;
					}
				}
			} catch (e) {
				console.error('Initializing Google Pay failed', e);
				// There are a number of reason why Google Pay may not be supported
				// (e.g. Browser Support, Device Support, Account). Therefore you should handle
				// initialization failures, while still loading other applicable payment methods.
			}

			async function initializeGooglePay(payments) {
				const paymentRequest = buildPaymentRequest(payments);
				const googlePay = await payments.googlePay(paymentRequest);
				if ($('#google-pay-button div .gpay-card-info-container').length == 0) {
				await googlePay.attach('#google-pay-button', { buttonColor: 'default', buttonType: 'long', buttonSizeMode: 'static' });
				}


				return googlePay;
			}

			if (googlePay) {
				const googlePayButton = document.getElementById('google-pay-button');
				document.querySelector('.nav-tabs #gPay-tab').style.display = 'block';
				googlePayButton.addEventListener('click', async function (event) {
					await handlePaymentMethodSubmission(event, googlePay);
				});
			}
		}

		if (payment_squareup_apple_pay_status == '1') {
			let applePay;
			try {
				applePay = await initializeApplePay(payments);
			} catch (e) {
				console.error('Initializing Apple Pay failed', e);
				// There are a number of reason why Apple Pay may not be supported
				// (e.g. Browser Support, Device Support, Account). Therefore you should handle
				// initialization failures, while still loading other applicable payment methods.
			}

			async function initializeApplePay(payments) {
				const paymentRequest = buildPaymentRequest(payments);
				const applePay = await payments.applePay(paymentRequest);
				// Note: You do not need to `attach` applePay.
				return applePay;
			}

			if (applePay) {
				const applePayTab = document.getElementById('apple-tab');
				const applePayButton = document.getElementById('apple-pay-button');
				document.querySelector('.nav-tabs #apple-tab').style.display = 'block';
				applePayButton.addEventListener('click', async function (event) {
					await handlePaymentMethodSubmission(event, applePay);
				});
			}
		}

		if (payment_squareup_after_pay_status == '1') {
			let afterpay;
			let afterpayClicked;
			try {
				document.getElementById("afterpay-tab").onclick = function(event) {
					if (!afterpayClicked) {
						event.preventDefault();
						afterpay = initializeAfterpay(payments);
						console.log('=== afterpay-tab openned ===');
						afterpayClicked = true;
					}
				}
			} catch (e) {
				console.error('Initializing Afterpay/Clearpay failed', e);
				// There are a number of reason why Afterpay/Clearpay may not be supported
				// (e.g. Browser Support, Device Support, Account). Therefore you should handle
				// initialization failures, while still loading other applicable payment methods.
			}

			async function initializeAfterpay(payments) {
				const paymentRequest = buildAfterPayPaymentRequest(payments);
				const afterpay = await payments.afterpayClearpay(paymentRequest);
				if ($('#afterpay-button button.sq-ap__button').length == 0) {
				await afterpay.attach('#afterpay-button');
				}

				return afterpay;
			}

			if (afterpay) {
				const afterpayButton = document.getElementById('afterpay-button');
				document.querySelector('.nav-tabs #afterpay-tab').style.display = 'block';
				afterpayButton.addEventListener('click', async function (event) {
					await handlePaymentMethodSubmission(event, afterpay);
				});
			}
		}
		lastExecution = Date.now();
	}
	
	function getLineItems(json) {
	  var lineItems = [];

	  $.ajax({
			url : "<?php echo $getTotals; ?>",
			dataType : 'json',
			type : 'POST',
			success : function(json) {
				if (json.totals) {
					for (var x = 0; x < json.totals.length; x++) {
					  var line = json.totals[x];
					  lineItems.push({label: line.title, amount: line.text});
					}
				}
			},
			error : function(jqXHR, ajaxSettings, thrownError) {
				squareupError(thrownError);
			}
		});

	  return lineItems;
	}
	
	$('#squareup_select_card').change(function() {
		if ($(this).val()) {
			$('#hide-card-details').slideUp();
			document.querySelector('.nav-tabs #hide-card').style.display = 'none';
		} else {
			$('a[href=\'#hide-card-details\']').trigger('click');
			document.querySelector('.nav-tabs #hide-card').style.display = 'block';
			//$('#hide-card-details').slideDown();
		}
	});
		
  
  main();
</script>
<style>
	#apple-pay-button {
		height: 48px;
		width: 100%;
		display: inline-block;
		-webkit-appearance: -apple-pay-button;
		-apple-pay-button-type: plain;
		-apple-pay-button-style: black;
	}
	#google-pay-button button {
		width: 100%;
	}
	#card-container .sq-card-wrapper {width: 100% !important;}
</style>
