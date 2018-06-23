package com.DV.service;

import java.util.List;
import java.util.Map;

public interface dataGraphService {
    List<Map> echartSet(String corp_id, String type);
    List<Map> test();
}
