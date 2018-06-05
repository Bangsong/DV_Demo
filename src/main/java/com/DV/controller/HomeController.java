package com.DV.controller;

import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping
    public String loginView(){
        return "home/login";
    }
    @RequestMapping("/index")
    public String indexView(){
        return "home/index";
    }

    @Autowired
    private homeService homeService;
    @RequestMapping("login")
    @ResponseBody
    public Integer selUser(String user_name, String user_pwd, Model model){
        if(user_name.equals("")||user_pwd.equals("")){
            model.addAttribute("data","账号或密码不能为空!");
        }
        Integer result =  homeService.login(user_name,user_pwd);
        if(result == 1){
            model.addAttribute("user_name",user_name);
        }
        return result;
    }
}
        