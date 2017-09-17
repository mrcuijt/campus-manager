package com.cduestc.service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.Feedback;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FeedBackService extends IService<Feedback> {
    /**
     * <p>
     * 获取用户反馈
     * </p>
     *
     * @param campusId
     * @param page
     * @return {List<Feedback></>}
     */
    List<Feedback> selectFeedbacks(Integer campusId, Page page);
}
