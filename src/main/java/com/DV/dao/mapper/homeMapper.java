package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface homeMapper {
    List<Map> login(@Param("user_id") String user_id, @Param("user_pwd") String user_pwd, @Param("alias") String corp_alias);
}
