<?php
echo $header;
?>
<script>
     const wop = {
            "075080": 0.0020,
            "080085": 0.0026,
            "085090": 0.0030,
            "090095": 0.0037,
            "100110": 0.0057,
            "110115": 0.0063,
            "115120": 0.0069,
            "120125": 0.0078,
            "125130": 0.0087,
            "130135": 0.0097,
            "135140": 0.0110,
            "140145": 0.0119,
            "145150": 0.0130,
            "150155": 0.0145,
            "155160": 0.0162,
            "160170": 0.0186,
            "170180": 0.0215,
            "180190": 0.0250,
            "190200": 0.0320,
            "200210": 0.0343,
            "210220": 0.0396,
            "220230": 0.0444,
            "230240": 0.0506,
            "240250": 0.0564,
            "250260": 0.0645,
            "260270": 0.0717
        }
</script>

<style>
    .max-alert{
        font-size:10px;
        color:red;
        display:none;
    }
    table tr td{
        text-transform:uppercase;
    }
    .diamond-form h5 {
        color: #62659c;
        text-align: left;
    }

    .diamond-form label {
        position: relative;
        margin: 0 10px 20px 0;
        display: inline-block;
        cursor: pointer;
    }

    .diamond-form label input {
        display: none;
    }

    .diamond-form label.rect span {
        padding: 7px 10px;
        border: 1px solid #ccc;
    }

    .diamond-form label.rect input:checked+span {
        background: rgb(117, 117, 117);
        color: #fff;
    }

    .diamond-form label.rect input:disabled+span {
        opacity: 50%;
        cursor: default;
    }

    .diamond-form label.circle span {
        height: 40px;
        width: 40px;
        border-radius: 50px;
        border: 1px solid #ccc;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        border: 1px solid #62659c;
    }

    .diamond-form label.circle input:checked+span {
        border: 2.5px solid rgb(0, 123, 255);
    }

    .diamond-form label.circle input:disabled+span {
        opacity: 50%;
    }

    .diamond-form .text-input {
        padding: 1px 0;
        text-align: center;
        background-color: #fff;
        border: 2px solid #62659c;
        outline: none;
        border-radius: 10px;
        width: 100px;
        color: #62659c;
        font-weight: bold;
    }

    .diamond-form .text-input:disabled {
        opacity: 50%
    }
</style>

<section>
    <img src="image/3.png" alt="" style="width:100%;">
</section>

