package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.AppKey;

import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-10 13:41
 */
public interface AppKeyMapper extends BaseMapper<AppKey> {
    String selectKey(Map<String, Object> paramMap);
}
