package com.DV.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface dataGraphMapper {
    List<Map> echartSet(@Param("type") String type);
}
