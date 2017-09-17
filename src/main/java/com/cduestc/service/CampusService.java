package com.cduestc.service;


import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.Campus;
import com.cduestc.service.entity.CampusAdmin;

import java.util.List;

/**
 * 表数据服务层
 */

public interface CampusService extends IService<Campus> {
    /**
     * <p>
     * 更新关闭店面
     * <p/>
     *
     * @param campus_id   校园id
     * @param closeReason 关闭原因
     * @return {Integer}
     */
    Integer updataCampus(Integer campus_id, String closeReason);

    /***
     * <p>
     *     查询campus所有信息</p>
     * @return {List<Campus></>}
     * */
    List<Campus> selectAllCampus();

    /**
     * <p>
     * 添加一条数据</p>
     *
     * @param campus
     * @return {Integer}
     */
    Integer insertCampus(Campus campus);

    /**
     * <p>获取校区记录
     * </p>
     *
     * @param campus_id
     * @return {Campus}
     * */
    Campus selectCampus(Integer campus_id);
}
