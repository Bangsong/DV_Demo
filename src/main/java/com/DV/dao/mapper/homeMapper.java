package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface homeMapper {
    Map login(@Param("user_id") String user_id, @Param("user_pwd") String user_pwd, @Param("alias") String corp_alias);
    Integer updateLoginStatus(@Param("user_id") String user_id, @Param("login_status") Integer login_status);
    List<Map> selJurisdict(@Param("corp_id") Integer corp_id, @Param("jurisdicte") Integer jurisdicte);
    Integer userExist(@Param("user_id") String user_id,@Param("oldpwd") String oldpwd);
    Integer updatePwd(@Param("user_id") String user_id,@Param("oldpwd") String oldpwd,@Param("newpwd") String newpwd);
}
