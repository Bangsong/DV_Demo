package com.DV.controller;

import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping
    public String loginView(){
        return "home/login";
    }
    @RequestMapping("index")
    public String indexView(HttpServletRequest request){
        if(request.getSession().getAttribute("user_name") != null)
            return "home/index";
        else
            return "redirect:/";
    }
    @Autowired
    private homeService homeService;
    @RequestMapping("login")
    public String login(String user_id, String user_pwd, String validationCode, HttpServletRequest request,Model model){
        String  realCode = request.getSession().getAttribute("validation_code").toString().toUpperCase();
        if(!realCode.equals(validationCode.toUpperCase())){
            model.addAttribute("errmsg","验证码错误!");
            return "redirect:/";
        }
        String corp_alias = "";
        corp_alias = user_id.split("@")[1];
        user_id = user_id.split("@")[0];
        List<Map> result =  homeService.login(user_id,user_pwd,corp_alias);
        if(result != null){
            HttpSession session = request.getSession(true);
//            session.setAttribute("user_id",result.get("user_id"));
//            session.setAttribute("user_name",result.get("user_name"));
//            session.setAttribute("corp_id",result.get("corp_id"));
            return "redirect:/index";
        }
        else {
            model.addAttribute("errmsg","账号或密码错误!");
            return "redirect:/";
        }
    }
    @RequestMapping("loginOut")
    public String loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute("user_id");
        request.getSession().removeAttribute("user_name");
        request.getSession().removeAttribute("corp_id");
        return "redirect:/";
    }
}