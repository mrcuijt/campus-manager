package com.cduestc.common.utils;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.List;

/**
 * @author admin
 * @description 支持加密配置文件
 * @date 2017-09-09 14:31
 */
public class DefualtPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
    private String[] propertyNames = {
             "jdbc.password", "jdbc.username"
    };

    public void setPropertyNames(String[] propertyNames) {
        this.propertyNames = propertyNames;
    }


    /**
     * 解密指定propertyName的加密属性值
     *
     * @param propertyName
     * @param propertyValue
     */
    @Override
    protected String convertProperty(String propertyName, String propertyValue) {
        for (String p : propertyNames) {
            if (p.equalsIgnoreCase(propertyName)) {
                return AESUtil.AESDecode(propertyValue);
            }
        }
        return super.convertProperty(propertyName, propertyValue);
    }
}
