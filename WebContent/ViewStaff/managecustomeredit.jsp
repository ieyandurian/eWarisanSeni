<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.eWarisanSeni.app.bean.CustomerBean"
	import="com.eWarisanSeni.app.util.ConnectionManager"
	import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>Manage Customers</title>
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
					<a href="ViewStaff/dashboard.jsp"><img width="33%" src="css/images/logo.png" title="Administration" /></a>
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

					<li id="catalog"><a href="ViewStaff/manageproduct.jsp" class="top">Manage
							Product</a></li>

					<li id="catalog"><a href="ViewStaff/manageorder.jsp" class="top">Manage
							Order</a></li>

					<li id="dashboard"><a href="ViewStaff/managecustomer.jsp" class="top">Manage
							Customer</a></li>

				</ul>

				<!-- END MENU -->


				<ul class="right" style="display: none;">
					<li><a class="top" href="ViewStaff/adminlogin.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
		<div id="content">
			<div class="breadcrumb">
				<a href="ViewStaff/dashboard.jsp">Home</a> :: <a href="ViewStaff/managecustomer.jsp">Manage
					Customer</a> :: <a href="ViewStaff/managecustomeredit.jsp">Edit Customer</a>
			</div>
			<div class="box">
				<div class="heading">
					<h1>
						<img src="image/product.png" alt="" /> Edit Customer
					</h1>
					<div class="buttons">
						<a
							href="ViewStaff/managecustomer.jsp?update=yes&<c:out value="${row.cust_id}" />"
							onclick="return update()">Save</a> <a href="ViewStaff/managecustomer.jsp"
							class="button">Cancel</a>
					</div>
				</div>
				<div class="content">

					<form action="updateCustomerAccount">
						<table class="form">
							<sql:setDataSource var="snapshot"
								driver="oracle.jdbc.driver.OracleDriver"
								url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
								password="oracle" />
							<sql:query dataSource="${snapshot}" var="result">
						 SELECT * from customer where cust_id =?
						<sql:param value="${param.cust_id}" />
							</sql:query>
							<c:forEach items="${result.rows}" var="row">
								<tr>
									<td><h3>Customer Details :</h3></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Customer ID:</td>
									<td><input type="text" name="cust_id"
										value="<c:out value="${param.cust_id}" />" size="80" readonly /></td>
								</tr>

								<tr>
									<td><span class="required">*</span> Username:</td>
									<td><input type="text" name="cust_username"
										value="<c:out value="${row.cust_username}" />" size="80" required/></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Password:</td>
									<td><input type="text" name="cust_password"
										value="<c:out value="${row.cust_password}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Email:</td>
									<td><input type="text" name="cust_email"
										value="<c:out value="${row.cust_email}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> First Name:</td>
									<td><input type="text" name="cust_firstname"
										value="<c:out value="${row.cust_firstname}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Last Name:</td>
									<td><input type="text" name="cust_lastname"
										value="<c:out value="${row.cust_lastname}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> IC Number:</td>
									<td><input type="text" name="cust_icnum"
										value="<c:out value="${row.cust_icnum}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Phone Number:</td>
									<td><input type="text" name="cust_phonenumber"
										value="<c:out value="${row.cust_phonenumber}" />" size="80" required /></td>
								</tr>
							</c:forEach>
							<sql:setDataSource var="snapshot"
								driver="oracle.jdbc.driver.OracleDriver"
								url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
								password="oracle" />
							<sql:query dataSource="${snapshot}" var="result">
						 SELECT * from address where cust_id =?
						<sql:param value="${param.cust_id}" />
							</sql:query>
							<c:forEach items="${result.rows}" var="row">
								<tr>
									<td><h3>Address Details :</h3></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Address :</td>
									<td><input type="text" name="add_address"
										value="<c:out value="${row.add_address}" />" size="80" required/></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Postcode :</td>
									<td><input type="text" name="add_postcode"
										value="<c:out value="${row.add_postcode}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> City :</td>
									<td><input type="text" name="add_city"
										value="<c:out value="${row.add_city}" />" size="80" required /></td>
								</tr>

								<tr>
									<td><span class="required">*</span> State :</td>
									<td><input type="text" name="add_state"
										value="<c:out value="${row.add_state}" />" size="80" required /></td>
								</tr>
								<tr>
									<td><span class="required">*</span> Country :</td>
									<td><input type="text" name="add_country"
										value="<c:out value="${row.add_country}" />" size="80" required /></td>
								</tr>
								<tr>
									<td colspan=2><input type="submit" value="Continue"
										class="button" /></td>
								</tr>
							</c:forEach>
						</table>
					</form>
				</div>
			</div>
		</div>


	</div>
	<div id="footer">
		&copy; 2015 Warisan Seni Haji Kasim Enterprise 2015. Created &amp; Designed
		by: Team ArISE. All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>