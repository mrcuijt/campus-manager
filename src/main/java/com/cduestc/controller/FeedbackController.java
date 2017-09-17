package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.FeedBackService;
import com.cduestc.service.entity.Feedback;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description 用户控制器
 * @date 2017-09-12 23:36
 */
@Controller
@RequestMapping("/feedback")
@Api(value = "FeedbackController", description = "用户信息控制器")
public class FeedbackController extends BaseController {

    @Autowired
    @Qualifier("feedback")
    private FeedBackService feedBackService;

    /**
     * <p>分页查询用户反馈</p>
     *
     * @param campus_Id 校园id
     * @param pageNum   行数
     * @param limit     页数
     * @return
     */
    @GetMapping("/{campus_Id}")
    @ResponseBody
    @ApiOperation(value = "用户反馈分页", notes = "用户分页反馈", httpMethod = "GET", response = List.class)
    public List<Feedback> getFeedbacks(@PathVariable("campus_Id") Integer campus_Id,
                                       @RequestParam("pageNum") Integer pageNum,
                                       @RequestParam("limit") Integer limit) {
        if (StringUtils.isEmpty(campus_Id)) {
            return null;
        }
        if (pageNum.intValue() > 0 && limit.intValue() > 0) {
            return feedBackService.selectFeedbacks(campus_Id, getPage(pageNum, limit, "date", "desc"));
        }
        return null;
    }

}
