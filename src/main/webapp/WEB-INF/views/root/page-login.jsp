<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ch">

<head>

<!-- Basic -->
<meta charset="UTF-8" />

<title>登录 | Fire - Admin Template</title>

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<!-- Import google fonts -->
<link href='http://fonts.useso.com/css?family=Titillium+Web'
	rel='stylesheet' type='text/css'>

<!-- Favicon and touch icons -->
<link rel="shortcut icon" href="assets/ico/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon" href="assets/ico/apple-touch-icon.png" />
<link rel="apple-touch-icon" sizes="57x57"
	href="assets/ico/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="72x72"
	href="assets/ico/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/ico/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114"
	href="assets/ico/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120"
	href="assets/ico/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144"
	href="assets/ico/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152"
	href="assets/ico/apple-touch-icon-152x152.png" />

<!-- start: CSS file-->

<!-- Vendor CSS-->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
<link href="assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />

<!-- Plugins CSS-->
<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />

<!-- Theme CSS -->
<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />

<!-- Page CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/add-ons.min.css" rel="stylesheet" />

<style>
footer {
	display: none;
}
</style>
<script src="assets/plugins/modernizr/js/modernizr.js"></script>

</head>

<body>
	<!-- Start: Content -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Main Page -->
			<div id="content" class="col-sm-12 full">
				<div class="row">
					<div class="login-box">
						<div class="panel">
							<div class="panel-body">
								<div class="header bk-margin-bottom-20 text-center">
									<h2>WELLCOME</h2>
									<h4>登录</h4>
								</div>
								<form class="form-horizontal login" action="${pageContext.request.contextPath}/login.do" method="get">
									<div class="bk-padding-left-20 bk-padding-right-20">
										<div class="form-group">
											<label>用户名</label>
											<div class="input-group input-group-icon">
												<input type="text" name="username" class="form-control bk-radius"
													id="username" placeholder="Username or E-mail"  /> <span
													class="input-group-addon"> <span class="icon">
														<i class="fa fa-user"></i>
												</span>
												</span>
											</div>
										</div>
										<div class="form-group">
											<label>密码</label>
											<div class="input-group input-group-icon">
												<input type="password" name="password" class="form-control bk-radius"
													id="password" placeholder="Password" /> <span
													class="input-group-addon"> <span class="icon">
														<i class="fa fa-key"></i>
												</span>
												</span>
											</div>
										</div>
										<div class="row bk-margin-top-20 bk-margin-bottom-10">
											<div class="col-sm-8">
												<div class="checkbox-custom checkbox-default">
													<input id="RememberMe" name="rememberme" type="checkbox" />
													<label for="RememberMe">记住登录</label>
												</div>
											</div>
											<div class="col-sm-4 text-right">
												<button type="submit"  class="btn btn-primary hidden-xs">登录</button>
												<button type="submit" 
													class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-20">Log
													In</button>

											</div>
										</div>
										<p class="text-center">
											还没有账号?  <a href="${pageContext.request.contextPath}/page-register.html">去注册吧!</a>

										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Main Page -->
		</div>
	</div>
	<!--/container-->


	<!-- start: JavaScript-->

	<!-- Vendor JS-->
	<script src="assets/vendor/js/jquery.min.js"></script>
	<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
	<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/skycons/js/skycons.js"></script>

	<!-- Plugins JS-->
	<script src="assets/plugins/bootkit/js/bootkit.js"></script>

	<!-- Theme JS -->
	<script src="assets/js/jquery.mmenu.min.js"></script>
	<script src="assets/js/core.min.js"></script>

	<!-- Pages JS -->
	<script src="assets/js/pages/page-login.js"></script>
	

	<!-- end: JavaScript-->

</body>

</html>