package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

public interface homeMapper {
    Integer login(@Param("user_name") String user_name,@Param("user_pwd") String user_pwd);
}
