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
<script type="text/javascript" src="js/search.js"></script>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" />
<script>
	function confirmGO(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>


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
				<a href="ViewStaff/dashboard.jsp">Home</a> :: <a href="ViewStaff/manageproduct.jsp">Manage
					Customer</a>
			</div>
			<div class="box">
				<div class="heading">
					<h1>
						<img src="image/product.png" alt="" /> Customers
					</h1>


				</div>




				<div class="content">
					<br> <input type="text" id="search"
						placeholder="Type to search"><br> <br> <br>

					<table class="list" id="table">
						<thead>
							<tr>


								<th class="center">Customer ID</th>
								<th class="center">Email</th>
								<th class="center">First Name</th>
								<th class="center">Last Name</th>
								<th width="80" class="center">Action</th>
							</tr>
						</thead>
						<tbody>
							<sql:setDataSource var="snapshot"
								driver="oracle.jdbc.driver.OracleDriver"
								url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
								password="oracle" />
							<sql:query dataSource="${snapshot}" var="result">
						SELECT * from customer
						</sql:query>
							<c:forEach items="${result.rows}" var="row">
								<tr>
									<TD class="center" height="30"><c:out
											value="${row.cust_id}" /></TD>
									<TD class="center"><c:out value="${row.cust_email}" /></TD>
									<TD class="center"><c:out value="${row.cust_firstname}" /></TD>
									<TD class="center"><c:out value="${row.cust_lastname}" /></TD>
									<td class="center"><a
										href="ViewStaff/managecustomeredit.jsp?cust_id=<c:out value="${row.cust_id}" />"><img
											src="image/review.png" title="Edit"></a></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>





				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(document).ready(function() {
			$('#search').keyup(function() {
				searchTable($(this).val());
			});
		});

		function searchTable(inputVal) {
			var table = $('#table');
			table.find('tr').each(function(index, row) {
				var allCells = $(row).find('td');
				if (allCells.length > 0) {
					var found = false;
					allCells.each(function(index, td) {
						var regExp = new RegExp(inputVal, 'i');
						if (regExp.test($(td).text())) {
							found = true;
							return false;
						}
					});
					if (found == true)
						$(row).show();
					else
						$(row).hide();
				}
			});
		}
	</script>
	<div id="footer">
		&copy; 2015 Warisan Seni Haji Kasim Enterprise 2015. Created &amp; Designed
		by: Team ArISE. All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>