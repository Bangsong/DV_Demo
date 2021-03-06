package com.DV.service.impl;

import com.DV.dao.mapper.dataGraphMapper;
import com.DV.service.dataGraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class dataGraphServiceImpl implements dataGraphService{
    @Autowired
    private dataGraphMapper dataGraphMapper;
    @Override
    public List<Map> echartSet(String corp_id, String type){
        return dataGraphMapper.echartSet(corp_id, type);
    }

    @Override
    public List<Map> test(){
        return dataGraphMapper.test();
    }
}
