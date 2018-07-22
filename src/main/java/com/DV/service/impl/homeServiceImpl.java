package com.DV.service.impl;

import com.DV.dao.mapper.homeMapper;
import com.DV.service.homeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class homeServiceImpl implements homeService {

    @Autowired
    private homeMapper homeMapper;
    @Override
    public Map login(String user_id, String user_pwd, String corp_alias){
        return homeMapper.login(user_id, user_pwd, corp_alias);
    }
    @Override
    public Integer updateLoginStatus(String user_id, Integer corp_id, Integer login_status){
        return homeMapper.updateLoginStatus(user_id, corp_id, login_status);
    }
    @Override
    public List<Map> selJurisdict(Integer corp_id, Integer jurisdicte){
        return homeMapper.selJurisdict(corp_id, jurisdicte);
    }
    @Override
    public Integer updatePwd(String user_id, Integer corp_id, String oldpwd, String newpwd){
        return homeMapper.updatePwd(user_id, corp_id, oldpwd, newpwd);
    }
    @Override
    public Integer userExist(String user_id, Integer corp_id, String oldpwd){
        return homeMapper.userExist(user_id, corp_id, oldpwd);
    }
}
