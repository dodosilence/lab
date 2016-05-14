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
                <li><a href="#"><i class="fa fa-table"></i>实验详情</a></li>
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
                    <c:if test="${project!=null}">
                        <h6 class="pull-right">${project.projectName}</h6>
                    </c:if>
                </div>
                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>所属实验</th>
                            <th>所在实验室</th>
                            <th>需求数</th>
                            <th>可用数</th>
                            <th>损坏数</th>
                            <c:if test="${sessionScope.user.role=='teacher'}">
                                <th>操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <c:forEach items="${pm}" var="p">
                            <tr class="gradeX">
                                <td>${p.equipment.eName}</td>
                                <td>${p.project.projectName}</td>
                                <td>${p.equipment.laboratory.labName}</td>
                                <td>${p.count}</td>
                                <td>${p.equipment.usefullCount}</td>
                                <td>${p.broken}
                                    <c:if test="${project.status==2}">
                                        <a href="javascript:broken('${p.uuid}');">---添加损坏</a>
                                    </c:if>
                                </td>
                                <c:if test="${sessionScope.user.role=='teacher'}">
                                    <td>
                                        <c:if test="${project.status>=1}"> 不可更改</c:if>
                                        <c:if test="${project.status<1}">
                                            <a href="javascript:deleteEquip('${p.uuid}');">删除</a>/
                                            <a href="javascript:changeCount('${p.uuid}','${p.count}');">修改数量</a>
                                        </c:if>

                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <div class="modal fade" id="broken" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">添加损坏</h4>
                                    </div>
                                    <div class="modal-body"><br>
                                        <form id="form_do_brok"
                                              action="${pageContext.request.contextPath}/mgr/project/broken"
                                              method="post">
                                            <div class="form-group">
                                                <label>损坏了</label>
                                                <div class="input-group input-group-icon">
                                                    <input type="number" name="broken" class="form-control bk-radius"
                                                           id="lname" placeholder="输入整数"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                                                </div>
                                            </div>
                                            <input type="hidden" name="format" value="json">
                                            <input type="hidden" name="mapid" value="" id="mapid">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-in" onclick="dobroken()">Save changes
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>
                        <script>


                            function broken(mapuuid) {
                                $("#mapid").attr("value",mapuuid)
                                $("#broken").modal("show")
                            }

                            function dobroken() {
                                $.ajax({
                                    type: "POST",
                                    url: $("#form_do_brok").attr("action"),
                                    data: $("#form_do_brok").serialize(),
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




                            function changeCount(pid, count) {
                                $("#pmapid").attr("value", pid)
                                $("#pcount").attr('value', count);

                                $("#model_edit_lab").modal('show')
                            }
                            function deleteEquip(eid) {
                                if (confirm("确定删除该设备?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/project/equip/delete/" + eid,    //请求的url地址
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


                    <c:if test="${sessionScope.user.role=='manager'&&project.status==0}">
                        <button style="margin-left: 10px;" onclick="doPublish('${project.uuid}')"
                                class="btn btn-default">审核通过
                        </button>
                        <script>
                            function doPublish(projectId) {
                                if (confirm("确定发布?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/project/publish/" + projectId,    //请求的url地址
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
                    </c:if>

                    <c:if test="${sessionScope.user.role=='teacher'&&project.status==1}">
                        <button style="margin-left: 10px;" onclick="doPublish('${project.uuid}')"
                                class="btn btn-default">开始课程
                        </button>
                        <script>
                            function doPublish(projectId) {
                                if (confirm("确定开始?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/project/start/" + projectId,    //请求的url地址
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
                    </c:if>
                    <c:if test="${sessionScope.user.role=='teacher'&&project.status==2}">
                        <button style="margin-left: 10px;" onclick="doPublish('${project.uuid}')"
                                class="btn btn-default">结束课程
                        </button>

                        <script>
                            function doPublish(projectId) {
                                if (confirm("确定结束?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/project/end/" + projectId,    //请求的url地址
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
                    </c:if>

                    <c:if test="${sessionScope.user.role=='student'&&project.status==2}">
                        <button style="margin-left: 10px;" onclick="doPublishs()"
                                class="btn btn-default">提交实验报告
                        </button>


                        <div class="modal fade" id="model_sub" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                                        </button>
                                        <h4 class="modal-title">修改数量</h4>
                                    </div>
                                    <div class="modal-body"><br>
                                        <form id="form_sub" action="/student/project/report" method="post"
                                              enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label>实验报告</label>
                                                <div class="input-group input-group-icon">
                                                    <input type="file" name="report">
                                                </div>
                                            </div>
                                            <input type="hidden" name="format" value="json">
                                            <input type="hidden" name="pid" id="project_id" value="${project.uuid}">
                                            <input type="hidden" name="sid" value="${sessionScope.user.uuid}">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-in" onclick="report()">提交
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal-dialog -->
                        </div>

                        <script>
                            function doPublishs() {
                                $("#model_sub").modal("show")
                            }

                            function report() {
                                $("#form_sub").submit()
                            }

                        </script>
                    </c:if>
                    <button style="margin-left: 10px;" onclick="location.href='/mgr/project/reports/${project.uuid}'"
                            class="btn btn-default">察看报告
                    </button>


                </div>
            </div>
        </div>
    </div>

</div>
<div class="modal fade" id="model_edit_lab" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">修改数量</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_lab" action="/mgr/project/changecount">
                    <div class="form-group">
                        <label>实验室名称</label>
                        <div class="input-group input-group-icon">
                            <input type="number" name="pcount" class="form-control bk-radius"
                                   id="pcount" placeholder="输入数量"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <input type="hidden" name="format" value="json">
                    <input type="hidden" name="pid" id="pmapid">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="changeCountCommit()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    function changeCountCommit() {
        $.ajax({
            url: $("#form_add_lab").attr("action"),    //请求的url地址
            dataType: "json",   //返回格式为json
            data: $("#form_add_lab").serialize(),
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

</script>
<c:if test="${sessionScope.user.role=='teacher'&&project.status<=0}">
    <!--/container-->
    <div class="container-fluid content">
        <div id="footer">
            <div class="pull-right">
                <button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加设备</button>
            </div>
        </div>
    </div>
</c:if>

<div class="modal fade" id="model_add_stu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_stu" action="/mgr/project/changecount">

                    <input type="hidden" name="format" value="json">
                    <input type="hidden" name="pid">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="changeCountCommit()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加设备</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_equip" action="/mgr/project/addequip/${project.uuid}">
                    <div class="form-group">
                        <label>设备</label>
                        <div class="input-group input-group-icon">
                            <select name="equipId" class="form-control">
                                <c:forEach items="${equipments}" var="equip">
                                    <option value="${equip.uuid}">${equip.eName}</option>
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
                        <label>总数</label>
                        <div class="input-group input-group-icon">
                            <input type="number" name="count" id="count" class="form-control bk-radius"
                                   placeholder="输入数量"/>
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
    function updateLabInfo() {
        $.ajax({
            type: "POST",
            url: $("#form_edit_lab").attr("action"),
            data: $("#form_edit_lab").serialize(),
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
    function addEquip() {
        $.ajax({
            type: "POST",
            url: $("#form_add_equip").attr("action"),
            data: $("#form_add_equip").serialize(),
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

<!-- end: JavaScript-->
</body>

</html>