package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.Seller;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

/**
 * @author admin
 * @description user操作类
 * @date 2017-09-09 13:54
 */
public interface SellerMapper extends BaseMapper<Seller> {
    /**
     * 更新登录数据
     *
     * @param date
     * @param campusAdmin
     */
    void updateDate(@Param("date") Date date, @Param("campusAdmin") String campusAdmin);
}
