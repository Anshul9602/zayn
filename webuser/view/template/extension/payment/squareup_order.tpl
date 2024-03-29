<div id="transaction-alert" data-message="<?php echo $text_loading; ?>"></div>
<div class="text-right">
</div>
<div class="table-responsive">
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th class="text-left hidden-xs"><?php echo $column_transaction_id; ?></th>
                <th class="text-left hidden-xs"><?php echo $column_type; ?></th>
                <th class="text-left hidden-xs"><?php echo $column_amount; ?></th>
                <th class="text-left hidden-xs"><?php echo $column_refunds; ?></th>
                <th class="text-left hidden-xs hidden-sm"><?php echo $column_ip; ?></th>
                <th class="text-left"><?php echo $column_date_created; ?></th>
                <th class="text-right"><?php echo $column_action; ?></th>
            </tr>
        </thead>
        <tbody id="transactions">
        </tbody>
    </table>
    <div id="transactions_pagination" class="pagination"></div>
</div>
<div class="modal fade" id="squareup-confirm-modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><?php echo $text_confirm_action; ?></h4>
            </div>
            <div class="modal-body">
                <h4 id="squareup-confirm-modal-content"></h4>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $text_close; ?></button>
                <button id="squareup-confirm-ok" type="button" class="btn btn-primary"><?php echo $text_ok; ?></button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="squareup-refund-modal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-body">
                <div class="text-center">
                    <i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;<?php echo $text_loading; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    var listTransactions = function(page) {
        $.ajax({
          url : '<?php echo $url_list_transactions; ?>'.replace('{PAGE}', page ? page : transactionListPage),
          dataType : 'json',
          beforeSend : function() {
            $('#refresh_transactions').button('loading');
            $('#transactions_pagination').empty();
            $('#transactions').html('<tr><td colspan="9" class="text-center"><i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;<?php echo $text_loading; ?></td></tr>');
          },
          success : function(data) {
            var html = '';

            if (data.transactions.length) {
              for (var i in data.transactions) {
                var row = data.transactions[i];

                html += '<tr>';
                html += '<td class="text-left hidden-xs">' + (!row.is_merchant_transaction ? '<i class="fa fa-warning text-warning" data-toggle="tooltip" title="' + row.text_different_merchant + '"></i>&nbsp;' : '') + row.transaction_id + '</td>';
                html += '<td class="text-left hidden-xs">' + row.status + '</td>';
                html += '<td class="text-left hidden-xs">' + row.amount + '</td>';
                html += '<td class="text-left hidden-xs">' + row.amount_refunded + '</td>';
                html += '<td class="text-left hidden-xs hidden-sm">' + row.ip + '</td>';
                html += '<td class="text-left">' + row.date_created + '</td>';
                html += '<td class="text-right">';

                if (row.is_merchant_transaction) {
                    switch (row.type) {
                        case "AUTHORIZED" : {
                            html += '<a class="btn btn-success" data-url-transaction-capture="' + row.url_capture + '" data-confirm-capture="' + row.confirm_capture + '"><?php echo $text_capture; ?></a> ';
                            html += '<a class="btn btn-warning" data-url-transaction-void="' + row.url_void + '" data-confirm-void="' + row.confirm_void + '"><?php echo $text_void; ?></a> ';
                        } break;

                        case "CAPTURED" : {
                            if (row.is_fully_refunded) {
                                break;
                            }
                            html += '<a class="btn btn-danger" data-url-transaction-refund="' + row.url_refund + '" data-url-transaction-refund-modal="' + row.url_refund_modal + '"><?php echo $text_refund; ?></a> ';
                        } break;
                    }
                }

                html += ' <a class="btn btn-info" href="' + row.url_info + '"><?php echo $text_view; ?></a>';
                html += '</td>';
                html += '</tr>';
              }
            } else {
              html += '<tr>';
              html += '<td class="text-center" colspan="7"><?php echo $text_no_transactions; ?></td>';
              html += '</tr>';
            }

            $('#transactions').html(html);
            
            $('#transactions_pagination').html(data.pagination).find('a[href]').each(function(index,element) {
              $(this).click(function(e) {
                e.preventDefault();

                transactionListPage = isNaN($(this).attr('href')) ? 1 : $(this).attr('href');

                listTransactions();
              })
            });

            for (var j in data.order_histories) {
                var order_history_data = data.order_histories[j];

                $.ajax({
                    url: '<?php echo (!$old_api) ? ($catalog . "index.php?route=api/order/history&token=' + token + '") : ("index.php?route=sale/order/api&token=" . $token . "&api=api/order/history"); ?>&store_id=' + order_history_data.store_id + '&order_id=' + order_history_data.order_id,
                    type: 'post',
                    dataType: 'json',
                    data: order_history_data,
                    async: false,
                    success: function() {
                        $('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

                        $('select[name="order_status_id"]').val(order_history_data.order_status_id);
                    }
                });
            }
          },
          complete : function() {
            $('#refresh_transactions').button('reset');
          }
        });
    }

    var transactionLoading = function() {
        var message = $('#transaction-alert').attr('data-message');

        $('#transaction-alert').html('<div class="text-center alert alert-info"><i class="fa fa-circle-o-notch fa-spin"></i>&nbsp;' + message + '</div>');
    }

    var transactionError = function(message) {
        $('#transaction-alert').html('<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" aria-label="X"><span aria-hidden="true">&times;</span></button><i class="fa fa-exclamation-circle"></i>&nbsp;' + message + '</div>');
    }

    var transactionSuccess = function(message) {
        $('#transaction-alert').html('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert" aria-label="X"><span aria-hidden="true">&times;</span></button><i class="fa fa-exclamation-circle"></i>&nbsp;' + message + '</div>');
    }

    var addOrderHistory = function(data, success_callback) {
        $.ajax({
            url: '<?php echo (!$old_api) ? ($catalog . "index.php?route=api/order/history&token=' + token + '") : ("index.php?route=sale/order/api&token=" . $token . "&api=api/order/history"); ?>&store_id=' + data.store_id + '&order_id=' + data.order_id,
            type: 'post',
            dataType: 'json',
            data: data,
            success: function(json) {
                if (json['error']) {
                    transactionError(json['error']);
                    enableTransactionButtons();
                }

                if (json['success']) {
                    success_callback();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                transactionError(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                enableTransactionButtons();
            }
        });
    }

    var transactionRequest = function(type, url, data) {
        $.ajax({
            url : url,
            dataType : 'json',
            type : type,
            data : data,
            beforeSend : transactionLoading,
            success : function(json) {
                if (json.error) {
                    transactionError(json.error);
                    enableTransactionButtons();
                }

                if (json.success && json.order_history_data) {
                    addOrderHistory(json.order_history_data, function() {
                        transactionSuccess(json.success);
                        listTransactions();

                        $('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

                        $('select[name="order_status_id"]').val(json.order_history_data.order_status_id);
                    });
                }
            },
            error : function(xhr, ajaxSettings, thrownError) {
                transactionError(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                enableTransactionButtons();
            }
        });
    }

    var disableTransactionButtons = function() {
        $('*[data-url-transaction-capture], *[data-url-transaction-void], *[data-url-transaction-refund]').attr('disabled', true);
    }

    var enableTransactionButtons = function() {
        $('*[data-url-transaction-capture], *[data-url-transaction-void], *[data-url-transaction-refund]').attr('disabled', false);
    }

    var modalConfirm = function(url, text) {
        var modal = '#squareup-confirm-modal';
        var content = '#squareup-confirm-modal-content';
        var button = '#squareup-confirm-ok';

        $(content).html(text);
        $(button).unbind().click(function() {
            disableTransactionButtons();

            $(modal).modal('hide');

            transactionRequest('GET', url);
        });
        
        $(modal).modal('show');
    }

    var refundInputValidate = function(reason_input, amount_input) {
        var result = true;

        if (!$(reason_input)[0].checkValidity()) {
            $(reason_input).closest('.form-group').addClass('has-error');
            result = false;
        } else {
            $(reason_input).closest('.form-group').removeClass('has-error');
        }

        if (!$(amount_input)[0].checkValidity()) {
            $(amount_input).closest('.form-group').addClass('has-error');
            result = false;
        } else {
            $(amount_input).closest('.form-group').removeClass('has-error');
        }

        return result;
    }

    var modalRefund = function(url, url_refund_modal) {
        $('#squareup-refund-modal').modal('show');

        var setModalHtml = function(html) {
            $('#squareup-refund-modal .modal-content').html(html);
        }

        $.ajax({
            url : url_refund_modal,
            dataType : 'json',
            success : function(data) {
                if (typeof data.error != 'undefined') {
                    setModalHtml('<div class="modal-body"><div class="alert alert-danger">' + data.error + '</div></div>');
                } else if (typeof data.html != 'undefined') {
                    setModalHtml(data.html);

                    var invalidRefundAmount = function(element) {
                        var value = parseFloat($(element).val().replace(/[^0-9\.\-]/g, ""));
                        var max = parseFloat($(element).attr('data-max-allowed').replace(/[^0-9\.\-]/g, ""));

                        return (value <= 0) || (value > max);
                    };

                    var flow = {
                        itemized : {
                            steps : [
                                "#squareup-refund-step-itemized-refund",
                                "#squareup-refund-step-itemized-restock"
                            ],
                            final : "#squareup-refund-confirm-itemized"
                        },
                        amount : {
                            steps : [],
                            final : "#squareup-refund-confirm-amount"
                        }
                    };

                    var breadcrumb = [];

                    var showScreenById = function(screenId) {
                        $(".squareup-refund-step").hide();
                        $(screenId).show();
                    }

                    $("#squareup-refund-finish").hide();
                    $("#squareup-refund-back").hide();
                    $("#squareup-refund-next").show();
                    showScreenById("#squareup-refund-initial");

                    var showNextScreen = function(type) {
                        var nextScreenIndex = breadcrumb.length;

                        if (typeof flow[type].steps[nextScreenIndex] == 'string') {
                            $("#squareup-refund-finish").hide();
                            $("#squareup-refund-back").show();
                            $("#squareup-refund-next").show();

                            breadcrumb.push(flow[type].steps[nextScreenIndex]);

                            showScreenById(flow[type].steps[nextScreenIndex]);
                        } else if (typeof flow[type].steps[nextScreenIndex] == 'undefined') {
                            $("#squareup-refund-finish").show();
                            $("#squareup-refund-back").show();
                            $("#squareup-refund-next").hide();

                            breadcrumb.push(flow[type].final);

                            showScreenById(flow[type].final);
                        }
                    }

                    $("#squareup-refund-next").click(function(e) {
                        e.preventDefault();

                        if ($(this).attr('disabled')) {
                            return;
                        }

                        var type = $('input[name="refund_type"]:checked').val();

                        showNextScreen(type);

                        if ($('#squareup-refund-step-itemized-restock').is(':visible')) {
                            var amount_input = '#squareup-refund-itemized-insert';

                            if (!$(amount_input)[0].checkValidity() || invalidRefundAmount(amount_input)) {
                                $(amount_input).closest('.form-group').addClass('has-error');
                                showPreviousScreen(type);
                            } else {
                                $(amount_input).closest('.form-group').removeClass('has-error');

                                // No issues here. Restrict the allowed re-stocks according to the quantity selections from the refund screen

                                var text_summary = 
                                    "<?php echo $text_itemized_refund_restock_total; ?>"
                                        .replace(/{price_prefix}/, $(amount_input).attr('data-price-prefix'))
                                        .replace(/{price_suffix}/, $(amount_input).attr('data-price-suffix'))
                                        .replace(/{price}/, $(amount_input).val().replace(/[^0-9\.\-]/g, ""));

                                $('#itemized_refund_restock_total').html(text_summary);
                            }
                        } else if ($('#squareup-refund-confirm-itemized').is(':visible')) {
                            var rows = {};

                            var populateRows = function(index, element) {
                                var order_product_id = $(element).attr('data-order-product-id');
                                var type = $(element).attr('data-type');
                                var quantity = parseInt($(element).val());

                                if (quantity <= 0) {
                                    return;
                                }

                                if (typeof rows[order_product_id] == 'undefined') {
                                    rows[order_product_id] = {
                                        'name' : $(element).closest('tr').find('td.itemized_name').html(),
                                        'model' : $(element).closest('tr').find('td.itemized_model').html(),
                                        'quantity_restock' : 0,
                                        'quantity_refund' : 0
                                    };
                                }

                                rows[order_product_id][type] += quantity;
                            };

                            $('[name^="itemized_restock"]').each(populateRows);
                            $('[name^="itemized_refund"]').each(populateRows);

                            if (Object.keys(rows).length === 0) {
                                $('#itemized_refund_restock_items').html('<div class="alert alert-warning"><?php echo $text_no_items_restock_refund; ?></div>');
                            } else {
                                var html = '';

                                html += '<div class="table-responsive">';
                                html += '<table class="table table-bordered table-hover">';
                                html += '<thead>';
                                html += '<tr>';
                                html += '<th><?php echo $column_product_name; ?></th>';
                                html += '<th><?php echo $column_product_model; ?></th>';
                                html += '<th><?php echo $column_product_quantity_refund; ?></th>';
                                html += '<th><?php echo $column_product_quantity_restock; ?></th>';
                                html += '</tr>';
                                html += '</thead>';
                                html += '<tbody>';

                                $.each(rows, function(index, row) {
                                    html += '<tr>';
                                    html += '<td>' + row.name + '</td>';
                                    html += '<td>' + row.model + '</td>';
                                    html += '<td>' + row.quantity_refund + '</td>';
                                    html += '<td>' + row.quantity_restock + '</td>';
                                    html += '</tr>';
                                });

                                html += '</tbody>';
                                html += '</table>';
                                html += '</div>';

                                $('#itemized_refund_restock_items').html(html);
                            }
                        }
                    });

                    var showPreviousScreen = function(type) {
                        breadcrumb.pop();

                        var candidatePreviousScreen = breadcrumb[breadcrumb.length - 1];

                        if (typeof candidatePreviousScreen == 'undefined') {
                            $("#squareup-refund-finish").hide();
                            $("#squareup-refund-back").hide();
                            $("#squareup-refund-next").show();

                            showScreenById("#squareup-refund-initial");
                        } else if (typeof candidatePreviousScreen == 'string') {
                            $("#squareup-refund-finish").hide();
                            $("#squareup-refund-back").show();
                            $("#squareup-refund-next").show();

                            showScreenById(candidatePreviousScreen);
                        }
                    }

                    $("#squareup-refund-back").click(function(e) {
                        e.preventDefault();

                        showPreviousScreen($('input[name="refund_type"]:checked').val());
                    });

                    var refundInputValidate = function() {
                        var result = true;
                        var reason_input = "#squareup-refund-reason-insert";
                        var amount_input = "#squareup-refund-amount-insert";

                        if (!$(reason_input)[0].checkValidity()) {
                            $(reason_input).closest('.form-group').addClass('has-error');
                            result = false;
                        } else {
                            $(reason_input).closest('.form-group').removeClass('has-error');
                        }

                        if (!$(amount_input)[0].checkValidity() || invalidRefundAmount(amount_input)) {
                            $(amount_input).closest('.form-group').addClass('has-error');
                            result = false;
                        } else {
                            $(amount_input).closest('.form-group').removeClass('has-error');
                        }

                        return result;
                    }

                    var validateNext = function(e) {
                        if (parseInt($(this).val()) > parseInt($(this).attr("max")) || parseInt($(this).val()) < 0) {
                            $(this).css('background-color', '#f5c1bb');
                            $("#squareup-refund-next").attr('disabled', true);
                        } else {
                            $(this).css('background-color', 'white');
                            $("#squareup-refund-next").attr('disabled', false);
                        }
                    }

                    $('[name^="itemized_refund"]').change(function(e) {
                        var element = $('#squareup-refund-itemized-insert').first();
                        var currentValue = 0;
                        var price = parseFloat($(this).attr('data-price').replace(/[^0-9\.\-]/g, ""));

                        $('[name^="itemized_refund"]').each(function(index, element) {
                            currentValue += price * parseInt($(element).val());
                        });
                        
                        var max = parseFloat($(element).attr('data-max-allowed').replace(/[^0-9\.\-]/g, ""));

                        if (currentValue > max) {
                            currentValue = max;
                        } else if (currentValue < 0) {
                            currentValue = 0;
                        }

                        $(element).val(currentValue);
                    });

                    $('[name^="itemized_refund"], [name^="itemized_restock"]').change(validateNext);
                    $('[name^="itemized_refund"], [name^="itemized_restock"]').keyup(validateNext);

                    $("#squareup-refund-finish").click(function(e) {
                        e.preventDefault();

                        if ($('input[name="refund_type"]:checked').val() == 'amount') {
                            // Amount Refund - validate the manually inserted amount and prepare the POST request
                            if (!refundInputValidate()) {
                                return;
                            }

                            disableTransactionButtons();

                            $('#squareup-refund-modal').modal('hide');

                            transactionRequest('POST', url, {
                                reason : $("#squareup-refund-reason-insert").val(),
                                amount : $("#squareup-refund-amount-insert").val()
                            });
                        } else {
                            // Itemized Refund - display refund confirmation and prepare the POST request
                            disableTransactionButtons();

                            $('#squareup-refund-modal').modal('hide');

                            var restock = {};
                            var refund = {};

                            $('[name^="itemized_restock"]').each(function(index, element) {
                                var key = $(element).attr('data-order-product-id');
                                var value = parseInt($(element).val());

                                if (value > 0) {
                                    restock[key] = value;
                                }
                            });

                            $('[name^="itemized_refund"]').each(function(index, element) {
                                var key = $(element).attr('data-order-product-id');
                                var value = parseInt($(element).val());

                                if (value > 0) {
                                    refund[key] = value;
                                }
                            });

                            transactionRequest('POST', url, {
                                reason : "<?php echo $text_itemized_refund_reason; ?>",
                                amount : $("#squareup-refund-itemized-insert").val(),
                                restock : restock,
                                refund : refund
                            });
                        }
                    });
                }
            },
            error : function(xhr, ajaxSettings, thrownError) {
                setModalHtml('<div class="modal-body"><div class="alert alert-danger">' + '(' + xhr.statusText + '): ' + xhr.responseText + '</div></div>');
            }
        });
    }

    var transactionListPage = 1;

    $(document).on('click', '*[data-url-transaction-capture]', function() {
        if ($(this).attr('disabled')) return;

        modalConfirm(
            $(this).attr('data-url-transaction-capture'),
            $(this).attr('data-confirm-capture')
        );
    });
        
    $(document).on('click', '*[data-url-transaction-void]', function() {
        if ($(this).attr('disabled')) return;

        modalConfirm(
            $(this).attr('data-url-transaction-void'),
            $(this).attr('data-confirm-void')
        );
    });

    $(document).on('click', '*[data-url-transaction-refund]', function() {
        if ($(this).attr('disabled')) return;

        modalRefund($(this).attr('data-url-transaction-refund'), $(this).attr('data-url-transaction-refund-modal'));
    });

    listTransactions();
});
</script>