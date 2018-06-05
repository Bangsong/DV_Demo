<%--
  Created by IntelliJ IDEA.
  User: jmr
  Date: 2018/3/23
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/content/css/login.css" />
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
                        <input name="user_name" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="user_pwd" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
                    </div>
                    <div class="subPos"><input class="submit" type="submit" href="javascript:;" style="color: #FFFFFF" value="登录"/></div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/content/js/login.js"></script>
<script src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("input[name=user_name]").focus();
        $(".submit").click(function () {
            if(userCheck()){
                $("form").action("/login");
            }
            else{
                return false;
            }
        });
    });
    <%--登录前验证--%>
    function userCheck() {
        if($("input[name=user_name]").val() == null || $("input[name=user_name]").val() == ""){
            alert("用户名不能为空");
            $("input[name=user_name]").focus();
            return false;
        }
        if($("input[name=user_pwd]").val() == null || $("input[name=user_pwd]").val() == ""){
            alert("密码不能为空");
            $("input[name=user_pwd]").focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>
