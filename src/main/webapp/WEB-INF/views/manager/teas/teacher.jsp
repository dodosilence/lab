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
                        <i class="fa fa-table red"></i><span class="break"></span>老师列表
                    </h6>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>年龄</th>
                            <th>性别</th>
                            <th>负责课程数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${teachers}" var="teacher">
                            <tr class="gradeX">
                                <td>${teacher.user.truename}</td>
                                <td>${teacher.user.username}</td>
                                <td>${teacher.user.age}</td>
                                <td>${teacher.user.gender}</td>
                                <td>${fn:length(teacher.courses)}</td>
                                <td>
                                    <a href="javascript:deleteTeacher('${teacher.uuid}');">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <script>
                            function deleteTeacher(eid) {
                                if (confirm("确定删除?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/teacher/delete/" + eid,    //请求的url地址
                                        dataType: "json",   //返回格式为json
                                        data: {format: 'json'},
                                        async: false, //请求是否异步，默认为异步，这也是ajax重要特性
                                        type: "POST",   //请求方式
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
<div class="container-fluid content">
    <div id="footer">
        <div class="pull-right">
            <button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加</button>
        </div>
    </div>
</div>



<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_user" action="/mgr/teacher/create" method="POST">
                    <div class="form-group">
                        <label>姓名</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="truename" class="form-control bk-radius"
                                    placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>登录账号</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="username" class="form-control bk-radius"
                                   placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <div class="input-group input-group-icon">
                            <input type="password" name="password" class="form-control bk-radius"
                                   placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>性别</label>
                        <div class="input-group input-group-icon">
                            <select class="form-control" name="gender">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                            </select>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>年龄</label>
                        <div class="input-group input-group-icon">
                            <input type="number" name="age" class="form-control bk-radius"
                                   placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <input type="hidden" name="format" value="json">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="addUser()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>




<div class="clearfix"></div>
<c:import url="/WEB-INF/views/base/js.jsp"/>
<script>
    function addUser() {
            $.ajax({
                type: "POST",
                url: $("#form_add_user").attr("action"),
                data: $("#form_add_user").serialize(),
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