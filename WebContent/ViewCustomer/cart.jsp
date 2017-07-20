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
<title>Shopping Cart</title>
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
								<a href="ViewCustomer/home.jsp">Home</a> &raquo; <a href="ViewCustomer/cart.jsp">Shopping
									Cart</a>
							</div>
							<div class="checkout">
								<h1>Shopping Cart</h1>
								<form action="checkout">
									<div class="cart-info">
										<table class="pav-shop-cart">
											<thead class="hidden-phone">
												<tr>
													<td align="center">Image</td>
													<td align="center">Product Name</td>
													<td align="center">Type</td>
													<td align="center">Quantity</td>
													<td align="center">Unit Price</td>
													<td align="center">Total</td>
													<td align="center">&nbsp;</td>
												</tr>
											</thead>
											<tbody>
												<%
													HashMap<Integer, Integer> item1 = cart.getCartItems();	
																																for (int key : item1.keySet()) {
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
																																															bean.setProd_Quantity(item1.get(key));
																																															int q = bean.getProd_Quantity();
													%>
													<c:set var="q" value="<%=bean.getProd_Quantity()%>" />
													<tr>
														<td align="center" data-label="Image"><a
															href="ViewCustomer/productdetails.jsp?prod_ID=<c:out value="${row.prod_ID}" />"><img
																src="image/data/img-75x62-<c:out value="${row.prod_ID}" />.jpg"
																alt="<c:out value="${row.prod_Name}" />"
																title="<c:out value="${row.prod_Name}" />" /></a></td>
														<td align="center" data-label="Product Name"><a
															href="ViewCustomer/productdetails.jsp?prod_ID=<c:out value="${row.prod_ID}" />"><c:out
																	value="${row.prod_Name}" /></a>
															<div></div></td>
														<td align="center" data-label="Model"><c:out
																value="${row.prod_Type}" /></td>
														<td align="center" data-label="Quantity"><input
															type="hidden" name="quantity"
															value="<%=bean.getProd_Quantity()%>" size="1"
															title="Remove from cart if you want to change the quantity desired."
															disabled /><%=bean.getProd_Quantity()%></td>
														<td align="center" data-label="Unit Price">RM <fmt:formatNumber
																type="number" minFractionDigits="2"
																maxFractionDigits="2" value="${row.prod_Price}" /></td>
														<td align="center" data-label="Total">RM <fmt:formatNumber
																type="number" minFractionDigits="2"
																maxFractionDigits="2" value="${row.prod_Price * q}" /></td>
														<td align="center"><a
															href="deleteFromCart?prod_ID=<c:out value="${row.prod_ID}" />"><img
																src="catalog/view/theme/default/image/remove.png"
																alt="Remove" title="Remove From Cart" /></a></td>
													</tr>
													<c:set var="sum1" value="${(row.prod_Price * q) + sum1}" />
												</c:forEach>
												<%
													}
												%>

											</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span9">
							<div class="buttons clearfix">
								<div class="pull-right right">
									<a href="ViewCustomer/checkout.jsp" class="button">Checkout</a>
								</div>
								<div class="center pull-left">
									<a href="ViewCustomer/product.jsp" class="button">Continue Shopping</a>
								</div>
							</div>
						</div>
						<div class="span3">
							<div class="cart-total clearfix">
								<table id="total">
									<tr>
										<td class="right"><b>Sub-Total:</b></td>
										<td class="right pull-right">RM <fmt:formatNumber
												value='${sum1}' type="number" groupingUsed='true'
												minFractionDigits="2" maxFractionDigits="2" /></td>
									</tr>
									<tr>
										<td class="right"><b>Total:</b></td>
										<td class="right pull-right">RM <fmt:formatNumber
												value='${sum1}' type="number" groupingUsed='true'
												minFractionDigits="2" maxFractionDigits="2" /></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			<!--
				$('input[name=\'next\']').bind('change', function() {
					$('.cart-module > div').hide();

					$('#' + this.value).show();
				});
			//-->
			</script>
			<script type="text/javascript">
			<!--
				$('#button-quote')
						.live(
								'click',
								function() {
									$
											.ajax({
												url : 'index.php?route=checkout/cart/quote',
												type : 'post',
												data : 'country_id='
														+ $(
																'select[name=\'country_id\']')
																.val()
														+ '&zone_id='
														+ $(
																'select[name=\'zone_id\']')
																.val()
														+ '&postcode='
														+ encodeURIComponent($(
																'input[name=\'postcode\']')
																.val()),
												dataType : 'json',
												beforeSend : function() {
													$('#button-quote').attr(
															'disabled', true);
													$('#button-quote')
															.after(
																	'<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
												},
												complete : function() {
													$('#button-quote').attr(
															'disabled', false);
													$('.wait').remove();
												},
												success : function(json) {
													$(
															'.success, .warning, .attention, .error')
															.remove();

													if (json['error']) {
														if (json['error']['warning']) {
															$('#notification')
																	.html(
																			'<div class="warning" style="display: none;">'
																					+ json['error']['warning']
																					+ '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

															$('.warning')
																	.fadeIn(
																			'slow');

															$('html, body')
																	.animate(
																			{
																				scrollTop : 0
																			},
																			'slow');
														}

														if (json['error']['country']) {
															$(
																	'select[name=\'country_id\']')
																	.after(
																			'<span class="error">'
																					+ json['error']['country']
																					+ '</span>');
														}

														if (json['error']['zone']) {
															$(
																	'select[name=\'zone_id\']')
																	.after(
																			'<span class="error">'
																					+ json['error']['zone']
																					+ '</span>');
														}

														if (json['error']['postcode']) {
															$(
																	'input[name=\'postcode\']')
																	.after(
																			'<span class="error">'
																					+ json['error']['postcode']
																					+ '</span>');
														}
													}

													if (json['shipping_method']) {
														html = '<h2>Please select the preferred shipping method to use on this order.</h2>';
														html += '<form action="http://localhost/warisanseni/index.php?route=checkout/cart" method="post" enctype="multipart/form-data">';
														html += '  <table class="radio">';

														for (i in json['shipping_method']) {
															html += '<tr>';
															html += '  <td colspan="3"><b>'
																	+ json['shipping_method'][i]['title']
																	+ '</b></td>';
															html += '</tr>';

															if (!json['shipping_method'][i]['error']) {
																for (j in json['shipping_method'][i]['quote']) {
																	html += '<tr class="highlight">';

																	if (json['shipping_method'][i]['quote'][j]['code'] == '') {
																		html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" /></td>';
																	} else {
																		html += '<td><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" /></td>';
																	}

																	html += '  <td><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">'
																			+ json['shipping_method'][i]['quote'][j]['title']
																			+ '</label></td>';
																	html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">'
																			+ json['shipping_method'][i]['quote'][j]['text']
																			+ '</label></td>';
																	html += '</tr>';
																}
															} else {
																html += '<tr>';
																html += '  <td colspan="3"><div class="error">'
																		+ json['shipping_method'][i]['error']
																		+ '</div></td>';
																html += '</tr>';
															}
														}

														html += '  </table>';
														html += '  <br />';
														html += '  <input type="hidden" name="next" value="shipping" />';

														html += '  <input type="submit" value="Apply Shipping" id="button-shipping" class="button" disabled="disabled" />';

														html += '</form>';

														$
																.colorbox({
																	overlayClose : true,
																	opacity : 0.5,
																	width : '600px',
																	height : '400px',
																	href : false,
																	html : html
																});

														$(
																'input[name=\'shipping_method\']')
																.bind(
																		'change',
																		function() {
																			$(
																					'#button-shipping')
																					.attr(
																							'disabled',
																							false);
																		});
													}
												}
											});
								});
			//-->
			</script>
			<script type="text/javascript">
			<!--
				$('select[name=\'country_id\']')
						.bind(
								'change',
								function() {
									$
											.ajax({
												url : 'index.php?route=checkout/cart/country&country_id='
														+ this.value,
												dataType : 'json',
												beforeSend : function() {
													$(
															'select[name=\'country_id\']')
															.after(
																	'<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
												},
												complete : function() {
													$('.wait').remove();
												},
												success : function(json) {
													if (json['postcode_required'] == '1') {
														$('#postcode-required')
																.show();
													} else {
														$('#postcode-required')
																.hide();
													}

													html = '<option value=""> --- Please Select --- </option>';

													if (json['zone'] != '') {
														for (i = 0; i < json['zone'].length; i++) {
															html += '<option value="'
																	+ json['zone'][i]['zone_id']
																	+ '"';

															if (json['zone'][i]['zone_id'] == '') {
																html += ' selected="selected"';
															}

															html += '>'
																	+ json['zone'][i]['name']
																	+ '</option>';
														}
													} else {
														html += '<option value="0" selected="selected"> --- None --- </option>';
													}

													$(
															'select[name=\'zone_id\']')
															.html(html);
												},
												error : function(xhr,
														ajaxOptions,
														thrownError) {
													alert(thrownError + "\r\n"
															+ xhr.statusText
															+ "\r\n"
															+ xhr.responseText);
												}
											});
								});

				$('select[name=\'country_id\']').trigger('change');
			//-->
			</script>
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