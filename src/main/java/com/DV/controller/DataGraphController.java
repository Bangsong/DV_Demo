package com.DV.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/DataGrap")
public class DataGraphController {
    @RequestMapping("/demo")
    public String demo(){
        return "DataGraph/demo";
    }
}
