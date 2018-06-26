package com.DV.controller;

import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping
    public String loginView(){
        return "home/login";
    }
    @RequestMapping("welCome")
    public String welComeView(){
        return "welCome";
    }
    @RequestMapping("index")
    public String indexView(HttpServletRequest request){
        //通过request.getSession().getAttributeNames()获取枚举类型的值，hasMoreElements判断枚举值是否存在
        //若为false则表示session失效
        if(request.getSession().getAttributeNames().hasMoreElements())
            return "home/index";
        else
            return "redirect:/";
    }
    @Autowired
    private homeService homeService;
    @PostMapping("login")
    public String login(String user_id, String user_pwd, String validationCode, String RF, HttpServletRequest request,Model model){
        String RFS = request.getSession().getAttribute("RFS").toString();
        //判断是否为刷新操作，刷新则重定向
        if(RF.equals(RFS)){
            String  realCode = request.getSession().getAttribute("validation_code").toString().toUpperCase();
            request.getSession().removeAttribute("validation_code");//清除验证码
            if(!realCode.equals(validationCode.toUpperCase())){
                model.addAttribute("errmsg","验证码错误!");
                return "home/login";
            }
            String corp_alias = "";
            corp_alias = user_id.split("@")[1];
            user_id = user_id.split("@")[0];
            Map result =  homeService.login(user_id,user_pwd,corp_alias);
            if(result != null){
                Integer loginStatus = 0;
                do {
                    loginStatus = homeService.updateLoginStatus(user_id,1);
                }while (loginStatus == 0);
                HttpSession session = request.getSession(true);
                session.setAttribute("user_id",result.get("user_id"));
                session.setAttribute("user_name",result.get("user_name"));
                session.setAttribute("user_hp",result.get("user_hp"));
                session.setAttribute("sex",result.get("sex"));
                session.setAttribute("c_name",result.get("c_name"));
                session.setAttribute("age",result.get("age"));
                session.setAttribute("birthday",result.get("birthday"));
                session.setAttribute("tel",result.get("tel"));
                session.setAttribute("corp_id",result.get("corp_id"));
                session.setAttribute("c_name",result.get("c_name"));
                session.setAttribute("address",result.get("address"));
                session.setAttribute("job_id",result.get("job_id"));
                session.setAttribute("d_name",result.get("d_name"));
                session.setAttribute("j_name",result.get("j_name"));
                return "redirect:/index";
            }
            else {
                model.addAttribute("errmsg","账号或密码错误!");
                return "home/login";
            }
        }
        else{
            return "redirect:/";
        }

    }
    @RequestMapping("loginOut")
    public String loginOut(HttpServletRequest request) {
        try{
            String user_id = request.getSession().getAttribute("user_id").toString();
            Integer loginStatus = 0;
            do {
                loginStatus = homeService.updateLoginStatus(user_id,0);
            }while (loginStatus == 0);
            //清空session
            request.getSession().invalidate();
            return "redirect:/";
        }catch(Exception e){
            return "redirect:/";
        }
    }

    @RequestMapping("selJurisdict")
    @ResponseBody
    public List<Map> selJurisdict(Integer corp_id, Integer jurisdicte){
        List<Map>  result = homeService.selJurisdict(corp_id,jurisdicte);
        return result;
    }

    @RequestMapping("changePwd")
    @ResponseBody
    public Integer changePwd(String user_id, String oldpwd, String newpwd){
        Integer  result = homeService.userExist(user_id,oldpwd);
        if(result == 1){
            result = homeService.updatePwd(user_id, oldpwd, newpwd);
        }
        else
            result = -1;
        return result;
    }
}