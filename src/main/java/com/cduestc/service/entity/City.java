package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 14:57
 */
@TableName("city")
public class City {
    @TableId("city_id")
    protected Integer cityId;
    @TableField("city_name")
    protected String cityName;

    public Integer getCityId() {
        return cityId==null?0:cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public String getCityName() {
        return cityName;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }
}
