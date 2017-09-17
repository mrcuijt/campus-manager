package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

import java.util.Date;

@TableName("users")
public class User {
    @TableId("phone")
    private String phone;

    @TableField("password")
    private String password;

    @TableField("type")
    private Short type;

    @TableField("nickname")
    private String nickname;

    @TableField("img_url")
    private String imgUrl;

    @TableField("last_login_date")
    private Date lastLoginDate;

    @TableField("create_time")
    private Date createTime;

    @TableField("academy")
    private String defaultAddress;
    @TableField("token")
    private String token;
    @TableField("sex")
    private Short sex;
    @TableField("academy")
    private String academy;
    @TableField("qq")
    private String qq;
    @TableField("weixin")
    private String weiXin;
    @TableField("campus_id")
    private Integer campusId;

    public User(String phone2, String password2, String nickname2) {
        phone = phone2;
        password = password2;
        nickname = nickname2;
        type = 2;
        createTime = new Date();
        lastLoginDate = new Date();
    }

    public User() {
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Short getType() {
        return type == null ? 0 : type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl == null ? null : imgUrl.trim();
    }

    public Date getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Date lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(String defaultAddress) {
        this.defaultAddress = defaultAddress;
    }

    public Short getSex() {
        return sex == null ? 0 : sex;
    }

    public void setSex(Short sex) {
        this.sex = sex;
    }

    public String getAcademy() {
        return academy;
    }

    public void setAcademy(String academy) {
        this.academy = academy;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getWeiXin() {
        return weiXin;
    }

    public void setWeiXin(String weiXin) {
        this.weiXin = weiXin;
    }

    public Integer getCampusId() {
        return campusId == null ? 0 : campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}