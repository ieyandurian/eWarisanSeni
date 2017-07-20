<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.eWarisanSeni.app.bean.ProductBean"
	import="com.eWarisanSeni.app.util.ConnectionManager"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>Manage Orders</title>
<base href="http://localhost:8082/eWarisanSeni/" />
<meta name="description" content="eWarisanSeni Ordering System" />
<link href="css/images/logo-icon.png" rel="icon" />
<link rel="stylesheet" type="text/css" href="css/stylesheet.css" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jsjquery-ui-1.8.16.custom.min.js"></script>
<link type="text/css" href="css/jquery-ui-1.8.16.custom.css"
	rel="stylesheet" />
<script type="text/javascript" src="js/tabs.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />

</head>
<body>
	<div id="container">
		<div id="header">
			<div class="div1">
				<div class="div2">
					<a href="ViewStaff/dashboard.jsp"><img width="33%"
						src="css/images/logo.png" title="Administration" /></a>
				</div>
				<div class="div3">
					<img src="image/lock.png" alt=""
						style="position: relative; top: 3px;" />&nbsp;You are logged in
					as <span>admin</span>
				</div>
			</div>


			<!-- MENU NAVIGATION -->
			<div id="menu">
				<ul class="left" style="display: none;">
					<li id="catalog"><a href="ViewStaff/dashboard.jsp" class="top">Dashboard</a></li>

					<li id="catalog"><a href="ViewStaff/manageproduct.jsp"
						class="top">Manage Product</a></li>

					<li id="dashboard"><a href="ViewStaff/manageorder.jsp"
						class="top">Manage Order</a></li>

					<li id="catalog"><a href="ViewStaff/managecustomer.jsp"
						class="top">Manage Customer</a></li>

				</ul>

				<!-- END MENU -->


				<ul class="right" style="display: none;">
					<li><a class="top" href="ViewStaff/adminlogin.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div class="breadcrumb">
				<a href="dashboard.jsp">Home</a> :: <a
					href="ViewStaff/manageorder.jsp">Manage Order</a> :: <a
					href="ViewStaff/updateorder.jsp">Edit Order</a>
			</div>


			<sql:setDataSource var="snapshot"
				driver="oracle.jdbc.driver.OracleDriver"
				url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
				password="oracle" />
			<sql:query dataSource="${snapshot}" var="result">
						SELECT * from orderlist where order_id=?
						<sql:param value="${param.order_ID}" />
			</sql:query>
			<c:forEach items="${result.rows}" var="row">
				<div class="box">

					<div class="heading">
						<h1>
							<img src="image/product.png" alt="" /> Edit Order
						</h1>
						<div class="buttons">
							<a href="ViewStaff/manageorder.jsp"
								class="button">Cancel</a>
						</div>
					</div>
					<div class="content">
						<form action="updateorder" id="form">
							<table class="form">
								<tr>
									<td><span class="required">*</span>Order ID:</td>
									<td><input type="text" name="order_ID"
										value="<c:out value="${param.order_ID}" />" size="80" readonly /></td>
								</tr>
								<!-- <tr>
									<td><span class="required">*</span>Customer ID:</td>
									<td><input type="text" name="cust_ID"
										value="<c:out value="${row.cust_ID}" />" size="80" readonly /></td>
								</tr> -->
								<tr>
									<td><span class="required">*</span> Date:</td>
									<td><input type="text" name="order_Date"
										value="<c:out value="${row.order_Date}" />" size="80" readonly /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Total Price:</td>
									<td><input type="text" name="order_TotalPrice"
										value="<c:out value="${row.order_TotalPrice}" />" size="80"
										readonly /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Payment Method:</td>
									<td><input type="text" name="order_PaymentMethod"
										value="<c:out value="${row.order_PaymentMethod}" />" size="80"
										readonly /></td>
								</tr>
								<tr>
									<td><span class="required">*</span>Status</td>
									<td><select name="order_Status">
									 <option value="" disabled="disabled" selected="selected"><c:out value="${row.order_Status}" /></option>
											<option value="Processing">Processing</option>
											<option value="Completed">Completed</option>
											<option value="Canceled">Canceled</option>
									</select></td>
								</tr>
								<tr>
									<td></td>
									<td><input type="submit" value="Save" class="button"
										width="20" /></td>

								</tr>
							</table>

						</form>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	<div id="footer">
		&copy; 2015 Warisan Seni Haji Kasim Enterprise 2015. Created &amp;
		Designed by: Team ArISE. All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>