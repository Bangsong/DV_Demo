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
        optionBar.legend.data = ['邮件营销','联盟广告','视频广告','直接访问','搜索引擎'];
        optionBar.xAxis.data = ['周一','周二','周三','周四','周五','周六','周日'];
        optionBar.series = [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
                areaStyle: {normal: {}},
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ];
        myChartBar = echarts.init(document.getElementById('bar'));
        myChartBar.setOption(optionBar);
        var paramsLine = {
            "corp_id":1,
            "type":"line"
        }
        var optionLine = echartSet(paramsLine);
        optionLine.legend.data = ['邮件营销','联盟广告','视频广告','直接访问','搜索引擎'];
        optionLine.xAxis.data = ['周一','周二','周三','周四','周五','周六','周日'];
        optionLine.series = [
            {
                name:'邮件营销',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'联盟广告',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'视频广告',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'直接访问',
                type:'line',
                stack: '总量',
                areaStyle: {normal: {}},
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'搜索引擎',
                type:'line',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'top'
                    }
                },
                areaStyle: {normal: {}},
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ];
        myChartLine = echarts.init(document.getElementById('line'));
        myChartLine.setOption(optionLine);
    });
</script>
</body>
</html>
