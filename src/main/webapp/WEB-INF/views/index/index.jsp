<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ch">

<head>

<!-- Basic -->
<meta charset="UTF-8" />

<title>实验室管理</title>

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<c:import url="/WEB-INF/views/base/css.jsp"/>
</head>

<body>

	<!-- Start: Header -->


	<!-- Start: Content -->
	<div class="container-fluid content">
		<div class="row">
			<c:if test="${sessionScope.user.role=='manager'}">
				<c:import url="/WEB-INF/views/manager/navigation.jsp"/>
			</c:if>
			<c:if test="${sessionScope.user.role=='teacher'}">
				<c:import url="/WEB-INF/views/teacher/navigation.jsp"/>
			</c:if>
			<c:if test="${sessionScope.user.role!='teacher'&&sessionScope.user.role!='manager'}">
				<c:import url="/WEB-INF/views/student/navigation.jsp"/>
			</c:if>
			<!-- Main Page -->
			<div class="main ">
				<!-- Page Header -->
				<div class="page-header">
					<div class="pull-left">
						<ol class="breadcrumb visible-sm visible-md visible-lg">
							<li><a href="index.jsp"><i class="icon fa fa-home"></i>Home</a></li>
							<li class="active"><i class="fa fa-laptop"></i>总体预览</li>
						</ol>
					</div>
					<div class="pull-right">
						<h2>总体预览</h2>
					</div>
				</div>
				<!-- End Page Header -->
				<div class="row">
					<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="panel bk-widget bk-border-off">
							<div
								class="panel-body text-left bk-bg-white bk-padding-top-10 bk-padding-bottom-10">
								<div class="row">
									<div class="col-xs-4 bk-vcenter text-center">
										<div class="small-chart-wrapper">
											<div class="small-chart" id="sparklineBarweeklystats"></div>
											<script type="text/javascript">
												var sparklineBarweeklystatsData = [
														5, 6, 7, 2, 0, 4, 2, 4,
														2, 0, 4, 2, 4, 2, 0, 4 ];
											</script>
										</div>
										<strong>Weekly stats</strong>
									</div>
									<div class="col-xs-8 text-left bk-vcenter text-center">
										<small>管理员: ${mgr}%</small>
										<div
											class="progress light progress-xs  progress-striped active bk-margin-bottom-10">
											<div class="progress-bar progress-bar-primary"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: ${mgr}%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
										<small>教师: ${tea}%</small>
										<div
											class="progress light progress-xs  progress-striped active bk-margin-bottom-10">
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="88" aria-valuemin="0"
												aria-valuemax="100" style="width: ${tea}%;">
												<span class="sr-only">88% Complete</span>
											</div>
										</div>
										<small>学生: ${stu}%</small>
										<div
											class="progress light progress-xs  progress-striped active bk-margin-bottom-10">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: ${stu}%;">
												<span class="sr-only">60% Complete</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
						<div class="panel bk-widget bk-border-off">
							<div class="panel-body bk-bg-very-light-gray">
								<h4 class="bk-margin-off-bottom bk-docs-font-weight-300">实验室总数</h4>
								<div class="clearfix  bk-padding-top-10">
									<div class="pull-right bk-margin-left-15">
										<i class="fa fa-dollar fa-3x"></i>
									</div>
									<h1 class="bk-margin-off-top pull-right">${labscount}</h1>
								</div>
								<a href="/mgr/labs/list/all"><h6 class="text-right bk-padding-top-20 bk-margin-off">详情</h6></a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
						<div class="panel bk-widget bk-border-off">
							<div class="panel-body bk-bg-very-light-gray">
								<h4 class="bk-margin-off-bottom bk-docs-font-weight-300">设备数</h4>
								<div class="clearfix bk-padding-top-20">
									<div class="text-center">
										<i class="fa fa-random fa-3x bk-fg-warning"></i>
									</div>
								</div>
								<h4 class="text-right bk-padding-top-15 bk-margin-off">${equscount}</h4>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">

						<div class="panel">
							<div
								class="panel-heading panel-heading-transparent bk-border-off">
								<h6>
									<strong>实验室分布图</strong>
								</h6>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
									<h4 class="bk-fg-warning">Best Seller</h4>
									<div id="piechart" style="height: 280px"></div>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
									<h4 class="bk-fg-warning">Marketplace Area</h4>
									<canvas id="radar" height="280" width="220"></canvas>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">


						<div class="panel panel-default">
							<div class="panel-heading bk-bg-white">
								<h6>
									<span class="label label-danger bk-margin-5">165</span>Friends
								</h6>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<a class="bk-bg-white bk-padding-off-top bk-padding-off-bottom">
									<div class="row">
										<div class="col-xs-3 bk-vcenter text-center bk-padding-10">
											<div class="bk-avatar">
												<img src="${pageContext.request.contextPath}/assets/img/avatar1.jpg" alt=""
													 class="img-circle bk-img-40 bk-border-primary bk-border-2x bk-border-darken">
											</div>
										</div>
										<div class="col-xs-9 bk-vcenter">
											<h5 class="bk-fg-primary bk-fg-darken bk-margin-off-bottom">John
												Doe</h5>
											<p>Nullam vitae arcu in leo molestie hendrerit at quis
												sem.</p>
										</div>
									</div>
								</a>
								<hr class="bk-margin-off">
								<a class="bk-bg-white bk-padding-off-top bk-padding-off-bottom">
									<div class="row">
										<div class="col-xs-3 bk-vcenter text-center bk-padding-10">
											<div class="bk-avatar">
												<img src="${pageContext.request.contextPath}/assets/img/avatar2.jpg" alt=""
													 class="img-circle bk-img-40 bk-border-warning bk-border-2x bk-border-darken">
											</div>
										</div>
										<div class="col-xs-9 bk-vcenter">
											<h5 class="bk-fg-warning bk-fg-darken bk-margin-off-bottom">John
												Doe</h5>
											<p>Nunc vitae porttitor purus.</p>
										</div>
									</div>
								</a>
								<hr class="bk-margin-off">
								<a class="bk-bg-white bk-padding-off-top bk-padding-off-bottom">
									<div class="row">
										<div class="col-xs-3 bk-vcenter text-center bk-padding-10">
											<div class="bk-avatar">
												<img src="${pageContext.request.contextPath}/assets/img/avatar2.jpg" alt=""
													 class="img-circle bk-img-40 bk-border-danger bk-border-2x bk-border-darken">
											</div>
										</div>
										<div class="col-xs-9 bk-vcenter">
											<h5 class="bk-fg-danger bk-fg-darken bk-margin-off-bottom">John
												Doe</h5>
											<p>Morbi interdum posuere ultricies. Aliquam sit amet
												neque nisi.</p>
										</div>
									</div>
								</a>
								<hr class="bk-margin-off">
								<div class="panel-footer bk-bg-white">
									<div class="bk-padding-top-5 bk-padding-bottom-5 ">
										<div class="row">
											<div class="col-xs-6">
												<a href="#" class="bk-fg-textcolor"><small><i
														class="fa fa-angle-left"></i> PREVIOUS</small></a>
											</div>
											<div class="col-xs-6 text-right">
												<a href="#" class="bk-fg-textcolor"><small>NEXT
														<i class="fa fa-angle-right"></i>
												</small></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

						<div class="panel panel-transparent">
							<div class="panel-heading">
								<h6>
									<strong>Company Schedule Activity</strong>
								</h6>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<div class="timelineProfile timeline-profile">
									<div class="timeline-body">
										<div class="timeline-title">
											<h5 class="text-uppercase">May 2014</h5>
										</div>
										<ol class="timeline-items">
											<li>
												<div class="timeline-box">
													<p class="text-muted">5 months ago.</p>
													<p>
														It's awesome when we find a good solution for our
														projects, Fire Admin is <span class="text-primary">#awesome</span>
													</p>
												</div>
											</li>
											<li>
												<div class="timeline-box">
													<p class="text-muted">5 months ago.</p>
													<p>What is your greatest projects for your
														Administrator?</p>
												</div>
											</li>
											<li>
												<div class="timeline-box">
													<p class="text-muted">5 months ago.</p>
													<p>Checkout! How cool is that!</p>
													<div class="img-timeline">
														<a class="img-thumbnail lightbox"
															href="${pageContext.request.contextPath}/assets/img/gallery/photo6.jpg"
															data-plugin-options='{ "type":"image" }'> <img
															class="img-responsive" width="215"
															src="${pageContext.request.contextPath}/assets/img/gallery/photo6.jpg"> <span
															class="zoom"> <i class="fa fa-search"></i>
														</span>
														</a>
													</div>
												</div>
											</li>
										</ol>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="panel">
							<div
								class="panel-heading panel-heading-transparent bk-border-off">
								<h6>
									<strong>Employes Stats</strong>
								</h6>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table
										class="table table-striped table-bordered bootstrap-datatable datatable">
										<thead>
											<tr>
												<th>Employe</th>
												<th>Position</th>
												<th>Salary</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Willson</td>
												<td>Developer</td>
												<td>2563$</td>
												<td><span class="label label-warning">Pending</span></td>
											</tr>
											<tr>
												<td>James</td>
												<td>SEO</td>
												<td>5000$</td>
												<td><span class="label label-warning">Pending</span></td>
											</tr>
											<tr>
												<td>Steven</td>
												<td>Photographer</td>
												<td>1269$</td>
												<td><span class="label label-success">Success</span></td>
											</tr>
											<tr>
												<td>Aselay</td>
												<td>Project manger</td>
												<td>6253$</td>
												<td><span class="label label-danger">Failed</span></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="panel">
							<div
								class="panel-heading panel-heading-transparent bk-border-off">
								<h6>
									<strong>Calendar</strong>
								</h6>
								<div class="panel-actions">
									<a href="#" class="btn-minimize"><i class="fa fa-caret-up"></i></a>
									<a href="#" class="btn-close"><i class="fa fa-times"></i></a>
								</div>
							</div>
							<div class="panel-body">
								<div class="calendar calendar-small">
									<div id="calendar"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Main Page -->

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
	<c:import url="/WEB-INF/views/base/js.jsp"/>




</body>

</html>