package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

import java.util.Date;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 16:06
 */
@TableName("food")
public class Food {
    @TableId("food_id")
    private Long foodId;
    @TableField("name")
    private String name;

    @TableField("price")
    private Float price;

    @TableField("discount_price")
    private Float discountPrice;

    @TableField("grade")
    private Float grade;

    @TableField("img_url")
    private String imgUrl;

    @TableField("info")
    private String info;

    @TableField("food_count")
    private Integer foodCount;

    @TableField("modify_time")
    private Date modifyTime;

    @TableField("status")
    private Short status;

    @TableField("food_flag")
    private String foodFlag;

    @TableField("tag")
    private Short tag;

    @TableField("is_discount")
    private Short isDiscount;

    @TableField("category_id")
    private Integer categoryId;

    @TableField("prime_cost")
    private Float primeCost;

    @TableField("sale_number")
    private Long saleNumber;

    @TableField("")
    private Long commentNumber;

    //private List<FoodSpecial> foodSpecial;

    private Integer campusId;

    private Short toHome;

    private String homeImage;

    private String message;

    private Short isFullDiscount;

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Float getGrade() {
        return grade==null?0:grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Integer getFoodCount() {
        return foodCount==null?0:foodCount;
    }

    public void setFoodCount(Integer foodCount) {
        this.foodCount = foodCount;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Short getStatus() {
        return status==null?0:status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public String getFoodFlag() {
        return foodFlag;
    }

    public void setFoodFlag(String foodFlag) {
        this.foodFlag = foodFlag;
    }

    public Short getTag() {
        return tag==null?0:tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
    }

    public Short getIsDiscount() {
        return isDiscount==null?0:isDiscount;
    }

    public void setIsDiscount(Short isDiscount) {
        this.isDiscount = isDiscount;
    }

    public Integer getCategoryId() {
        return categoryId==null?0:categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Float getPrimeCost() {
        return primeCost==null?0:primeCost;
    }

    public void setPrimeCost(Float primeCost) {
        this.primeCost = primeCost;
    }

    public Long getSaleNumber() {
        return saleNumber==null?0:saleNumber;
    }

    public void setSaleNumber(Long saleNumber) {
        this.saleNumber = saleNumber;
    }

    public Long getCommentNumber() {
        return commentNumber==null?0:commentNumber;
    }

    public void setCommentNumber(Long commentNumber) {
        this.commentNumber = commentNumber;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public Short getToHome() {
        return toHome==null?0:toHome;
    }

    public void setToHome(Short toHome) {
        this.toHome = toHome;
    }

    public String getHomeImage() {
        return homeImage;
    }

    public void setHomeImage(String homeImage) {
        this.homeImage = homeImage;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Short getIsFullDiscount() {
        return isFullDiscount==null?0:isFullDiscount;
    }

    public void setIsFullDiscount(Short isFullDiscount) {
        this.isFullDiscount = isFullDiscount;
    }
}
