package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface testMapper {
    List<Map> selectUser(@Param("user_name") String user_name);
}
