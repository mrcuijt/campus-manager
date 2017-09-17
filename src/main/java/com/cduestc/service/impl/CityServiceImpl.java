package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.CityService;
import com.cduestc.service.dao.CityMapper;
import com.cduestc.service.entity.City;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @description city服务实现类
 * @date 2017-09-14 21:27
 */
@Service("city")
public class CityServiceImpl extends ServiceImpl<CityMapper, City> implements CityService {
    /**
     * <p>
     * 查询所有城市
     * </p>
     *
     * @return
     */
    @Override
    public List<City> selectAll() {
        return baseMapper.selectList(null);
    }

    /**
     * <p>添加城市</p>
     *
     * @param city 城市信息
     * @return
     */
    @Override
    public Integer insertCity(City city) {
        return baseMapper.insert(city);
    }
}
