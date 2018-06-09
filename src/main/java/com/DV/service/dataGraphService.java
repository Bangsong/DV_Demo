package com.DV.service;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public interface dataGraphService {
    List<Map> echartSet(String type);
}
