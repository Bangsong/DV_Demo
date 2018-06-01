package com.DV.controller;

import com.DV.dao.mapper.testMapper;
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
    private testMapper testMapper;
    @RequestMapping("selUser")
    public Map selUser(String user_name){
        return testMapper.selectUser(user_name);
    }
}
        