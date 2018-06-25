<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jmr
  Date: 2018/3/23
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*"%>
<% String RF = Double.toString(Math.random());session.setAttribute("RFS",RF);%>
<html>
<head>
    <title>登录</title>
    <link rel="icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/content/css/login.css?ver=<%=Math.random()%>" />
</head>
<body>
<div class="container main">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="canvas"></canvas>
            <div class="logo_box">
                <h3 style="font-size: 25px;font-weight: bold;">新系统</h3>
                <form action="/login" name="form" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="user_id" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账号">
                    </div>
                    <div class="input_outer">
                        <span class="u_pwd"></span>
                        <input name="user_pwd" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div class = "input_outer">
                        <span class="u_code"></span>
                        <input name = "validationCode" type = "text" class="code_text" style="color: #FFFFFF !important; position:absolute; z-index:100;" placeholder="请输入验证码"/>
                        <img class = "validationCode_img" src="/validationCode">
                    </div>
                    <div class="errmsg" style="color: red;">${errmsg}</div>
                    <input type="hidden" name="RF" value="<%=RF%>">
                    <div class="subPos"><input class="submit" type="submit" href="javascript:;" style="color: #FFFFFF" value="登录"/></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/content/js/home/login.js?ver=<%=Math.random()%>"></script>
</body>
</html>
