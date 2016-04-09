<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ch">

<head>

<!-- Basic -->
<meta charset="UTF-8" />

<title>总体预览 | Fire - Admin Template</title>

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
<link href="assets/vendor/css/pace.preloader.css" rel="stylesheet" />

<!-- Plugins CSS-->
<link href="assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css"
	rel="stylesheet" />
<link href="assets/plugins/scrollbar/css/mCustomScrollbar.css"
	rel="stylesheet" />
<link href="assets/plugins/bootkit/css/bootkit.css" rel="stylesheet" />
<link href="assets/plugins/magnific-popup/css/magnific-popup.css"
	rel="stylesheet" />
<link href="assets/plugins/fullcalendar/css/fullcalendar.css"
	rel="stylesheet" />
<link href="assets/plugins/jqvmap/jqvmap.css" rel="stylesheet" />

<!-- Theme CSS -->
<link href="assets/css/jquery.mmenu.css" rel="stylesheet" />

<!-- Page CSS -->
<link href="assets/css/style.css" rel="stylesheet" />
<link href="assets/css/add-ons.min.css" rel="stylesheet" />

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

	<c:import url="/navigation.jsp"></c:import>

	<!-- Main Page -->
	<div class="main sidebar-minified">
		<!-- Page Header -->
		<div class="page-header">
			<div class="pull-left">
				<ol class="breadcrumb visible-sm visible-md visible-lg">
					<li><a href="index.html"><i class="icon fa fa-home"></i>Home</a></li>
					<li><a href="#"><i class="fa fa-table"></i>Tables</a></li>
					<li class="active"><i class="fa fa-thumbs-o-up"></i>Advanced</li>
				</ol>
			</div>

		</div>
		<!-- End Page Header -->
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="panel panel-default bk-bg-white">
					<div class="panel-heading bk-bg-white">
						<h6>
							<i class="fa fa-table red"></i><span class="break"></span>所有用户
						</h6>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>名称</th>
									<th>数量</th>
									<th>售出数</th>
									<th>生产日期</th>
									<th>保质日期</th>
									<th>售价</th>
									<th>出货量</th>
									<th>更改</th>
								</tr>
							</thead>
							<c:forEach items="${requestScope.goods}" var="good">
								<tr class="gradeX">
									<td>${good.name}</td>
									<td>${good.count}</td>
									<td>${good.salednumber}</td>
									<td>${good.productDate}</td>
									<td>${good.saveDate}</td>
									<td>${good.price}</td>
									<form action="${pageContext.request.contextPath}/DoOutServlet" method="get">
										<input type="hidden" name="id" value="${good.id}">
										<td> <input type="number" value="0" name="count"> </td>
										 <td><input type="submit" value="确定"></td>
									</form>
								</tr>
							</c:forEach>

						</table>
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- End Page Header -->









	<!-- Footer -->
	<div id="footer">
		<ul>
			<li>
				<div class="title">Memory</div>
				<div class="bar">
					<div class="progress light progress-sm  progress-striped active">
						<div class="progress-bar progress-squared progress-bar-success"
							role="progressbar" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100" style="width: 60%;">60%</div>
					</div>
				</div>
				<div class="desc">4GB of 8GB</div>
			</li>
			<li>
				<div class="title">HDD</div>
				<div class="bar">
					<div class="progress light progress-sm  progress-striped active">
						<div class="progress-bar progress-squared progress-bar-primary"
							role="progressbar" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100" style="width: 40%;">40%</div>
					</div>
				</div>
				<div class="desc">250GB of 1TB</div>
			</li>
			<li>
				<div class="title">SSD</div>
				<div class="bar">
					<div class="progress light progress-sm  progress-striped active">
						<div class="progress-bar progress-squared progress-bar-warning"
							role="progressbar" aria-valuenow="70" aria-valuemin="0"
							aria-valuemax="100" style="width: 70%;">70%</div>
					</div>
				</div>
				<div class="desc">700GB of 1TB</div>
			</li>
			<li>
				<div class="copyright">
					<p class="text-muted text-right">
						Fire <i class="fa fa-coffee"></i> Collect from <a
							href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿"
							target="_blank">ç½é¡µæ¨¡æ¿</a> - More Templates <a
							href="http://www.cssmoban.com/" target="_blank"
							title="æ¨¡æ¿ä¹å®¶">æ¨¡æ¿ä¹å®¶</a>
					</p>
				</div>
			</li>
		</ul>
	</div>
	<!-- End Footer -->

	</div>
	</div>
	<!--/container-->


	<div class="clearfix"></div>


	<!-- start: JavaScript-->

	<!-- Vendor JS-->
	<script src="assets/vendor/js/jquery.min.js"></script>
	<script src="assets/vendor/js/jquery-2.1.1.min.js"></script>
	<script src="assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/skycons/js/skycons.js"></script>
	<script src="assets/vendor/js/pace.min.js"></script>

	<!-- Plugins JS-->
	<script src="assets/plugins/moment/js/moment.min.js"></script>
	<script src="assets/plugins/select2/select2.js"></script>
	<script
		src="assets/plugins/jquery-datatables/media/js/jquery.dataTables.js"></script>
	<script
		src="assets/plugins/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
	<script src="assets/plugins/jquery-datatables-bs3/js/datatables.js"></script>
	<script src="assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>

	<!-- Theme JS -->
	<script src="assets/js/jquery.mmenu.min.js"></script>
	<script src="assets/js/core.min.js"></script>

	<!-- Pages JS -->
	<script src="assets/js/pages/table-advanced.js"></script>

	<!-- end: JavaScript-->
</body>

</html>