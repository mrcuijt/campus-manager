package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.City;

import java.util.List;

/**
 * @author admin
 * @description City表数据服务层接口
 * @date 2017-09-10 13:42
 */
public interface CityService extends IService<City> {
    /**
     * <p>
     * 查询所有城市
     * </p>
     *
     * @return {List<City></>}
     */
    List<City> selectAll();

    /**
     * <p>添加城市<p/>
     *
     * @param city
     * @return {Integer}
     */
    Integer insertCity(City city);
}
