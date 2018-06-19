$(function () {
    layui.use('element', function(){
        var element = layui.element;
    });
    var params = {
        "corp_id":parseInt($(".corp_id").text()),
        "jurisdicte":parseInt($(".job_id").text())
    }
    //动态生成导航
    $.getJSON("/selJurisdict",$.param(params),function (data) {
        if(data == null){
            return;
        }
        var menu =[],menuO = [],menuT = [];
        $.each(data,function (i,item) {
            var menuObj = {
                "id"  :item.id,
                "name":item.name,
                "url" :item.url
            };
            removeRepeat(menu,menuObj);
            if(item.o_id != "" && item.o_id != null && item.o_id != "undefined"){
                var menuOObj = {
                    "p_id":item.id,
                    "id"  :item.o_id,
                    "name":item.o_name,
                    "url" :item.o_url
                };
                removeRepeat(menuO,menuOObj);
            }
            if(item.t_id != "" && item.t_id != null && item.t_id != "undefined"){
                var menuTObj = {
                    "p_id":item.o_id,
                    "id"  :item.t_id,
                    "name":item.t_name,
                    "url" :item.t_url
                };
                removeRepeat(menuT,menuTObj);
            }
        });
        var menuStr = "",menuOStr = "",menuTStr = "";
        //一级菜单
        $.each(menu,function (i,zitem) {
            menuStr = '<li class="layui-nav-item"><a href="javascript:void(0);" url = "' + zitem.url + '" target="mainFrame">' + zitem.name + '<span class="layui-nav-more"></span></a>';
            //二级菜单
            menuOStr = '<dl class="layui-nav-child layui-anim layui-anim-upbit">';
            $.each(menuO,function (i,oitem) {
                if(oitem.p_id == zitem.id){
                    menuOStr += '<dd><a href="javascript:void(0);" url = "'+oitem.url+'" target="mainFrame">' + oitem.name + '</a>';
                    //三级菜单
                    menuTStr = '<ul>';
                    $.each(menuT,function (i,titem) {
                        titem.p_id == oitem.id?menuTStr += '<li><a href="javascript:void(0);" url="' + titem.url + '">' + titem.name + '</a></li>':menuTStr +="";
                    });
                    menuTStr +='</ul>';
                    menuTStr.indexOf("li") > -1?menuOStr += menuTStr + "</dd>":menuTStr += "";
                }
                else{
                    menuOStr += "";
                }
            });
            menuOStr != ""?menuOStr += '</dl>':menuOStr = "";
            menuStr += menuOStr + '</li>';
            $("#menu").append(menuStr);
        });
        $("#menu").append('<span class="layui-nav-bar"></span>');
        //iframe网址跳转
        $("a").click(function () {
            var url = $(this).attr("url");
            if(url != "#")
                $("#mainFrame").attr("src",url);
        });
        menuCss();
    });
    //用户信息显示
    $(".userMsg").click(function () {
        layui.use('layer', function(){
            layer = layui.layer;
            var layer_id =layer.open({
                type: 1
                ,area: ['400px', '80%']
                ,skin: 'demo-class'
                , title:  ['基本资料']
                , offset: 'auto'
                , id: 1 //防止重复弹出
                , content: $(".user").html()
                , btnAlign: 'c' //按钮居中
                , shade: 0 //不显示遮罩
            });
            layer.style(layer_id,{
                "background": '#e0e0e0',
            });
        });
    });
    //修改密码
    $(".changePwd").click(function () {
        $(this).removeClass("layui-this");
        layui.use('layer', function(){
            layer = layui.layer;
            var layer_id =layer.open({
                type: 1
                ,title:"修改密码"
                ,offset: 'auto'
                ,id: 2 //防止重复弹出
                ,content: '<div style="padding: 20px 20px;">' +
                '<form>' +
                '<div>'+
                '<div style="padding: 5px;"><span class="userFont">旧密码：</span><input style="margin-left: 22px;height: 30px;" name="oldpwd" value="" type="password" placeholder="请输入旧密码"></div>'+
                '<div style="padding: 5px;"><span class="userFont">新密码：</span><input style="margin-left: 22px;height: 30px;" name="newpwd" value="" type="password" placeholder="请输入新密码"></div>'+
                '<div style="padding: 5px;"><span class="userFont">确认密码：</span><input style="margin-left: 8px;height: 30px;" name="againpwd" value="" type="password" placeholder="请输入确认密码"></div>'+
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
                        user_id:$(".user_id").text(),
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
    });
});

function menuCss() {
    $(".layui-nav-item").mouseover(function(){
        $(this).find(".layui-this").removeClass("layui-this");
        $(this).addClass("hover");
        $(this).children("dl").fadeIn(1);
        $(this).children("a").children("span").addClass("layui-nav-mored");
        $(this).parent("ul").children("span").css({"position": "absolute", "left": $(this).position().left+"px", "top": "55px", "width": $(this).width(), opacity: 1});
        //三级菜单位置
        $("dd").mouseover(function () {
            $(this).find("ul").css({"display":"block","left":($(this).parent("dl").width() + 2)+"px"});
        });
    });
    $(".layui-nav-item").mouseleave(function(){
        $(this).removeClass("hover");
        $(this).children("dl").fadeOut(100);
        $(this).children("a").children("span").removeClass("layui-nav-mored");
        $(this).parent("ul").children("span").css({"position": "relative", "left": $(this).position().left+"px", "top": "55px", "width": "0px", opacity: 0});
        $(".layui-this").removeClass(".layui-this");
        //三级菜单隐藏
        $("dd").mouseleave(function () {
            $(this).find("ul").css("display","none");
        });
    });
}
//数据去重
function removeRepeat(dataArr, item) {
    var flag = 0;
    if (dataArr.length == 0) {
        dataArr[0] = item;
    }
    else {
        $.each(dataArr, function (i) {
            //dataArr[i] == item ? function () { flag = 0; return; } : flag = 1;
            if (dataArr[i].id == item.id) {
                flag = 0;
                return false;
            }
            else
                flag = 1;
        });
        flag == 1 ? dataArr[dataArr.length] = item : 0;
    }
    return dataArr;
}