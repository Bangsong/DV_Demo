/*
* 使用echarts动态生成各种图表
* */
$(function () {
    demo();
})
function demo() {
    var params = {
        "corp_id":1,
        "type":"line"
    }
    $.getJSON("/DataGraph/echartSet",$.param(params),function (dataS) {
        $.each(dataS,function (i,item) {
            var xAxisData = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
            var seriesData = [820, 932, 901, 934, 1290, 1330, 1320];
            var option ={};
            item.text !=""?option.title = {text:item.text}:0;
            var x_dataArr = item.x_data.split(',');
            item.x_type !="" && x_dataArr.length > 0?option.xAxis = {type:item.x_type,data:x_dataArr}:0;
            item.y_type !=""?option.yAxis = {type:item.y_type}:0;
            var s_dataArr = item.s_data.split(',');
            item.s_tpye !="" && s_dataArr.length > 0?option.series = {type:$.trim(item.s_tpye),data:s_dataArr}:0;

            // option = {
            //     title:{
            //         text:"测试"
            //     },
            //     xAxis: {
            //         type: 'category',
            //         data: xAxisData
            //     },
            //     yAxis: {
            //         type: 'value'
            //     },
            //     series: [{
            //         data: seriesData,
            //         type: 'line'
            //     }]
            // };
            myChart = echarts.init(document.getElementById('bar'));
            myChart.setOption(option);
        });
    });
}

function test() {
    option = {
        title: {
            text: '特性示例：渐变色 阴影 点击缩放',
            subtext: 'Feature Sample: Gradient Color, Shadow, Click Zoom'
        },
        xAxis: {
            data: dataAxis,
            axisLabel: {
                inside: true,
                textStyle: {
                    color: '#fff'
                }
            },
            axisTick: {
                show: false
            },
            axisLine: {
                show: false
            },
            z: 10
        },
        yAxis: {
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: '#999'
                }
            }
        },
        dataZoom: [
            {
                type: 'inside'
            }
        ],
        series: [{type: 'bar',itemStyle: {normal: {color: 'rgba(0,0,0,0.05)'}},barGap:'-100%',barCategoryGap:'40%',data: dataShadow,animation: false},{type: 'bar',itemStyle: {normal: {color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{offset: 0, color: '#83bff6'},{offset: 0.5, color: '#188df0'},{offset: 1, color: '#188df0'}])},emphasis: {color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{offset: 0, color: '#2378f7'},{offset: 0.7, color: '#2378f7'}, {offset: 1, color: '#83bff6'}])}},data: data}]
    };
    myChart = echarts.init(document.getElementById('bar'));
    myChart.setOption(option);
}
