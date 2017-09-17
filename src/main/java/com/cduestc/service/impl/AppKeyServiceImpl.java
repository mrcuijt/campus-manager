package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.AppKeyService;
import com.cduestc.service.dao.AppKeyMapper;
import com.cduestc.service.entity.AppKey;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * @author admin
 * @description Key表数据实现层
 * @date 2017-09-10 13:44
 */
@Service("appkey")
public class AppKeyServiceImpl extends ServiceImpl<AppKeyMapper, AppKey> implements AppKeyService {

    @Override
    public String selectKey(Map<String, Object> paramMap) {
        return baseMapper.selectKey(paramMap);
    }

    @Override
    public void addKey(AppKey appKey) {
        baseMapper.insert(appKey);
    }
}
