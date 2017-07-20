
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
<script type="text/javascript">
	var upload = function() {
		var photo = document.getElementById("photo");
		return false;
	};
</script>

<script type="text/javascript">
	//-----------------------------------------
	// Confirm Actions (delete, uninstall)
	//-----------------------------------------
	$(document)
			.ready(
					function() {
						// Confirm Delete
						$('#form')
								.submit(
										function() {
											if ($(this).attr('action').indexOf(
													'delete', 1) != -1) {
												if (!confirm('Delete/Uninstall cannot be undone! Are you sure you want to do this?')) {
													return false;
												}
											}
										});
						// Confirm Uninstall
						$('a')
								.click(
										function() {
											if ($(this).attr('href') != null
													&& $(this)
															.attr('href')
															.indexOf(
																	'uninstall',
																	1) != -1) {
												if (!confirm('Delete/Uninstall cannot be undone! Are you sure you want to do this?')) {
													return false;
												}
											}
										});
					});
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
					href="ViewStaff/addproduct.jsp">Add Product</a>
			</div>
			<div class="box">
				<div class="heading">
					<h1>
						<img src="image/product.png" alt="" /> Add Product
					</h1>
					<div class="buttons">
						<a href="ViewStaff/manageproduct.jsp" class="button">Back</a>
					</div>
				</div>
				<div class="content">

					<form action="addproduct" method="post"
						enctype="multipart/form-data">

						<table class="form">
							<tr>
								<td><span class="required">*</span> Product Name:</td>
								<td><input type="text" name="prod_Name" required size="100"
									value="" /></td>
							</tr>

							<tr>
								<td>Description:</td>
								<td><textarea name="prod_Desc" required
										style="width: 300px; height: 150px;"></textarea></td>
							</tr>
							<tr>
								<td><span class="required">*</span>Price :</td>
								<td><textarea name="prod_Price" required cols="40" rows="5"></textarea></td>
							</tr>

							<tr>
								<td><span class="required">*</span>Size</td>
								<td><input type="text" name="prod_Size" required value=""
									size="80" /></td>
							</tr>

							<tr>
								<td><span class="required">*</span>Type</td>
								<td><input type="text" name="prod_Type" required value=""
									size="80" /></td>
							</tr>

							<tr>
								<td>Image</td>
								<td><input type="file" name="prod_Image" required
									id="photo"></td>
							</tr>



						</table>
						<input type="submit" value="Continue" class="button" />
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="view/javascript/ckeditor/ckeditor.js"></script>
		<script type="text/javascript">
		<!--
			CKEDITOR
					.replace(
							'description1',
							{
								filebrowserBrowseUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0',
								filebrowserImageBrowseUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0',
								filebrowserFlashBrowseUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0',
								filebrowserUploadUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0',
								filebrowserImageUploadUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0',
								filebrowserFlashUploadUrl : 'index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0'
							});
		//-->
		</script>




		<script type="text/javascript">
		<!--
			function image_upload(field, thumb) {
				$('#dialog').remove();

				$('#content')
						.prepend(
								'<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=51602be51240160c1f219179cfb769a0&field='
										+ encodeURIComponent(field)
										+ '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

				$('#dialog')
						.dialog(
								{
									title : 'Image Manager',
									close : function(event, ui) {
										if ($('#' + field).attr('value')) {
											$
													.ajax({
														url : 'index.php?route=common/filemanager/image&token=51602be51240160c1f219179cfb769a0&image='
																+ encodeURIComponent($(
																		'#'
																				+ field)
																		.attr(
																				'value')),
														dataType : 'text',
														success : function(text) {
															$('#' + thumb)
																	.replaceWith(
																			'<img src="' + text + '" alt="" id="' + thumb + '" />');
														}
													});
										}
									},
									bgiframe : false,
									width : 800,
									height : 400,
									resizable : false,
									modal : false
								});
			};
		//-->
		</script>


	</div>
	<div id="footer">
		Warisan Seni Traditional Musical Instrument Ordering System &copy;
		2015 All Rights Reserved.<br />Version 1.0.0
	</div>
</body>
</html>