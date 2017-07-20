<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.eWarisanSeni.app.bean.*"
	import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8" />
<title>Register Account</title>
<base href="http://localhost:8082/eWarisanSeni/" />
<meta name="description" content="eWarisanSeni Ordering System" />
<link href="css/images/logo-icon.png" rel="icon" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/stylesheet.css" />
<style type="text/css">
</style>
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/font.css" />
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/pavmegamenubase.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/pavproductcarousel.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/javascript/jquery/colorbox/colorbox.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/skins/green/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/theme-responsive.css" />

<script type="text/javascript"
	src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript"
	src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<script type="text/javascript"
	src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript"
	src="catalog/view/theme/pav_bikestore/javascript/common.js"></script>
<script type="text/javascript"
	src="catalog/view/javascript/jquery/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript"
	src="catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js"></script>
<script type="text/javascript"
	src="catalog/view/javascript/jquery/tabs.js"></script>

<script type="text/javascript" src="js/countries.js"></script>

<!--[if IE 8]>         
 <link rel="stylesheet" type="text/css" href="catalog/view/theme/pav_bikestore/stylesheet/ie8.css" />
<![endif]-->
<!--[if lt IE 9]>
<script src="catalog/view/javascript/html5.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/paneltool.css" />
	
<script>
	function validateRegister() {

		var first = document.reg.cust_firstname.value;
		var last = document.reg.cust_lastname.value;
		var icnum = document.reg.cust_icnum.value;
		var pnum = document.reg.cust_phonenumber.value;
		var email = document.reg.cust_email.value;
		var atposition=email.indexOf("@");  
		var dotposition=email.lastIndexOf(".");
		var city = document.reg.add_city.value;
		var postcode = document.reg.add_postcode.value;
		var pass1 = document.reg.cust_password.value;
		var pass2 = document.reg.confirm.value;


		if (!/^[a-z A-Z]*$/g.test(first)) {
			alert("Please Insert Your Firstname In Letters.");
			return false;
		}
		if (!/^[a-z A-Z]*$/g.test(last)) {
			alert("Please Insert Your Lastname In Letters.");
			return false;
		}
		if (isNaN(icnum)) {
			alert("Your IC Number Cannot Be In Letters.");
			return false;
		}
		if (icnum.length < 12 || icnum.length > 12) {
			alert("The Length Of Your IC Number Is Incorrect");
			return false;
		}
		if (isNaN(pnum)) {
			alert("Phone Number Cannot Be In Letters.");
			return false;
		}
		if (pnum.length < 10 || pnum.length > 11) {
			alert("Phone number length is incorrect");
			return false;
		}
		if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){  
			  alert("Please enter a valid e-mail address \n eg: email@website.com");  
			  return false;      
		}
		if (!/^[a-z A-Z]*$/g.test(city)) {
			alert("Please insert city in letters");
			return false;
		}
		if (isNaN(postcode)) {
			alert("Postcode cannot be in letter");
			return false;
		}
		if(pass1 != pass2){
			alert("Passwords must be the same");
			return false;  
			}
		else {
			return true;
		}
	}
</script>

