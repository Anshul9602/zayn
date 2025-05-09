<?php
// Text
$_['text_accepted_cards']                       = 'Accepted Cards:';
$_['text_card_cvc']                             = 'Card Security Code (CVC):';
$_['text_card_details']                         = 'Pay with Credit/Debit Card';
$_['text_card_ends_in']                         = 'Pay with existing %s card that ends on XXXX XXXX XXXX %s';
$_['text_card_expiry']                          = 'Card Expiry (MM/YY):';
$_['text_card_number']                          = 'Card Number:';
$_['text_card_placeholder']                     = 'XXXX XXXX XXXX XXXX';
$_['text_card_save']                            = 'Save card for future use?';
$_['text_card_save_warning']                    = 'Square can accept recurring payments only with saved cards.';
$_['text_card_zip']                             = 'Card Zip Code:';
$_['text_card_zip_placeholder']                 = 'Zip Code';
$_['text_cron_expiration_message_expired']      = 'The following non-captured transactions have expired. They have been automatically voided by Square due to 6 days of inactivity. Customers have been notified.';
$_['text_cron_expiration_message_expiring']     = 'The following non-captured transactions are about to expire. Please take action as soon as possible.';
$_['text_cron_expiration_subject']              = 'Square non-captured transactions';
$_['text_cron_fail_charge']                     = 'Profile <strong>#%s</strong> could not get charged with <strong>%s</strong>';
$_['text_cron_inventory_dashboard']             = '<a href="%s" target="_blank">Click here</a> to access your Square Dashboard to manually set your inventories.<br /><br />For more detailed instructions, here\'s a helpful <a href="%s" target="_blank">Video Tutorial</a>!';
$_['text_cron_inventory_links_intro']           = 'New items have just been synced. Some of them have been added to Square with empty inventories.';
$_['text_cron_inventory_links_more']            = '... %s other item(s).';
$_['text_cron_message']                         = 'Here is a list of all CRON tasks performed by your Square extension:';
$_['text_cron_subject']                         = 'Square CRON job summary';
$_['text_cron_success_charge']                  = 'Profile <strong>#%s</strong> was charged with <strong>%s</strong>';
$_['text_cron_summary_error_heading']           = 'Transaction Errors:';
$_['text_cron_summary_fail_heading']            = 'Failed Transactions (Profiles Suspended):';
$_['text_cron_summary_fail_sync']               = 'Sync failed. Errors:';
$_['text_cron_summary_success_heading']         = 'Successful Transactions:';
$_['text_cron_summary_success_sync_heading']    = 'Sync between Square and OpenCart:';
$_['text_cron_summary_token_heading']           = 'Refresh of access token:';
$_['text_cron_summary_token_updated']           = 'Access token updated successfully!';
$_['text_cron_tax_rates_intro']                 = 'The last Square sync has resulted in <strong>%s</strong> new Tax Rate(s) in your OpenCart store.<br /><br />Please visit <a href="%s" target="_blank">the admin panel of the Square Payment Extension</a> to configure the appropriate Geo Zone for each new Tax Rate:';
$_['text_cron_tax_rates_subject']               = 'Square - newly created Tax Rates';
$_['text_cron_warnings_intro']                  = 'The last Square sync has resulted in <strong>%s</strong> issues:';
$_['text_cron_warnings_subject']                = 'Square Catalog Sync: A few items to update manually';
$_['text_cvv']                                  = 'CVV';
$_['text_default_squareup_name']                = 'Credit / Debit Card';
$_['text_expiry']                               = 'MM/YY';
$_['text_length']                               = ' for %s payments';
$_['text_loading']                              = 'Loading... Please wait...';
$_['text_new_card']                             = '+ Add new card';
$_['text_order_error_mail_intro']               = 'The following order <strong>#%s</strong> was SUCCESSFULLY charged; however it was submitted to Square as a non-Itemized "Custom Amount" transaction due to the following error:';
$_['text_order_error_mail_outro']               = 'Because of the order being recorded as "Custom Amount", you may need to manually adjust your accounting and inventory entries in Square to reflect the itemization of the order.<br /><br />To prevent this issue in the future:<br /><br />#1 - Please first ensure you have the latest version of the Square plug-in.<br />#2 - If upgrading does not resolve the issue, please file a support ticket here [ <a href="%s" target="_blank">%s</a> ] with as much information as possible.<br /><br />This is an automated email. Please do not reply.';
$_['text_order_error_mail_subject']             = 'Square Order Issue';
$_['text_order_id']                             = 'Order #%s';
$_['text_pay_with_applepay']                    = 'Pay with Apple Pay';
$_['text_pay_with_wallet']                      = 'Pay with a Digital Wallet';
$_['text_recurring']                            = '%s every %s %s';
$_['text_saved_card']                           = 'Use Saved Card:';
$_['text_secured']                              = 'Secured by Square';
$_['text_squareup_profile_suspended']           = ' Your recurring payments have been suspended. Please contact us for more details.';
$_['text_squareup_recurring_expired']           = ' Your recurring payments have expired. This was your last payment.';
$_['text_squareup_trial_expired']               = ' Your trial period has expired.';
$_['text_sync_disabled']                        = 'Sync is disabled. No sync has been performed.';
$_['text_token_expired_message']                = "The Square payment extension's access token connecting it to your Square account has expired. You need to verify your application credentials and CRON job in the extension settings and connect again.";
$_['text_token_expired_subject']                = 'Your Square access token has expired!';
$_['text_token_issue_customer_error']           = 'We are experiencing a technical outage in our payment system. Please try again later.';
$_['text_token_revoked_message']                = "The Square payment extension's access to your Square account has been revoked through the Square Dashboard. You need to verify your application credentials in the extension settings and connect again.";
$_['text_token_revoked_subject']                = 'Your Square access token has been revoked!';
$_['text_trial']                                = '%s every %s %s for %s payments then ';
$_['text_view']                                 = 'VIEW';
$_['text_wallet_details']                       = 'Pay with a Digital Wallet';

