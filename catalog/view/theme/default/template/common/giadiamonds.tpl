<?php echo $header; ?>
<link rel='stylesheet' href='assets/css/gia.css' />
<style>
   @media screen and (max-width:650px) {
      .desktop-table{
      display:none !important;
      }
   }
   .d-flex{
      display:flex;
   }
    .align-item-center{
      align-items:center;
    }
    .card{
      margin:10px auto;
     padding:10px;
    }
    .mt-30{
      margin-top:30px;
    }
    .moblie-shape.diamond-shape-box{
      text-transform:uppercase;
    }
    .moblie-shape.diamond-shape-box svg{
      width:40px;
      height:40px;
    }

    @media screen and (min-width:651px) {
      .card{
         display:none;
      }
    }
    .dummy_element2{
      display:none !important;
    }
</style>
<div class="container">
   <div class="row">
      <div class="col-sm-12">
         <br />
      
         <img src="image/gia-banner.jpg" alt="" class="img-fluid" />
      </div>
   </div>
   <br />
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
   <section>
      <div class="container" >
         <div class="row">
            <div class="col-sm-4 p-0">
               <div class="filter-header">
                  <p> FILTER BY SHAPE </p>
               </div>
               <ul class="mt-10 shape-filter">
                  <li class="ml-5" data-shape="round">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M18.8.8A17.7 17.7 0 0 0 .8 18v.2A17.7 17.7 0 1 0 18.8.9Zm.6.8c4 .2 7.6 1.8 10.3 4.3l-6 .2zm-1.9 0L13.3 6l-6-.2c2.7-2.5 6.3-4 10.2-4.3zm1 .2 4.3 4.5L18.5 8l-4.3-1.7zm11.8 4.8-.2 6.3-4.3-1.8L24 7zm-23.7 0L13 7l-1.7 4.3L6.9 13zm16.6.4 1.5 3.7-5.2-2.1zm-9.5 0 3.7 1.6-5.2 2zm17.4.2c2.5 2.8 4 6.4 4.3 10.3l-4.5-4.2zm-25.2 0 .2 6.2-4.5 4.2c.2-4 1.8-7.6 4.3-10.3zM18.5 9l6.7 2.8 2.7 6.6-2.7 6.7-6.7 2.8-6.7-2.7L9 18.5l2.8-6.7zm7.7 3.2 3.7 1.5-1.5 3.7zm-15.5 0-2.1 5.2L7 13.8zm19.9 2 4.6 4.3-4.6 4.3-1.8-4.4zm-24.2 0L8 18.5l-1.7 4.3-4.6-4.3zm29 5.2c-.2 4-1.8 7.6-4.3 10.3l-.2-6zm-33.8 0 4.5 4.3-.2 6c-2.5-2.7-4-6.3-4.3-10.2zm26.8 0 1.5 3.8-3.7 1.5zm-19.8 0 2.1 5.3-3.6-1.5zM30 24l.3 6.3-6.4-.2 1.8-4.3zM7 24l4.3 1.8L13 30l-6.3.3zm17.8 2.2-1.5 3.7-3.6-1.5zm-12.5 0 5.2 2.2-3.6 1.5zm6.3 2.6 4.4 1.8-4.4 4.6-4.3-4.6zm5.2 2 6 .3c-2.7 2.5-6.3 4-10.2 4.3zm-10.3 0 4.2 4.6c-4-.2-7.6-1.8-10.3-4.3z">
                        </path>
                     </svg>
                     <br>
                     <label class="shape-filter-button-label screen-reader-only"
                        for="RD-filter-button-med-lrg">Round</label>
                  </li>
                  <li class="ml-5" data-shape="princess">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-background" fill="#495068" d="M1.5 2h34v33h-34Z"></path>
                        <path class="icon-outline" fill="#ffffff"
                           d="M1.7 1.3c-.3 0-.4.1-.4.4v33.6c0 .3.1.4.4.4h33.5c.3 0 .5-.1.5-.4V1.7c0-.3-.2-.4-.5-.4Zm1 .8h31.5L30.4 6H6.5Zm-.6.6L6 6.6v23.8l-4 3.9zm32.7 0v31.6L31 30.4V6.6ZM7.3 6.9h22.3L25.2 11H11.7Zm-.5.5 4.3 4.3v13.6l-4.3 4.3zm23.3 0v22.2l-4.3-4.3V11.7Zm-18.2 4.5H25v13.2H12Zm-.2 14h13.5l4.4 4.2H7.3ZM6.5 31h23.9l3.8 3.9H2.7Z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="PR-filter-button-med-lrg">Princess</label>
                  </li>
                  <li class="ml-5" data-shape="emerald">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M9.4.5h-.2L9 .7 4.6 5.1v.1l-.1.1V32L9 36.4h.2v.1h18.7l.1-.1 4.5-4.5v-.1l.1-.1V5L28 .6h-.2V.4H9.3Zm.9.9h16.6L24 5H13Zm17.5.2 3.6 3.6-4.2 2.6L25 5.5Zm-18.5 0 2.9 4-2.4 2.3-4.2-2.5zM13 6h11.3l.9 1L22.4 9h-7.8L12 7Zm18.8 0v24.8l-4.1-2.5V8.6Zm-26.4.2 4.1 2.5v19.7l-4 2.5Zm20.4 1.4 1 1v19.8l-1 1-2.7-2.2V9.8Zm-14.4 0L14 9.8v17.4l-2.7 2.2-1-1V8.7ZM15 10H22v17H15zM14.5 28h8L25 30l-1 1H12.9l-1-1zM27.2 29l4.2 2.5-3.8 3.8-2.8-4zm-17.4.1 2.2 2.3-2.8 3.9-3.6-3.6Zm3 2.7H24l2.7 3.7H10.1Z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="EC-filter-button-med-lrg">Emerald</label>
                  </li>
                  <li class="ml-5" data-shape="asscher">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M5.7 1.2 1.3 5.7l-.1.2v25.6l4.3 4.3h25.8l4.4-4.5.1-.2V5.5l-4.4-4.3H5.9Zm1.2.9h23.4L28 5h-19Zm-1 .2 2.3 3L5.5 8 2.3 6Zm25.3 0 3.5 3.4L31.5 8 29 5.3ZM9.7 5.9h17.8l-2.3 3H11.9Zm18.7.2 2.2 2.3-3.2 2.3L26 9.2Zm-19.7 0L11 9.3l-1.5 1.4-3.2-2.1Zm26.2.6v23.5l-3.3-2.3V9Zm-32.8.1 3.3 2.3v19L2 30.3Zm28.6 2.7v17.9l-2.8-2V11.5Zm-24.4.1 2.8 2v13.9l-2.8 1.9zm5.5.2h13.5l1.6 1.7v13.9l-1.7 1.8H11.7l-1.6-1.7V11.6Zm15.6 16.4 3.3 2.2-2.4 2.5-2.3-3.2zm-17.9 0 1.4 1.5-2.3 3.2-2.2-2.4Zm2.3 2h13.3l2.2 2.8H9.5Zm19.7.8 3.2 2-3.6 3.7-2.3-3zm-26 0L8 31.8l-2.3 3-3.4-3.4ZM9 32H28l2.1 3H6.7Z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="AS-filter-button-med-lrg">Asscher</label>
                  </li>
                  <li class="ml-5" data-shape="cushion">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M18.5.7c-2 0-4.4.2-6.8.7-3.5.6-6.2 2-8 4.1-2 2.2-2.8 5.1-2.8 9v8c0 3.9.9 6.8 2.7 9 1.9 2.1 4.6 3.5 8.1 4.1 2.6.5 4.3.6 6.4.6h.4c2 0 4.4-.1 6.8-.6 3.5-.6 6.2-2 8-4.1 2-2.2 2.8-5.1 2.8-9v-8c0-3.9-.9-6.8-2.7-9a13.5 13.5 0 0 0-8.1-4.1 32 32 0 0 0-6.4-.7Zm1 1c1.8 0 3.3 0 5.6.5a14 14 0 0 1 6.2 2.6L23.5 6Zm-2 0-4 4.3-8-1C7 3.8 9 2.8 11.8 2.3c2-.4 3.8-.5 5.6-.6Zm1 0 4.3 4.7-4.3 4.5-4.3-4.5zm13.2 3.9L30 12.9l-4.3-1.6L24 6.7Zm.8.2c1.8 2 2.8 4.8 2.8 8.6v3.2L31 13.4v-.1h-.1zM5 5.8l8 1-1.8 4.5L7 13zm-.8.3 1.9 7.2-.1.2-4.4 4.2v-3.3c0-3.6 1-6.3 2.6-8.3zm19 1 1.5 4h-5.5zm-9.6 0 3.9 4h-5.4ZM12 12h13v13H12Zm13.8.2 4 1.5-4 4zm-14.6 0v5.5l-4-4Zm19.3 2 4.5 4.2-4.5 4.3-4.4-4.2zm-24 0 4.4 4.3-4.4 4.2L2 18.5zm28.8 5v3.6c0 3.6-1 6.1-2.6 8l-1.9-7v-.1l.1-.3zm-33.6 0L6 23.6v.2L4.5 31c-1.7-2-2.7-4.7-2.7-8.3Zm24.1.1 4 4-4 1.5zm-14.6.1v5.4l-4-1.5ZM30 24l1.8 7.2-7.9-1 1.7-4.5zM7 24l4.3 1.7 1.7 4.5-7.9 1zm5.2 1.8h5.5l-4 4zm7.2 0h5.4l-1.5 4zm-.9.3 4.3 4.5-4.3 4.6-4.3-4.6Zm5 4.8 8 1a13 13 0 0 1-5.4 2.7l-.5.1-.5.1-.5.1c-1.8.3-3.5.4-5.1.5zm-10 0 4 4.5a30.6 30.6 0 0 1-6.1-.7l-.5-.1A13 13 0 0 1 5.5 32Z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="CU-filter-button-med-lrg">
                     Cushion
                     </label>
                  </li>
                  <li data-shape="marquise" class="ml-5">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M18.5.8h-.7C12 5.4 7.7 12.4 7.7 18.5c0 2.8.8 5.6 2.3 8.3v.2a27.8 27.8 0 0 0 6.1 7.5l1.2 1 .3.4.2.1.2.2V36h.3l.3.2V36h.6v-.1l.2-.1.2-.2.2-.2.3-.2.3-.3.4-.3.3-.4.3-.2.2-.2.3-.3c1.7-1.7 3.3-3.7 4.6-5.8l.2-.4.1-.2c1.6-2.8 2.5-5.7 2.5-8.7 0-4.3-2-8.5-5-12.4a34.8 34.8 0 0 0-4.6-4.7h-.1l-.2-.3-.2-.1h-.7zm.6 1V2a30.5 30.5 0 0 1 7 8.2l-3.2 3.3zm-1.4.3L14 13.5 11 10.2c1.6-3 4-5.8 6.8-8.1zm.8.3L21.9 13l-3-2.4h-.4L15 13.2zm8 8.4c1.1 2.3 1.8 4.6 2 7L23.4 14zm-16 .2 3 3.2-5 3.6c.2-2.2.8-4.6 2-6.8zm8.1.5 3.8 2.8 1.4 4.3-1.4 4.2-3.7 2.6-4.3-3-1.2-3.8 1.3-4.1zm4.9 3.6 4.7 3.5-4.7 3.4 1.1-3.3v-.2zm-10 .1-1.1 3.3v.2l1 3-4.6-3zm-5 4.3 5.2 3.4-3.1 3.2a16.9 16.9 0 0 1-2-6.6Zm19.9 0c-.2 2.2-.9 4.5-2 6.7l-3-3.1zM14 23.7l3.6 11a33 33 0 0 1-6.6-7.9Zm.8 0 3.8 2.5h.3l3-2.1-3.5 10.4zm8 0L26 27v.2h-.1v.1c-1.3 2.1-2.9 4-4.6 5.8l-.2.2-.4.3-.2.3-.4.3-.3.3-.3.2-.2.2-.2.2H19z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="MQ-filter-button-med-lrg">Marquise</label>
                  </li>
                  <li data-shape="radiant" class="ml-5">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M9.4.5H9L4.5 5.3V32L9 36.4l.2.1h18.7l4.6-4.7V5L28 .6l-.2-.1zm.8.9H27l-2 2.8H12.2Zm17.6.2 3.6 3.6-3.2 2-2.6-2.7Zm-18.4 0 2.1 3-2.7 2.6-3.2-1.8ZM13.9 5h9.4l-4.7 2.4zm-1.3.3 4.5 2.2-4 .4zm12 0L24 8l-4-.4zm-12.8.2.4 2.3-2.4-.3Zm13.6 0 1.9 1.9-2.3.4zm6.3.5v24.8L28.6 29V7.9Zm-26.4.2L8.4 8v21.1l-3 1.9Zm22.2 2L25.2 16 25 8.7Zm-8.9 0 5.4.5.5 9.8-1 9.5-5 .7-5-.7-1-9.5.6-9.8zm-9.1 0 2.8.5-.5 7.4Zm18.2 2.4v15.7l-2.3-7.8Zm-18.4.1 2.3 7.8-2.3 7.9Zm15.8 10 2.4 8-3.1-.6zm-13.2 0 .7 7.4-3.1.7zm1.5 8.2 3.7.5-4.5 2.2zm10.2 0 .7 2.7-4.4-2.2zm1 0 2.7.6-2.1 2zm-12.1 0-.8 2.7-2-2zm6 .7 4.6 2.4h-9.3zm9.7.2 3.2 1.8-3.8 3.8-2.1-3zm-19.4 0 2.6 2.7-2.2 3-3.6-3.7zm3.4 3h12.5l2 2.8H10.2Z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="RA-filter-button-med-lrg">Radiant</label>
                  </li>
                  <li data-shape="oval" class="ml-5">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M18.6.5c-3.5-.1-6.7 1.8-9 5A21.6 22 0 0 0 5.9 18v.3A22 22.4 0 0 0 9.4 31c2.2 3.4 5.3 5.5 8.9 5.5 3.5.1 6.7-1.8 9-5s3.7-7.7 3.8-12.7c0-4.9-1.3-9.5-3.5-12.8-2.3-3.3-5.4-5.5-9-5.5zm-1 .8-3 4.2h-3.9c1.9-2.4 4.3-3.9 6.9-4zm1.6 0c2.6.3 5 1.8 6.9 4.2h-4zm-.8.2 3 4.3-3 1.7-3-1.7zm-4 4.8-1.3 4.4-2.8 1.7V6.3Zm8 0h4.1v6.1l-2.8-1.7zm-7.3.2L17.6 8l-3.5 2zm6.6 0 1 3.6-3.5-2zm-12.2 1v5.4l-2.8 4a21 21.4 0 0 1 2.8-9.5zm17.8 0a21 21.4 0 0 1 2.8 9.5l-2.8-4zm-8.9 1 4.6 2.8 2 7.1-2 7.3-4.6 2.8-4.6-2.8-2-7.3 2-7.1zm-5.6 3.4-1.4 5-1-3.6zm11.1 0 2.4 1.4-1 3.7zm-14.2 2 1.3 4.4-1.3 4.5-3-4.5zm17.4 0 3 4.4-3 4.5-1.3-4.5zm3 5.8a21 21 0 0 1-2.8 9.8v-5.7zm-23.4 0 2.8 4v5.8a20.3 20.3 0 0 1-2.8-9.7zm4.7.1 1.4 5.1-2.4-1.4zm14 0 1 3.7L24 25zm-15.1 4.6 2.8 1.7 1.3 4.5h-4.1zm16.2 0v6.1h-4l1.2-4.4zm-12.4 2.3 3.5 2-2.4 1.6zm8.6 0-1 3.6-2.5-1.4zm-4.3 2.6 3 1.8-3 4.3-3-4.3zm-7.7 2h4l2.9 4.3c-2.6-.3-5-1.8-6.9-4.2zm11.4 0h4a10.3 10.5 0 0 1-6.9 4.3z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="OV-filter-button-med-lrg">Oval
                     </label>
                  </li>
                  <li  data-shape="pear" class="ml-5">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M18 .7v.4l-.5.5-.4.4-.3.4a41.8 41.8 0 0 0-4.4 5.5l-.2.2v.1l-.3.5a37.8 37.8 0 0 0-3.6 7v.1l-.4.8C7 19.3 6.5 22 6.5 24.5v2.2l.1.2v.3l.1.2c1.2 5.1 6.1 8.9 11.8 8.9 5.7 0 10.6-3.8 11.8-8.9V26.8c.2-.4.2-1 .2-1.4V24.5c0-2.7-.6-5.5-1.6-8.3l-.1-.4-.3-.5c-.9-2.4-2.1-4.7-3.6-7l-.4-.6a46.6 46.6 0 0 0-4-5.1l-.4-.4-.2-.2-.4-.4-.3-.3-.1-.1L19 1h-.1V.7h-.2zm0 1.5v8.7l-4.7-3a45.7 45.7 0 0 1 3.9-4.8l.3-.4c.1 0 .2 0 .2-.2l.3-.3zm.9 0 .2.2.4.3.3.4.4.5c1.2 1.2 2.3 2.7 3.4 4.3L19 11zm5.4 6.7.2.3a37 37 0 0 1 3.4 6.7l-5.4-.6zM12.7 9l1.8 6.4-5.4.6.1-.3c.8-2.2 2-4.3 3.3-6.4zm.8 0 4.4 2.8-2.7 3.1zm10 0-1.7 6-2.7-3.2zM18 12.8v16.9L15.3 28 13.5 24l2-8zm.8 0 2.7 3.1 1.9 8.1-1.8 4.2-2.8 1.5zm-4.4 3.4L13 23l-3.7-6.2zm8 0 5.3.6-3.7 6.2zm5.9 1.2a25 25 0 0 1 1.3 7.6V26l-5.2-2.2zm-19.8 0 4 6.5L7.2 26v-1.5c0-2.3.5-4.7 1.3-7.1Zm4.3 7.2 1.4 3.3-6-1.3zm11.2 0 4.6 2-6 1.3zm5.4 2.6v.2c-.5 1.9-1.5 3.6-3 5L23 28.5zm-22 0 6.6 1.5-3.7 3.6a10 10 0 0 1-2.9-5ZM15 29l2.4 1.2L12 32zm7 0 3 3-5.4-1.8zm-4 1.9v4.6c-2.5-.1-4.8-1-6.7-2.5zm.9 0 6.8 2.1a11.6 11.6 0 0 1-6.8 2.5zm7.2 1.6.1.2H26zm-15.2 0v.1h-.1z">
                        </path>
                     </svg>
                     <br><label class="shape-filter-button-label screen-reader-only"
                        for="PS-filter-button-med-lrg">Pear
                     </label>
                  </li>
                  <li data-shape="heart" class="ml-5">
                     <svg  viewBox="0 0 37 37" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068"
                           d="M10 1.5c-1 0-2 .1-3 .4a8.4 8.4 0 0 0-6 5.3C0 9.9 0 13.5 1 17a23 23 0 0 0 5 9c.9 1.2 2 2.3 3.2 3.4v.2l.3.3h.2a42.1 42.1 0 0 0 7.3 5h.2l.4.2.4.2.4.2h.2l.4-.2.4-.2.4-.2h.2a37.4 37.4 0 0 0 7.3-5h.2l.3-.3v-.2l3.3-3.3A23 23 0 0 0 36 17c1-3.5 1-7.1 0-9.8a8.4 8.4 0 0 0-6-5.3 11 11 0 0 0-8 .7 32.5 32.5 0 0 0-2.9 1.5l-.4.2h-.2l-.4-.2h-.2A46 46 0 0 0 13 1.9c-1-.3-2-.4-3-.4Zm-.1.8 2.3.3-3 3.9-3.5-3.3L7 2.7c1-.3 1.9-.4 2.8-.4Zm17 0 2.7.3h.3l.2.1 1.3.6-3.6 3.2-3-3.9 2.1-.3zm-14 .7 5 5.9-3 1-5-3Zm11.2 0 3.1 4-5.2 3-2.7-1zm-1.2.2-4.3 5.3-4.4-5.3a31.7 31.7 0 0 1 3.4 1.6l.5.3.3.1h.2L19 5l.5-.2a45.4 45.4 0 0 1 2.9-1.4l.5-.2zm-18 .4L8.6 7 1.3 9.5c0-.7.2-1.4.5-2 .7-1.8 1.8-3 3.1-3.9Zm27.2 0c1.3.9 2.4 2 3.1 3.9l.1.2.5 1.8L28.5 7Zm-23.3 4v4.6L6.2 15l-4.7-4.6Zm19.4 0 7.3 2.7-4.7 4.5-2.6-2.6zm-18.6.2 4.3 2.4-4.3 1.6zm17.9 0-.1 4-4.4-1.5zm-9 1.7 2.6 1-2.5 1.4-2.8-1.5zm-3.7 1.2 3.7 2h.2l3.3-1.9 5.3 1.8-1 5.7-3.8 5-4 3-3.8-3-4-4.8-1-6ZM1 11l4.6 4.5-2.6 4.7a18 18 0 0 1-2-9.3ZM36 11a18 18 0 0 1-.7 5.8l-.1.3c-.3 1.1-.7 2.2-1.2 3.1l-2.6-4.7zM28 13l2.3 2.3-3 2.4zm-19 .1.7 4.5-2.9-2.3zM6.3 16l3.6 2.8-1 3.2-5.1-1.4zm24.4 0 2.5 4.6-5.1 1.4-.9-3.2zm-4.1 3.3.7 2.9-3.6.8zm-16.1.2 2.9 3.5-3.7-.8zm-6.8 2 5.1 1.3.3 5.4-2.6-2.6c-1.1-1.3-2-2.7-2.8-4.2Zm29.6 0a22 22 0 0 1-5.4 6.7l.3-5.4zm-6 1.5-.3 6-5-.5 1.1-4.6zM9.7 23l4.5 1 .9 4.5-5 .5zm12.5 1.5-.8 3.7-2-1.5zm-7.1 0 3 2.2-2.3 1.5zm3.5 2.7L21 29l-2.5 5.2L16 29zm-3.3 2 2.4 5h-.2a36.7 36.7 0 0 1-6.5-4.5zm6.6 0 4.3.5a41.2 41.2 0 0 1-6.5 4.4l-.2.1z">
                        </path>
                     </svg>
                     <br>
                     <label class="shape-filter-button-label screen-reader-only" for="HS-filter-button-med-lrg">
                     Heart 
                     </label>
                  </li>
               </ul>
            </div>
            <div class="col-sm-4 p-0">
               <div class="filter-header">
                  <p> CARAT </p>
               </div>
               <div class="row" style="padding:10px 20px">
                  <div class="col-sm-12" >
                     <p>
                        <label for="amount">Carat Range:</label>
                        <input type="text" id="amount" readonly style="border:0; color:#423c9e; font-weight:bold;">
                     </p>
                     <div id="slider-range"></div>
                  </div>
               </div>
            </div>
            <div class="col-sm-4 p-0">
               <div class="filter-header">
                  <p> COLOR </p>
               </div>
               <div style="text-align:left;" class="color-filter">
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="f" disabled=""><span>F</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="g" disabled=""><span>G</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="h" disabled=""><span>H</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="i" disabled=""><span>I</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="j" disabled=""><span>J</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="k" disabled=""><span>K</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="l" disabled=""><span>L</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="m" disabled=""><span>M</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="color" value="m" disabled=""><span>O</span></label>
               
               </div>
            </div>
            <div class="col-sm-4 p-0">
               <div class="filter-header">
                  <p> CUT </p>
               </div>
               <div style="text-align:left;" class="cut-filter">
               <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="cut" value="excellent" disabled=""><span>Excellent</span></label>
                
                 <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="cut" value="very good" disabled=""><span>Very Good</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;">
                  <input class="form-check-input" type="radio" name="cut" value="good" disabled=""><span>Good</span></label>
               </div>
            </div>
            <div class="col-sm-4 p-0">
               <div class="filter-header" >
                  <p> CLARITY </p>
               </div>
               <div style="text-align:left;" class="clarity-filter">
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="if" disabled=""><span>IF</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vvs1" disabled=""><span>VVS1</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vvs2" disabled=""><span>VVS2</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vs1" disabled=""><span>VS1</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="vs2" disabled=""><span>VS2</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="si1" disabled=""><span>SI1</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="si2" disabled=""><span>SI2</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i1" disabled=""><span>I1</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i2" disabled=""><span>I2</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i3" disabled=""><span>I3</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i4" disabled=""><span>I4</span></label>
                  <label class="rect" style="font-size: 12px; font-weight: bold;"><input class="form-check-input" type="radio" name="clarity" value="i5" disabled=""><span>I5</span></label>
               </div>
            </div>
            <div class="col-sm-4 p-0">
               <div class="filter-header">
                  <p> PRICE </p>
               </div>
               <div class="col-sm-12" >
                  <p>
                     <label for="amount2">Price Range:</label>
                     <input type="text" id="amount2" readonly style="border:0; color:#423c9e; font-weight:bold;">
                  </p>
                  <div id="slider-range2"></div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <br />
   <div class="row">
      <div class="col-sm-12">
         
         <table id="myTable" class="table-resopsive table table-striped desktop-table">
            <th onclick="">Wish list</th>
            <th >Shape</th>
             <?php if($isUserLogged){?>
               <th >Price</th>
             <?php }?>   
            <th >Carat</th>
            <th >Cut</th>
            <th >Color</th>
            <th>Clarity</th>
            <th>Buy Now</th>
            <tbody class='all_products'>
               <?php 
                $prices = array();
              
               ?>
               <?php foreach ($products as $product) {?>
                  <?php 
                       array_push($prices, $product['price']);
                     ?>
               <tr 
                  data-shape="<?php echo $product['shape']; ?>"
                  data-carat="<?php echo $product['carat']; ?>"
                  data-color="<?php echo $product['color']; ?>"
                  data-cut="<?php echo $product['cut']; ?>"  
                  data-clarity="<?php echo $product['clarity']; ?>"  
                  data-price="<?php echo $product['price']; ?>"
                  >
                  <td>
                     <div class="icon-heart-empty" style="cursor: pointer;">
                        <?php if(in_array($product['product_id'],$wishlist_products)){?>
                           <i data-pid="<?php echo $product['product_id'];?>" class="fa btn-wishlist fa-heart"
                              aria-hidden="true">
                           </i>
                         <?php }else{?> 
                           <i data-pid="<?php echo $product['product_id'];?>" class="fa btn-wishlist fa-heart-o"
                           aria-hidden="true">
                           </i>
                            <?php }?>
                     </div>
                  </td>
                  <td class='diamond-shape-box' data-shape='<?php echo strtolower($product['shape']); ?>' style=" padding-left:2%">
                     <span class='svg-span'>
                        <svg width="20" height="20" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path class="icon-outline" fill="#495068" d="M18.8.8A17.7 17.7 0 0 0 .8 18v.2A17.7 17.7 0 1 0 18.8.9Zm.6.8c4 .2 7.6 1.8 10.3 4.3l-6 .2zm-1.9 0L13.3 6l-6-.2c2.7-2.5 6.3-4 10.2-4.3zm1 .2 4.3 4.5L18.5 8l-4.3-1.7zm11.8 4.8-.2 6.3-4.3-1.8L24 7zm-23.7 0L13 7l-1.7 4.3L6.9 13zm16.6.4 1.5 3.7-5.2-2.1zm-9.5 0 3.7 1.6-5.2 2zm17.4.2c2.5 2.8 4 6.4 4.3 10.3l-4.5-4.2zm-25.2 0 .2 6.2-4.5 4.2c.2-4 1.8-7.6 4.3-10.3zM18.5 9l6.7 2.8 2.7 6.6-2.7 6.7-6.7 2.8-6.7-2.7L9 18.5l2.8-6.7zm7.7 3.2 3.7 1.5-1.5 3.7zm-15.5 0-2.1 5.2L7 13.8zm19.9 2 4.6 4.3-4.6 4.3-1.8-4.4zm-24.2 0L8 18.5l-1.7 4.3-4.6-4.3zm29 5.2c-.2 4-1.8 7.6-4.3 10.3l-.2-6zm-33.8 0 4.5 4.3-.2 6c-2.5-2.7-4-6.3-4.3-10.2zm26.8 0 1.5 3.8-3.7 1.5zm-19.8 0 2.1 5.3-3.6-1.5zM30 24l.3 6.3-6.4-.2 1.8-4.3zM7 24l4.3 1.8L13 30l-6.3.3zm17.8 2.2-1.5 3.7-3.6-1.5zm-12.5 0 5.2 2.2-3.6 1.5zm6.3 2.6 4.4 1.8-4.4 4.6-4.3-4.6zm5.2 2 6 .3c-2.7 2.5-6.3 4-10.2 4.3zm-10.3 0 4.2 4.6c-4-.2-7.6-1.8-10.3-4.3z">
                           </path>
                        </svg>
                     </span>
                     &nbsp;
                     <span class='shape_name'><?php echo $product['shape']; ?></span> 
                  </td>
                  <?php if($isUserLogged){?>
                    <td>
                        <?php echo number_format($product['price'],2); ?>
                    </td>
                  <?php }?>
                  <td>
                     <?php echo $product['carat']; ?>
                  </td>
                  <td>
                     <?php echo $product['cut']; ?>
                  </td>
                  <td>
                     <?php echo $product['color']; ?>
                  </td>
                  <td>
                  <?php echo $product['clarity']; ?>
                  </td>
                  <td>
                     <a href="<?php echo $product['href']; ?>"><button style="margin-top:0px"
                        class="btn btn-hero">View more</button></a>
                  </td>
               </tr>



               <?php }  ?>
            </tbody>
         </table>
         
         <span class='all_product_mob'>            
            <?php foreach ($products as $product) {?>
            <div     data-shape="<?php echo $product['shape']; ?>"
                     data-carat="<?php echo $product['carat']; ?>"
                     data-color="<?php echo $product['color']; ?>"
                     data-cut="<?php echo $product['cut']; ?>"  
                     data-clarity="<?php echo $product['clarity']; ?>"  
                     data-price="<?php echo $product['price']; ?>"
                     class="card"
                     >
            <div class="row d-flex align-item-center">
               <div class="col-4 text-center">
                  <span class='diamond-shape-box moblie-shape' data-shape='<?php echo strtolower($product['shape']); ?>'>
                     <svg viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path class="icon-outline" fill="#495068" d="M18.8.8A17.7 17.7 0 0 0 .8 18v.2A17.7 17.7 0 1 0 18.8.9Zm.6.8c4 .2 7.6 1.8 10.3 4.3l-6 .2zm-1.9 0L13.3 6l-6-.2c2.7-2.5 6.3-4 10.2-4.3zm1 .2 4.3 4.5L18.5 8l-4.3-1.7zm11.8 4.8-.2 6.3-4.3-1.8L24 7zm-23.7 0L13 7l-1.7 4.3L6.9 13zm16.6.4 1.5 3.7-5.2-2.1zm-9.5 0 3.7 1.6-5.2 2zm17.4.2c2.5 2.8 4 6.4 4.3 10.3l-4.5-4.2zm-25.2 0 .2 6.2-4.5 4.2c.2-4 1.8-7.6 4.3-10.3zM18.5 9l6.7 2.8 2.7 6.6-2.7 6.7-6.7 2.8-6.7-2.7L9 18.5l2.8-6.7zm7.7 3.2 3.7 1.5-1.5 3.7zm-15.5 0-2.1 5.2L7 13.8zm19.9 2 4.6 4.3-4.6 4.3-1.8-4.4zm-24.2 0L8 18.5l-1.7 4.3-4.6-4.3zm29 5.2c-.2 4-1.8 7.6-4.3 10.3l-.2-6zm-33.8 0 4.5 4.3-.2 6c-2.5-2.7-4-6.3-4.3-10.2zm26.8 0 1.5 3.8-3.7 1.5zm-19.8 0 2.1 5.3-3.6-1.5zM30 24l.3 6.3-6.4-.2 1.8-4.3zM7 24l4.3 1.8L13 30l-6.3.3zm17.8 2.2-1.5 3.7-3.6-1.5zm-12.5 0 5.2 2.2-3.6 1.5zm6.3 2.6 4.4 1.8-4.4 4.6-4.3-4.6zm5.2 2 6 .3c-2.7 2.5-6.3 4-10.2 4.3zm-10.3 0 4.2 4.6c-4-.2-7.6-1.8-10.3-4.3z">
                        </path>
                     </svg>
                  </span>
               </div>
               <div class="col-8">
                  <b>CARAT :</b>  <?php echo $product['carat']; ?>
                  <br />
                  <b>CUT :</b>    <?php echo $product['cut']; ?>
                  <br />
                  <b>COLOR :</b>  <?php echo $product['color']; ?>
                  <br />
                  <b>CLARITY :</b>  <?php echo $product['clarity']; ?>
                  <br />
                  <a style="float:left;" href="<?php echo $product['href']; ?>">
                  <button style="margin-top:5px" class="btn btn-hero">View more</button>
                  </a>
                  <div class="icon-heart-empty" style="cursor: pointer; float:left; margin-top:12px; margin-left:10px;">
                     <?php if(in_array($product['product_id'],$wishlist_products)){?>
                     <i data-pid="<?php echo $product['product_id'];?>" class="fa btn-wishlist fa-heart"
                        aria-hidden="true">
                     </i>
                     <?php }else{?> 
                     <i data-pid="<?php echo $product['product_id'];?>" class="fa btn-wishlist fa-heart-o"
                        aria-hidden="true">
                     </i>
                     <?php }?>
                  </div>
               </div>
            </div>
               
            </div>
            <?php }  ?>
         </span>
      </div>
   </div>
   <?php }?>
