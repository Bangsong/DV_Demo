package com.DV.service.impl;

import com.DV.dao.mapper.dataGraphMapper;
import com.DV.service.dataGraphService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class dataGraphServiceImpl implements dataGraphService{
    @Autowired
    private dataGraphMapper dataGraphMapper;
    @Override
    public List<Map> echartSet(String type){
        return dataGraphMapper.echartSet(type);
    }
}
