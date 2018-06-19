/*
* 使用echarts动态生成各种图表
* */

function echartSet(params) {
    var option = {};
    $.ajaxSettings.async = false;//同步请求
    $.getJSON("/DataGraph/echartSet",$.param(params),function (data) {
        option.series = [];
        $.each(data,function (i,item) {
            if(i == 0){
                item.title_text !=""?option.title = {text:item.title_text}:0;
                item.title_link !=""?option.title.link = item.title_link:0;
                item.title_target !=""?option.target = item.title_target:0;
                item.title_subtext !=""?option.title.subtext = item.title_subtext:0;
                item.title_sublink !=""?option.title.sublink = item.title_sublink:0;
                item.title_subtarget !=""?option.title.subtarget = item.title_subtarget:0;
                item.title_padding !=""?option.title.padding = item.title_padding:0;
                item.title_itemgap !=""?option.title.itemGap = item.title_itemgap:0;
                item.title_left !=""?option.title.left = item.title_left:0;
                item.title_top !=""?option.title.top = item.title_top:0;
                item.title_right !=""?option.title.right = item.title_right:0;
                item.title_bottom !=""?option.title.bottom = item.title_bottom:0;
                item.backgroundcolor !=""?option.title.backgroundColor = item.backgroundcolor:0;

                var l_dataArr = item.legend_data.split(',');
                item.legend_data !="" && l_dataArr.length > 0?option.legend = {data:l_dataArr}:0;
                item.tooltip_trigger != ""?option.tooltip = {trigger:item.tooltip_trigger}:0;
                var x_dataArr = item.x_data.split(',');
                item.x_type !="" && x_dataArr.length > 0?option.xAxis = {type:item.x_type,data:x_dataArr}:0;
                item.y_type !=""?option.yAxis = {type:item.y_type}:0;

            }
            var s_dataArr = item.series_data_value.split(',');
            var series_smooth =  item.series_smooth !="" && item.series_smooth != undefined? item.series_smooth:false;
            item.e_type !="" && item.e_type != undefined && s_dataArr.length > 0?option.series.push({type:$.trim(item.e_type),name:item.series_data_mame,data:s_dataArr,smooth:series_smooth}):0;
            switch(item.e_type){
                case "line":
                    item.areaStyle_color != "" && item.areaStyle_color != undefined?option.series[i].areaStyle = {color:item.areaStyle_color}:0;
                    break;
                case "bar":
                    break;
                case "pie":
                    break;
                case "scatter":
                    break;
                case "map":
                    break;
                case "candlestick":
                    break;
                case "radar":
                    break;
            };
        });
    });
    return option;
}
