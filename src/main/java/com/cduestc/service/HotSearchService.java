package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.HotSearch;

import java.io.Serializable;
import java.util.List;

/**
 * @author admin
 * @description 抽象服务接口
 * @date 2017-09-13 22:31
 */
public interface HotSearchService extends IService<HotSearch> {
    /**
     * <p>
     * 热搜查询<p/>
     *
     * @param campusId 校园id
     * @return {List<HotSearh></>}
     */
    List<HotSearch> selectHostSearchs(Integer campusId);

    /**
     * <p>
     * 更新热搜</p>
     *
     * @param hotSearch 热搜对象
     * @return {Integer}
     */
    Integer updateHotSearch(HotSearch hotSearch);

    /**
     * <p>
     * 批处理删除热搜</p>
     *
     * @param hotIds 多条热售id
     * @return {Integer}
     */
    Integer deleteHotSearchs(List<Serializable> hotIds);
}
