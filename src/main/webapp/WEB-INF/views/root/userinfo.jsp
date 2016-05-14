<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title>总体预览 | Fire - Admin Template</title>

    <!-- Mobile Metas -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <!-- Import google fonts -->
    <link href='http://fonts.useso.com/css?family=Titillium+Web'
          rel='stylesheet' type='text/css'>

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico"
          type="image/x-icon"/>
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon.png"/>
    <link rel="apple-touch-icon" sizes="57x57"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57x57.png"/>
    <link rel="apple-touch-icon" sizes="72x72"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72x72.png"/>
    <link rel="apple-touch-icon" sizes="76x76"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-76x76.png"/>
    <link rel="apple-touch-icon" sizes="114x114"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114x114.png"/>
    <link rel="apple-touch-icon" sizes="120x120"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-120x120.png"/>
    <link rel="apple-touch-icon" sizes="144x144"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144x144.png"/>
    <link rel="apple-touch-icon" sizes="152x152"
          href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-152x152.png"/>

    <!-- start: CSS file-->

    <!-- Vendor CSS-->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/skycons/css/skycons.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/font-awesome/css/font-awesome.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/vendor/css/pace.preloader.css" rel="stylesheet"/>

    <!-- Plugins CSS-->
    <link href="${pageContext.request.contextPath}/assets/plugins/jquery-ui/css/jquery-ui-1.10.4.min.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/scrollbar/css/mCustomScrollbar.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/bootkit/css/bootkit.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/magnific-popup/css/magnific-popup.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/fullcalendar/css/fullcalendar.css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/plugins/jqvmap/jqvmap.css" rel="stylesheet"/>

    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/jquery.mmenu.css" rel="stylesheet"/>

    <!-- Page CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/assets/css/add-ons.min.css" rel="stylesheet"/>

    <!-- end: CSS file-->


    <!-- Head Libs -->
    <script src="${pageContext.request.contextPath}/assets/plugins/modernizr/js/modernizr.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

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
<div class="main">
    <!-- Page Header -->
    <div class="page-header">
        <div class="pull-left">
            <ol class="breadcrumb visible-sm visible-md visible-lg">
                <li><a href="/index.html"><i class="icon fa fa-home"></i>主页</a></li>
                <li><a href="#"><i class="fa fa-file-text"></i>个人信息</a></li>
            </ol>
        </div>
        <div class="pull-right">
            <h2>Profile</h2>
        </div>
    </div>
    <!-- End Page Header -->
    <div class="row profile">
        <div class="col-lg-4 col-md-5 col-sm-5">
            <div class="panel">
                <div class="panel-body">
                    <div
                            class="text-left bk-bg-white bk-padding-top-40 bk-padding-bottom-10">
                        <div class="row">
                            <div
                                    class="col-lg-12 col-md-12 col-sm-12 col-xs-12 bk-vcenter text-center">
                                <div class="bk-avatar">
                                    <c:if test="${user.role=='manager'}">
                                        <img src="${pageContext.request.contextPath}/assets/img/avatar2.jpg" alt=""
                                             class="img-circle bk-img-120 bk-border-light-gray bk-border-3x"/>
                                    </c:if>
                                    <c:if test="${user.role!='manager'}">
                                        <img src="${pageContext.request.contextPath}/assets/img/noLogin.jpg" alt=""
                                             class="img-circle bk-img-120 bk-border-light-gray bk-border-3x"/>
                                    </c:if>

                                </div>
                                <h4 class="bk-margin-top-10 bk-docs-font-weight-300">${user.truename}</h4>
                            </div>
                            <hr class="bk-margin-off"/>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <a
                                        class="col-xs-4 bk-bg-white bk-fg-primary bk-padding-top-20 bk-padding-bottom-20 text-center">
                                    <i class="fa fa-facebook"></i>
                                </a> <a
                                    class="col-xs-4 bk-bg-white bk-fg-success bk-padding-top-20 bk-padding-bottom-20 text-center">
                                <i class="fa fa-twitter"></i>
                            </a> <a
                                    class="col-xs-4 bk-bg-white bk-fg-danger bk-padding-top-20 bk-padding-bottom-20 text-center">
                                <i class="fa fa-google-plus"></i>
                            </a>
                            </div>
                        </div>
                    </div>
                    <hr class="bk-margin-off"/>
                    <div class="bk-ltr bk-bg-white">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="bk-widget bk-border-off bk-webkit-fix">
                                    <div
                                            class="bk-bg-white text-center bk-padding-top-20 bk-padding-bottom-10">
                                        <div class="row">
                                            <div class="text-left bk-padding-left-10">
                                                <h4 class="bk-margin-off">General Information</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="bs-example">
                                        <div id="carousel-example-generic3"
                                             class="carousel bk-carousel-fade slide"
                                             data-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="item">
                                                    <a
                                                            class="panel-body bk-bg-white bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
                                                        <div
                                                                class="pull-left bk-margin-top-10 bk-margin-right-10">
                                                            <div
                                                                    class="bk-round bk-bg-darken bk-border-off bk-icon bk-icon-default bk-bg-primary">
                                                                <i class="fa fa-thumbs-up"></i>
                                                            </div>
                                                        </div>
                                                        <h5
                                                                class="bk-fg-primary bk-fg-darken bk-margin-off-bottom">
                                                            Position</h5>
                                                        <p>
                                                            <small>${sessionScope.user.role}</small>
                                                        </p>
                                                    </a>
                                                </div>
                                                <div class="item active">
                                                    <a
                                                            class="panel-body bk-bg-white bk-bg-lighten bk-padding-off-top bk-padding-off-bottom">
                                                        <div
                                                                class="pull-left bk-margin-top-10 bk-margin-right-10">
                                                            <div
                                                                    class="bk-round bk-bg-darken bk-border-off bk-icon bk-icon-default bk-bg-info">
                                                                <i class="fa fa-building-o"></i>
                                                            </div>
                                                        </div>
                                                        <h5
                                                                class="bk-fg-info bk-fg-darken bk-margin-off-bottom">
                                                            Company
                                                            Name</h5>
                                                        <p>
                                                            <small>AdminTemplate Inc.</small>
                                                        </p>
                                                    </a>
                                                </div>
                                            </div>
                                            <a
                                                    class="left carousel-control bk-carousel-control bk-carousel-control-white bk-carousel-hide-init"
                                                    href="#carousel-example-generic3" role="button"
                                                    data-slide="prev"> <span
                                                    class="fa fa-angle-left icon-prev bk-bg-very-light-gray"></span>
                                            </a> <a
                                                class="right carousel-control bk-carousel-control bk-carousel-control-white bk-carousel-hide-init"
                                                href="#carousel-example-generic3" role="button"
                                                data-slide="next"> <span
                                                class="fa fa-angle-right icon-next"></span>
                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="bk-margin-off"/>
                    <div class="bk-ltr bk-bg-white">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div
                                        class="bk-bg-white text-center bk-padding-top-20 bk-padding-bottom-10">
                                    <div class="row">
                                        <div class="text-left bk-padding-left-10">
                                            <h4 class="bk-margin-off">Address</h4>
                                        </div>
                                    </div>
                                </div>
                                <div
                                        class="bk-bg-white bk-bg-lighten bk-padding-top-10 bk-padding-left-20">
                                    <div class="pull-left bk-margin-right-10">
                                        <div class="bk-round bk-bg-darken bk-border-off">
                                            <i class="fa fa-map-marker fa-2x bk-fg-danger"></i>
                                        </div>
                                    </div>
                                    <p class="text-left">
                                        <small>${user.address}</small>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bk-ltr bk-padding-bottom-20 bk-padding-left-20">
                        <div class="row">
                            <div
                                    class="col-12-4 col-md-12 col-sm-12 col-xs-12 bk-bg-white bk-padding-top-10">
                                <i class="fa fa-tablet"></i> ${user.phone}
                            </div>
                            <div
                                    class="col-12-4 col-md-12 col-sm-12 col-xs-12 bk-bg-white bk-padding-top-10">
                                <i class="fa fa-envelope"></i> ${user.email}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-5 col-md-7 col-sm-7">
            <div class="panel">
                <div class="panel-body">
                    <div class="tabs tabs-warning">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#overview" data-toggle="tab">预览</a>
                            </li>
                            <li><a href="#edit" data-toggle="tab">编辑</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="overview" class="tab-pane active">
                                <h5>Timeline</h5>
                                <div class="timelineProfile timeline-profile">
                                    <div class="timeline-body">
                                        <div class="timeline-title">
                                            <h5 class="text-uppercase">March 2015</h5>
                                        </div>
                                        <ol class="timeline-items">
                                            <li>
                                                <div class="timeline-box">
                                                    <p class="text-muted">5 months ago.</p>
                                                    <p>
                                                        It's awesome when we find a good solution for our
                                                        projects, Fire Admin is <span
                                                            class="text-primary">#awesome</span>
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
                                                           href="${pageContext.request.contextPath}/assets/img/gallery/photo1.jpg"
                                                           data-plugin-options='{ "type":"image" }'> <img
                                                                class="img-responsive" width="215"
                                                                src="${pageContext.request.contextPath}/assets/img/gallery/photo1.jpg"> <span
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
                            <div id="edit" class="tab-pane updateProfile">
                                <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/mgr/update">
                                    <div
                                            class="bk-bg-white bk-padding-top-10 bk-padding-bottom-10">
                                        <h4>信息修改</h4>
                                        <fieldset>

                                            <div class="form-group">
                                                <label for="profileLastName">昵称</label> <input name="truename"
                                                                                               value="${user.truename}"
                                                                                               type="text"
                                                                                               class="form-control"
                                                                                               id="profileLastName"
                                                                                               placeholder="用户名"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="profileAddress">地址</label> <input name="address"
                                                                                              type="text"
                                                                                              class="form-control"
                                                                                              id="profileAddress"
                                                                                              placeholder="${user.address} "
                                                                                              value="${user.address}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="profileAddress1">邮箱</label> <input name="email"
                                                                                               type="text"
                                                                                               class="form-control"
                                                                                               id="profileAddress1"
                                                                                               placeholder="${user.email} "
                                                                                               value="${user.email}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="profileAddress2">手机</label> <input name="phone"
                                                                                               type="text"
                                                                                               class="form-control"
                                                                                               id="profileAddress2"
                                                                                               placeholder="${user.phone} "
                                                                                               value="${user.phone}"/>
                                            </div>
                                            <div class="form-group">
                                                <label for="profileCompany3">密码</label> <input name="password"
                                                                                               type="password"
                                                                                               class="form-control"
                                                                                               id="profileCompany3"
                                                                                               placeholder="＊＊＊＊＊＊＊＊"
                                                                                               value="${user.password}"/>
                                                <div class="form-group">
                                                    <label for="profileCompany4">确认密码</label> <input name="password1"
                                                                                                     type="password"
                                                                                                     class="form-control"
                                                                                                     id="profileCompany4"
                                                                                                     placeholder="＊＊＊＊＊＊＊＊"
                                                                                                     value="${user.password}"/>
                                                    <input type="hidden" name="uuid" value="${user.uuid}">

                                                </div>
                                                <div class="bk-bg-white">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="pull-right">
                                                                <button type="submit" class="btn btn-primary">提交
                                                                </button>
                                                                <button type="reset" class="btn btn-default">重设</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Page Header -->

<!-- Footer -->
<!-- End Footer -->
<!--/container-->


<div class="clearfix"></div>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/skycons/js/skycons.js"></script>
<script src="${pageContext.request.contextPath}/assets/vendor/js/pace.min.js"></script>

<!-- Plugins JS-->
<script src="${pageContext.request.contextPath}/assets/plugins/moment/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/select2/select2.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables/media/js/jquery.dataTables.js"></script>
<script
        src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables/extras/TableTools/js/dataTables.tableTools.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/jquery-datatables-bs3/js/datatables.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/sparkline/js/jquery.sparkline.min.js"></script>

<!-- Theme JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.mmenu.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core.min.js"></script>

<!-- Pages JS -->
<script src="${pageContext.request.contextPath}/assets/js/pages/table-advanced.js"></script>

<!-- end: JavaScript-->
</body>

</html>
