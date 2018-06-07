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
    public Map login(String user_id, String user_pwd, String corp_alias){
        return homeMapper.login(user_id, user_pwd, corp_alias);
    }
    @Override
    public List<Map> selJurisdict(Integer corp_id, Integer jurisdicte){
        return homeMapper.selJurisdict(corp_id, jurisdicte);
    }
    @Override
    public Integer updatePwd(String user_id, String oldpwd, String newpwd){
        return homeMapper.updatePwd(user_id, oldpwd, newpwd);
    }
    @Override
    public Integer userExist(String user_id, String oldpwd){
        return homeMapper.userExist(user_id, oldpwd);
    }
}
