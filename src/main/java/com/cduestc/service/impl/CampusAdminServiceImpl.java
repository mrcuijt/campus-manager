package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.common.utils.DigestUtils;
import com.cduestc.service.CampusAdminService;
import com.cduestc.service.dao.CampusAdminMapper;
import com.cduestc.service.entity.CampusAdmin;
import org.springframework.stereotype.Service;

/**
 * @author admin
 * @description campusAdmin服务实现类
 * @date 2017-09-12 19:53
 */
@Service("campusAdmin")
public class CampusAdminServiceImpl extends ServiceImpl<CampusAdminMapper, CampusAdmin> implements CampusAdminService {
    /**
     * <p>更新校园管理员密码<p/>
     *
     * @param campusAdmin 用户帐号
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @return
     */
    @Override
    public Integer updateCampusAdminPassword(String campusAdmin, String oldPassword, String newPassword) {
        return baseMapper.updateCampusAdminPassword(
                campusAdmin, DigestUtils.hashByShiro(oldPassword)
                , DigestUtils.hashByShiro(newPassword));
    }

    /**
     * <p>插入校园管理员<p/>
     *
     * @param campusAdmin 管理员信息
     * @return
     */
    @Override
    public Integer insertCampusAdmin(CampusAdmin campusAdmin) {
        campusAdmin.setPassword(DigestUtils.hashByShiro(campusAdmin.getPassword()));
        return baseMapper.insert(campusAdmin);
    }

}
