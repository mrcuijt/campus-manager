package com.cduestc.service.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.cduestc.common.utils.JsonUtils;

@TableName("hot_search")
public class HotSearch {
    @TableId("hot_id")
    private Integer hotId;

    @TableField("display_name")
    private String displayName;

    @TableField("search_tag")
    private String searchTag;

    @TableField("create_time")
    private Long createTime;

    @TableField("is_display")
    private Byte isDisplay;

    @TableField("campus_id")
    private Integer campusId;

    public HotSearch() {

    }

    public HotSearch(Integer hotId, String displayName, String searchTag, Long createTime, Integer campusId) {
        this.hotId = hotId;
        this.displayName = displayName;
        this.searchTag = searchTag;
        this.createTime = createTime;
        this.campusId = campusId;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName == null ? null : displayName.trim();
    }

    public String getSearchTag() {
        return searchTag;
    }

    public void setSearchTag(String searchTag) {
        this.searchTag = searchTag == null ? null : searchTag.trim();
    }

    public Long getCreateTime() {
        return createTime==null?0:createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Byte getIsDisplay() {
        return isDisplay==0?0:isDisplay;
    }

    public void setIsDisplay(Byte isDisplay) {
        this.isDisplay = isDisplay;
    }

    public Integer getCampusId() {
        return campusId==null?0:campusId;
    }

    public void setCampusId(Integer campusId) {
        this.campusId = campusId;
    }

    public Integer getHotId() {
        return hotId==null?0:hotId;
    }

    public void setHotId(Integer hotId) {
        this.hotId = hotId;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}