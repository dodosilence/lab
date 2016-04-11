<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ch">

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title>总体预览 | Fire - Admin Template</title>

    <!-- Mobile Metas -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <c:import url="/WEB-INF/views/base/css.jsp"/>
</head>

<body>

<c:import url="/WEB-INF/views/manager/navigation.jsp"/>

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
        <c:forEach items="${labstyles}" var="labstyle">
            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="panel bk-widget bk-border-off">
                    <div class="panel-body bk-bg-very-light-gray">
                        <h4 class="bk-margin-off-bottom bk-docs-font-weight-300">${labstyle.styleName}</h4>
                        <div class="clearfix  bk-padding-top-10">
                            <div class="pull-right bk-margin-left-15">
                                <i class="fa fa-dollar fa-3x"></i>
                            </div>
                            <h1 class="bk-margin-off-top pull-right">共${fn:length(labstyle.laboratorys)}</h1>
                        </div>
                        <a href="${pageContext.request.contextPath}/mgr/labs/list/${labstyle.uuid}"><h6
                                class="text-right bk-padding-top-20 bk-margin-off">详情</h6></a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<!--/container-->


<div class="clearfix"></div>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<c:import url="/WEB-INF/views/base/js.jsp"/>
</body>

</html>