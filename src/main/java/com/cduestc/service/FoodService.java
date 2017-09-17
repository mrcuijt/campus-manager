package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.Food;
import com.cduestc.service.entity.FoodWithSales;

import java.util.Date;
import java.util.List;

public interface FoodService extends IService<Food> {
    /**
     * <p>
     * 热销查询<p/>
     *
     * @param start    开始时间
     * @param end      结束时间
     * @param campusId 校园id
     * @param page     前page数开始
     * @param limit    行数
     * @return
     */
    List<FoodWithSales> getFoodWithSales(Date start, Date end, Integer campusId, Integer page, Integer limit);
}
