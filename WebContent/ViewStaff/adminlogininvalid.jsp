<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="UTF-8" />
<title>Admin</title>

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
</head>
<body>
	<div id="container">
		<div id="header">
			<div class="div1">
				<div class="div2">
					<a href="home.jsp"><img width="33%" src="css/images/logo.png" title="Administration" /></a>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="box"
				style="width: 400px; min-height: 300px; margin-top: 40px; margin-left: auto; margin-right: auto;">
				<div class="heading">
					<h1>
						<img src="image/lockscreen.png" alt="" /> Admin Login
					</h1>
				</div>
				<div class="content" style="min-height: 150px; overflow: hidden;">
					<form action="stafflogin">
						<h3>Incorrect Staff ID or Password !</h3>
						<table style="width: 100%;">
							<tr>
								<td style="text-align: center;" rowspan="4"><img
									src="image/login.png" alt="Please enter your login details." /></td>
							</tr>
							<tr>
								<td>Staff ID:<br /> <input type="text" name="id" value=""
									style="margin-top: 4px;" /> <br /> <br /> Password:<br /> <input
									type="password" name="pw" value="" style="margin-top: 4px;" />
									<br />
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right;"><input type="submit"
									value="Login " class="button"></td>
							</tr>
						</table>

					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#form').submit();
	}
});
//--></script>
	</div>
	<div id="footer">
		&copy; 2015 Warisan Seni Haji Kasim Enterprise 2015. Created &amp; Designed
		by: Team ArISE. All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>