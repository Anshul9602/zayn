<?php echo $header; ?>
<style>
    .list-unstyled li {
        color: #333;
        font-size: 14px;
        letter-spacing: 1px;
        margin-top: 5px
    }

    .list-unstyled li a {
        color: #ccc
    }

    .list-unstyled li a:hover {
        color: #333
    }
</style>

<!-- breadcrumb area start -->
<div class="breadcrumb-area hidden-phone">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                                <li class="ml-2">
                                    <a href="<?php echo $breadcrumb['href']; ?>" style="text-transform: uppercase;"><?php echo $breadcrumb['text']; ?></a>
                                </li>
                                &nbsp;/
                            <?php } ?>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<div style="min-height:50vh;" class="container">
    <div class="row mbn-30">
        <div id="pro_card" class="row mt-4"></div>
    </div>
    <br><br>
    <button class="btn btn-hero get-pdff">Get Catalogue</button>
    <br><br>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const product = JSON.parse(localStorage.getItem("wishzayn"));
    
        let result = "";
    
        for (let i = 0; i < product.length; i++) {
            var card = `<div class="col-md-3 col-sm-6 mt-3 pl-2">
            <!-- product grid start -->
            <div class=" p-card-holder">
                <div class="product-card">
                    <div class="image real_pro-img">
                        <a href="${product[i].producturl}">
                            <img src="${product[i].productimg}" class="img-responsive" />
                        </a>
                    </div>
                        <div class="caption text-center">
                            <a href="${product[i].producturl}">
                                <h6 class="product_name" style="text-transform: uppercase;">${product[i].productname}</h6>
                            </a>
                            <button type="button" btnid="${product[i].productid}" class="btn btn-primary remove_btn">remove</button>
                        </div>
                </div>
            </div>
        </div>`;
            result = result + card;
        }
    
        document.getElementById('pro_card').innerHTML = result;
    
        // Remove products from wish
        const allProductBtns = document.querySelectorAll(".remove_btn");
    
        allProductBtns.forEach((btn) => {
            btn.addEventListener("click", (e) => {
                const productId = e.target.getAttribute("btnid");
                let idToRemove = productId;
                let index = product.findIndex(obj => obj.productid === idToRemove);
                if (index !== -1) {
                    product.splice(index, 1);
                }
                localStorage.setItem('wishzayn', JSON.stringify(product));
                window.location.reload();
            });
        });
    
        // Send wishlist via email
        const getCatalogueBtn = document.querySelector(".get-pdff");
        getCatalogueBtn.addEventListener("click", () => {
            fetch('account/generate_pdf.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(product)
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                } else {
                    alert('Failed to send wishlist PDF.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('An error occurred while sending the wishlist PDF.');
            });
        });
    
        // Update wishlist count on page load
        const updateWishlistCount = () => {
            const wishlistCount = product.length;
            document.getElementById('wish_count').textContent = wishlistCount;
        };
    
        updateWishlistCount();
    });
</script>
<?php echo $footer; ?>
