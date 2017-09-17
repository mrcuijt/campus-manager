package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.FoodCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FoodCategoryMapper extends BaseMapper<FoodCategory> {
    /**
     * <p>获取所有食物类别</p>
     *
     * @param campusId 校区id
     * @param limit    行数
     * @param offset   开始第几行
     * @return
     */
    List<FoodCategory> selectFoodCategory(
            @Param("limit") Integer limit,
            @Param("offset") Integer offset,
            @Param("campusId") Integer campusId);
}
