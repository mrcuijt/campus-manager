package com.cduestc.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.UserService;
import com.cduestc.service.dao.UserMapper;
import com.cduestc.service.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-15 10:52
 */
@Service("user")
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Override
    public Short getType(String phone) {
        return baseMapper.selectType(phone);
    }

    /**
     * <p>查询用户</p>
     *
     * @param limit  行数
     * @param offset 起始行
     * @param sort   排序字段
     * @param order  降序或升序
     * @param search 条件
     * @return
     */
    @Override
    public List<User> getAllUser(Integer limit, Integer offset, String sort, String order, String search) {
        return baseMapper.selectAllUser(limit, offset, sort, order, search);
    }
}
