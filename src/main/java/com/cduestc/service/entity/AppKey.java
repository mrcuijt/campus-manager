package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * @author admin
 * @description key实体类映射
 * @date 2017-09-10 13:40
 */
@TableName("app_key")
public class AppKey {
    @TableId("key")
    private String key;
    @TableField("secrect")
    private String secrect;

    public String getKey() {
        return key;
    }

    public void setKee(String ke) {
        this.key = key;
    }

    public String getSecrect() {
        return secrect;
    }

    public void setSecrect(String secrect) {
        this.secrect = secrect;
    }
}
