package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cduestc.service.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    /**
     * <p>查询用户类型</p>
     *
     * @param phone 用户id
     * @return
     */
    Short selectType(@Param("phone") String phone);

    /**
     * <p>按照search条件分页查询<p/>
     *
     * @param offset 起始行
     * @param sort   排序行
     * @param order  降序或升序
     * @param limit  行数
     * @param search 条件
     * @return {List<User></>}
     */
    List<User> selectAllUser(@Param("limit") Integer limit,
                             @Param("offset") Integer offset,
                             @Param("sort") String sort,
                             @Param("order") String order,
                             @Param("search") String search);
}