</head>
<body class="fs12 page-common-home none">
	<section id="page-container">
		<section id="header">
			<div class="container">
				<div class="row-fluid">
					<div class="span2">
						<div id="logo">
							<a href="home.jsp"><img src="css/images/logo.png"
								title="eWarisanSeni Ordering System"
								alt="eWarisanSeni Ordering System" /></a>
						</div>

					</div>
					<div class="header-right span7 offset3 pull-right ">
						<div class="login clearfix">
							Welcome visitor, you can <a href="login.jsp">login</a> or <a
								href="register.jsp">create an account</a>.
						</div>
						<div class="wrap-link clearfix">
							<div class="currency pull-left"></div>
							<div class="language pull-left"></div>
							<div class="links pull-right">
								<a class="first" href="home.jsp">Home</a> <a href="login.jsp">My
									Account</a> <a href="login.jsp">Shopping Cart</a> <a class="last"
									href="login.jsp">Checkout</a>

							</div>
						</div>
						<div class="cart-top pull-right">
							<div id="cart">
								<div class="heading">
									<h4>My Shopping Cart</h4>
									<a><span id="cart-total"></span></a>
								</div>
								<div class="content">
									<div class="empty">Your shopping cart is empty!</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section id="mainnav">
			<div class="container">
				<div class="mainnav-inner">
					<div class="row-fluid">

						<nav id="mainmenu" class="span9">
							<div class="navbar">
								<div class="navbar-inner">
									<a data-target=".nav-collapse" data-toggle="collapse"
										class="btn btn-navbar"> <span class="icon-bar"></span> <span
										class="icon-bar"></span> <span class="icon-bar"></span>
									</a>
									<div class="nav-collapse collapse">

										<ul class="nav navbar-navf megamenu">
											<li class="homepage"><a href="home.jsp"><span
													class="menu-title">Home</span></a></li>
											<li class=""><a href="about.jsp"><span
													class="menu-title">About Us</span></a></li>
											<li class=""><a href="product.jsp"><span
													class="menu-title">Products</span></a></li>
											<li class=""><a href="ViewStaff/adminlogin.jsp"><span
													class="menu-title">&gt;&gt; ADMIN SITE</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</section>

		<section id="sys-notification">
			<div class="container">
				<div id="notification"></div>
			</div>
		</section>
		<section id="columns">
			<div class="container">
				<div class="row-fluid">

					<div class="span9">
						<div id="content">
							<div class="breadcrumb">
								<a href="home.jsp">Home</a> &raquo; <a href="login.jsp">Account</a>
								&raquo; <a href="register.jsp">Register</a>
							</div>
							<h1>Register Account</h1>
							<p>
								If you already have an account with us, please login at the <a
									href="login.jsp">login page</a>.
							</p>
							<form name="reg" action="register" onsubmit="return validateRegister()">
								<h2>Your Personal Details</h2>
								<div class="content">
									<table class="form">
										<tr>
											<td><span class="required">*</span> First Name:</td>
											<td><input type="text" name="cust_firstname" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> Last Name:</td>
											<td><input type="text" name="cust_lastname" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> IC Number:</td>
											<td><input type="text" name="cust_icnum" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> Phone Number:</td>
											<td><input type="text" name="cust_phonenumber" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> E-Mail:</td>
											<td><input type="text" name="cust_email" value="" required/></td>
										</tr>
									</table>
								</div>
								<h2>Your Address</h2>
								<div class="content">
									<table class="form">
										<tr>
											<td><span class="required">*</span> Street Address:</td>
											<td><input type="text" name="add_address" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> City:</td>
											<td><input type="text" name="add_city" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span>
												Post Code:</td>
											<td><input type="text" name="add_postcode" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> Country:</td>
											<td><select id="country" name="add_country" required></select></td>
										</tr>
										<tr>
											<td><span class="required">*</span> State:</td>
											<td><select id="state" name="add_state" required></select> <script
													type="text/javascript">
												populateCountries("country",
														"state");
											</script></td>
										</tr>
									</table>
								</div>
								<h2>Your Username and Password</h2>
								<div class="content">
									<table class="form">
										<tr>
											<td><span class="required">*</span> Username:</td>
											<td><input type="text" name="cust_username" value="" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> Password:</td>
											<td><input type="password" name="cust_password" required/></td>
										</tr>
										<tr>
											<td><span class="required">*</span> Password Confirm:</td>
											<td><input type="password" name="confirm" value="" required/></td>
										</tr>
									</table>
								</div>
								<div class="buttons">
									<div class="right">
										<!-- I have read and agree to the <a class="colorbox"
											href="privacy.jsp" title="Privacy Policy"><b>Privacy
												Policy</b></a> <input type="checkbox" name="agree" value="1" />  --><input
											type="submit" value="Continue" class="button" />
									</div>
								</div>
							</form>
						</div>
					</div>

					<div class="span3">
						<div id="column-right" class="sidebar">
							<div class="box">
								<div class="box-heading">
									<h3>
										<span>Account</span>
									</h3>
								</div>
								<div class="box-content">
									<ul>
										<li><a href="login.jsp">Login</a> / <a
											href="register.jsp">Register</a></li>
										<li><a href="forgotten.jsp">Forgotten Password</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="footer">
			<div class="footer-top">
				<div class="container">
					<div class="row-fluid">
						<div class="span9">
							<div class="box pav-custom  ">
								<div class="box-content">
									<div class="listmenu navbar">
										<ul class="nav">
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-center">
				<div class="container">
					<div class="row-fluid">
						<div class="column span3">
							<div class="box">
								<h3>Information</h3>
								<ul class="list">
									<li><a href="about.jsp">About Us</a></li>
									<li><a href="policy.jsp">Privacy Policy</a></li>
									<li><a href="term.jsp">Terms &amp; Conditions</a></li>
								</ul>
							</div>
						</div>
						<div class="column span3">
							<div class="box">
								<h3>My Account</h3>
								<ul class="list">
									<li><a href="login.jsp">My Account</a></li>
									<li><a href="login.jsp">Order History</a></li>
								</ul>
							</div>
						</div>
						<div class="column span3">
							<div class="box"></div>
						</div>
						<div class="column span3">
							<div class="box contact-us">
								<h3>Contact Us</h3>
								<ul>
									<li class="members">Address: Warisan Seni Haji Kasim
										Enterprise, KM16, Jalan Masjid, Kampung Pulai, Melaka.</li>
									<li class="phone">Phone: 06 551 0401</li>
									<li class="fax">Fax: 06 551 0402</li>
									<li class="email">Email: <a href="mailto:#">admin@warisanseni.com</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="powered">
				<div class="container">
					<div class="copyright pull-left">© 2015 Warisan Seni Haji
						Kasim Enterprise 2015. Created &amp; Designed by: Team ArISE. All
						Rights Reserved.</div>
				</div>
			</div>
		</section>
	</section>
</body>
</html>