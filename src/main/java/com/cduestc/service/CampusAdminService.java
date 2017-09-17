package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.CampusAdmin;

/**
 * @author admin
 * @description 服务抽象类
 * @date 2017-09-12 19:51
 */
public interface CampusAdminService extends IService<CampusAdmin> {
    /**
     * <p>
     * 校园管理员更新密码
     * </p>
     *
     * @param campusAdmin 管理员帐号
     * @param newPassword 管理员旧密码
     * @param oldPassword 管理员新密码
     * @return {int} 城成功
     */
    Integer updateCampusAdminPassword(String campusAdmin, String oldPassword, String newPassword);


    /**
     * <p>
     * 添加账户信息<p/>
     *
     * @param campusAdmin 管理员信息
     * @return {Integer}
     */
    Integer insertCampusAdmin(CampusAdmin campusAdmin);
}
