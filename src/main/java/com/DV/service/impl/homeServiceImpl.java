package com.DV.service.impl;

import com.DV.dao.mapper.homeMapper;
import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class homeServiceImpl implements homeService {

    @Autowired
    private homeMapper homeMapper;
    @Override
    public List<Map> login(String user_id, String user_pwd, String corp_alias){
        return homeMapper.login(user_id, user_pwd, corp_alias);
    }
}
