<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新系统</title>
    <meta name="viewport" content="width=device-width,initial-scale=1, maximum-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link href="${pageContext.request.contextPath}/content/layui/css/layui.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/content/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <a href="javascript:void(0);" url="/welCome" class="layui-logo" style="font-weight: bold;font-size: 2em">新系统</a>
        <div class="beg-layout-main beg-layout-side-toggle">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" id="menu">
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}${sessionScope.user_hp}"  class="layui-nav-img">
                    ${sessionScope.user_name}
                </a>
                <dl class="layui-nav-child" id="userInfo">
                    <dd class="userMsg" ><a href="#">基本资料</a></dd>
                    <dd class="changePwd" ><a href="#">修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/loginOut">退出</a></li>
        </ul>
    </div>
    <%--<div class="layui-side layui-bg-black">--%>
        <%--<div class="layui-side-scroll">--%>
            <%--<!-- 左侧导航区域（可配合layui已有的垂直导航） -->--%>
            <%--<ul class="layui-nav layui-nav-tree"  lay-filter="test">--%>
                <%--<li class="layui-nav-item layui-nav-itemed">--%>
                    <%--<a class="" href="javascript:;">所有商品</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表三</a></dd>--%>
                        <%--<dd><a href="">超链接</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">解决方案</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:;">列表一</a></dd>--%>
                        <%--<dd><a href="javascript:;">列表二</a></dd>--%>
                        <%--<dd><a href="">超链接</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>

    <div class="layui-body">
            <iframe src="/welCome" frameborder="0" id="mainFrame" name="mainFrame" style=" border:none;width: 100%;height: 100%;"></iframe>
    </div>

    <div class="layui-footer"style="left:-0.5%;text-align: center">
        <!-- 底部固定区域 -->
        © 2018 万能的小明
    </div>

    <%-- 修改密码 --%>
    <div class="layui-container user" style="display: none;">
        <div class="layui-row">
            <div class="layui-col-xs4 layui-col-md-offset4 userdivLogo">
                <hr style="height:3px;border:none;border-top:2px solid black;" />
                <img class="layui-nav-img" src="${pageContext.request.contextPath}${sessionScope.user_hp}" alt="userlogo"><span class="userFont">${sessionScope.user_name}</span>
                <hr style="height:3px;border:none;border-top:2px solid black;" />
            </div>
        </div>
        <div class="layui-row userdiv">
            <div class="layui-col-xs4">
                <div>
                    <span>账号：<span class="userFont user_id">${sessionScope.user_id}</span></span>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div>
                    <span>姓名：<span class="userFont">${sessionScope.user_name}</span></span>
                </div>
            </div>
        </div>
        <div class="layui-row userdiv">
            <div class="layui-col-xs4">
                <div>
                    <span>性别：<span class="userFont">${sessionScope.sex}</span></span>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div>
                    <span>电话：<span class="userFont">${sessionScope.tel}</span></span>
                </div>
            </div>
        </div>
        <div class="layui-row userdiv">
            <div class="layui-col-xs4">
                <div>
                    <span>年龄：<span class="userFont">${sessionScope.age}</span></span>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div>
                    <span>生日：<span class="userFont">${sessionScope.birthday}</span></span>
                </div>
            </div>
        </div>
        <div class="layui-row">
            <div class="userdiv" style="display: none;">
                <span>公司ID：<span class="userFont corp_id">${sessionScope.corp_id}</span></span>
            </div>
            <div class="userdiv">
                <span>公司名：<span class="userFont">${sessionScope.c_name}</span></span>
            </div>
        </div>
        <div class="layui-row">
            <div class="userdiv">
                <span>公司地址：<span class="userFont">${sessionScope.address}</span></span>
            </div>
        </div>
        <div class="layui-row userdiv">
            <div class="layui-col-xs4">
                <div>
                    <span>部门：<span class="userFont">${sessionScope.d_name}</span></span>
                </div>
            </div>
            <div class="layui-col-xs4" style="display: none">
                <div>
                    <span>职位ID：<span class="userFont job_id">${sessionScope.job_id}</span></span>
                </div>
            </div>
            <div class="layui-col-xs4">
                <div>
                    <span>职位：<span class="userFont">${sessionScope.j_name}</span></span>
                </div>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/home/index.js"></script>
</body>
</html>
