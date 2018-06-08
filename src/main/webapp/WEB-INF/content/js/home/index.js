$(function () {
    layui.use('element', function(){
        var element = layui.element;
    });
    var params = {
        "corp_id":parseInt($(".corp_id").text()),
        "jurisdicte":parseInt($(".job_id").text())
    }
    $.getJSON("/selJurisdict",$.param(params),function (data) {
        if(data == null){
            return;
        }

        $.each(data,function (i,item) {
            if(item.p_id == 0){
                var menu_li= '<li class="layui-nav-item"><a href="'+item.url+'">' + item.name + '<span class="layui-nav-more"></span></a><dl class="layui-nav-child layui-anim layui-anim-upbit" id="menudl_'+item.id+'"></dl></li>';
                $("#menu").append(menu_li);
            }
            else{
                var menu_dl = '<dd id="menudd_'+item.id+'"><a href="'+item.url+'">' + item.name + '</a></dd></dl>';
                $("#menudl_"+item.p_id).append(menu_dl);
            }
        });
        $("#menu").append('<span class="layui-nav-bar"></span>');
        menuCss();
    });
    $(".userMsg").click(function () {
        $(this).removeClass("layui-this");
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
    })
});

function menuCss() {
    $(".layui-nav-item").mouseover(function(){
        $(this).addClass("hover");
        $(this).children("dl").fadeIn(1);
        $(this).children("a").children("span").addClass("layui-nav-mored");
        $(this).parent("ul").children("span").css({"position": "absolute", "left": $(this).position().left+"px", "top": "55px", "width": $(this).width(), opacity: 1});
    });
    $(".layui-nav-item").mouseleave(function(){
        $(this).removeClass("hover");
        $(this).children("dl").fadeOut(10);
        // $(this).children("dl").removeClass("layui-show");
        $(this).children("a").children("span").removeClass("layui-nav-mored");
        $(this).parent("ul").children("span").css({"position": "relative", "left": $(this).position().left+"px", "top": "55px", "width": "0px", opacity: 0});
    });
}