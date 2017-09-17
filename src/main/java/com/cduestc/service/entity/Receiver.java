package com.cduestc.service.entity;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 15:48
 */
public class Receiver extends ReceiverKey {
    private String phone;
    private String name;
    private String address;
    private Short tag;
    private Integer campusId;
    private String campusName;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Short getTag() {
        return tag==null?0:tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
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
}
