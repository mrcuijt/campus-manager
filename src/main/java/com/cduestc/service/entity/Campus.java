package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

import java.sql.Time;

/**
 * @author admin
 * @description Campus 表数据映射
 * @date 2017-09-10 14:51
 */
@TableName("campus")
public class Campus {
    @TableId("campus_id")
    private Integer campusId;
    @TableField("campus_name")
    private String campusName;
    @TableField("city_id")
    private Integer cityId;
    @TableField("city_name")
    private String cityName;
    @TableField("open_time")
    private Time openTime;
    @TableField("close_time")
    private Time closeTime;
    @TableField("status")
    private Short status;
    @TableField("close_reason")
    private String closeReason;
    @TableField("custom_service")
    private String customService;

    public Campus() {

    }

    public Campus(Integer campusId, Short status, String closeReason) {
        this.campusId = campusId;
        this.status = status;
        this.closeReason = closeReason;
    }

    public Campus( String campusName, Integer cityId, String cityName, Time openTime, Time closeTime, Short status, String customService) {
        this.campusName = campusName;
        this.cityId = cityId;
        this.cityName = cityName;
        this.openTime = openTime;
        this.closeTime = closeTime;
        this.status = status;
        this.customService = customService;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public String getCampusName() {
        return campusName;
    }

    public void setCampusName(String campusName) {
        this.campusName = campusName;
    }

    public Integer getCityId() {
        return cityId==null?0:cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Time getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Time openTime) {
        this.openTime = openTime;
    }

    public Time getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Time closeTime) {
        this.closeTime = closeTime;
    }

    public Short getStatus() {
        return status==null?0:status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getCloseReason() {
        return closeReason;
    }

    public void setCloseReason(String closeReason) {
        this.closeReason = closeReason;
    }

    public String getCustomService() {
        return customService;
    }

    public void setCustomService(String customService) {
        this.customService = customService;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
