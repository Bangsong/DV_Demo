package com.DV.entity;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
    public static final ThreadLocal<String> holder = new ThreadLocal<String>();
    //设置数据源
    public static void setDataSource(String datasource) {
        holder.set(datasource);
    }
    //获取数据源
    private String getDataSource() {
        return holder.get();
    }
    //清除数据源
    public static void clearDataSource() {
        holder.remove();
    }
    @Override
    protected Object determineCurrentLookupKey() {
        return getDataSource();
    }
}
