<%--
  Created by IntelliJ IDEA.
  User: 万能的小明
  Date: 2018/6/9
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据可视化Demo</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/content/layui/css/layui.css">
    <style>
        .divHeight{
            height: 600px;
            width: 600px;
        }
    </style>
</head>
<body>

<div>
    <div class="layui-row">
        <div class="layui-col-xs4">
            <div id="bar" class="divHeight"></div>
        </div>
        <div class="layui-col-xs4">
            <div id="line" class="divHeight"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/echarts/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/content/js/echarts/DataGraph.js"></script>
<script type="text/javascript">
    $(function () {
        var paramsBar = {
            "corp_id":1,
            "type":"bar"
        }
        var optionBar = echartSet(paramsBar);
        myChartBar = echarts.init(document.getElementById('bar'));
        myChartBar.setOption(optionBar);
        var paramsLine = {
            "corp_id":1,
            "type":"line"
        }
        var optionLine = echartSet(paramsLine);
        myChartLine = echarts.init(document.getElementById('line'));
        myChartLine.setOption(optionLine);
    });
</script>
</body>
</html>
