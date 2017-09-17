package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cduestc.service.entity.Campus;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CampusMapper extends BaseMapper<Campus> {
    /**
     * <p>
     * 条件查询<p/>
     *
     * @return {List}
     */
    List<Campus> selectAllCampus();
}
