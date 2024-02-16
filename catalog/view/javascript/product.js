$(".writeme").click(function() {
    $('html, body').animate({
        scrollTop: $("#review").offset().top - 250
    }, 2000);
})
eraseCookie('login_redirect');
$("#login-redirect").click(function(e) {
    e.preventDefault();
    setCookie('login_redirect', window.location.href, '1'); //(key,value,expiry in days)
    window.location = "index.php?route=account/login";
})


var old_price = Number($("#p_pr").text().replace(/[`~!@#$%^&*()_|+\-=?;:'",<>\{\}\[\]\\\/]/gi, ''));


    $('.sizes').change(function() {
        var p = $(this).attr('data-price');
        var sig = $(this).attr('data-sign');
        var q = p.replace(/[`~!@#$%^&*()_|+\-=?;:'",<>\{\}\[\]\\\/]/gi, '');
        var x = Number(q);

        if (sig == "+") {
            var new_p = old_price + x;
        } else {
            var new_p = old_price - x;
        }


        $("#p_pr").text('$' + new_p);

    }); 

$(".nav-tabs li").click(function() {
    $(".nav-tabs li").removeClass('active');
    $(this).addClass('active');
})

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};


$(document).ready(function(e) {
    var link = getUrlParameter('a');


    if (link) {
        $(".tab_options").each(function() {
            if ($.trim($(this).siblings().html()).toLocaleLowerCase() == link.toLocaleLowerCase()) {
                $(this).css('border', '2px solid #413B98');
                $(this).addClass('current');
                var val = $(this).attr("data-val");

                $("select option").each(function(index, element) {
                    if ($(this).val() == val) {
                        $(this).prop("selected", true);
                    }

                })

            }
        })
    } else {
        if ($(".tab_options").length > 0) {

            var val;

            $("select option").each(function(index, element) {
                if ($(this).attr("data-link") == "") {
                    $(this).prop("selected", true);
                    val = $(this).val();
                }
            })

            $(".tab_options").each(function() {
                if ($(this).attr("data-val") == val) {
                    $(this).css('border', '2px solid #413B98');
                }
            })
        }
    }
    $(".tab_options").click(function() {
        if (!$(this).hasClass('current')) {
            var val = $(this).attr("data-val");

            $("select option").each(function(index, element) {
                if ($(this).val() == val) {
                    if ($(this).attr("data-link")) {
                        $(this).prop("selected", true);
                        window.location = $(this).attr("data-link") + '?a=' + $.trim($(this).html());

                    }
                }
            });
        }

    })

});




$(document).ready(function(e) {
    $("#qtys option:selected").text("Qty (" + $("#qtys option:selected").val() + ")");
    $('.zoom').zoom({
        magnify: '1.4'
    });

    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id='+pid);

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id='+pid,
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');
            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after(
                        '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' +
                        json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after(
                        '<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' +
                        json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });


    var slides_to_show1 = $(".product-boxes").length;
    (slides_to_show1 > 3) ? slides_to_show1 = 3: null;

    $(".slicker").slick({
        dots: false,
        arrows: true,
        infinite: true,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 1,
        responsive: [
            {
            breakpoint: 650,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 1
            }
          }]
    })

    var slides_to_show = $(".nav-list-li").length;
    $('.slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: true,
        fade: false,
        asNavFor: '.slider-nav',
        nextArrow: '<button style="width: 25px;top: 150px;position: absolute;right: -25px;z-index: 99;" class="btn-round left"><svg viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow" transform="translate(100, 100) rotate(180) "></path></svg></button>',
        prevArrow: '<button style="width: 25px;top: 150px;position: absolute;left: -25px;z-index: 99;" class="btn-round right"><svg viewBox="0 0 100 100"><path d="M 20,50 L 60,90 L 60,85 L 25,50  L 60,15 L 60,10 Z" class="arrow"></path></svg></button>'

    });
    $('.slider-nav').slick({
        slidesToShow: slides_to_show,
        vertical: true,
        slidesToScroll: 1,
        asNavFor: '.slider-for',
        dots: false,
        focusOnSelect: true

    });

    $('.slider-mob').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        cssEase: 'linear',
        arrows: false,


    });


    if ($(".slick-track li").length < 7) {

        $(".slick-dots").css("display", "none");
    };




    $("#continue_shopping").click(function() {
        $(".overlay1, .confrim_pop").fadeOut();
    })

    $(".overlay1").click(function() {
        $(".overlay1, .confrim_pop").fadeOut();
    })

});

