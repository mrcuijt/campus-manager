package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.FoodCategory;

import java.util.List;

public interface FoodCategoryService extends IService<FoodCategory> {
    /**
     * <p>获取所有食物类别</p>
     *
     * @param campusId 校区id
     * @param limit    行数
     * @param offset   开始第几行
     * @return
     */
    List<FoodCategory> getAllFoodCategory(Integer limit, Integer offset, Integer campusId);
}
