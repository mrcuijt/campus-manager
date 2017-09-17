package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cduestc.service.entity.Feedback;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author admin
 * @description Freeback表映射
 * @date 2017-09-13 9:20
 */
public interface FeedbackMapper extends BaseMapper<Feedback> {
    /**
     * <p>
     * 查询 : 根据state状态查询用户列表，分页显示
     * </p>
     *
     * @param pagination 翻页对象，可以作为 xml 参数直接使用，传递参数 Page 即自动分页
     * @param campusId   状态
     * @return
     */
    List<Feedback> selectFeedbackList(@Param("campusId") Integer campusId, Pagination pagination);
}
