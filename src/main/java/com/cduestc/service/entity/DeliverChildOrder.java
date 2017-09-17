package com.cduestc.service.entity;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 15:59
 */
public class DeliverChildOrder {
    private String foodName;
    private Short status;
    private Float price;
    private Float discountPrice;
    private Short isDiscount;
    private Integer orderCount;

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Short getStatus() {
        return status == null ? 0 : status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Float getPrice() {
        return price == null ? 0 : price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscountPrice() {
        return discountPrice == null ? 0 : discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Short getIsDiscount() {
        return isDiscount == null ? 0 : isDiscount;
    }

    public void setIsDiscount(Short isDiscount) {
        this.isDiscount = isDiscount;
    }

    public Integer getOrderCount() {
        return orderCount == null ? 0 : orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }
}
