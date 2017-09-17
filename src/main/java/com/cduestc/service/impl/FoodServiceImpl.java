package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.FoodService;
import com.cduestc.service.dao.FoodMapper;
import com.cduestc.service.entity.Food;
import com.cduestc.service.entity.FoodWithSales;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-15 14:08
 */
@Service("food")
public class FoodServiceImpl extends ServiceImpl<FoodMapper, Food> implements FoodService {
    @Override
    public List<FoodWithSales> getFoodWithSales(Date start, Date end, Integer campusId, Integer page, Integer limit) {
        return baseMapper.getTopFive(start, end, campusId, page, limit);
    }
}
