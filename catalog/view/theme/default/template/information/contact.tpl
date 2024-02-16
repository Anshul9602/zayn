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
                                <a href="index.php?route=common/contact">contact

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
<div class="contact-area section-padding pt-20">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="contact-message">
                    <h4 class="contact-title">Send Us A Message</h4>
                    <form id="contact-form" action="" method="post" class="contact-form">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <input id="name" name="first_name" placeholder="Name *" type="text" required="">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <input id="phone" name="phone" placeholder="Phone *" type="tel" maxlength="12" required="">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <input id="email" name="email_address" placeholder="Email *" type="email" required="">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <input id="subject" name="contact_subject" placeholder="Subject *" type="text">
                            </div>
                            <div class="col-12">
                                <div class="contact2-textarea text-center">
                                    <textarea id="message" placeholder="Message *" name="message" class="form-control2" required=""></textarea>
                                </div>
                                <div class="contact-btn1">
                                    <button id="send_con" class="btn btn-hero" type="submit">Send Message</button>
                                </div>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="contact-info">
                    <h4 class="contact-title">Contact Info</h4>
                    <p>Get in touch with us over email or simply give us a call.</p>
                    <ul>
                        <li><i class="fa fa-phone"></i> +1 (949) 900-6910</li>
                        <li><i class="fa fa-envelope-o"></i>info@zaynjewels.com </li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(e) {
        function isEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }

        $("#send_con").click(function(e) {
            e.preventDefault();
            if ($("#email").val() != "" && $("#name").val() != "" && $("#message").val() != "") {
                if (!isEmail($("#email").val())) {
                    alert('Invalid Email');
                    return false;
                }
                $.ajax({
                    url: 'index.php?route=common/contact/send_email',
                    method: 'POST',
                    data: {
                        "email": $("#email").val(),
                        "phone": $("#phone").val(),
                        "name": $("#name").val(),
                        "message": $("#message").val(),
                        "subject": $("#subject").val()
                    },

                    beforeSend: function() {
                        $("#send_con").attr('disabled', true);
                        $("#send_con").text('Sending Email . . .');
                    },

                    success: function(data) {

                        alert("Thank you for your message, we will be in touch!");
                        $("#email").val("");
                        $("#name").val("");
                        $("#message").val("");
                        $("#phone").val("");
                        $("#subject").val("");

                        $("#send_con").attr('disabled', false);
                        $("#send_con").text('Send Email');
                    }

                })
            } else {
                alert("Please fill the form completely");
            }


        })
    });
</script>
<?php echo $footer; ?>