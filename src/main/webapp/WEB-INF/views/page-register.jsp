<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ch">

<head>

<!-- Basic -->
<meta charset="UTF-8" />

<title>注册 | Fire - Admin Template</title>

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

<!-- end: CSS file-->


<!-- Head Libs -->
<script src="assets/plugins/modernizr/js/modernizr.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
	<!-- Start: Content -->
	<div class="container-fluid content">
		<div class="row">
			<!-- Main Page -->
			<div id="content" class="col-sm-12 full">
				<div class="row">
					<div class="register-box">
						<div class="panel">
							<div class="panel-body">
								<div class="header bk-margin-bottom-20 text-center">
									<br> WELLCOME
									<h4>注册新用户</h4>
									<br>
								</div>
								<form class="form-horizontal register" action="${pageContext.request.contextPath}/RegisterServlet"
									method="get">
									<div class="bk-padding-left-20 bk-padding-right-20">
										<div class="form-group">
											<label>用户名</label><label style="color: red;">${requestScope.registerinfo}</label>
											
											 <input name="username" type="text"
												class="form-control" placeholder="ID" id="fullname" />
											<label>昵称</label><label style="color: red;">${requestScope.registerinfo}</label>
											
											 <input name="nickname" type="text"
												class="form-control" placeholder="NICKNAME" id="fullname" />
											<label>地址</label><label style="color: red;">${requestScope.registerinfo}</label>
											
											 <input name="address" type="text"
												class="form-control" placeholder="ADDRESS" id="fullname" />
											<label>手机</label><label style="color: red;">${requestScope.registerinfo}</label>
											
											 <input name="phone" type="text"
												class="form-control" placeholder="PHOEN NUMBER" id="fullname" />
											<label>email</label><label style="color: red;">${requestScope.registerinfo}</label>
											
											 <input name="email" type="text"
												class="form-control" placeholder="EMAIL" id="fullname" />
										</div>
										<div class="form-group">
											<div class="row">
												<div class="col-sm-6">
													<label>密码</label> <input name="password" type="password"
														class="form-control bk-margin-bottom-10"
														placeholder="Password" id="password" />
												</div>
												<div class="col-sm-6">
													<label>密码确认</label> <input name="passwordconfim"
														type="password" class="form-control bk-margin-bottom-10"
														placeholder="Password Confirm" id="passwordConfirm" />
												</div>
											</div>
										</div>
										<div class="row bk-margin-top-20 bk-margin-bottom-10">
											<div class="col-sm-8">
												<div class="checkbox-custom checkbox-default">
													<input id="manager" name="manager" type="checkbox" /> <label
														for="AgreeTerms">是否作为管理员</label>
												</div>
											</div>
											<div class="col-sm-4 text-right">
												<button type="submit" class="btn btn-primary hidden-xs">点击注册</button>
												<button type="submit"
													class="btn btn-primary btn-block btn-lg visible-xs bk-margin-top-20">Register</button>
											</div>
										</div>
										<div class="text-with-hr">
											<span>or use your another account</span>
										</div>
										<p class="text-center">
											已经拥有用户名? <a href="page-login.jsp">登录吧!</a>
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
	<script src="assets/js/pages/page-register.js"></script>

	<!-- end: JavaScript-->

</body>

</html>