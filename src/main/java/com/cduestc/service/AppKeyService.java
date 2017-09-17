package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.AppKey;

import java.util.Map;

/**
 * @author admin
 * @description Key表数据服务层接口
 * @date 2017-09-10 13:42
 */
public interface AppKeyService extends IService<AppKey> {
    /**
     * 查询
     * */
    String selectKey(Map<String, Object> paraMap);

    void addKey(AppKey appKey);
}
