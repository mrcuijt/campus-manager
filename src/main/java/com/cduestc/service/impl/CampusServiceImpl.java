package com.cduestc.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.CampusService;
import com.cduestc.service.dao.CampusMapper;
import com.cduestc.service.entity.Campus;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @description 服务层实现
 * @date 2017-09-12 19:09
 */
@Service("campus")
public class CampusServiceImpl extends ServiceImpl<CampusMapper, Campus> implements CampusService {
    /**
     * <p>
     * 关闭校园
     * </p>
     *
     * @param campus_id   校园id
     * @param closeReason 关闭原因
     * @return
     */
    @Override
    public Integer updataCampus(Integer campus_id, String closeReason) {
        return baseMapper.updateById(new Campus(campus_id, (short) 0, closeReason));
    }

    /**
     * <p>
     * 获取所有校区
     * </p>
     *
     * @return
     */
    @Override
    public List<Campus> selectAllCampus() {
        return baseMapper.selectAllCampus();
    }

    /**
     * <p>插入校区</p>
     *
     * @param campus 校区信息
     * @return
     */
    @Override
    public Integer insertCampus(Campus campus) {
        return baseMapper.insert(campus);
    }

    /**
     * <p>根据校园id获取校园信息</p>
     *
     * @param campus_id 校园主键
     * @return
     */
    @Override
    public Campus selectCampus(Integer campus_id) {
        return baseMapper.selectById(campus_id);
    }

}
