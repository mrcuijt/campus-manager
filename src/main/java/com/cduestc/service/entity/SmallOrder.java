package com.cduestc.service.entity;

import java.util.Date;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 15:39
 */
public class SmallOrder {
    private Long foodId;
    private Integer campusId;
    private Long orderId;
    private String togetherId;
    private String name;
    private Short status;
    private Float price;
    private Float discountPrice;
    private Short isDiscount;
    private Integer orderCount;
    private String address;
    private String adminPhone;
    private String imageUrl;
    private String specialName;
    private Integer foodCount;
    private Short isRemarked;
    private String rank;
    private Date togetherDate;
    private String message;
    private Short payWay;
    private Float totalPrice;
    private Short isFullDiscount;

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public Long getOrderId() {
        return orderId==null?0:orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getTogetherId() {
        return togetherId;
    }

    public void setTogetherId(String togetherId) {
        this.togetherId = togetherId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getSpecialName() {
        return specialName;
    }

    public void setSpecialName(String specialName) {
        this.specialName = specialName;
    }

    public Integer getFoodCount() {
        return foodCount==null?0:foodCount;
    }

    public void setFoodCount(Integer foodCount) {
        this.foodCount = foodCount;
    }

    public Short getIsRemarked() {
        return isRemarked==null?0:isRemarked;
    }

    public void setIsRemarked(Short isRemarked) {
        this.isRemarked = isRemarked;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public Date getTogetherDate() {
        return togetherDate;
    }

    public void setTogetherDate(Date togetherDate) {
        this.togetherDate = togetherDate;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Short getPayWay() {
        return payWay==null?0:payWay;
    }

    public void setPayWay(Short payWay) {
        this.payWay = payWay;
    }

    public Float getTotalPrice() {
        return totalPrice==null?0:totalPrice;
    }

    public void setTotalPrice(Float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Short getIsFullDiscount() {
        return isFullDiscount==null?0:isFullDiscount;
    }

    public void setIsFullDiscount(Short isFullDiscount) {
        this.isFullDiscount = isFullDiscount;
    }
}