// Error
$_['error_browser_not_supported']               = 'Error: The payment system no longer supports your web browser. Please update or use a different one.';
$_['error_card_invalid']                        = 'Error: Card is invalid!';
$_['error_currency_invalid']                    = 'The expected currency is not supported on this store.';
$_['error_generic']                             = 'Unexpected website error. Please contact the store owner on <strong>%s</strong> or e-mail <strong>%s</strong>. Note that your transaction may be processed.';
$_['error_price_invalid_negative']              = 'The recurring price is negative. This amount cannot be charged by Square.';
$_['error_squareup_cron_token']                 = 'Error: Access token could not get refreshed. Please connect your Square Payment extension via the OpenCart admin panel.';
$_['error_currency_mismatch']                   = 'Your default store currency is different than your Square location currency, therefore the catalog was not synced. In order for Catalog Sync to work, your default OpenCart currency must be %s.';

// Warning
$_['warning_currency_converted']                = 'Warning: The total paid amount will be converted into <strong>%s</strong> at a conversion rate of <strong>%s</strong>. The expected transaction amount will be <strong>%s</strong>.';

// Statuses
$_['squareup_status_comment_authorized']        = 'The card transaction has been authorized but not yet captured.';
$_['squareup_status_comment_captured']          = 'The card transaction was authorized and subsequently captured (i.e., completed).';
$_['squareup_status_comment_failed']            = 'The card transaction failed.';
$_['squareup_status_comment_voided']            = 'The card transaction was authorized and subsequently voided (i.e., canceled).   ';

