package com.DV.service.impl;

import com.DV.dao.mapper.homeMapper;
import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;

public class homeServiceImpl implements homeService {

    @Autowired
    private homeMapper homeMapper;
    @Override
    public Integer login(String user_name,String user_pwd){
        return homeMapper.login(user_name, user_pwd);
    }
}
