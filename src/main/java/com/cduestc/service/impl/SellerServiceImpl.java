package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.entity.Seller;
import com.cduestc.service.dao.SellerMapper;
import com.cduestc.service.SellerService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author admin
 * @description seller表数据服务层接口实现类
 * @date 2017-09-09 14:01
 */
@Service("seller")
public class SellerServiceImpl extends ServiceImpl<SellerMapper, Seller> implements SellerService {

    @Override
    public Seller selectByCampusAdmin(String campusAdmin) {
        return baseMapper.selectById(campusAdmin);
    }

    @Override
    public void updateLastLoginTime(Date date, String campusAdmin) {
        baseMapper.updateDate(date, campusAdmin);
    }

    @Override
    public void addASeller(Seller seller) {
        baseMapper.insert(seller);
    }

    @Override
    public void removeSeller(String campusAdmin) {
        baseMapper.deleteById(campusAdmin);
    }
}
