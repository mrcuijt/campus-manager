package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.FoodCategoryService;
import com.cduestc.service.dao.FoodCategoryMapper;
import com.cduestc.service.entity.FoodCategory;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-16 19:16
 */
@Service("foodcategory")
public class FoodCategoryServiceImpl extends ServiceImpl<FoodCategoryMapper, FoodCategory> implements FoodCategoryService {
    /**
     * <p>获取所有食物类别</p>
     *
     * @param limit    行数
     * @param offset   开始第几行
     * @param campusId 校区id
     * @return
     */
    @Override
    public List<FoodCategory> getAllFoodCategory(Integer limit, Integer offset, Integer campusId) {
        return baseMapper.selectFoodCategory(limit, offset, campusId);
    }
}