$("#qtys").change(function() {
    $("#qtys option").each(function(index, element) {
        $(this).text($(this).val());
    });
    $("#qtys option:selected").text("Qty" + " " + "(" + $("#qtys option:selected").val() + ")");
})

$("#continue_shopping").click(function() {
    $(".overlay1, .confrim_pop").fadeOut();

})

$(".overlay1").click(function() {
    $(".overlay1, .confrim_pop").fadeOut();
})


$('select[name=\'recurring_id\'], input[name="quantity"]').change(function() {
    $.ajax({
        url: 'index.php?route=product/product/getRecurringDescription',
        type: 'post',
        data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
        dataType: 'json',
        beforeSend: function() {
            $('#recurring-description').html('');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['success']) {
                $('#recurring-description').html(json['success']);
            }
        }
    });
});

$("#add_quantity").click(function() {
    var b = Number($("#input-quantity").val()) + 1;
    $("#input-quantity").val(b);
})


$("#less_quantity").click(function() {
    var b = Number($("#input-quantity").val()) - 1;
    if (b < 0) {
        b = 0;
    }
    $("#input-quantity").val(b);
})


$('#button-cart').on('click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $(
            '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'
        ),
        dataType: 'json',
        beforeSend: function() {
            $('#button-cart').button('loading');
        },
        complete: function() {
            $('#button-cart').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        var element = $('#input-option' + i.replace('_', '-'));

                        if (element.parent().hasClass('input-group')) {
                            element.parent().after('<div class="text-danger">' + json['error']['option'][i] +
                                '</div>');
                            $('.nav-tabs').find('a[href="#' + element.parent().parent().parent().paren().attr('id') + '"]').children('h6').css('color', '#ff0000');
                        } else {
                            element.after('<div class="text-danger" style="clear:both;">' + json['error']['option'][i] +
                                '</div>');
                            $('.nav-tabs').find('a[href="#' + element.parent().parent().parent().parent().attr('id') + '"]').children('h6').css('color', '#ff0000');
                        }
                    }
                }

                if (json['error']['recurring']) {
                    $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error'][
                        'recurring'
                    ] + '</div>');
                }

                // Highlight any found errors
                $('.text-danger').parent().addClass('has-error');
            }

         
            if (json['success']) {
                $(".overlay1, .confrim_pop").fadeIn();

                $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' +
                    json['total'] + '</span>');
                $("#cart_count").html((json['total'][0]));
                $("#qtys").val("1");
                $("#input-quantity").val("1");


                $('#cart #product_mark').load('index.php?route=common/cart/info #product_mark');
                $("#cart").slideDown();
                setTimeout(function() {
                    $('#cart').slideUp();
                }, 6000);
                $("#p_added").fadeIn().delay(3000).fadeOut();
                $('.new-product-form').find('input').val('');
                $('.new-product-form').find('textarea').val('');
            }
        },

        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });


});

