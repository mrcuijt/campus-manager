package com.cduestc.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.FeedBackService;
import com.cduestc.service.dao.FeedbackMapper;
import com.cduestc.service.entity.Feedback;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author admin
 * @description 服务实现
 * @date 2017-09-13 9:28
 */
@Service("feedback")
public class FeedBackServiceImpl extends ServiceImpl<FeedbackMapper, Feedback> implements FeedBackService {
    /**
     * <p>分页查询用户反馈</p>
     *
     * @param campusId 校园id
     * @param page     分页对象
     * @return
     */
    @Override
    public List<Feedback> selectFeedbacks(Integer campusId, Page page) {
        return baseMapper.selectFeedbackList(campusId, page);
    }
}
