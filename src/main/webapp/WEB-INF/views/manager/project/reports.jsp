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
                <li><a href="#"><i class="fa fa-table"></i>实验报告</a></li>
            </ol>
        </div>

    </div>
    <!-- End Page Header -->
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-heading bk-bg-white">
                    <h6>
                        <i class="fa fa-table red"></i><span class="break"></span>实验报告
                    </h6>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>实验</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>报告</th>
                            <th>得分</th>
                        </tr>
                        </thead>
                        <c:forEach items="${students}" var="stu">
                            <tr class="gradeX">
                                <td>${stu.user.truename}</td>
                                <td>${project.projectName}</td>
                                <td>${project.startDateTime}</td>
                                <td>${project.endDateTime}</td>
                                <td>
                                    <c:forEach var="report" items="${reports}" varStatus="i">
                                        <c:if test="${report.sid==stu.uuid&&report.report!=null}">
                                            <a href="/mgr/project/report/download/${stu.uuid}/${project.uuid}">${report.name}</a>
                                        </c:if>

                                    </c:forEach>
                                </td>
                                <td>

                                    <c:forEach var="report" items="${reports}" varStatus="i">
                                        <c:if test="${report.sid==stu.uuid&&report.score!=null}">
                                            已得${report.score}分
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${sessionScope.user.role=='teacher'&&project.status==3}">
                                        <a href="javascript:score('${stu.uuid}','${project.uuid}');">评分</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function score(stuid, pid) {
        $("#pid").attr("value", pid)
        $("#stuid").attr("value", stuid)
        $("#score").modal("show")
    }


    function doscore() {


        $.ajax({
            type: "POST",
            url: $("#form_do_score").attr("action"),
            data: $("#form_do_score").serialize(),
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
<div class="modal fade" id="score" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">评分</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_do_score"
                      action="${pageContext.request.contextPath}/mgr/project/doscore" method="post">
                    <div class="form-group">
                        <label>得分</label>
                        <div class="input-group input-group-icon">
                            <input type="number" name="score" class="form-control bk-radius"
                                   id="lname" placeholder="0~100整数"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <input type="hidden" name="format" value="json">
                    <input type="hidden" name="pid" value="" id="pid">
                    <input type="hidden" name="stuid" value="" id="stuid">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="doscore()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--/container-->

<div class="clearfix"></div>
<c:import url="/WEB-INF/views/base/js.jsp"/>
<!-- end: JavaScript-->
</body>

</html>