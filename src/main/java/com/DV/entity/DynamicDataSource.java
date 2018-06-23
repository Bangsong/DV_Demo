package com.DV.entity;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
    public static final ThreadLocal<String> holder = new ThreadLocal<String>();
    public static void setDataSource(String datasource) {
        holder.set(datasource);
    }

    private String getDataSource() {
        return holder.get();
    }
    @Override
    protected Object determineCurrentLookupKey() {
        return getDataSource();
    }
}
