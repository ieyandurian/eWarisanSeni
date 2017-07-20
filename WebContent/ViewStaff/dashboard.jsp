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
<title>Dashboard</title>
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
					<li id="dashboard"><a href="ViewStaff/dashboard.jsp"
						class="top">Dashboard</a></li>

					<li id="catalog"><a href="ViewStaff/manageproduct.jsp"
						class="top">Manage Product</a></li>

					<li id="catalog"><a href="ViewStaff/manageorder.jsp"
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
				<a href="ViewStaff/dashboard.jsp">Home</a>
			</div>
			<div class="box">
				<div class="heading">
					<h1>
						<img src="image/home.png" alt="" /> Dashboard
					</h1>
				</div>
				<div class="content">
					<div class="dashboard-heading">Overview</div>
					<div class="dashboard-content">
						<table style="width: 100%;">
							<tr>
								<td>Total Sales:</td>
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
						SELECT sum(order_totalPrice) as s from orderList
						</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<td align="right">RM <c:out value="${row.s}" /></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Total Sales This Year:</td>
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
						SELECT sum(order_totalPrice) as s from orderList
						</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<td align="right">RM <c:out value="${row.s}" /></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Total Orders:</td>
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
						SELECT count(order_id) as s from orderList
						</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<td align="right"><c:out value="${row.s}" /></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Total Customers:</td>
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
						SELECT count(cust_id) as s from customer
						</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<td align="right"><c:out value="${row.s}" /></td>
								</c:forEach>
							</tr>
							<tr>
								<td>Total Product:</td>
								<sql:setDataSource var="snapshot"
									driver="oracle.jdbc.driver.OracleDriver"
									url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
									password="oracle" />
								<sql:query dataSource="${snapshot}" var="result">
						SELECT count(prod_id) as s from product
						</sql:query>
								<c:forEach items="${result.rows}" var="row">
									<td align="right"><c:out value="${row.s}" /></td>
								</c:forEach>
							</tr>
						</table>
					</div>
					<!-- <div class="statistic">
						<div class="range">
							Select Range: <select id="range"
								onchange="getSalesChart(this.value)">
								<option value="day">Today</option>
								<option value="week">This Week</option>
								<option value="month">This Month</option>
								<option value="year">This Year</option>
							</select>
						</div>
						<div class="dashboard-heading">Statistics</div>
						<div class="dashboard-content">
							<div id="report"
								style="width: 390px; height: 170px; margin: auto;"></div>
						</div>
					</div> -->
					<div>&nbsp;</div>
					<div class="latest">
						<div class="dashboard-heading">Latest Order</div>
						<div class="dashboard-content">
							<table class="list">
								<thead>
									<tr>
										<th class="center">Order ID</th>
										<th class="center">Product ID</th>
										<th class="center">Ordered Quantity</th>
										<th class="center">Date</th>
										<th class="center">Payment Method</th>
										<th class="center">Total Price</th>
										<th class="center">Status</th>
										<th class="center">Customer ID</th>
										<th width="80" class="center">Action</th>
									</tr>
								</thead>
								<tbody>
									<sql:setDataSource var="snapshot"
										driver="oracle.jdbc.driver.OracleDriver"
										url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
										password="oracle" />
									<sql:query dataSource="${snapshot}" var="result">
						SELECT distinct a.*, c.* from orderlist a join orderitem b on a.order_id = b.order_id left join customer c on c.cust_id=b.cust_id order by a.order_id desc
						</sql:query>
									<c:forEach items="${result.rows}" var="row" begin="0" end="0">
										<tr>
											<TD class="center" height="30"><c:out
													value="${row.order_ID}" /></TD>
											<TD class="center"><table class="list">
													<tbody>
														<sql:setDataSource var="snapshot"
															driver="oracle.jdbc.driver.OracleDriver"
															url="jdbc:oracle:thin:@localhost:1521:xe"
															user="eWarisanSeni" password="oracle" />
														<sql:query dataSource="${snapshot}" var="result">
						SELECT * from orderitem where order_id = ?
						<sql:param value="${row.order_ID}" />
														</sql:query>
														<c:forEach items="${result.rows}" var="row1">
															<tr>
																<TD class="center"><c:out
																		value="${row1.orderitem_id}" /></TD>
															</tr>
														</c:forEach>
													</tbody>
												</table></TD>
											<TD class="center"><table class="list">
													<tbody>
														<sql:setDataSource var="snapshot"
															driver="oracle.jdbc.driver.OracleDriver"
															url="jdbc:oracle:thin:@localhost:1521:xe"
															user="eWarisanSeni" password="oracle" />
														<sql:query dataSource="${snapshot}" var="result">
						SELECT * from orderitem where order_id = ?
						<sql:param value="${row.order_ID}" />
														</sql:query>
														<c:forEach items="${result.rows}" var="row2">
															<tr>
																<TD class="center"><c:out
																		value="${row2.orderitem_quantity}" /></TD>
															</tr>
														</c:forEach>
													</tbody>
												</table></TD>
											<TD class="center"><c:out value="${row.order_Date}" /></TD>
											<TD class="center"><c:out
													value="${row.order_PaymentMethod}" /></TD>
											<TD class="center">RM <c:out
													value="${row.order_TotalPrice}" /></TD>
											<TD class="center"><c:out value="${row.order_Status}" /></TD>
											<td align="center"><c:out value="${row.cust_id}" /></td>
											<td class="center"><a
												href="ViewStaff/updateorder.jsp?order_ID=<c:out value="${row.order_ID}" />"><img
													src="image/review.png" title="Edit"></a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>




	</div>
	<div id="footer">
		&copy; 2015 Warisan Seni Haji Kasim Enterprise 2015. Created &amp;
		Designed by: Team ArISE. All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>