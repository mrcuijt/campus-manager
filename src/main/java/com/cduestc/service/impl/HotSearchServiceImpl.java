package com.cduestc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.HotSearchService;
import com.cduestc.service.dao.HotSearchMapper;
import com.cduestc.service.entity.HotSearch;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.List;

/**
 * @author admin
 * @description 服务具体实现
 * @date 2017-09-13 22:34
 */
@Service("hotSearch")
public class HotSearchServiceImpl extends ServiceImpl<HotSearchMapper, HotSearch> implements HotSearchService {

    /**
     * <p>根据校园获取当前热搜数据</p>
     *
     * @param campusId 校园id
     * @return
     */
    @Override
    public List<HotSearch> selectHostSearchs(Integer campusId) {
        return baseMapper.selectList(new EntityWrapper<HotSearch>().where("campus_id={0}", campusId).orderBy("create_time", false));
    }

    /**
     * <p>
     * 更新热搜
     * </p>
     *
     * @param hotSearch 热搜对象
     * @return
     */
    @Override
    public Integer updateHotSearch(HotSearch hotSearch) {
        return baseMapper.updateById(hotSearch);
    }

    /**
     * <p>批量删除热搜</p>
     *
     * @param hotIds
     * @return
     */
    @Override
    public Integer deleteHotSearchs(List<Serializable> hotIds) {
        return baseMapper.deleteBatchIds(hotIds);
    }
}
