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
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-heading bk-bg-white">
                    <h6>
                        <i class="fa fa-table red"></i><span class="break"></span>设备列表
                    </h6>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>所在实验室</th>
                            <th>损坏数</th>
                            <th>借出数</th>
                            <th>可用数</th>
                            <th>价格</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${equitments}" var="equip">
                            <tr class="gradeX">
                                <td>${equip.eName}</td>
                                <td>${equip.laboratory.labName}</td>
                                <td>${equip.brokenCount}</td>
                                <td>${equip.borrowdCount}</td>
                                <td>${equip.usefullCount}</td>
                                <td>${equip.price}</td>
                                <td>
                                    <a  href="javascript:deleteEquip('${equip.uuid}');">删除</a>/<a  href="${pageContext.request.contextPath}/mgr/equip/info/${equip.uuid}">详情</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <script>
                            function deleteEquip(eid) {
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/mgr/equip/delete/"+eid,    //请求的url地址
                                    dataType: "json",   //返回格式为json
                                    async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                                    type: "GET",   //请求方式
                                    success: function (req) {
                                        //请求成功时处理
                                        window.location.reload();
                                    },
                                    complete: function () {
                                        //请求完成的处理
                                    }
                                })
                            }
                        </script>
                    </table>


                </div>
            </div>
        </div>
    </div>

</div>
<!--/container-->


<div class="clearfix"></div>
<c:import url="/WEB-INF/views/base/js.jsp"/>

<!-- end: JavaScript-->
</body>

</html>