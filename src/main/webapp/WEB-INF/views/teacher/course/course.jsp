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
                <li><a href="/index.html"><i class="icon fa fa-home"></i>主页</a></li>
                <li><a href="#"><i class="fa fa-table"></i>课程管理</a></li>
            </ol>
        </div>

    </div>
    <!-- End Page Header -->
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-heading bk-bg-white">
                    <h6>
                        <i class="fa fa-table red"></i><span class="break"></span>课程
                    </h6>
                    <c:if test="${laboratory!=null}">
                        <h6 class="pull-right">${laboratory.labName}</h6>
                    </c:if>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>所在实验室</th>
                            <th>负责老师</th>
                            <th>学生数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${courses}" var="course">
                            <tr class="gradeX">
                                <td>${course.courseName}</td>
                                <td>${course.laboratory.labName}</td>
                                <td>${course.teacher.user.truename}</td>
                                <td>${fn:length(course.students)}</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/mgr/course/info/${course.uuid}">详细</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>


                </div>
            </div>
        </div>
    </div>

</div>



<c:if test="${laboratory!=null}">
    <div class="modal fade" id="model_edit_lab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">修改实验室信息</h4>
                </div>
                <div class="modal-body"><br>
                    <form id="form_edit_lab"
                          action="${pageContext.request.contextPath}/mgr/labs/update/${laboratory.uuid}">
                        <div class="form-group">
                            <label>名称</label>
                            <div class="input-group input-group-icon">
                                <input type="text" name="lname" class="form-control bk-radius"
                                       id="lname" placeholder="低于十个字符" value="${laboratory.labName}"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>位置</label>
                            <div class="input-group input-group-icon">
                                <input type="text" name="position" id="position" class="form-control bk-radius"
                                       placeholder="输入位置" value="${laboratory.position}"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>类型</label>
                            <select class="form-control" name="style">
                                <c:forEach items="${labstyles}" var="style">
                                    <option value="${style.uuid}"
                                            <c:if test="${laboratory.labstyle.uuid==style.uuid}">
                                                selected
                                            </c:if>


                                    >${style.styleName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="format" value="json">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-in" onclick="updateLabInfo()">Save changes</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div>

</c:if>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加课程</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_equip">
                    <div class="form-group">
                        <label>课程名</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="courseName" class="form-control bk-radius"
                                   id="ename" placeholder="低于十个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>所属实验室</label>
                        <div class="input-group input-group-icon">
                            <select class="form-control" name="labId">
                                <c:forEach items="${laboratories}" var="lab">
                                    <option value="${lab.uuid}">${lab.labName}</option>
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
                        <label>负责老师</label>
                        <div class="input-group input-group-icon">
                            <select class="form-control" name="teacherId">
                                <c:forEach items="${teachers}" var="teacher">
                                    <option value="${teacher.uuid}">${teacher.user.truename}</option>
                                </c:forEach>
                            </select>
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
                <button type="button" class="btn btn-in" onclick="addEquip()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<div class="clearfix"></div>
<c:import url="/WEB-INF/views/base/js.jsp"/>
<script>
    function addEquip() {
        if ($("#ename").attr("value").length >= 1) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mgr/course/create",
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


        } else {
            alert("参数不可为空")
        }
    }
</script>

<!-- end: JavaScript-->
</body>

</html>