package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface testMapper {
    Map selectUser(@Param("user_name") String user_name);
}
