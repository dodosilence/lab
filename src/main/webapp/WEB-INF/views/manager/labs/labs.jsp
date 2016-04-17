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
                        <p class="fa fa-table red"></p><span class="break"></span>实验室列表
                    </h6>
                    <c:if test="${labstyle!=null}">
                        <h6 class="pull-right">${labstyle.styleName}</h6>
                    </c:if>
                </div>

                <div class="panel-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>类型</th>
                            <th>位置</th>
                            <th>课程量</th>
                            <th>设备数</th>
                            <th>模块数</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <c:forEach items="${laboratorys}" var="lab">
                            <tr class="gradeX">
                                <td>${lab.labName}</td>
                                <td>${lab.labstyle.styleName}</td>
                                <td>${lab.position}</td>
                                <td>${fn:length(lab.courses)}</td>
                                <td>${fn:length(lab.equipments)}</td>
                                <td>${fn:length(lab.modules)}</td>
                                <td>
                                    <a href="javascript:deleteLab('${lab.uuid}');">删除</a>/<a
                                        href="${pageContext.request.contextPath}/mgr/labs/info/${lab.uuid}">详情</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <script>
                            function deleteLab(labId) {
                                alert(labId)
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/mgr/labs/delete/" + labId,    //请求的url地址
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


<div class="container-fluid content">
    <div id="footer">
        <div class="pull-right">
            <button class="btn btn-default" data-toggle="modal" data-target="#myModal">新建</button>
        </div>
        <c:if test="${labstyle!=null}">
            <div class="pull-right">
                <button class="btn btn-danger" onclick="deleteLabstyle('${labstyle.uuid}')">删除</button>
            </div>
        </c:if>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">添加实验室</h4>
            </div>
            <div class="modal-body"><br>
                <form id="form_add_lab">
                    <div class="form-group">
                        <label>实验室名称</label>
                        <div class="input-group input-group-icon">
                            <input type="text" name="labName" class="form-control bk-radius"
                                   id="labName" placeholder="低于十个字符"/>
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
                                   placeholder="低于六个字符"/>
                    <span class="input-group-addon">
                        <span class="icon">
						    <i class="fa fa-warning"></i>
                       </span>
					</span>
                        </div>
                    </div>
                    <c:if test="${labstyle!=null}">
                        <input type="hidden" name="labstyle" value="${labstyle.uuid}">
                    </c:if>
                    <input type="hidden" name="format" value="json">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-in" onclick="addLab()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<c:import url="/WEB-INF/views/base/js.jsp"/>
<script>
    function deleteLabstyle(uuid) {

        if (confirm("确认删除该类型,并使该类型下的实验室类型为空?")) {
            $.ajax({

                type: "POST",
                url: "${pageContext.request.contextPath}/mgr/labstyle/delete",
                data: {format: 'json', uuid: uuid},
                success: function (data, textStatus) {
                    $("#myModal").modal("hide")
                    alert(data.message)
                    location.href="${pageContext.request.contextPath}/mgr/labstyle/list/all"
                },

                complete: function (XMLHttpRequest, textStatus) {

                },
                error: function () {

                }
            });
        }

    }
    function addLab() {
        if (!$("#labName").attr("value").length < 3 && !$("#position").attr("value").length < 1) {
            $.ajax({

                type: "POST",
                url: "${pageContext.request.contextPath}/mgr/labs/create",
                data: $("#form_add_lab").serialize(),
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