// Override errors
$_['squareup_error_field']                                  = ' Field: %s';
$_['squareup_override_error_billing_address.country']       = 'Payment Address country is not valid. Please modify it and try again.';
$_['squareup_override_error_email_address']                 = 'Your customer e-mail address is not valid. Please modify it and try again.';
$_['squareup_override_error_phone_number']                  = 'Your customer phone number is not valid. Please modify it and try again.';
$_['squareup_override_error_shipping_address.country']      = 'Shipping Address country is not valid. Please modify it and try again.';
$_['PAN_FAILURE']							= 'Incorrect card number. Update the card number.';
$_['CARD_TOKEN_USED']						= 'Card token already used, please request a new one.';
$_['CUSTOMER_NOT_FOUND']					= 'The provided customer id can not be found in the merchants customers list.';
$_['SOURCE_EXPIRED']						= 'Session expired, please try again.';
$_['SOURCE_USED']							= 'The provided source id was already used to create a card.';
$_['INVALID_CARD_DATA']						= 'The provided card data is invalid.Please try with a new card.';
$_['CARD_DECLINED_VERIFICATION_REQUIRED']	= 'The payment card is declined. Additional verification is needed.';
$_['CARD_PROCESSING_NOT_ENABLED']			= 'The location provided in the API call is not enabled for credit card processing.';
$_['INTERNAL_SERVER_ERROR']					= 'A general server error occurred. Please try again or contact support for more information.';
$_['UNAUTHORIZED']							= 'A general authorization error occurred. Please try again or contact support for more information.';
$_['ACCESS_TOKEN_EXPIRED']					= 'The provided access token has expired.';
$_['ACCESS_TOKEN_REVOKED']					= 'The provided access token has been revoked.';
$_['CLIENT_DISABLED']						= 'The provided client has been disabled.';
$_['FORBIDDEN']								= 'A general server error occurred. Please try again or contact support for more information.';
$_['INSUFFICIENT_SCOPES']					= 'The provided access token does not have permission to execute the requested action.';
$_['APPLICATION_DISABLED']					= 'The calling application was disabled.';
$_['CARD_PROCESSING_NOT_ENABLED']			= 'The location provided in the API call is not enabled for credit card processing.';
$_['MERCHANT_SUBSCRIPTION_NOT_FOUND']		= 'A required subscription was not found for the merchant.';
$_['BAD_REQUEST']							= 'A general error occurred with the request. Please try again or contact support for more information.';
$_['MISSING_REQUIRED_PARAMETER']			= 'The request is missing a required path, query, or body parameter.';
$_['INCORRECT_TYPE']						= 'The value provided in the request is the wrong type.';
$_['INVALID_TIME']							= 'Formatting for the provided time value is incorrect.';
$_['CUSTOMER_MISSING_NAME']					= 'The provided customer does not have a recorded name.';
$_['CARD_EXPIRED']							= 'The card issuer declined the request because the card is expired.';
$_['INVALID_EXPIRATION']					= 'The expiration date for the payment card is invalid.';
$_['INVALID_EXPIRATION_YEAR']				= 'The expiration year for the payment card is invalid.';
$_['INVALID_EXPIRATION_DATE']				= 'The expiration date for the payment card is invalid.';
$_['UNSUPPORTED_CARD_BRAND']				= 'The credit card is not from a supported issuer.';
$_['UNSUPPORTED_ENTRY_METHOD']				= 'The entry method for the credit card (swipe, dip, tap) is not supported.';
$_['INVALID_ENCRYPTED_CARD']				= 'The encrypted card information is invalid.';
$_['INVALID_CARD']							= 'The credit card cannot be validated based on the provided details.';
$_['PAYMENT_AMOUNT_MISMATCH']				= 'Payment declined due to a payment amount mismatch. The provided amount does not match the expected one.';
$_['GENERIC_DECLINE']						= 'Unexpected decline. For more information contact the card issuer.';
$_['CVV_FAILURE']							= 'Card CVV is incorrect.';
$_['ADDRESS_VERIFICATION_FAILURE']			= 'Authorization error: Invalid card postal code. Please try again or contact support for more information.';
$_['INVALID_ACCOUNT']						= 'Invalid account. Try with another account.';
$_['CURRENCY_MISMATCH']						= 'The currency associated with the payment is not valid for the provided funding source.';
$_['INSUFFICIENT_FUNDS']					= 'There are insufficient funds to cover the payment. Add more funds and try again.';
$_['INSUFFICIENT_PERMISSIONS']				= 'The Square account has insufficent permissions to accept this payment.';
$_['CARDHOLDER_INSUFFICIENT_PERMISSIONS']	= 'Insufficent permissions to use the card.';
$_['INVALID_LOCATION']						= 'Payments are not allowed for this region.';
$_['TRANSACTION_LIMIT']						= 'Payment amount is not within the allowed limits.';
$_['VOICE_FAILURE']							= 'The request is declined, voice authorization is required.';
$_['EXPIRATION_FAILURE']					= 'Card expiration data is incorrect.';
$_['CARD_NOT_SUPPORTED']					= 'Card not supported in this location or by the MCC.';
$_['INVALID_PIN']							= 'Request decined due to invalid PIN.';
$_['MISSING_PIN']							= 'The required PIN code is missing.';
$_['MISSING_ACCOUNT_TYPE']					= 'The account type is missing.';
$_['INVALID_POSTAL_CODE']					= 'The postal code is incorrectly formatted.';
$_['INVALID_FEES']							= 'The app fee value is too high.';
$_['MANUALLY_ENTERED_PAYMENT_NOT_SUPPORTED']	= 'Payments attempted by manually entering the card number are declined.';
$_['PAYMENT_LIMIT_EXCEEDED']				= 'Request declined. The payment amount exceeded the processing limit for this merchant.';
$_['GIFT_CARD_AVAILABLE_AMOUNT']			= 'Gift card does not have sufficient balance for requested amount and tip.';
$_['ACCOUNT_UNUSABLE']						= 'The request failed. The account provided cannot carry out transations.';
$_['BUYER_REFUSED_PAYMENT']					= 'Bank account rejected or was not authorized for the payment.';
$_['DELAYED_TRANSACTION_EXPIRED']			= 'The delayed-capture payment has expired.';
$_['DELAYED_TRANSACTION_CANCELED']			= 'The delayed-capture payment is already cancelled.';
$_['DELAYED_TRANSACTION_CAPTURED']			= 'The delayed-capture payment is already captured.';
$_['DELAYED_TRANSACTION_FAILED']			= 'The delayed-capture payment is already failed.';
$_['CARD_TOKEN_EXPIRED']					= 'The card token has been expired.';
$_['CARD_TOKEN_USED']						= 'The provided card token already used to process the payment or refund.';
$_['AMOUNT_TOO_HIGH']						= 'The payment amount is too high for the payment source.';
$_['REFUND_AMOUNT_INVALID']					= 'The requested refund amount exceeds the amount available to refund.';
$_['REFUND_ALREADY_PENDING']				= 'The payment already has a pending refund.';
$_['PAYMENT_NOT_REFUNDABLE']				= 'The payment is not refundable.';
$_['REFUND_DECLINED']						= 'Request failed - The card issuer declined the refund.';
$_['SOURCE_USED']							= 'The provided source id was already used to create a card.';
$_['SOURCE_EXPIRED']						= 'Expired source id.';
$_['LOCATION_MISMATCH']						= 'The given location does not match the expected one.';
$_['IDEMPOTENCY_KEY_REUSED']				= 'The provided idempotency key has already been used. Please try again or contact support for more information.';
$_['VERIFY_CVV_FAILURE']					= 'The CVV could not be verified.';
$_['CARD_DECLINED_CALL_ISSUER']				= 'The payment card was declined. Call the card issuer for more information.';
$_['RATE_LIMITED']							= 'Rate Limited.';
$_['TEMPORARY_ERROR']						= 'A temporary internal error occurred. You can safely retry your call using the same idempotency key. Please try again or contact support for more information.';
$_['SERVICE_UNAVAILABLE']					= 'Service Unavailable. Please try again or contact support for more information.';