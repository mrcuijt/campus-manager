package com.cduestc.common.utils;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;

/**
 * @author admin
 * @description
 * @date 2017-09-14 15:13
 */
public final class JsonUtils {
    private static ObjectMapper INSTANCE = new JackSonHolder();

    private JsonUtils() {

    }

    /**
     * <p>
     * 将对象序列化成json字符串<p/>
     *
     * @param object 　javaBean
     * @return {String}
     */
    public static String toJson(Object object) {
        try {
            return INSTANCE.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            return null;
        }

    }

    /**
     * <p>
     * 反序列化<p/>
     *
     * @param valueType  类class对象
     * @param jsonString 字符串
     * @return　{Class}
     */
    public static <T> T parse(Class<T> valueType, String jsonString) {
        try {
            return INSTANCE.readValue(jsonString, valueType);
        } catch (IOException e) {
            return null;
        }
    }



    private static class JackSonHolder extends ObjectMapper {

        private final Long serialVersionUID = 154646751648798L;

        private final Locale CHINA = Locale.CHINA;

        public JackSonHolder() {
            this.setLocale(CHINA);
            this.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", CHINA));
            this.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        }
    }
}
