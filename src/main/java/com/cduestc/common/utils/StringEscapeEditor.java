package com.cduestc.common.utils;

import org.springframework.web.util.HtmlUtils;

import java.beans.PropertyEditorSupport;

/**
 * @author admin
 * @description
 * @date 2017-09-08 21:39
 */
public class StringEscapeEditor extends PropertyEditorSupport {
    @Override
    public String getAsText() {
        Object value=getValue();
        return value!=null?value.toString():"";
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text==null){
            setValue(null);
        }else {
            setValue(HtmlUtils.htmlEscape(text));
        }
    }
}
