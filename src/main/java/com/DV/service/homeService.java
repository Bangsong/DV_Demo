package com.DV.service;

import java.util.List;
import java.util.Map;

public interface homeService {
    Map login(String user_id, String user_pwd, String corp_alias);
    List<Map> selJurisdict(Integer corp_id, Integer jurisdicte);
    Integer updateLoginStatus(String user_id, Integer corp_id, Integer login_status);
    Integer userExist(String user_id, Integer corp_id, String oldpwd);
    Integer updatePwd(String user_id, Integer corp_id, String oldpwd, String newpwd);
}
