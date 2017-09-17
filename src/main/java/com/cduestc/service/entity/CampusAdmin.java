package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.Date;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 14:59
 */
@TableName("campus_admin")
public class CampusAdmin {
    @TableId("campus_admin")
    private String campusAdmin;
    @TableField("password")
    private String password;
    @TableField("type")
    private Short type;
    @TableField("campus_id")
    private Integer campusId;
    @TableField("salt")
    private String campusName;
    @TableField("last_login_date")
    private Date lastLoginDate;

    public CampusAdmin() {
    }

    public CampusAdmin(String campusAdmin, String password) {
        this.campusAdmin = campusAdmin;
        this.password = password;
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

    public String getCampusName() {
        return campusName;
    }

    public void setCampusName(String campusName) {
        this.campusName = campusName;
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }
}
