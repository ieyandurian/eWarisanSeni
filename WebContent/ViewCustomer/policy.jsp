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
<title>Privacy Policy</title>
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

<!--[if IE 8]>         
 <link rel="stylesheet" type="text/css" href="catalog/view/theme/pav_bikestore/stylesheet/ie8.css" />
<![endif]-->
<!--[if lt IE 9]>
<script src="catalog/view/javascript/html5.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/paneltool.css" />

</head>
<body class="fs12 page-common-home none">
	<section id="page-container">
		<section id="header">
			<div class="container">
				<div class="row-fluid">
					<div class="span2">
						<div id="logo">
							<a href="ViewCustomer/home.jsp"><img src="css/images/logo.png"
								title="eWarisanSeni Ordering System"
								alt="eWarisanSeni Ordering System" /></a>
						</div>

					</div>
					<%
						CustomerBean currentUser = ((CustomerBean) (session
								.getAttribute("currentSessionUser")));
						AddressBean currentUserAdd = ((AddressBean) (session
								.getAttribute("currentSessionAddress")));
					%>
					<%
								CartBean cart = ((CartBean) (session.getAttribute("cart")));
							%>
					<div class="header-right span7 offset3 pull-right ">
						<div class="login clearfix">
							Welcome, <a href="ViewCustomer/account.jsp"><%=currentUser.getCust_firstname() + " "
					+ currentUser.getCust_lastname()%></a> <b> &nbsp;(</b> <a
								href="accountlogout.jsp">Logout</a> <b>)</b>
						</div>
						<div class="wrap-link clearfix">
							<div class="currency pull-left"></div>
							<div class="language pull-left"></div>
							<div class="links pull-right">
								<a class="first" href="ViewCustomer/home.jsp">Home</a> <a href="ViewCustomer/account.jsp">My
									Account</a> <a href="ViewCustomer/cart.jsp">Shopping Cart</a> <a class="last"
									href="ViewCustomer/checkout.jsp">Checkout</a>

							</div>
						</div>
						<div class="cart-top pull-right">
							<div id="cart">
								<div class="heading">
									<h4>My Shopping Cart</h4>
									<a><span id="cart-total"></span></a>
								</div>
								<div class="content">
									<div class="mini-cart-info">
										<table>
											<%
													ProductBean bean = new ProductBean();
													HashMap<Integer, Integer> items = cart.getCartItems();																																																			for (int key : items.keySet()) {
												%>
											<sql:setDataSource var="snapshot"
												driver="oracle.jdbc.driver.OracleDriver"
												url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
												password="oracle" />
											<sql:query dataSource="${snapshot}" var="result">SELECT * from product where prod_id = <%=key%></sql:query>
											<c:forEach items="${result.rows}" var="row"
												varStatus="counter">
												<%
														bean.setProd_ID(key);
																									bean.setProd_Quantity(items.get(key));
																									int q = bean.getProd_Quantity();
													%>
												<c:set var="q" value="<%=bean.getProd_Quantity()%>" />
												<tr>
													<td class="image" data-label="Image"><a
														href="ViewCustomer/productdetails.jsp?prod_ID=<c:out value="${row.prod_ID}" />"><img
															src="image/data/img-55x46-<c:out value="${row.prod_ID}" />.jpg"
															alt="<c:out value="${row.prod_Name}" />"
															title="<c:out value="${row.prod_Name}" />" /></a></td>
													<td class="name" data-label="Product Name"><a
														href="ViewCustomer/productdetails.jsp?prod_ID=<c:out value="${row.prod_ID}" />"><c:out
																value="${row.prod_Name}" /></a>
														<div></div></td>
													<td class="quantity" data-label="Quantity"><%=bean.getProd_Quantity()%>&nbsp;<a
														href="deleteFromCart?prod_ID=<c:out value="${row.prod_ID}" />"><img
															src="catalog/view/theme/default/image/remove.png"
															alt="Remove" title="Remove From Cart" /></a></td>
													<td class="total" data-label="Total">RM <fmt:formatNumber
															type="number" minFractionDigits="2" maxFractionDigits="2"
															value="${row.prod_Price * q}" /></td>
												</tr>
												<c:set var="sum" value="${(row.prod_Price * q) + sum}" />
											</c:forEach>
											<%
													}
												%>
										</table>
									</div>
									<div class="mini-cart-total">
										<table>
											<tr>
												<td class="right"><b>Sub-Total:</b></td>
												<td class="right">RM <fmt:formatNumber value='${sum}'
														type="number" groupingUsed='true' minFractionDigits="2"
														maxFractionDigits="2" /></td>
											</tr>
											<tr>
												<td class="right"><b>Total:</b></td>
												<td class="right">RM <fmt:formatNumber value='${sum}'
														type="number" groupingUsed='true' minFractionDigits="2"
														maxFractionDigits="2" /></td>
											</tr>
										</table>
									</div>
									<div class="checkout">
										<a href="ViewCustomer/cart.jsp">View Cart</a> &nbsp; <a href="ViewCustomer/checkout.jsp">Checkout</a>
									</div>
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
											<li class="homepage"><a href="ViewCustomer/home.jsp"><span
													class="menu-title">Home</span></a></li>
											<li class=""><a href="ViewCustomer/about.jsp"><span
													class="menu-title">About Us</span></a></li>
											<li class=""><a href="ViewCustomer/product.jsp"><span
													class="menu-title">Products</span></a></li>
											<li class=""><a href="ViewStaff/adminlogin.jsp"><span
													class="menu-title">&gt;&gt; ADMIN SITE</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</nav>
						<form action="search">
							<div id="search" class="span3">
								<table>
									<tr>
										<td><input type="text" name="search"
											placeholder="Search..." value="" /></td>
										<td><input class="button-search" type="submit" value="" /></td>
									</tr>
								</table>
							</div>
						</form>
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
					<div class="span12">
						<div id="content">
							<div class="breadcrumb">
								<a href="ViewCustomer/home.jsp">Home</a> &raquo; <a href="ViewCustomer/policy.jsp">Privacy
									Policy</a>
							</div>
							<h1>Privacy Policy</h1>
							<div
								style="width: 770px; height: 600px; line-height: 3em; overflow: scroll; padding: 5px; background-color: #FFFFFF; color: #000000; border: 4px double #7AA65D;">
								<p style="text-align: center; line-height: normal;">
									<strong><span
										style="font-family: 'Verdana', 'sans-serif'; font-size: 14pt;">
											Privacy Policy<br>
										<br>
									</span></strong>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">This
											privacy policy discloses the privacy practices for <span
											style="text-decoration: underline;">eWarisanSeni
												Ordering System</span>. This privacy policy applies solely to
											information collected by this web site. It will notify you of
											the following:
									</span></span>
								</p>
								<ol>
									<li style="line-height: normal;">
										<div>
											<span style="font-size: small;"><span
												style="font-family: 'Verdana', 'sans-serif';"><br>What
													personally identifiable information is collected from you
													through the web site, how it is used and with whom it may
													be shared. </span></span>
										</div>
									</li>
									<li style="line-height: normal;">
										<div>
											<span style="font-size: small;"><span
												style="font-family: 'Verdana', 'sans-serif';"><br>What
													choices are available to you regarding the use of your
													data. </span></span>
										</div>
									</li>
									<li style="line-height: normal;">
										<div>
											<span style="font-size: small;"><span
												style="font-family: 'Verdana', 'sans-serif';"><br>The
													security procedures in place to protect the misuse of your
													information. </span></span>
										</div>
									</li>
									<li style="line-height: normal;">
										<div>
											<span style="font-size: small;"><span
												style="font-family: 'Verdana', 'sans-serif';"><br>How
													you can correct any inaccuracies in the information. </span></span>
										</div>
									</li>
								</ol>
								<p style="line-height: normal;">
									<strong><span
										style="font-family: 'Verdana', 'sans-serif';"><span
											style="font-size: small;"><br>
											<br>Information Collection, Use, and Sharing</span></span></strong><span
										style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';"><br>
										<br>We are the sole owners of the information collected
											on this site. We only have access to/collect information that
											you voluntarily give us via email or other direct contact
											from you. We will not sell or rent this information to
											anyone. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">We will
											use your information to respond to you, regarding the reason
											you contacted us. We will not share your information with any
											third party outside of our organization, other than as
											necessary to fulfill your request, e.g. to ship an order. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">Unless
											you ask us not to, we may contact you via email in the future
											to tell you about specials, new products or services, or
											changes to this privacy policy. </span></span>
								</p>
								<p style="line-height: normal;">
									<strong><span
										style="font-family: 'Verdana', 'sans-serif';"><span
											style="font-size: small;"><br>
											<br>Your Access to and Control Over Information</span></span></strong><span
										style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';"><br>
										<br>You may opt out of any future contacts from us at any
											time. You can do the following at any time by contacting us
											via the email address or phone number given on our website: </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">&nbsp;&nbsp;&nbsp;¢
									</span><span style="font-family: 'Verdana', 'sans-serif';">See
											what data we have about you, if any. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">&nbsp;&nbsp;&nbsp;¢
									</span><span style="font-family: 'Verdana', 'sans-serif';">Change/correct
											any data we have about you. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">&nbsp;&nbsp;&nbsp;¢
									</span><span style="font-family: 'Verdana', 'sans-serif';">Have
											us delete any data we have about you. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">&nbsp;&nbsp;&nbsp;¢
									</span><span style="font-family: 'Verdana', 'sans-serif';">Express
											any concern you have about our use of your data. </span></span>
								</p>
								<p style="line-height: normal;">
									<strong><span
										style="font-family: 'Verdana', 'sans-serif';"><span
											style="font-size: small;"><br>
											<br>Security</span></span></strong><span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';"><br>
										<br>We take precautions to protect your information. When
											you submit sensitive information via the website, your
											information is protected both online and offline. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">Wherever
											we collect sensitive information (such as credit card data),
											that information is encrypted and transmitted to us in a
											secure way. You can verify this by looking for a closed lock
											icon at the bottom of your web browser, or looking for
											"https" at the beginning of the address of the web page. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';">While we
											use encryption to protect sensitive information transmitted
											online, we also protect your information offline. Only
											employees who need the information to perform a specific job
											(for example, billing or customer service) are granted access
											to personally identifiable information. The computers/servers
											in which we store personally identifiable information are
											kept in a secure environment. </span></span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><strong><span
											style="font-family: 'Verdana', 'sans-serif';"><br>
											<br>Updates</span></strong> </span>
								</p>
								<p style="line-height: normal;">
									<span style="font-size: small;"><span
										style="font-family: 'Verdana', 'sans-serif';"><br>Our
											Privacy Policy may change from time to time and all updates
											will be posted on this page.</span> </span>
								</p>
								<p style="line-height: normal;">
									<strong><span
										style="font-family: 'Verdana', 'sans-serif';"><span
											style="font-size: small;"><br>
											<br>If you feel that we are not abiding by this privacy
												policy, you should contact us immediately via telephone at <span
												style="text-decoration: underline;">06 551 0401</span> or <span
												style="text-decoration: underline;">admin@warisanseni.com</span>.
										</span></span></strong>
								</p>
							</div>
							<div class="buttons">
								<div class="right">
									<a href="ViewCustomer/home.jsp" class="button">Continue</a>
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
						<div class="span3">
							<div class="box pav-custom  ">
								<div class="box-content">
									<div class="social">
										<h4 class="pull-left">&nbsp;</h4>
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
									<li><a href="ViewCustomer/about.jsp">About Us</a></li>
									<li><a href="ViewCustomer/policy.jsp">Privacy Policy</a></li>
									<li><a href="ViewCustomer/term.jsp">Terms &amp; Conditions</a></li>
								</ul>
							</div>
						</div>
						<div class="column span3">
							<div class="box">
								<h3>My Account</h3>
								<ul class="list">
									<li><a href="ViewCustomer/account.jsp">My Account</a></li>
									<li><a href="ViewCustomer/orderhistory.jsp">Order History</a></li>
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