package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

import java.util.Date;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 16:08
 */
@TableName("food_comment")
public class FoodComment {
    @TableField("food_id")
    private Long foodId;
    @TableField("campus_id")
    private Integer campusId;
    @TableField("comment")
    private String comment;

    @TableField(exist = false)
    private String foodName;

    @TableField("date")
    private Date date;

    @TableField("grade")
    private Short grade;

    @TableField(exist = false)
    private String imgUrl;

    @TableField(exist = false)
    private String nickName;

    @TableField("phone")
    private String phone;

    @TableField("tag")
    private Short tag;

    @TableField("is_hidden")
    private Short isHidden;

    @TableField(exist = false)
    private Integer orderCount;

    @TableField("order_id")
    private Long orderId;

    public Long getFoodId() {
        return foodId == null ? 0 : foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public Integer getCampusId() {
        return campusId == null ? 0 : campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Short getGrade() {
        return grade == null ? 0 : grade;
    }

    public void setGrade(Short grade) {
        this.grade = grade;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Short getTag() {
        return tag == null ? 0 : tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
    }

    public Short getIsHidden() {
        return isHidden == null ? 0 : isHidden;
    }

    public void setIsHidden(Short isHidden) {
        this.isHidden = isHidden;
    }

    public Integer getOrderCount() {
        return orderCount == null ? 0 : orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public Long getOrderId() {
        return orderId == null ? 0 : orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
