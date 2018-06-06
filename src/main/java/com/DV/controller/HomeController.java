package com.DV.controller;

import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
        return "home/index";
    }

    @Autowired
    private homeService homeService;
    @RequestMapping("login")
    public String selUser(String user_id, String user_pwd, String validationCode, HttpServletRequest request,Model model){
        String  realCode = request.getSession().getAttribute("validation_code").toString().toUpperCase();
        if(!realCode.equals(validationCode.toUpperCase())){
            model.addAttribute("errmsg","验证码错误!");
            return "forward:/";
        }
        Map result =  homeService.login(user_id,user_pwd);
        if(result != null){
            HttpSession session = request.getSession(true);
            session.setAttribute("user_name",user_id);
            return "forward:/index";
        }
        else {
            model.addAttribute("errmsg","账号或密码错误!");
            return "forward:/";
        }
    }
}
        