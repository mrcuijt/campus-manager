package com.cduestc.service.entity;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 15:53
 */
public class CartGood {
    private Long orderId;
    private String name;
    private String phone;
    private Short status;
    private Float price;
    private Float discountPrice;
    private Short isDiscount;
    private Integer orderCount;
    private Short tag;
    private Short isFullDiscount;
    private Long foodId;
    private String imageUrl;
    private Integer foodCount;
    private String message;

    public Long getOrderId() {
        return orderId==null?0:orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Short getStatus() {
        return status==null?0:status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Float getPrice() {
        return price==null?0:price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscountPrice() {
        return discountPrice==null?0:discountPrice;
    }

    public void setDiscountPrice(Float discountPrice) {
        this.discountPrice = discountPrice;
    }

    public Short getIsDiscount() {
        return isDiscount==null?0:isDiscount;
    }

    public void setIsDiscount(Short isDiscount) {
        this.isDiscount = isDiscount;
    }

    public Integer getOrderCount() {
        return orderCount==null?0:orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public Short getTag() {
        return tag==null?0:tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
    }

    public Short getIsFullDiscount() {
        return isFullDiscount==null?0:isFullDiscount;
    }

    public void setIsFullDiscount(Short isFullDiscount) {
        this.isFullDiscount = isFullDiscount;
    }

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Integer getFoodCount() {
        return foodCount==null?0:foodCount;
    }

    public void setFoodCount(Integer foodCount) {
        this.foodCount = foodCount;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
