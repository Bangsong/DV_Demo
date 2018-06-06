package com.DV.service;

import java.util.List;
import java.util.Map;

public interface homeService {
    List<Map> login(String user_id, String user_pwd, String corp_alias);
}
