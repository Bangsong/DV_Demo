<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/content/images/ico.ico" type="image/x-icon" />
    <style type="text/css">
        .layui-nav .layui-nav-child dd:hover ul{
            display:block;
            position:absolute;
            top:0px;
            left:125px;
            background:#ddd;
            box-shadow:0 2px 4px rgba(0,0,0,.12);
            broder:1px solid #d2d2d2;
            border-radius:2px;}
        .layui-nav .layui-nav-child dd ul{display:none;}
        .layui-nav .layui-nav-child dd ul a:hover{background:#F0F0F0;}
        .btnc{margin:5px 5px;}
        .errmsg{text-align: center;color: #ff0000;font-weight: bold;}
    </style>
</head>
<%
    String user_id = session.getAttribute("user_id").toString();
    String user_name = session.getAttribute("user_name").toString();
    Integer corp_id = (Integer)session.getAttribute("corp_id");
    String c_name = session.getAttribute("c_name").toString();
    Integer jurisdict = (Integer)session.getAttribute("jurisdicte");
%>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">新系统</div>
        <div class="beg-layout-main beg-layout-side-toggle">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" id="menu">
            <%--<li class="layui-nav-item">--%>
                <%--<a href="">系统管理</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd>--%>
                        <%--<a href="">参数设置</a>--%>
                        <%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据定义</a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据查询</a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据维护</a></li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                    <%--</dd>--%>
                    <%--<dd>--%>
                        <%--<a href="">人员角色设置</a>--%>
                        <%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据定义</a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据查询</a></li>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<li><a href="">元数据维护</a></li>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                    <%--</dd>--%>
                    <%--<dd><a href="">员工信息设置</a></dd>--%>
                    <%--<dd><a href="">角色设置</a></dd>--%>
                    <%--<dd><a href="">黄牛拦截名单</a></dd>--%>
                    <%--<dd><a href="">发展人管理</a></dd>--%>
                    <%--<dd><a href="">订单配置</a></dd>--%>
                    <%--<dd><a href="">提交结果设置</a></dd>--%>
                    <%--<dd><a href="">营销脚本设置</a></dd>--%>
                    <%--<dd><a href="">套餐管理资费</a></dd>--%>
                <%--</dl>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item">--%>
                <%--<a href="">订单管理</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="">订单查询</a></dd>--%>
                <%--</dl>--%>
            <%--</li>--%>
            <%--<li class="layui-nav-item"><a href="">回访管理</a></li>--%>
            <%--<li class="layui-nav-item"><a href="">报表管理</a>--%>
                <%--<dl class="layui-nav-child">--%>
                    <%--<dd><a href="${pageContext.request.contextPath}/Report/Test">石家庄全景图</a></dd>--%>
                <%--</dl></li>--%>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/content/images/user.jpg" class="layui-nav-img">
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

    <%--<div class="layui-body" style="left:-0.5%">--%>
        <%--<!-- 内容主体区域 -->--%>
        <%--<div style="padding: 15px;">内容主体区域</div>--%>
    <%--</div>--%>

    <div class="layui-footer"style="left:-0.5%;text-align: center">
        <!-- 底部固定区域 -->
        © 2018 万能的小明
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/layui/layui.js"></script>
<link href="${pageContext.request.contextPath}/content/layui/css/layui.css" rel="stylesheet" type="text/css"/>
<script>
    $(function () {
        layui.use('element', function(){
            var element = layui.element;
        });
        var params = {
            "corp_id":<%=corp_id%>,
            "jurisdicte":<%=jurisdict%>
        }
        $.getJSON("/selJurisdict",$.param(params),function (data) {
            if(data == null){
                return;
            }
            $.each(data,function (i,item) {
               if(item.p_id == 0){
                  var menu= '<li class="layui-nav-item" id="menuli_'+item.id+'"><a href="'+item.url+'">' + item.name + '</a></li>';
                  $("#menu").append(menu);
               }
               else{
                   var menu = '<dd id="menudd_'+item.id+'"><a href="'+item.url+'">' + item.name + '</a></dd>';
                   $("#menuli_"+item.p_id).append(menu);
               }
            });
        });
        <%--修改密码--%>
        $(".changePwd").click(function () {
            $(this).removeClass("layui-this");
            layui.use('layer', function(){
                layer = layui.layer;
                var layer_id =layer.open({
                    type: 1
                    ,title:"修改密码"
                    ,offset: 'auto'
                    ,id: 1 //防止重复弹出
                    ,content: '<div style="padding: 20px 20px;font-weight: bold;">' +
                    '<form>' +
                    '<div>'+
                    '<div style="padding: 5px;">旧密码：<input style="margin-left: 22px;height: 30px;" name="oldpwd" value="" type="password" placeholder="请输入旧密码"></div>'+
                    '<div style="padding: 5px;">新密码：<input style="margin-left: 22px;height: 30px;" name="newpwd" value="" type="password" placeholder="请输入新密码"></div>'+
                    '<div style="padding: 5px;">确认密码：<input style="margin-left: 8px;height: 30px;" name="againpwd" value="" type="password" placeholder="请输入确认密码"></div>'+
                    '</div>' +
                    '</form>'+
                    '<div class="errmsg"></div>'+
                    '</div>'
                    ,btn: '确认修改'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        if($("input[name=oldpwd]").val() == $("input[name=newpwd]").val()){
                            $(".errmsg").text("旧密码与新密码一致，请输入新的密码");
                            return;
                        }
                        if($("input[name=newpwd]").val() != $("input[name=againpwd]").val()){
                            $(".errmsg").text("确认密码与新密码不一致");
                            return;
                        }
                        var params = {
                            user_id:"<%=user_id%>",
                            oldpwd:$("input[name=oldpwd]").val(),
                            newpwd:$("input[name=newpwd]").val(),
                        };
                        $.post("/changePwd",params,function (data) {
                            switch(data){
                                case -1:
                                    layer.msg("原密码错误！",{
                                        time: 2000,
                                        success:function () {
                                            $("input[name=oldpwd]").val("");
                                        }
                                    });
                                    break;
                                case 0:
                                    layer.msg("密码修改失败：未知错误！",{
                                        time: 2000,
                                        success:function () {
                                            $("input[name=oldpwd]").val("");
                                            $("input[name=newpwd]").val("");
                                            $("input[name=againpwd]").val("");
                                        }
                                    });
                                    break;
                                case 1:
                                    layer.msg("密码修改成功！",{
                                        time: 1000,
                                        success:function () {
                                            layer.close(layer_id);
                                        }
                                    });
                                    break;
                            }
                        });
                    }
                });
            });
        })
    });
</script>
</body>
</html>
