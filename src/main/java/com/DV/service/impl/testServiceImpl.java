package com.DV.service.impl;

import com.DV.dao.mapper.testMapper;
import com.DV.service.testService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class testServiceImpl implements testService {
    @Autowired
    private testMapper testMapper;

    @Override
    public List<Map> selectUser(String user_name){
        return testMapper.selectUser(user_name);
    }
}
