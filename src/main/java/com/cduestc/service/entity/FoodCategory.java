package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

import java.util.List;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-10 16:07
 */
@TableName("food_category")
public class FoodCategory {
    @TableField("category_id")
    private Integer categoryId;
    @TableField("campus_id")
    private Integer campusId;

    @TableField("category")
    private String category;

    @TableField("img_url")
    private String imgUrl;

    @TableField("parent_id")
    private Integer parentId;

    @TableField("tag")
    private Short tag;

    @TableField("serial")
    private Short serial;

    @TableField("is_open")
    private Short isOpen;

    private List<FoodCategory> child;

    public Integer getCategoryId() {
        return categoryId == null ? 0 : categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getCampusId() {
        return campusId == null ? 0 : campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Integer getParentId() {
        return parentId == null ? 0 : parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public Short getTag() {
        return tag == null ? 0 : tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
    }

    public Short getSerial() {
        return serial == null ? 0 : serial;
    }

    public void setSerial(Short serial) {
        this.serial = serial;
    }

    public Short getIsOpen() {
        return isOpen == null ? 0 : isOpen;
    }

    public void setIsOpen(Short isOpen) {
        this.isOpen = isOpen;
    }

    public List<FoodCategory> getChild() {
        return child;
    }

    public void setChild(List<FoodCategory> child) {
        this.child = child;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
