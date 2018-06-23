package com.DV.service;

import com.DV.entity.DataSource;

import java.util.List;
import java.util.Map;

public interface dataGraphService {
    @DataSource("Echarts")
    List<Map> echartSet(String corp_id, String type);
    @DataSource("Echarts")
    List<Map> test();
}
