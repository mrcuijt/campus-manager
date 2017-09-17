package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.CampusAdmin;
import org.apache.ibatis.annotations.Param;

/**
 * @author admin
 * @description 表数据映射
 * @date 2017-09-12 19:50
 */
public interface CampusAdminMapper extends BaseMapper<CampusAdmin> {
    /**
     * <p>
     * 匹配旧密码 更新密码
     * </p>
     *
     * @param campusAdmin 校园管理员主键
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return
     */
    Integer updateCampusAdminPassword(
            @Param("campusAdmin") String campusAdmin,
            @Param("oldPassword") String oldPassword,
            @Param("newPassword") String newPassword);
}
