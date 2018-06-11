package com.DV.controller;

import com.DV.service.dataGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/DataGraph/")
public class DataGraphController {
    @Autowired
    private dataGraphService dataGraphService;

    @RequestMapping("demo")
    public String demo(){
        return "DataGraph/demo";
    }

    @RequestMapping("echartSet")
    @ResponseBody
    public List<Map> echartSet(String corp_id, String type){
        List<Map>  result = dataGraphService.echartSet(corp_id, type);
        return result;
    }
}
