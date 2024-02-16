<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie-edge">
	<link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;700;900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,400;0,700;0,900;1,400;1,600;1,900&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=PT+Sans:wght@400;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" 
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" 
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 
	crossorigin="anonymous">
	<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

	<title>ZAYN JEWELS</title>
	
</head>


<body>


	<!--<div style="margin-left: 45%;">
		<img id="logo-img" src="assets/images/logo_main.png" style="vertical-align: middle;
		border-style: none;height: 15%;width: 117px;" >
	</div>-->
	<nav class="navbar navbar-expand-md navbar-light bg-light p-0 py-3 ">
        <div class="container" style="width: 100%;     margin-left: 17%;
		margin-right: 10%; margin-top:3%;">
			
			
            <button class="navbar-toggler" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item px-5">
                        <a class="nav-link" href="#">HOME</a>
                    </li>
                    <li class="nav-item px-5">
                        <a class="nav-link" href="#about-us">ABOUT US</a>
                    </li>
                    <li class="nav-item px-5">
                        <a class="nav-link" href="#jewelry">SHOP</a>
                    </li>
                    <li class="nav-item px-5" id="gallery">
						<a class="nav-link" href="#gallery">GALLERY &#9662;</a>
						<ul class="dropdown">
							<a href="#">LOOKBOOK</a>
						</ul>
					</li>
					<li>
					<img id="logo-img" src="assets/images/logo_main.png" style="vertical-align: middle;
		border-style: none;height: 15%;width: 117px;" >
					</li>
					<li class="nav-item px-5">
                        <a class="nav-link" href="#blog">BLOG</a>
					</li>
					<li class="nav-item px-5">
                        <a class="nav-link" href="get-in-touch">GET IN TOUCH</a>
					</li>
					<li class="nav-item px-1 pt-2 d-none d-lg-inline">
                        <a class="nav-link search-icon" href="#search"><i id="search" class="fa fa-search" aria-hidden="true"></i></a>
                    </li>
                </ul>
            </div>
        </div>
	</nav> 
	
	
	<!--Main navbar
 <div class="col-sm-4 col-xs-12" style="padding-left: 30px; padding-top: 3-px;">
	<div id="mySidenav" class="sidenav">
		<ul class="navbar-nav ml-auto"></ul>
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		
		<li><a href="#">HOME</a></li>
		<li><a href="#">ABOUT US</a></li>
		<li><a href="#">JEWELLERY</a></li>
		<li class="nav-item" id="gallery">
			<a class="nav-link" href="#gallery">GALLERY &#9662;</a>
			<ul class="dropdown">
				<a href="#">LOOKBOOK</a>
			</ul>
		</li>
		<li><a href="#">BLOG</a></li>
		<li><a href="#">GET IN TOUCH</a></li>
	    </ul>
	  </div>
	  
	  <div id="main">
		
		<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; </span>
		
	</div>
</div>
	  
	  <script>
	  function openNav() {
		document.getElementById("mySidenav").style.width = "250px";
		document.getElementById("main").style.marginLeft = "250px";
		document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	  }
	  
	  function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
		document.getElementById("main").style.marginLeft= "0";
		document.body.style.backgroundColor = "white";
	  }
	  </script>
	<div class="col-sm-4 text-center">
		<a href="#">
			<img  src="assets/images/logo_main.png" alt="Zayn Jewels" class="img-responsive main-logo">
		</a>
		<i class="fa fa-search fa-2x" aria-hidden="true"></i>
		<i class="fa fa-heart-o fa-2x" aria-hidden="true"></i>
	</div>-->

	<!---video
	<section id="video">
		<div class="container py-3" style=" margin-left: 0%; margin-right: 0%;">
			<div class="container-video">
				<video src="assets/images/mov_bbb.mp4" class="video"></video>
				<div class="heading">
					<div class="title">
						Diamond video
					</div>
				</div>
				<div class="controls">
					<div class="buttons">
						<button id="play-pause"></button>
					</div>
				</div>
			</div>
		</div>
	</section>-->
	
	

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" 
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
	crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" 
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" 
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" 
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" 
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</body>
</html>