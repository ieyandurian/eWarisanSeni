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
<title>Manage Products</title>
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



<script>
	function validateAccount() {

		var prod_Price = document.form.prod_Price.value;

		
		
		if (isNaN(prod_Price)) {
			alert("Price cannot be in letter");
			return false;
		}
		
	
		else {
			return true;
		}
	}
</script>



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

					<li id="dashboard"><a href="ViewStaff/manageproduct.jsp"
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
				<a href="ViewStaff/dashboard.jsp">Home</a> :: <a
					href="ViewStaff/manageproduct.jsp">Manage Product</a> :: <a
					href="ViewStaff/editproduct.jsp">Edit Product</a>
			</div>


			<sql:setDataSource var="snapshot"
				driver="oracle.jdbc.driver.OracleDriver"
				url="jdbc:oracle:thin:@localhost:1521:xe" user="eWarisanSeni"
				password="oracle" />
			<sql:query dataSource="${snapshot}" var="result">
						SELECT * from product where prod_ID=?
						<sql:param value="${param.prod_ID}" />
			</sql:query>
			<c:forEach items="${result.rows}" var="row">
				<div class="box">

					<div class="heading">
						<h1>
							<img src="image/product.png" alt="" /> Edit Product
						</h1>
						<div class="buttons">
							<a href="ViewStaff/manageproduct.jsp" class="button">Cancel</a>
						</div>
					</div>
					<div class="content">


						<form action="editproduct" name="form" onsubmit="return validateAccount()">


							<table class="form">


								<tr>
									<td><span class="required">*</span> ID:</td>
									<td><input type="text" name="prod_ID"
										value="<c:out value="${param.prod_ID}" />" size="80" readonly /></td>
								</tr>

								<tr>
									<td><span class="required">*</span> Name:</td>
									<td><input type="text" name="prod_Name"
										value="<c:out value="${row.prod_Name}" />" size="80" required /></td>
								</tr>

								<tr>
									<td>Description:</td>
									<td><textarea name="prod_Desc" required
											style="width: 300px; height: 150px;"><c:out
												value="${row.prod_Desc}" /> </textarea></td>
								</tr>

								<tr>
									<td><span class="required">*</span>Price :</td>
									<td><input type="text" name="prod_Price"
										value="<c:out value="${row.prod_Price}" />" size="80" required /></td>
								</tr>

								<tr>
									<td><span class="required">*</span>Size</td>
									<td><input type="text" name="prod_Size"
										value="<c:out value="${row.prod_Size}" />" size="80" required /></td>
								</tr>

								<tr>
									<td><span class="required">*</span>Type</td>
									<td><input type="text" name="prod_Type"
										value="<c:out value="${row.prod_Type}" />" size="80" required /></td>
								</tr>


								<tr>
									<td></td>
									<td><input type="submit" value="Continue" class="button"
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