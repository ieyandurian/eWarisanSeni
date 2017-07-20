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
<title>Checkout</title>
<base href="http://localhost:8082/eWarisanSeni/" />
<meta name="description" content="eWarisanSeni Ordering System" />
<link href="css/images/logo-icon.png" rel="icon" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="catalog/view/theme/pav_bikestore/stylesheet/stylesheet.css" />
<link rel="stylesheet" type="text/css" href="css/style1.css" />
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
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/jquery-1.10.2.js"></script>
<script src="js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#accordion").accordion({
			heightStyle : "content"
		});
		$('#accordion button').click(
				function(e) {
					e.preventDefault();
					var delta = ($(this).is('.next') ? 1 : -1);
					$('#accordion')
							.accordion(
									'option',
									'active',
									($('#accordion').accordion('option',
											'active') + delta));
				});
	});
</script>
</head>
<body class="fs12 page-common-home none">
	<section id="page-container">
		<section id="header">
			<div class="container">
				<div class="row-fluid">
					<div class="span2">
						<div id="logo">
							<a href="ViewCustomer/home.jsp"><img
								src="css/images/logo.png" title="eWarisanSeni Ordering System"
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
								<a class="first" href="ViewCustomer/home.jsp">Home</a> <a
									href="ViewCustomer/account.jsp">My Account</a> <a
									href="ViewCustomer/cart.jsp">Shopping Cart</a> <a class="last"
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
												url="jdbc:oracle:thin:@localhost:1521:xe"
												user="eWarisanSeni" password="oracle" />
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
										<a href="ViewCustomer/cart.jsp">View Cart</a> &nbsp; <a
											href="ViewCustomer/checkout.jsp">Checkout</a>
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
								<a href="ViewCustomer/home.jsp">Home</a> &raquo; <a
									href="ViewCustomer/cart.jsp">Shopping Cart</a> &raquo; <a
									href="ViewCustomer/checkoutcart.jsp">Checkout</a>
							</div>
							<h1>Checkout</h1>
							<form action="createOrder">
								<div class="onepage-checkout">
									<div class="pure-g-r">
										<div id="accordion">
											<h3>Step 1 : Billing/Shipping Address</h3>
											<div>
												<sql:setDataSource var="snapshot"
													driver="oracle.jdbc.driver.OracleDriver"
													url="jdbc:oracle:thin:@localhost:1521:xe"
													user="eWarisanSeni" password="oracle" />
												<sql:query dataSource="${snapshot}" var="result">SELECT * from address where cust_id = <%=currentUser.getCust_id()%></sql:query>
												<!-- Billing & shipping address -->
												<div class="pure-u-1-4">
													<div class="pure-u-1-1">
														<div class="wrapper wrapper__beta">
															<h2 class="__alpha">Billing/Shipping Address</h2>
															<c:forEach items="${result.rows}" var="row" begin="0" end="0">
																<ul class="wrapper--box">
																	<li><input type="radio" name="address"
																		id="address" checked /> <label for="Address">

																			<b><%=currentUser.getCust_firstname() + " "
						+ currentUser.getCust_lastname()%>,</b> <input type="hidden"
																			name="add_id" value="${row.add_id}" /> <br> <c:out
																				value="${row.add_address}" />,<br> <c:out
																				value="${row.add_postcode}" />, <c:out
																				value="${row.add_city}" />,<br> <c:out
																				value="${row.add_state}" />,<br> <c:out
																				value="${row.add_country}" />
																	</label></li>
																</ul>
															</c:forEach>
														</div>
													</div>
												</div>
												<div class="text--right">
													<button class='next'>Next</button>
												</div>
											</div>
											<h3>Step 2 : Payment Method</h3>
											<div>
												<!-- Payment -->
												<div class="pure-u-1-1">
													<div class="wrapper wrapper__delta">
														<h2 class="__alpha">Payment Method</h2>
														<ul class="wrapper--box">
															<li><input type="radio" name="payment"
																id="Cash On Delivery" checked /> <label
																for="Cash On Delivery">Cash On Delivery <sub>(Promotion!!
																		Only RM 30.00 delivery charge.)</sub></label></li>
														</ul>
													</div>
												</div>
												<div class="text--right">
													<button class='previous'>Previous</button>
													<button class='next'>Next</button>
												</div>
											</div>
											<h3>Step 3 : Submit Order</h3>
											<div>
												<div class="pure-u-1-2">
													<div class="wrapper wrapper__gamma">
														<h2 class="__alpha">Cart Items</h2>
														<table class="">
															<thead>
																<tr>
																	<th>Products</th>
																	<th>Quantity</th>
																	<th>Total</th>
																</tr>
															</thead>
															<%
																HashMap<Integer, Integer> item1 = cart.getCartItems();
																for (int key : item1.keySet()) {
															%>
															<sql:setDataSource var="snapshot"
																driver="oracle.jdbc.driver.OracleDriver"
																url="jdbc:oracle:thin:@localhost:1521:xe"
																user="eWarisanSeni" password="oracle" />
															<sql:query dataSource="${snapshot}" var="result">SELECT * from product where prod_id = <%=key%></sql:query>
															<c:forEach items="${result.rows}" var="row"
																varStatus="counter">
																<%
																	bean.setProd_ID(key);
																			bean.setProd_Quantity(item1.get(key));
																			int q = bean.getProd_Quantity();
																%>
																<c:set var="q" value="<%=bean.getProd_Quantity()%>" />
																<tr class="wrapper--box">
																	<td class="alpha">
																		<div class="pure-g">
																			<div class="pure-u-1-4">

																				<img
																					src='image/data/img-75x62-<c:out value="${row.prod_ID}" />.jpg'>
																			</div>
																			<div class="pure-u-3-4">
																				<div class="helper--alpha">
																					<h3>
																						<c:out value="${row.prod_Name}" />
																					</h3>
																					<p>
																						RM
																						<fmt:formatNumber type="number"
																							minFractionDigits="2" maxFractionDigits="2"
																							value="${row.prod_Price}" />
																					</p>
																					<p>
																						<a
																							href="deleteFromCart?prod_ID=<c:out value="${row.prod_ID}" />"><img
																							src="catalog/view/theme/default/image/remove.png"
																							alt="Remove" title="Remove From Cart" /></a>
																					</p>
																				</div>
																			</div>
																		</div>
																	</td>
																	<td class="alpha"><%=bean.getProd_Quantity()%></td>
																	<td align="right" data-label="Total">RM <fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${row.prod_Price * q}" /></td>
																</tr>
																<c:set var="sum1" value="${(row.prod_Price * q) + sum1}" />
																<tr>
																	<td colspan="3"><hr></td>
																</tr>
															</c:forEach>
															<%
																}
															%>
															<tr>
																<th colspan='2'><b>Sub-Total:</b></th>
																<td class="right pull-right">RM <fmt:formatNumber
																		value='${sum1}' type="number" groupingUsed='true'
																		minFractionDigits="2" maxFractionDigits="2" /></td>
															</tr>
															<tr>
																<th colspan='2'>Delivery:</th>
																<td class="right pull-right">RM 30.00</td>
															</tr>
															<tr class="alpha">
																<th colspan='2'><b>Total:</b></th>
																<td class="right pull-right">RM <fmt:formatNumber
																		value='${sum1 + 30}' type="number" groupingUsed='true'
																		minFractionDigits="2" maxFractionDigits="2" /></td>
																<td><input type="hidden" name="totalprice"
																	value="${sum1 + 30}"></td>
															</tr>
														</table>
														<div class="text--right">
															<input class="button" type="submit" value="Submit Order">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<script src="js/index.js"></script>
								</div>
							</form>
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
									<li><a href="ViewCustomer/term.jsp">Terms &amp;
											Conditions</a></li>
								</ul>
							</div>
						</div>
						<div class="column span3">
							<div class="box">
								<h3>My Account</h3>
								<ul class="list">
									<li><a href="ViewCustomer/account.jsp">My Account</a></li>
									<li><a href="ViewCustomer/orderhistory.jsp">Order
											History</a></li>
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