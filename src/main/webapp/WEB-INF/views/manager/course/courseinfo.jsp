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

    <title>实验室管理</title>
    <!-- Mobile Metas -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <c:import url="/WEB-INF/views/base/css.jsp"/>


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
<div class="main sidebar-minified">
    <!-- Page Header -->
    <div class="page-header">
        <div class="pull-left">
            <ol class="breadcrumb visible-sm visible-md visible-lg">
                <li><a href="/index.html"><i class="icon fa fa-home"></i>主页</a></li>
                <li><a href="#"><i class="fa fa-table"></i>课程信息</a></li>
            </ol>
        </div>

    </div>
    <!-- End Page Header -->
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-heading bk-bg-white">
                    <h6>
                        <i class="fa fa-table red"></i><span class="break"></span>学生列表
                    </h6>
                    <h6 class="pull-right">${course.courseName}</h6>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>课程数</th>
                            <c:if test="${sessionScope.user.role=='manager'}">
                                <th>操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${course.students}" var="student">
                            <tr class="gradeX">
                                <td>${student.user.truename}</td>
                                <td>${student.user.age}</td>
                                <td><c:if test="${stu.user.gender==1}">男</c:if><c:if
                                        test="${stu.user.gender!=1}">女</c:if></td>
                                <td>${fn:length(student.courses)}</td>
                                <c:if test="${sessionScope.user.role=='manager'}">
                                    <td>
                                        <a href="javascript:deleteCourse('${student.uuid}');">移除</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <script>
                            function deleteCourse(eid) {
                                if (confirm("确定移除?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/course/removeStu/${course.uuid}/" + eid,    //请求的url地址
                                        dataType: "json",   //返回格式为json
                                        data: {format: 'json'},
                                        async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                                        success: function (req) {
                                            //请求成功时处理
                                            window.location.reload();
                                        },
                                        complete: function () {
                                            //请求完成的处理
                                        }
                                    })
                                }
                            }
                        </script>
                    </table>


                </div>
            </div>
        </div>
    </div>

</div>
<!--/container-->
<c:if test="${sessionScope.user.role=='manager'}">
    <div class="container-fluid content">
        <div id="footer">
            <div class="pull-right">
                <button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加学生</button>
            </div>

        </div>
    </div>
</c:if>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_equip" action="/mgr/course/addstu/${course.uuid}">
                    <div style="text-align: center">
                    <c:forEach items="${students}" var="stu">
                    <input type="checkbox" name="stu" class="form-group" value="${stu.uuid}"><span
                        style="width: 30px;font-size: 20px">${stu.user.truename}</span><br>
                    </c:forEach>
                    <input type="hidden" name="format" value="json">
                        </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="addEquip()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<div class="clearfix"></div>
<c:import url="/WEB-INF/views/base/js.jsp"/>
<script>
    function addEquip() {
        $.ajax({
            type: "POST",
            url: $("#form_add_equip").attr("action"),
            data: $("#form_add_equip").serialize(),
            success: function (data, textStatus) {
                location.reload();
            },

            complete: function (XMLHttpRequest, textStatus) {

            },
            error: function () {
                window.reload()

            }
        });


    }
</script>

<!-- end: JavaScript-->
</body>

</html>