package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface homeMapper {
    Map login(@Param("user_id") String user_id, @Param("user_pwd") String user_pwd);
}
