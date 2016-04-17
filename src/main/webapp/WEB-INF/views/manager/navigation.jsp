<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div class="navbar" role="navigation">
    <div class="container-fluid container-nav">
        <!-- Navbar Action -->
        <ul class="nav navbar-nav navbar-actions navbar-left">
            <li class="visible-md visible-lg"><a href="#"
                                                 id="main-menu-toggle"><i class="fa fa-th-large"></i></a></li>
            <li class="visible-xs visible-sm"><a href="#" id="sidebar-menu"><i
                    class="fa fa-navicon"></i></a></li>
        </ul>
        <!-- Navbar Right -->
        <div class="navbar-right">
            <!-- Userbox -->
            <div class="userbox">
                <c:if test="${sessionScope.user==null}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <figure class="profile-picture hidden-xs">
                            <img src="${pageContext.request.contextPath}/assets/img/noLogin.jpg" class="img-circle"
                                 alt=""/>
                        </figure>
                        <div class="profile-info">
                            <a href="${pageContext.request.contextPath}/page-login.html">登录</a>
                        </div>
                        <i class="fa custom-caret"></i>
                    </a>
                </c:if>
                <c:if test="${sessionScope.user!=null}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <figure class="profile-picture hidden-xs">
                            <img src="${pageContext.request.contextPath}/assets/img/avatar2.jpg" class="img-circle"
                                 alt=""/>
                        </figure>
                        <div class="profile-info">
                            <span class="name">${sessionScope.user.truename}</span> <span
                                class="role"><i class="fa fa-circle bk-fg-success"></i>
                            <c:if test="${sessionScope.user.role=='manager'}">
                                管理员
                            </c:if>
                            <c:if test="${sessionScope.user.role=='teacher'}">
                                老师
                            </c:if>
                            <c:if test="${sessionScope.user.role!='teacher'&&sessionScope.user.role!='manager'}">
                                学生
                            </c:if>
                        </span>
                        </div>
                        <i class="fa custom-caret"></i>
                    </a>
                    <div class="dropdown-menu">
                        <ul class="list-unstyled">
                            <li class="dropdown-menu-header bk-bg-white bk-margin-top-15">
                                <div class="progress progress-xs  progress-striped active">
                                    <div class="progress-bar progress-bar-primary"
                                         role="progressbar" aria-valuenow="60" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 60%;">60%
                                    </div>
                                </div>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/UserProfileServlet"><i
                                    class="fa fa-user"></i>
                                信息</a></li>
                            <li><a
                                    href="${pageContext.request.contextPath}/logout.do"><i
                                    class="fa fa-power-off"></i> 注销</a></li>
                        </ul>
                    </div>
                </c:if>
            </div>
            <!-- End Userbox -->
        </div>
        <!-- End Navbar Right -->
    </div>
</div>
<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-collapse">
        <!-- Sidebar Header Logo-->
        <div class="sidebar-header">
            <img src="${pageContext.request.contextPath}/assets/img/logo.png" class="img-responsive" alt=""/>
        </div>
        <!-- Sidebar Menu-->
        <div class="sidebar-menu">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-sidebar">
                    <div class="panel-body text-center">
                        <div class="flag"></div>
                    </div>
                    <li class="active"><a href="${pageContext.request.contextPath}/mgr/index.html"> <i
                            class="fa fa-laptop" aria-hidden="true"></i><span>总体预览</span>
                    </a></li>
                    <li class="nav-parent"><a> <i class="fa fa-list-alt"
                                                  aria-hidden="true"></i><span>实验室</span>
                    </a>
                        <ul class="nav nav-children">
                            <li><a href="${pageContext.request.contextPath}/mgr/labstyle/list/all"><span class="text">
										实验室分类</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/mgr/labs/list/all"><span class="text">
										实验室列表</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/mgr/equip/list/all"><span class="text">
										设别管理</span></a></li>
                        </ul>
                    </li>
                    <li class="nav-parent"><a> <i class="fa fa-table"
                                                  aria-hidden="true"></i><span>课程系统</span>
                    </a>
                        <ul class="nav nav-children">
                            <li><a href="${pageContext.request.contextPath}/ShowAllUserServlet"><span class="text">
										课程管理</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/UserDeleteservlet"><span class="text">
										实验列表</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/UserUpdateServlet"><span class="text">
										项目管理</span></a></li>
                        </ul>
                    </li>
                    <li class="nav-parent"><a> <i class="fa fa-list-alt"
                                                  aria-hidden="true"></i><span>实验课程管理</span>
                    </a>
                        <ul class="nav nav-children">
                            <li><a href="${pageContext.request.contextPath}/GoodsShowAllServlet"><span class="text">
										所有货物</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/StockServlet"><span class="text">
										进货</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/OutServlet"><span class="text">
										出货</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/GoodsUpdateServlet"><span class="text">
										更新</span></a></li>
                        </ul>
                    </li>
                    <li class="nav-parent"><a> <i class="fa fa-list-alt"
                                                  aria-hidden="true"></i><span>用户权限管理</span>
                    </a>
                        <ul class="nav nav-children">
                            <li><a href="${pageContext.request.contextPath}/GoodsShowAllServlet"><span class="text">
										管理员</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/StockServlet"><span class="text">
										老师</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/OutServlet"><span class="text">
										学生</span></a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
        <!-- End Sidebar Menu-->
    </div>
    <!-- Sidebar Footer-->
    <div class="sidebar-footer">
        <div class="small-chart-visits">
            <div class="small-chart" id="sparklineLineVisits"></div>
            <div class="small-chart-info">
                <label>New Visits</label> <strong>70,79%</strong>
            </div>
            <script type="text/javascript">
                var sparklineLineVisitsData = [15, 16, 17, 19, 15, 25, 23, 35,
                    29, 15, 30, 45];
            </script>
        </div>
        <ul class="sidebar-terms bk-margin-top-10">
            <li><a href="#">Terms</a></li>
            <li><a href="#">Privacy</a></li>
            <li><a href="#">Help</a></li>
            <li><a href="#">About</a></li>
        </ul>
    </div>
    <!-- End Sidebar Footer-->
</div>
<!-- End Sidebar -->
