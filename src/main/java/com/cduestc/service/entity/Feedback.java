package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 16:04
 */
@TableName("feedback")
public class Feedback {
    @TableField("phone_id")
    private String phoneId;
    @TableField("suggestion")
    private String suggestion;
    @TableField("campus_id")
    private Integer campusId;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @TableField("date")
    private Date date;

    public String getPhoneId() {
        return phoneId;
    }

    public void setPhoneId(String phoneId) {
        this.phoneId = phoneId;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
