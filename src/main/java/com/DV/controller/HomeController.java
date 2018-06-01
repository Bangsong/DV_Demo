package com.DV.controller;

import com.DV.service.testService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/")
public class HomeController {
    @RequestMapping
    public String indexView(){
        return "home/index";
    }

    @Autowired
    private testService testService;
    @RequestMapping("selUser")
    public Map selUser(String user_name){
        return testService.selectUser(user_name);
    }
}
        