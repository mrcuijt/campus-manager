package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

import java.util.Date;

/**
 * @author admin
 * @description 实体类映射
 * @date 2017-09-10 12:36
 */
@TableName("campus_admin")
public class Seller {
    @TableId("campus_admin")
    protected String campusAdmin;
    @TableField("password")
    protected String password;
    @TableField("type")
    protected Short type;
    @TableField("campus_id")
    protected Integer campusId;
    @TableField("last_login_date")
    protected Date lastLoginDate;
    @TableField("salt")
    protected String salt;

    public Seller() {

    }

    public Seller(String campusAdmin, String password, Short type, Integer campusId, Date lastLoginDate, String salt) {
        this.campusAdmin = campusAdmin;
        this.password = password;
        this.type = type;
        this.campusId = campusId;
        this.lastLoginDate = lastLoginDate;
        this.salt = salt;
    }

    public String getCampusAdmin() {
        return campusAdmin;
    }

    public void setCampusAdmin(String campusAdmin) {
        this.campusAdmin = campusAdmin;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Short getType() {
        return type==null?0:type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