<?php
if (!$isUserLogged) {
?>

    <div class="container">

        <div class="text-center my-5">
            <button id="login-redirect" style="background:#423c9e; border: 1px solid #62659c; border-radius:10px; padding:10px 20px; outline:none; color:#fff;text-align:center">
                LOGIN TO ACCESS
            </button>
        </div>



    </div>
<?php
} else {
?>

    <div class="container">

        <div style="padding:30px 0">
            <div action="" class="diamond-form">
                <div class="row">
                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <input type="text" id="product_id" hidden>
                        <input type="text" id="product_name" hidden>
                        <h5 class="mb-3">SHAPE</h5>
                        <div style="text-align:left;">
                            <label class="circle" style="font-size: 12px; font-weight: bold; margin-right:30px; height:60px; width:60px">
                                <input class="form-check-input" type="radio" name="shape" value="princess">
                                <span class="image-as-bg" style="background-image: url('image/diamondsdemo/shapes/princess.png'); background-size: 60%; background-position: center; background-repeat: no-repeat; height:60px; width:60px">
                                    <p style="color: #62659c;font-size: 13px; margin: -80px 10px 0px; padding: 0px; display: inline;">
                                        PRINCESS
                                    </p>
                                </span>
                            </label>

                            <label class="circle" style="font-size: 12px; font-weight: bold; height:60px; width:60px">
                                <input class="form-check-input" type="radio" name="shape" value="round">
                                <span class="image-as-bg" style="background-image: url('image/diamondsdemo/shapes/round.png'); background-size: 60%; background-position: center; background-repeat: no-repeat; height:60px; width:60px">
                                    <p style="color: #62659c;font-size: 13px; margin: -80px 0px 0px; padding: 0px; display: inline;">
                                        ROUND
                                    </p>
                                </span>
                            </label>


                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <h5 class="mb-3">DIAMOND</h5>
                        <div style="text-align:left;">
                            <label class="circle" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="diamond" value="white">
                                <span class="image-as-bg" style="background-image: url('image/diamondsdemo/colors/white.png'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
                                    <p style="color: #62659c;font-size: 13px; margin: -80px 0px 0px; padding: 0px; display: inline;">
                                        White
                                    </p>
                                </span>
                            </label>

                            <label class="circle" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="diamond" value="brown">
                                <span class="image-as-bg" style="background-image: url('image/diamondsdemo/colors/brown.png'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
                                    <p style="color: #62659c;font-size: 13px; margin: -80px 0px 0px; padding: 0px; display: inline;">
                                        Brown
                                    </p>
                                </span>
                            </label>

                            <label class="circle" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="diamond" value="black">
                                <span class="image-as-bg" style="background-image: url('image/diamondsdemo/colors/black.png'); background-size: cover; background-position: center center; background-repeat: no-repeat;">
                                    <p style="color: #62659c;font-size: 13px; margin: -80px 0px 0px; padding: 0px; display: inline;">
                                        Black
                                    </p>
                                </span>
                            </label>
                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <h5 class="mb-3">CUT</h5>
                        <div style="text-align:left;">
                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="cut" value="princess"><span>Princess</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="cut" value="single"><span>Single Cut</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="cut" value="full"><span>Full Cut</span></label>


                        </div>
                    </div>


                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <h5 class="mb-3">COLOR</h5>
                        <div style="text-align:left;">

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="f"><span>F</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="g"><span>G</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="h"><span>H</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="i"><span>I</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="j"><span>J</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="k"><span>K</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="l"><span>L</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;">
                                <input class="form-check-input" type="radio" name="color" value="m"><span>M</span></label>
                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <h5 class="mb-3">CLARITY</h5>
                        <div style="text-align:left;">
                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="if"><span>IF</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vvs1"><span>VVS1</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vvs2"><span>VVS2</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vs1"><span>VS1</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vs2"><span>VS2</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="si1"><span>SI1</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="si2"><span>SI2</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i1"><span>I1</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i2"><span>I2</span></label>

                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i3"><span>I3</span></label>


                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i4"><span>I4</span></label>


                            <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i5"><span>I5</span></label>


                        </div>
                    </div>

                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <div class="row">
                            <div class="col-8">
                                <h5 class="mb-3">DIAMOND SIZE</h5>
                                <div style="text-align:left;">
                                    <select name="" class="custom-select">
                                    </select>
                                </div>
                            </div>

                        </div>

                    </div>

                    <div class="col-12 col-sm-12 col-md-6 mb-5">
                        <div class="row">
                            <div class="col-4">
                                <h5 class="mb-3">PRICE (Per Carat)</h5>
                                <h2 style="color:#423c9e"><span id="diamond-price"></span> </h2>
                            </div>
                        </div>

                    </div>

                    <div class="col-12 col-sm-12 col-md-6 col-lg-5 col-xl-4 mb-5">
                        <input type="hidden" id="diamonds-by-pieces">
                        <h5 class="mb-3">Buy By</h5>
                        <div class="d-flex">
                            <style>
                                .buy-options li {
                                    padding: 5px;
                                    border: 1px solid #ccc;
                                    font-size: 12px;
                                    font-weight: bold;
                                    opacity: 50%;
                                    cursor: pointer;
                                    display: inline-block;
                                    margin-right: 10px;
                                    margin-bottom: 20px;
                                }

                                .buy-options li.selected {
                                    opacity: 100%;
                                }
                            </style>

                            <ul class="buy-options">
                                <li data-buy-option="buy-option-carat" class="selected">Buy By Carat</li>
                                <li data-buy-option="buy-option-pieces">Buy By Pieces</li>
                            </ul>
                            
<script>
    //max qty limit
    $(document).ready(function() {
        $('#input-quantity').on('keydown keyup change input', function(e) {
            $("#input-pieces").val(Math.floor($(this).val() / wop[$('select option:selected').text().replace(/\D/g, '')]));

            if ($(".buy-options li.selected").attr('data-buy-option') == "buy-option-carat") {
                if ($(this).val() > 500 &&
                    e.keyCode !== 46 &&
                    e.keyCode !== 8
                ) {
                    $(".max-alert").fadeIn(function() {
                        setTimeout(() => {
                            $(".max-alert").fadeOut()
                        }, 2000);
                    })
                    e.preventDefault();
                    $(this).val(500);
                    return false;
                }
            }
        });
        $('#input-pieces').on('keydown keyup change input', function(e) {
            $("input[name='quantity']").val(($(this).val() * wop[$('select option:selected').text().replace(/\D/g, '')]).toFixed(3).replace(/[.,]0000$/, ""));
   
            var max_qty = Math.floor(500 / wop[$('select option:selected').text().replace(/\D/g, '')]);
            console.log(max_qty);
            if ($(this).val() > max_qty &&
                e.keyCode !== 46 &&
                e.keyCode !== 8
            ) {

                $(".max-alert").fadeIn(function() {
                    setTimeout(() => {
                        $(".max-alert").fadeOut()
                    }, 2000);
                })
                e.preventDefault();
                $(this).val(max_qty);

                return false;
            }

        });

    })
 </script>

                            <div style="padding-right:50px">
                                <div class="buy-option buy-option-carat">

                                    <div style="text-align:left;">
                                        <input class="text-input selected-buy-option-input" id="input-quantity" name="quantity" type="number" oninput="restrict(this);">
                                        <p class="max-alert">Maxium Qty Reached</p>   

                                    </div>
                                </div>

                              
                                <div class="buy-option buy-option-pieces" style="display:none">
                                    <div style="text-align:left;">
                                        <input class="text-input" id="input-pieces" type="number" min="0" step="1" oninput="restrict2(this);">
                                    </div>
                                </div>
                            </div>

                            <script>
                                function restrict(tis) {
                                    var prev = tis.getAttribute("data-prev");
                                    prev = (prev != '') ? prev : '';
                                    if (Math.round(tis.value * 1000) / 1000 != tis.value)
                                        tis.value = prev;
                                    tis.setAttribute("data-prev", tis.value)
                                }

                                function restrict2(tis) {
                                    var prev = tis.getAttribute("data-prev");
                                    prev = (prev != '') ? prev : '';
                                    if (Math.round(tis.value * 1) / 1 != tis.value)
                                        tis.value = prev;
                                    tis.setAttribute("data-prev", tis.value)
                                }
                            </script>



                            <script>
                                $('.buy-options li').click(function() {
                                    $('.buy-option').hide();
                                    $('.selected-buy-option-input').removeClass('selected-buy-option-input');
                                    $("." + $(this).data("buy-option")).show();
                                    $("." + $(this).data("buy-option")).find('input').addClass('selected-buy-option-input');
                                    $('.buy-options li').removeClass("selected");
                                    $(this).addClass("selected");

                                })
                            </script>
                        </div>
                    </div>






                </div>
                <div class="text-center">
                    <button id="button-cart" style="background:#423c9e; border: 1px solid #62659c; border-radius:10px; padding:10px 20px; outline:none; color:#fff;text-align:center">
                        ADD TO BUYING LIST
                    </button>
                </div>

                <span style="color:#62659c; font-size:10px">*SHIPPING TIME: 3 Business Days</span>

            </div>
        </div>

        <div id="checkout-table" style="display:none">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <td class="text-left text-uppercase"> <b>S.no</b> </td>
                            <td class="text-left text-uppercase"><b>Diamond</b></td>
                            <td class="text-left text-uppercase"><b>Size</b></td>
                            <td class="text-left text-uppercase"><b>Quantity</b></td>
                            <td class="text-left text-uppercase"><b>Price Per Carat</b></td>
                            <td class="text-left text-uppercase"><b>Total Price</b></td>
                            <td></td>
                        </tr>
                    </thead>
                    <tbody id="cart-table">
                        <?php
                            $i     = 0;
                            $total = 0;
                            foreach ($cart_products as $product) {
                                if (array_key_exists($product['model'], $products)) {
                                    $total += str_replace(",", "", substr($product['total'], 1));
                                    $x = "";
                             ?>

                                <tr data-cart-id="<?php echo $product['cart_id'];?>" data-product-id="<?php echo $product['product_id'];?>">
                                    <td><?php echo ++$i;?> </td>
                                    <td><b><?php echo $product['name'];?></b>
                                 
                                   </td>
                                    <td><?php if ($product['option']) { ?>
                                           <?php
                                    foreach ($product['option'] as $option) {
                                        if ($option['name'] == "diamond by pieces") {
                                            $x = $option['value'];
                                            continue;
                                        }
                                        if (strtolower($option['value']) == "default") {
                                            continue;
                                        }
                                      ?>
                                                

                                            <?php }?>
                                       <?php }?>
                                   </td>
                                    <td><?php if ($x == "") {
                                        $qty = substr($product['quantity'] / 10000, 0, strpos($product['quantity'] / 10000, ".") + 4);
                                        echo $qty;
                                        if (strpos($qty, ".") === false) {
                                            echo ".000";
                                        } else {
                                            for ($zi = 0; $zi < 4 - (strlen($qty)) + strpos($qty, "."); $zi++) {
                                                echo "0";
                                            }
                                        }
                                        echo " Carats";
                                        } else {
                                            echo ($x);
                                            echo (" Pieces");
                                        }?></td>
                                    <td>$<?php echo (substr($product['price'], 1) * 10000);?>/Carat</td>
                                    <td>
                                        <h5>$<span class="item-total"><?php echo number_format(ceil(str_replace(",", "", substr($product['total'], 1)))); ?>.00</span> </h5>
                                    </td>
                                    <td class="delete-list-item" style="cursor:pointer;">REMOVE</td>
                                </tr>
                        <?php } ?>
                        <?php } ?>

                    </tbody>
                </table>
                <div class="text-center" style="margin-bottom:25px;">
                    <div style="margin-bottom:10px;" class="text-right">
                        <h4>Sub Total:- $<span style="display:none;" id="sub-total">
                        <?php echo ceil(str_replace(",", "", $total));?>.00</span>
                        <span id="sub-total-show"><?php echo number_format(ceil(str_replace(",", "", $total)));?>.00</span>
                    </h4>
                    </div>
                    <a href="index.php?route=checkout/cart" style="background:#423c9e; border: 1px solid #62659c; border-radius:10px; padding:10px 20px; outline:none; color:#fff;text-align:center">
                        CHECKOUT
                    </a>

                </div>
            </div>
        </div>
    </div>
<?php } ?>


