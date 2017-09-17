package com.cduestc.service.entity;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 16:02
 */
public class DeliverCom {
    private Integer deliverId;
    private String category;

    public Integer getDeliverId() {
        return deliverId==null?0:deliverId;
    }

    public void setDeliverId(Integer deliverId) {
        this.deliverId = deliverId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
