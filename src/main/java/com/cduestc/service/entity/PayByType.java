package com.cduestc.service.entity;

import com.cduestc.common.utils.JsonUtils;

/**
 * @author admin
 * @description
 * @date 2017-09-16 10:34
 */
public class PayByType {
    private Short payWay;
    private Float totalPrice;

    public Short getPayWay() {
        return payWay==null?0:payWay;
    }

    public void setPayWay(Short payWay) {
        this.payWay = payWay;
    }

    public Float getTotalPrice() {
        return totalPrice==null?0:totalPrice;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }

    public void setTotalPrice(Float totalPrice) {

        this.totalPrice = totalPrice;
    }
}