<script>
  
  
    function fetchProduct(productModel) {
        console.log('final');
        //let productModel = '_' + $('input[name="shape"]:checked').val() + '_' + $('input[name="diamond"]:checked').val() + '_' + $('input[name="cut"]:checked').val() + '_' + ($('input[name="color"]:checked').val() ? $('input[name="color"]:checked').val() + '_' : '') + ($('input[name="clarity"]:checked').val() ? $('input[name="clarity"]:checked').val() + '_' : '');
        console.log("fp pm", productModel);
        console.log('fetching product');
        let products = <?php echo (json_encode($products));?>;
        console.log("products", products);
        console.log(products[productModel]);
        let product = products[productModel];
        if (product) {
            for (let option of product.options) {
                if (Number(option.option_id) == 39) {
                    $('select').attr("name", option.product_option_id)
                    for (let pov of option.product_option_value) {
                        let povp = pov.price != false ? parseFloat(pov.price.slice(1).replace(/,/g, '')).toFixed(4).replace(/[.,]0000$/, "") : 0;
                        povp = parseFloat(pov.price_prefix + String(povp)).toFixed(4).replace(/[.,]0000$/, "");
                        console.log(pov.price, povp)
                        $('select').append(`<option data-price="${parseFloat(parseFloat(product.price.slice(1).replace(/,/g, ''))+ parseFloat(povp)).toFixed(4).replace(/[.,]0000$/, "")}" value="${pov.product_option_value_id}">${pov.name}</option>`);
                    }
                }
                if (Number(option.option_id) == 40) {
                    $('#diamonds-by-pieces').attr("name", option.product_option_id);
                }
            }

            $('#product_id').val(product.product_id);
            $('#product_name').val(product.name);
            $('input[type="number"]').prop("disabled", false);
            $("#diamond-price").text('$' + Math.trunc(($('select').val() != '' ? $('select option:selected').data('price') : "0.00") * 10000));
        }

        console.log($('#product_id').val());
        console.log($('#product_name').val());

    }



    $('input[type="radio"]').click(function() {
        $(this).parent().parent().parent().nextAll('div').find('input[type="radio"]:checked').prop("checked", false);
        $(this).parent().parent().parent().nextAll('div').find('input[type="radio"]').prop("disabled", true);
        $(this).parent().parent().parent().nextAll('div').find('option').remove();
        $('input[type="number"]').val('');
        $('input[type="number"]').prop("disabled", true);
        $('#product_id').val('');
        $('#product_name').val('');
        $('#diamond-price').text('');
        let products = <?php echo (json_encode($products));?>;

        if ($(this).attr('name') == "shape") {
            $(this).parent().parent().parent().next('div').find('input[type="radio"]').each(function() {
                let v = $(this).val();
                if (Object.keys(products).some((s) => {
                        return s.includes('_' + String($('input[name="shape"]:checked').val()) + '_' + String(v) + '_')
                    })) {
                    $(this).prop('disabled', false);
                }
            })
            fetchProduct('_' + String($('input[name="shape"]:checked').val()) + '_');
        }

        if ($(this).attr('name') == "diamond") {


            $(this).parent().parent().parent().next('div').find('input[type="radio"]').each(function() {
                let v = $(this).val();
                if (Object.keys(products).some((s) => {
                        return s.includes('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String(v) + '_')
                    })) {
                    $(this).prop('disabled', false);
                }
            })

            fetchProduct('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_');
        }

        if ($(this).attr('name') == "cut") {



            $(this).parent().parent().parent().next('div').find('input[type="radio"]').each(function() {
                let v = $(this).val();
                if (Object.keys(products).some((s) => {
                        return s.includes('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String($('input[name="cut"]:checked').val()) + '_' + String(v) + '_')
                    })) {
                    $(this).prop('disabled', false);
                }
            })

            fetchProduct('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String($('input[name="cut"]:checked').val()) + '_');

        }

        if ($(this).attr('name') == "color") {




            $(this).parent().parent().parent().next('div').find('input[type="radio"]').each(function() {
                let v = $(this).val();
                if (Object.keys(products).some((s) => {
                        return s.includes('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String($('input[name="cut"]:checked').val()) + '_' + String($('input[name="color"]:checked').val()) + '_' + String(v) + '_')
                    })) {
                    $(this).prop('disabled', false);
                }
            })

            fetchProduct('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String($('input[name="cut"]:checked').val()) + '_' + String($('input[name="color"]:checked').val()) + '_');

        }

        if ($(this).attr('name') == "clarity") {
            console.log('final selection');
            fetchProduct('_' + String($('input[name="shape"]:checked').val()) + '_' + String($('input[name="diamond"]:checked').val()) + '_' + String($('input[name="cut"]:checked').val()) + '_' + String($('input[name="color"]:checked').val()) + '_' + String($('input[name="clarity"]:checked').val()) + '_');
        }


    })

    $('select').change(function() {
        $('#diamond-price').text('$' + Math.trunc($('select option:selected').data('price') * 10000))
        $('input[type="number"]').val('');
    })

    $('input[type="radio"]:checked').prop("checked", false);
    $('input').each(function() {
        if ($(this).attr('name') != "shape") {
            $(this).prop('disabled', true);
        }
    })
    $('input[type="number"]').prop("disabled", true);
    $('#product_id').val('');
    $('#product_name').val('');

    $('option').remove();
    $('.delete-list-item').off().on("click", function() {
        let item = $(this);
        let cart_id = $(this).parent().attr('data-cart-id');
        cart.remove(cart_id);
        $(this).parent().fadeOut("fast", function() {
            let total = 0
            $('#cart-table').find(".item-total").each(function() {
                total += parseInt($(this).text().replace(",", ""));
            })

            total -= parseInt(item.parent().find('.item-total').text());
            item.parent().remove();


            console.log("tototot", total);
            $('#sub-total').text(Math.ceil(total));
            $('#sub-total-show').text(Math.ceil(total).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            $("#cart_count").html(parseInt($("#cart_count").html()) - 1);
            if ($("#cart-table tr").length == 0) {
                $("#checkout-table").fadeOut();
            }
        })

    })

    if ($('#checkout-table tbody').find('tr').length > 0) {
        $('#checkout-table').show();
    }


    $('#button-cart').on('click', function(e) {
        e.preventDefault();
        if ($('#product_id').val() == '') {
            alert('Please complete form');
            return;
        } else if ($('#input-pieces').val() == '') {
            alert('Please input carat or pieces');
            return;
        } else if ($('#input-pieces').val() < 1) {
            alert('Minimum quantity is 1 piece');
            return;
        }
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: {
                product_id: $('#product_id').val(),
                option: {
                    [$('select').attr('name')]: $('select').val(),
                    [$('#diamonds-by-pieces').attr("name")]: $('.selected-buy-option-input').attr('id') == 'input-pieces' ? $('.selected-buy-option-input').val() : ""
                },
                quantity: Number($('input[name="quantity"]').val()) * 10000
            },
            dataType: 'json',
            beforeSend: function() {
                $('#button-cart').button('loading');
            },
            complete: function() {
                $('#button-cart').button('reset');
            },
            success: function(json) {


                if (json['error']) {
                    console.log(json);
                    alert('Something wrong in form!')
                }

                if (json['success']) {
                    console.log(json);

                    $('#cart-table').empty();
                    const printZeros = (n) => {
                        if (n === 3) {
                            return ".000";
                        } else if (n === 2) {
                            return "00";
                        } else if (n === 1) {
                            return "0";
                        } else {
                            return ""
                        }
                    }
                    let total = 0;
                    json.cart_products.forEach((product, index) => {
                        let pros = <?php echo (json_encode($products));?>;


                        let pro = pros[product.model];
                        if (pro) {
                            total += parseFloat(product.total.replace(',', '').substring(1));
                            let pcs = "";

                            $('#cart-table').append(`
                                <tr 
                                    data-cart-id="${product.cart_id}"
                                    data-product-id="${product.product_id}">
                                    <td>${index+1} </td>
                                    <td><b>${product.name}</b></td>
                                    <td>
                                        ${

                                            product.option.map((option)=>{
                                            if(option.name === "diamond by pieces"){
                                                pcs = option.value;
                                            }else if(option.value !== "default"){
                                                return option.value;
                                            }
                                        }).join("")}
                                    </td>
                                    <td>
                                    ${
                                        pcs===""?`${(product.quantity/10000).toString().substring(0,(product.quantity/10000).toString().indexOf(".")===-1?(product.quantity/10000).toString().length:(product.quantity/10000).toString().indexOf(".")+4)}${(product.quantity/10000).toString().indexOf(".")===-1?printZeros(3):printZeros(4 - (product.quantity/10000).toString().length+ (product.quantity/10000).toString().indexOf("."))} Carats`:`${pcs} Pieces`
                                    }
            
                                    </td>
                                    <td>$${parseFloat(product.price.toString().substring(1))*10000}</td>
                                    <td><h5>$<span class="item-total">${Math.ceil(parseFloat(product.total.substring(1).replace(",",""))).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}</span>.00</h5></td>
                                
                                    <td class="delete-list-item" style="cursor:pointer;">REMOVE</td>
                                </tr>
                            `);
                        }

                    })
                    console.log("tototot", total);
                    $('#sub-total').text(Math.ceil(total));
                    $('#sub-total-show').text(Math.ceil(total).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    if ($("#cart-table tr").length == 1) {
                        $("#checkout-table").fadeIn();
                    }
                    $('.delete-list-item').off().on("click", function() {
                        let item = $(this);
                        let cart_id = $(this).parent().attr('data-cart-id');
                        cart.remove(cart_id);
                        $(this).parent().fadeOut("fast", function() {
                            let total = 0
                            $('#cart-table').find(".item-total").each(function() {
                                total += parseInt($(this).text().replace(",", ""));
                            })

                            total -= parseInt(item.parent().find('.item-total').text());
                            item.parent().remove();


                            console.log("tototot", total);
                            $('#sub-total').text(Math.ceil(total));
                            $('#sub-total-show').text(Math.ceil(total).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                            $("#cart_count").html(parseInt($("#cart_count").html()) - 1);

                            if ($("#cart-table tr").length == 0) {
                                $("#checkout-table").fadeOut();
                            }
                        })

                    })

                    $('input[type="radio"]:checked').prop("checked", false);
                    $('input').each(function() {
                        if ($(this).attr('name') != "shape") {
                            $(this).prop('disabled', true);
                        }
                    })
                    $('input[type="number"]').val('');
                    $('input[type="number"]').prop("disabled", true);

                    $('#product_id').val('');
                    $('option').remove();
                    $('#diamond-price').text('')


                    alert('added to cart!');

                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' +
                        json['total'] + '</span>');
                    $("#cart_count").html((json['total'][0]));


                }
            },

            error: function(xhr, ajaxOptions, thrownError) {
                console.log(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });


    });

   

   
</script>

<script>
    $("#login-redirect").click(function(e) {
        e.preventDefault();
        setCookie('login_redirect', window.location.href, '1'); //(key,value,expiry in days)
        window.location = "index.php?route=account/login";
    })
</script>

<?php
echo $footer;
?>
