<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.eWarisanSeni.app.bean.*"
	import="java.util.*" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta name="viewport" content="width=device-width">
<meta charset="UTF-8" />
<title>Musical Instruments</title>
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
		<section id="columns">
			<div class="container">
				<div class="row-fluid">
					<div class="breadcrumb">
						<a href="ViewCustomer/home.jsp">Home</a> &raquo; <a href="ViewCustomer/product.jsp">Musical
							Instruments</a> &raquo; Product Details
					</div>
					<div>
						<div class="span3">
							<div id="column-left" class="sidebar">
								<div class="box category">
									<div class="box-heading">
										<h3>
											<span>Categories</span>
										</h3>
									</div>
									<div class="box-content">
										<ul class="box-category">
											<li class=""><a href="ViewCustomer/product.jsp" class="active">Musical
													Instruments</a></li>
										</ul>
									</div>
								</div>
								<div class="box box-produce light">
									<div class="box-heading">
										<h3>
											<span>Bestsellers</span>
										</h3>
									</div>
									<div class="box-content">
										<div class="box-product">
											<div class="row-fluid">
												<div class="product-block span3">
													<div class="product-inner">
														<div class="image">
															<a href="ViewCustomer/productdetails.jsp?prod_ID=1000"><img
																src="image/cache/data/kompang-75x62.JPG"
																title="Traditional Kompang" alt="Traditional Kompang" /></a>
														</div>
														<div class="name">

															<a href="ViewCustomer/productdetails.jsp?prod_ID=1000">Traditional
																Kompang</a>
														</div>
														<div class="description">Traditional Kompang are
															available in various sizes ranging f...</div>
														<div class="price-cart">
															<div class="price">RM 30.00</div>
														</div>
													</div>
												</div>
												<div class="product-block span3">
													<div class="product-inner">

														<div class="image">
															<a href="ViewCustomer/productdetails.jsp?prod_ID=1001"><img
																src="image/cache/data/rebana-75x62.JPG"
																title="Percussion (Rebana)" alt="Percussion (Rebana)" /></a>
														</div>
														<div class="name">

															<a href="ViewCustomer/productdetails.jsp?prod_ID=1001">Percussion
																(Rebana)</a>
														</div>
														<div class="description">Percussion is another
															musical instrument which played in the...</div>
														<div class="price-cart">
															<div class="price">RM 50.00</div>
														</div>
													</div>
												</div>
												<div class="product-block span3">
													<div class="product-inner">

														<div class="image">
															<a href="ViewCustomer/productdetails.jsp?prod_ID=1002"><img
																src="image/cache/data/kompang-x-ray-75x62.jpg"
																title="X-Ray Kompang" alt="X-Ray Kompang" /></a>
														</div>
														<div class="name">

															<a href="ViewCustomer/productdetails.jsp?prod_ID=1002">X-Ray Kompang</a>
														</div>
														<div class="description">X-Ray&nbsp;Kompang from
															Haji Kasim are available in various sizes ranging fr...</div>
														<div class="price-cart">
															<div class="price">RM 60.00</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="span9">
							<div id="content">
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
								SELECT * from product where prod_id=?
								<sql:param value="${param.prod_ID}" />
								</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<div class="product-info">
										<div class="row-fluid">
											<div class="span6 image-container">
												<div class="image">
													<a
														href="image/data/img-<c:out value="${row.prod_ID}" />.jpg"
														title="<c:out value="${row.prod_Name}" />"
														class="colorbox"> <img
														src="image/data/img-<c:out value="${row.prod_ID}" />.jpg"
														title="<c:out value="${row.prod_Name}" />"
														alt="<c:out value="${row.prod_Name}" />" id="image"
														data-zoom-image="image/data/img-<c:out value="${row.prod_ID}" />.jpg"
														class="product-image-zoom" /></a>
												</div>
											</div>
											<div class="span6">
												<h2>
													<b><c:out value="${row.prod_Name}" /></b>
												</h2>
												<div class="description">
													<table>
														<tr>
															<th align="left"><span>Product Code:</span></th>
															<td><c:out value="${row.prod_ID}" /></td>
														</tr>
														<tr>
															<th align="left"><span>Size:</span></th>
															<td><c:out value="${row.prod_Size}" /> inches</td>
														</tr>
													</table>
												</div>

												<div class="price-cart">
													<div class="price">
														Price: RM
														<fmt:formatNumber type="number" minFractionDigits="2"
															maxFractionDigits="2" value="${row.prod_Price}" />
													</div>
													<br /> <br />
													<form action="addToCart">
														<div class="product-extra">
															<div class="quantity-adder pull-left">
																Qty: <input type="text" name="quantity"
																	size="2" value="1" /> <span class="add-up add-action"><span
																	class="icon-caret-up"></span></span> <span
																	class="add-down add-action"><span
																	class="icon-caret-down"></span></span>
															</div>
															<br /> <br /> <input type="hidden" name="prod_ID"
																value="<c:out value="${row.prod_ID}" />"> <a
																href="addToCart?prod_ID=<c:out value="${row.prod_ID}" />"><input
																type="submit" class="button" value="Add To Cart"></a>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
									<div class="tabs-group">
										<div id="tabs" class="htabs">
											<a href="#tab-description">Description</a>
										</div>
										<div id="tab-description" class="tab-content">
											<p>
												<c:out value="${row.prod_Desc}" />
											</p>
										</div>
									</div>
								</c:forEach>
							</div>
							<script type="text/javascript"
								src=" catalog/view/theme/pav_bikestore/javascript/elevatezoom/elevatezoom-min.js"></script>
							<script type="text/javascript">
								$("#image").elevateZoom({
									gallery : 'image-additional-carousel',
									cursor : 'pointer',
									galleryActiveClass : 'active'
								});
							</script>
							<script type="text/javascript">
							<!--
								$(document).ready(function() {
									$('.colorbox').colorbox({
										overlayClose : true,
										opacity : 0.5,
										rel : "colorbox"
									});
								});
							//-->
							</script>
							<script type="text/javascript">
							<!--
								$(
										'select[name="profile_id"], input[name="quantity"]')
										.change(
												function() {
													$
															.ajax({
																url : 'index.php?route=product/product/getRecurringDescription',
																type : 'post',
																data : $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
																dataType : 'json',
																beforeSend : function() {
																	$(
																			'#profile-description')
																			.jsp(
																					'');
																},
																success : function(
																		json) {
																	$(
																			'.success, .warning, .attention, information, .error')
																			.remove();

																	if (json['success']) {
																		$(
																				'#profile-description')
																				.jsp(
																						json['success']);
																	}
																}
															});
												});

								$('#button-cart')
										.bind(
												'click',
												function() {
													$
															.ajax({
																url : 'index.php?route=checkout/cart/add',
																type : 'post',
																data : $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
																dataType : 'json',
																success : function(
																		json) {
																	$(
																			'.success, .warning, .attention, information, .error')
																			.remove();

																	if (json['error']) {
																		if (json['error']['option']) {
																			for (i in json['error']['option']) {
																				$(
																						'#option-'
																								+ i)
																						.after(
																								'<span class="error">'
																										+ json['error']['option'][i]
																										+ '</span>');
																			}
																		}

																		if (json['error']['profile']) {
																			$(
																					'select[name="profile_id"]')
																					.after(
																							'<span class="error">'
																									+ json['error']['profile']
																									+ '</span>');
																		}
																	}

																	if (json['success']) {
																		$(
																				'#notification')
																				.jsp(
																						'<div class="success" style="display: none;">'
																								+ json['success']
																								+ '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

																		$(
																				'.success')
																				.fadeIn(
																						'slow');

																		$(
																				'#cart-total')
																				.jsp(
																						json['total']);

																		$(
																				'html, body')
																				.animate(
																						{
																							scrollTop : 0
																						},
																						'slow');
																	}
																}
															});
												});
							//-->
							</script>
							<script type="text/javascript"
								src="catalog/view/javascript/jquery/ajaxupload.js"></script>
							<script type="text/javascript">
							<!--
								$('#review .pagination a').live('click',
										function() {
											$('#review').fadeOut('slow');

											$('#review').load(this.href);

											$('#review').fadeIn('slow');

											return false;
										});

								$('#review')
										.load(
												'index.php?route=product/product/review&product_id=64');

								$('#button-review')
										.bind(
												'click',
												function() {
													$
															.ajax({
																url : 'index.php?route=product/product/write&product_id=64',
																type : 'post',
																dataType : 'json',
																data : 'name='
																		+ encodeURIComponent($(
																				'input[name=\'name\']')
																				.val())
																		+ '&text='
																		+ encodeURIComponent($(
																				'textarea[name=\'text\']')
																				.val())
																		+ '&rating='
																		+ encodeURIComponent($(
																				'input[name=\'rating\']:checked')
																				.val() ? $(
																				'input[name=\'rating\']:checked')
																				.val()
																				: '')
																		+ '&captcha='
																		+ encodeURIComponent($(
																				'input[name=\'captcha\']')
																				.val()),
																beforeSend : function() {
																	$(
																			'.success, .warning')
																			.remove();
																	$(
																			'#button-review')
																			.attr(
																					'disabled',
																					true);
																	$(
																			'#review-title')
																			.after(
																					'<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> Please Wait!</div>');
																},
																complete : function() {
																	$(
																			'#button-review')
																			.attr(
																					'disabled',
																					false);
																	$(
																			'.attention')
																			.remove();
																},
																success : function(
																		data) {
																	if (data['error']) {
																		$(
																				'#review-title')
																				.after(
																						'<div class="warning">'
																								+ data['error']
																								+ '</div>');
																	}

																	if (data['success']) {
																		$(
																				'#review-title')
																				.after(
																						'<div class="success">'
																								+ data['success']
																								+ '</div>');

																		$(
																				'input[name=\'name\']')
																				.val(
																						'');
																		$(
																				'textarea[name=\'text\']')
																				.val(
																						'');
																		$(
																				'input[name=\'rating\']:checked')
																				.attr(
																						'checked',
																						'');
																		$(
																				'input[name=\'captcha\']')
																				.val(
																						'');
																	}
																}
															});
												});
							//-->
							</script>
							<script type="text/javascript">
							<!--
								$('#tabs a').tabs();
							//-->
							</script>
							<script type="text/javascript"
								src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
							<script type="text/javascript">
							<!--
								$(document).ready(
										function() {
											if ($.browser.msie
													&& $.browser.version == 6) {
												$('.date, .datetime, .time')
														.bgIframe();
											}

											$('.date').datepicker({
												dateFormat : 'yy-mm-dd'
											});
											$('.datetime').datetimepicker({
												dateFormat : 'yy-mm-dd',
												timeFormat : 'h:m'
											});
											$('.time').timepicker({
												timeFormat : 'h:m'
											});
										});
							//-->
							</script>

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