</div>
<div class="dummy_element"></div>
<div class="dummy_element2"></div>

<?php sort($prices);

?>
<script>
let logged = <?php print_r($isUserLogged);?>;

  $( function() {
    $( "#slider-range" ).slider({
      range: true,
      min: 0.10,
      max: 10,
      step:0.01,
      values: [ 0.55, 1.65 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
        setTimeout(() => {
            update_filter_data('carat_data',ui.values[ 0 ]+'-'+ui.values[ 1 ]);
        }, 500);
       
      }
    });
    $( "#amount" ).val( $( "#slider-range" ).slider( "values", 0 ) +
      " - " + $( "#slider-range" ).slider( "values", 1 ) );
  } );

  $( function() {
    $( "#slider-range2" ).slider({
      range: true,
      min: <?php echo $prices[0];?>,
      max: <?php echo $prices[sizeof($prices)-1];?>,
      values: [ <?php echo $prices[0];?>, <?php echo $prices[sizeof($prices)-1];?> ],
      slide: function( event, ui ) {
        $( "#amount2" ).val('$'+ ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        if(logged){
            setTimeout(() => {
             update_filter_data('price_data',ui.values[ 0 ]+'-'+ui.values[ 1 ]);
            }, 500);
        }else{
            alert('Please login for price');
        }
       
      }
    });
    $( "#amount2" ).val('$'+ $( "#slider-range2" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range2" ).slider( "values", 1 ) );
  } );
  </script>

<script>
    $(document).ready(function(){
   
        //initial setup
        let filter_data = {
              shape_data:[],
              carat_data:'',
              color_data:[],
              cut_data:[],
              clarity_data:[],
              price_data:[]
            };
        
        $('.shape-filter li').each(function(){
           $('.diamond-shape-box[data-shape="'+$(this).attr('data-shape')+'"]').html($(this).html());
        })    
        
        let original_products = $('.all_products').html();
        let original_products_mob = $('.all_product_mob').html();

        $('.dummy_element').html(original_products);
        $('.dummy_element2').html(original_products_mob);
        
        localStorage.setItem("initalProducts", original_products);
        localStorage.setItem("initalProductsMob", original_products_mob);
        
       let update_filtered_products=()=>{
            $('.dummy_element').html(localStorage.getItem('initalProducts'));
            $('.dummy_element2').html(localStorage.getItem('initalProductsMob'));
          
            $('.dummy_element tr').each(function(){
                //apply shape filter
                if(filter_data.shape_data.length>0){
                 if(!filter_data.shape_data.includes(($(this)[0].attributes[0].nodeValue).toLowerCase())){
                    $(this).remove();
                 }   
                }
                
                
                //apply color filter
                if(filter_data.color_data.length>0){
                 if(!filter_data.color_data.includes(($(this)[0].attributes[2].nodeValue))){
                    $(this).remove();
                  }
                }
               

                //apply clarity filter
                if(filter_data.clarity_data.length>0){
                 if(!filter_data.clarity_data.includes(($(this)[0].attributes[4].nodeValue))){
                    $(this).remove();
                 }
                }
                

                //apply cut filter
                if(filter_data.cut_data.length>0){
                 if(!filter_data.cut_data.includes(($(this)[0].attributes[3].nodeValue))){
                    $(this).remove();
                 }
                }

                //apply price filter
                if(filter_data.price_data.length>0){
                  let p_range = filter_data.price_data.split('-');
                  if(!(parseInt($(this)[0].attributes[5].nodeValue) > p_range[0] && parseInt($(this)[0].attributes[5].nodeValue) < p_range[1])){
                    $(this).remove();
                  }
                }

                //apply carat filter
                if(filter_data.carat_data.length>0){
                  let c_range = filter_data.carat_data.split('-');
                  console.log(c_range);
                  if(!(parseFloat($(this)[0].attributes[1].nodeValue) > c_range[0] && parseFloat($(this)[0].attributes[1].nodeValue) < c_range[1])){
                    $(this).remove();
                  }
                }
                
            })
            $('.all_products').html($('.dummy_element').html());

            //mobile card
            $('.dummy_element2 .card').each(function(){
                console.log(($(this)[0].attributes));
               
                //apply shape filter
                if(filter_data.shape_data.length>0){
                 if(!filter_data.shape_data.includes(($(this)[0].attributes[0].nodeValue).toLowerCase())){
                    $(this).remove();
                 }   
                }
                
                
                //apply color filter
                if(filter_data.color_data.length>0){
                 if(!filter_data.color_data.includes(($(this)[0].attributes[2].nodeValue))){
                    $(this).remove();
                  }
                }
               

                //apply clarity filter
                if(filter_data.clarity_data.length>0){
                 if(!filter_data.clarity_data.includes(($(this)[0].attributes[4].nodeValue))){
                    $(this).remove();
                 }
                }
                

                //apply cut filter
                if(filter_data.cut_data.length>0){
                 if(!filter_data.cut_data.includes(($(this)[0].attributes[3].nodeValue))){
                    $(this).remove();
                 }
                }

                //apply price filter
                if(filter_data.price_data.length>0){
                  let p_range = filter_data.price_data.split('-');
                  if(!(parseInt($(this)[0].attributes[5].nodeValue) > p_range[0] && parseInt($(this)[0].attributes[5].nodeValue) < p_range[1])){
                    $(this).remove();
                  }
                }

                //apply carat filter
                if(filter_data.carat_data.length>0){
                  let c_range = filter_data.carat_data.split('-');
                  console.log(c_range);
                  if(!(parseFloat($(this)[0].attributes[1].nodeValue) > c_range[0] && parseFloat($(this)[0].attributes[1].nodeValue) < c_range[1])){
                    $(this).remove();
                  }
                }
                
            })
            $('.all_product_mob').html($('.dummy_element2').html());
        }


        update_filter_data=(key,val)=>{
            filter_data[key]=val;
            update_filtered_products();
        }
       
    })

    //wishlist
    $(document).ready(function(){
        $('.btn-wishlist').click(function(){
            if(logged){
                if($(this).hasClass('fa-heart-o')){
                  wishlist.add();
                  $(this).removeClass('fa-heart-o');
                  $(this).addClass('fa-heart');
                }else{
                    alert('Item already in wishlist.');
                }
                wishlist.add($(this).attr('data-pid'));
            }else{
                alert('Please login to access wishlist.');
            }
        })

        
    })

    //filter by shape
    $(document).ready(function(){
        $('li.ml-5').click(function(){
            if($(this).hasClass('active')){
                $(this).removeClass('active');
            }else{
                $(this).addClass('active');
            }
        let shapes = [];    
        $('li.ml-5.active').each(function(){
            shapes.push($(this).attr('data-shape'));
        })
        
        update_filter_data('shape_data',shapes);
        })


        //color filter
        $('.color-filter label span').click(function(){
           
            if($(this).hasClass('active')){
                $(this).removeClass('active');
            }else{
                $(this).addClass('active');
            }

           let colors = [];    
            $('.color-filter label span.active').each(function(){
              colors.push($(this).text());
            })
        
           update_filter_data('color_data',colors);    
            
        })

        //cut filter
        $('.cut-filter label span').click(function(){
           
           if($(this).hasClass('active')){
               $(this).removeClass('active');
           }else{
               $(this).addClass('active');
           }

          let cuts = [];    
           $('.cut-filter label span.active').each(function(){
             cuts.push($(this).text());
           })
       
          update_filter_data('cut_data',cuts);    
           
        })

         //clarity filter
         $('.clarity-filter label span').click(function(){
           
           if($(this).hasClass('active')){
               $(this).removeClass('active');
           }else{
               $(this).addClass('active');
           }

          let clarity = [];    
           $('.clarity-filter label span.active').each(function(){
            clarity.push($(this).text());
           })
       
          update_filter_data('clarity_data',clarity);    
           
        })
       
    })
   


</script>
<script>
    $("#login-redirect").click(function(e) {
        e.preventDefault();
        setCookie('login_redirect', window.location.href, '1'); //(key,value,expiry in days)
        window.location = "index.php?route=account/login";
    })
</script>

<?php echo $footer; ?>