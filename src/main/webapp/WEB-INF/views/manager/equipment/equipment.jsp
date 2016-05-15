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
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-heading bk-bg-white">
                    <h6>
                        <i class="fa fa-table red"></i><span class="break"></span>设备列表
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
                            <th>损坏数</th>
                            <th>借出数</th>
                            <th>可用数</th>
                            <th>价格(元)</th>
                            <c:if test="${sessionScope.user.role=='manager'}">
                                <th>操作</th>
                            </c:if>
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
                                <c:if test="${sessionScope.user.role=='manager'}">
                                    <td>
                                        <a href="javascript:deleteEquip('${equip.uuid}');">删除</a>/
                                        <a href="${pageContext.request.contextPath}/mgr/equip/info/${equip.uuid}">操作</a>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        <script>
                            function deleteEquip(eid) {
                                if (confirm("确定删除该设备?这会清除掉所有关于它的信息?")) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/mgr/equip/delete/" + eid,    //请求的url地址
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
<c:if test="${sessionScope.user.role=='manager'}">
    <!--/container-->
    <div class="container-fluid content">
        <div id="footer">
            <div class="pull-right">
                <button class="btn btn-default" data-toggle="modal" data-target="#myModal">添加设备</button>
            </div>
            <c:if test="${laboratory!=null}">
                <div class="pull-right">
                    <button class="btn btn-default" data-toggle="modal" data-target="#model_edit_lab">修改实验室信息</button>
                </div>
            </c:if>
        </div>
    </div>
</c:if>

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
                <h4 class="modal-title">添加设备</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_equip">
                    <div class="form-group">
                        <label>设备名</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="ename" class="form-control bk-radius"
                                   id="ename" placeholder="低于十个字符"/>
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
                    <div class="form-group">
                        <label>单价</label>
                        <div class="input-group input-group-icon">
                            <input type="number" name="price" id="price" class="form-control bk-radius"
                                   placeholder="输入单价(元)"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <c:if test="${laboratory!=null}">
                        <input type="hidden" name="labUuid" value="${laboratory.uuid}">
                    </c:if>
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
        if ($("#ename").attr("value").length >= 1 && $("#count").attr("value") >= 0) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/mgr/equip/create",
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


        } else {
            alert("参数不可为空")
        }


    }
</script>

<!-- end: JavaScript-->
</body>

</html>