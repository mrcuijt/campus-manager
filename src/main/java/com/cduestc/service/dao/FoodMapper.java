package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.Food;
import com.cduestc.service.entity.FoodWithSales;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FoodMapper extends BaseMapper<Food> {
    /**
     * <p>热销榜单</p>
     *
     * @param start    开始时间
     * @param end      结束时间
     * @param campusId 校园id
     * @param page     从第几条数据开始
     * @param limit    查询前多少条
     * @return
     */
    List<FoodWithSales> getTopFive(
            @Param("dateStart") Date start,
            @Param("dateEnd") Date end,
            @Param("campusId") Integer campusId,
            @Param("offset") Integer page,
            @Param("limit") Integer limit);
}
