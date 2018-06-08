<%--
  Created by IntelliJ IDEA.
  User: 万能的小明
  Date: 2018/6/8
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>欢迎页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/content/css/onepage-scroll.css" />
    <style>
        .page1 { background-color: #1bbc9b;}
        .page2 { background-color: #FF7F50;}
        .page3 { background-color: #4BBFC3;}
        .page4 { background-color: #f90;}
        p.title { position: relative; top: 35%; font: 700 40px "Microsoft Yahei"; color: #fff; text-align: center;}
    </style>
    <script src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/content/js/jquery.onepage-scroll.js"></script>
    <script>
        $(function(){
            $('.main').onepage_scroll({
                sectionContainer: '.page',
//                pagination: false
            });
        });
    </script>
</head>
<body>
<div class="main">
    <div class="page page1">
        <p class="title">第一屏</p>
    </div>
    <div class="page page2">
        <p class="title">第二屏</p>
    </div>
    <div class="page page3">
        <p class="title">第三屏</p>
    </div>
    <div class="page page4">
        <p class="title">第四屏</p>
    </div>
</div>
</body>
</html>