$('#button-cart1').on('click', function() {
    $('.nav-tabs').find('a').children('h6').css('color', '');
    console.log($('input[name="option[1423]"]:checked').val());
    if ($('input[name="option[1423]"]:checked').val() == undefined) {
        if ($('input[name="option[1422]"]:checked').val() != 2309) {
            let = element = $('#input-option1423');
            element.after('<div class="text-danger" style="clear:both;">Metal color required</div>');
            $('.nav-tabs').find('a[href="#' + element.parent().parent().parent().parent().attr('id') + '"]').children('h6').css('color', '#ff0000');
            return false;
        }

    }
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $(
            '#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'
        ),
        dataType: 'json',
        beforeSend: function() {
            $('#button-cart1').button('loading');
        },
        complete: function() {
            $('#button-cart1').button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        var element = $('#input-option' + i.replace('_', '-'));

                        if (element.parent().hasClass('input-group')) {
                            element.parent().after('<div class="text-danger">' + json['error']['option'][i] +
                                '</div>');
                            $('.nav-tabs').find('a[href="#' + element.parent().parent().parent().paren().attr('id') + '"]').children('h6').css('color', '#ff0000');
                        } else {
                            element.after('<div class="text-danger" style="clear:both;">' + json['error']['option'][i] +
                                '</div>');
                            $('.nav-tabs').find('a[href="#' + element.parent().parent().parent().parent().attr('id') + '"]').children('h6').css('color', '#ff0000');
                        }
                    }
                }

                if (json['error']['recurring']) {
                    $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error'][
                        'recurring'
                    ] + '</div>');
                }

                // Highlight any found errors
                $('.text-danger').parent().addClass('has-error');
            }


            if (json['success']) {
                $(".overlay1, .confrim_pop").fadeIn();

                $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' +
                    json['total'] + '</span>');
                $("#cart_count").html((json['total'][0]));
                $("#qtys").val("1");
                $("#input-quantity").val("1");


                $('#cart #product_mark').load('index.php?route=common/cart/info #product_mark');
                $("#cart").slideDown();
                setTimeout(function() {
                    $('#cart').slideUp();
                }, 6000);
                $("#p_added").fadeIn().delay(3000).fadeOut();
                $('.new-product-form').find('input').val('');
                $('.new-product-form').find('textarea').val('');
            }
        },

        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });


});



$('button[id^=\'button-upload\']').on('click', function() {
    var node = this;

    $('#form-upload').remove();

    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

    $('#form-upload input[name=\'file\']').trigger('click');

    if (typeof timer != 'undefined') {
        clearInterval(timer);
    }

    timer = setInterval(function() {
        if ($('#form-upload input[name=\'file\']').val() != '') {
            console.log($('#form-upload input[name=\'file\']')[0].files[0]);
            clearInterval(timer);

            $.ajax({
                url: 'index.php?route=tool/upload',
                type: 'post',
                dataType: 'json',
                data: new FormData($('#form-upload')[0]),
                cache: false,
                contentType: false,
                processData: false,
                beforeSend: function() {
                    $(node).button('loading');
                },
                complete: function() {
                    $(node).button('reset');
                },
                success: function(json) {
                    $('.text-danger').remove();

                    if (json['error']) {
                        $(node).parent().find('.filename').remove()
                        $(node).parent().find('input').after('<div class="text-danger filename">' + json['error'] + '</div>');
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $(node).parent().find('input').val(json['code']);
                        $(node).parent().find('.filename').remove()
                        $(node).parent().find('input').after('<div class="text-success filename">' + json['filename'] + '</div>');



                        var file = $('#form-upload input[name=\'file\']')[0].files[0];

                        if (file) {
                            console.log('here111');
                            var reader = new FileReader();

                            reader.onload = function() {
                                //console.log("here222", reader.result);
                                $(node).parent().find('.image-preview').find('img').attr("src", reader.result);
                            }

                            reader.readAsDataURL(file);
                        }




                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    }, 500);
});
$(".product-list").mouseenter(function() {
    $(this).find(".image-box").stop().fadeIn();
    $(this).find("img").css("opacity", "0.8");
})

$(".product-list").mouseleave(function() {
    $(this).find(".image-box").stop().fadeOut();
    $(this).find("img").css("opacity", "1");
})