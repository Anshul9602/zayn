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
    /* Modal container */
.modal {
    display: none;
    position: fixed;
    z-index: 1050;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: hidden;
    outline: 0;
    background-color: rgba(0, 0, 0, 0.5);
}

/* Modal dialog */
.modal-dialog {
    position: relative;
    width: auto;
    margin: 1.75rem auto;
    max-width: 500px;
}

/* Modal content */
.modal-content {
    position: relative;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 0.3rem;
    outline: 0;
}

/* Modal header */
.modal-header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    padding: 1rem;
    border-bottom: 1px solid #e9ecef;
    border-top-left-radius: 0.3rem;
    border-top-right-radius: 0.3rem;
}

/* Modal title */
.modal-title {
    margin-bottom: 0;
    line-height: 1.5;
    font-size: 1.25rem;
}

/* Close button */
.close {
    padding: 0.75rem 1.25rem;
    margin: -1rem -1rem -1rem auto;
    cursor: pointer;
}

/* Modal body */
.modal-body {
    position: relative;
    flex: 1 1 auto;
    padding: 1rem;
}

/* Modal footer */
.modal-footer {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    padding: 1rem;
    border-top: 1px solid #e9ecef;
    border-bottom-right-radius: 0.3rem;
    border-bottom-left-radius: 0.3rem;
}

/* Button */
.btn {
    display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    user-select: none;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border: 1px solid transparent;
    border-radius: 0.25rem;
    cursor: pointer;
}

.btn-primary {
    color: #fff;
    background-color: #423c9e;
    border-color: #423c9e;
}

.btn-secondary {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d;
}
.remove_btn{
display: none;
}
.p-card-holder:hover .remove_btn{
display: block;

}
.p-card-holder img{
    border: 1px solid lightgray;
    padding: 10px;
    margin-bottom: 10px;

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
    <div class="text-center">
        <button class="btn btn-hero get-pdff">Get Catalogue</button>
    </div>
    
    <br><br>

</div>

<div class="modal fade" id="catalogueModal" tabindex="-1" role="dialog" aria-labelledby="catalogueModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="catalogueModalLabel">Get Catalogue</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="catalogueForm">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                    </div>
                    <div class="form-group">
                        <label for="c_name">Company Name</label>
                        <input type="text" class="form-control" id="c_name" name="company_name" placeholder="Enter your company name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary send_con">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('.get-pdff').click(function() {
            $('#catalogueModal').modal('show');
        });
    
        $("#catalogueForm").submit(function(event) {
            event.preventDefault(); // Prevent default form submission
    
            // Validate form fields
            if ($("#email").val() !== "" && $("#name").val() !== "" && $("#c_name").val() !== "") {
               
    
                // Prepare data for submission
                const formData = {
                    name: $("#name").val(),
                    company_name: $("#c_name").val(),
                    email: $("#email").val(),
                    wishlist: JSON.parse(localStorage.getItem("wishzayn")) // Assuming you have wishlist data in localStorage
                };

                // Send data to server for PDF generation
                $.ajax({
                    url: 'index.php?route=account/generate_pdf',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(formData),
                    beforeSend: function() {
                        $("#send_con").attr('disabled', true).text('Sending Email...');
                    },
                    success: function(response) {
                        // Parse the JSON response directly
                        // Handle success response
                        if (response.success) {
                            alert(response.message); // Display success message
                            $('#catalogueModal').modal('hide'); // Hide modal after successful submission
                        } else {
                            alert('Failed to send wishlist PDF.'); // Display failure message
                        }
                    },
                    error: function(xhr, status, error) {
                        // Handle error response
                        console.error('Error:', error);
                        alert('An error occurred while sending the wishlist PDF.'); // Display error message
                    },
                    complete: function() {
                        $("#send_con").attr('disabled', false).text('Send Email'); // Re-enable button
                    }
                });
            } else {
                alert("Please fill the form completely");
            }
        });
    });
    document.addEventListener('DOMContentLoaded', function () {
        const product = JSON.parse(localStorage.getItem("wishzayn"));
    
        let result = "";
    
        for (let i = 0; i < product.length; i++) {
            var card = `<div class="col-md-2 col-sm-6 mt-3 pl-2">
        
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
                            <br>
                            <div class="text-center" style="    justify-content: center;
    display: flex;"><button type="button" btnid="${product[i].productid}" class="btn btn-primary remove_btn">remove</button></div>
                            
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
        
    
        // Update wishlist count on page load
        const updateWishlistCount = () => {
            const wishlistCount = product.length;
            document.getElementById('wish_count').textContent = wishlistCount;
        };
    
        updateWishlistCount();
    });
</script>
<?php echo $footer; ?>
