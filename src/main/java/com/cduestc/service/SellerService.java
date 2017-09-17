package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.Seller;

import java.util.Date;

/**
 * @author admin
 * @description Seller表数据服务层接口
 * @date 2017-09-09 13:58
 */
public interface SellerService extends IService<Seller> {
    /**
     * 根据主键查询卖家
     *
     * @param campusAdmin
     * @return Seller
     */
    Seller selectByCampusAdmin(String campusAdmin);

    /**
     * 更新卖家登陆时间
     *
     * @param campusAdmin
     * @param date
     */
    void updateLastLoginTime(Date date, String campusAdmin);

    /**
     * 添加卖家、
     *
     * @param seller
     */
    void addASeller(Seller seller);

    /**
     * 删除卖家
     *
     * @param campusAdmin
     */
    void removeSeller(String campusAdmin);
}
