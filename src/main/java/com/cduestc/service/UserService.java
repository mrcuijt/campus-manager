package com.cduestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.User;

import java.util.List;

public interface UserService extends IService<User> {
    /**
     * <p>
     * 查询用户类型管理员admin
     * </p>
     *
     * @param phone 用户主键
     * @return Short
     */
    Short getType(String phone);

    /**
     * <p>
     * 查询所有用户
     * </p>
     *
     * @param limit  行数
     * @param order  降序或升序
     * @param sort   排序字段
     * @param offset 起始行
     * @param search 条件
     * @return
     */
    List<User> getAllUser(Integer limit, Integer offset, String sort, String order, String search);


}
