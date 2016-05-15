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
                <li><a href="index.html"><i class="icon fa fa-home"></i>Home</a></li>
                <li><a href="#"><i class="fa fa-table"></i>Tables</a></li>
                <li class="active"><i class="fa fa-thumbs-o-up"></i>Advanced</li>
            </ol>
        </div>

    </div>
    <!-- End Page Header -->
    <div class="row">
        <c:forEach items="${projects}" var="project">

            <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                <div class="panel bk-widget bk-border-off">
                    <div class="panel-body bk-bg-very-light-gray">
                        <h4 class="bk-margin-off-bottom bk-docs-font-weight-300">${project.projectName}(${project.course.courseName})</h4>
                        <div class="clearfix  bk-padding-top-10">
                            <div class="pull-right bk-margin-left-15">
                            </div>
                            <h1 class="bk-margin-off-top pull-right">${fn:length(project.projectEquMaps)}种设备</h1>
                        </div>
                        <a href="${pageContext.request.contextPath}/mgr/project/info/${project.uuid}">
                            <h6 class="text-right bk-padding-top-20 bk-margin-off">

                                <c:if test="${project.status<=0||project.status==null}">
                                    <span style="color: red;">未审核</span>
                                </c:if>
                                <c:if test="${project.status==1}">
                                    <span style="color: yellow;">未开始</span>
                                </c:if>
                                <c:if test="${project.status==2}">
                                    <span style="color: black;">已结束</span>
                                </c:if>
                            </h6>
                        </a>

                    </div>
                </div>
            </div>

        </c:forEach>
    </div>
</div>
<!--/container-->

<!-- Footer -->
<%--<!-- Start: Content -->--%>
<div class="container-fluid content">
    <div id="footer">
        <div class="desc pull-right">
            <button class="btn btn-default" data-toggle="modal" data-target="#myModal">新建</button>
        </div>
    </div>
</div>
<script>
    function addLabstyle() {
        if (!$("#styleName").attr("value").length < 1) {
            $.ajax({

                type: "POST",

                url: "${pageContext.request.contextPath}/mgr/labstyle/create.html",
                data: {
                    styleName: $("#styleName").attr("value"),
                    format: 'json'
                },
                success: function (data, textStatus) {
                    $("#myModal").modal("hide")
                    alert(data.message)
                    location.reload();

                },

                complete: function (XMLHttpRequest, textStatus) {

                },
                error: function () {

                }
            });


        } else {
            alert("名称不可为空")
        }

    }
</script>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">新建实验</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_project" action="/mgr/project/create" method="post">
                    <div class="form-group">
                        <label>实验名称</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="projectName" class="form-control bk-radius"
                                   id="ename" placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>所属课程</label>
                        <div class="input-group input-group-icon">
                            <select class="form-control" name="course">
                                <c:forEach items="${courses}" var="course">
                                    <option value="${course.uuid}">${course.courseName}</option>
                                </c:forEach>
                            </select>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>开始时间</label>
                        <div class="input-group input-group-icon">
                            <input type="date" name="startDateTime" class="form-control bk-radius"
                                   placeholder="开始时间"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>结束时间</label>
                        <div class="input-group input-group-icon">
                            <input type="date" name="endDateTime" class="form-control bk-radius"
                                   placeholder="结束时间"/>
                        </div>
                    </div>

                    <input type="hidden" name="format" value="json">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="addProject()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>


    function addProject() {


        $.ajax({

            type: "POST",

            url: $("#form_add_project").attr("action"),
            data: $("#form_add_project").serialize(),
            success: function (data, textStatus) {
                $("#myModal").modal("hide")
                alert(data.message)
                location.reload();

            },

            complete: function (XMLHttpRequest, textStatus) {

            },
            error: function () {

            }
        });


    }
</script>


<!-- start: JavaScript-->

<!-- Vendor JS-->
<c:import url="/WEB-INF/views/base/js.jsp"/>
</body>

</html>