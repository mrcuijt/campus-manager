package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-16 18:36
 */
@Controller
@RequestMapping("/foodcomment")
@Api(value = "foodcommentcontroller", description = "食物评论控制器")
public class FoodCommentController extends BaseController {

    @GetMapping("/{campus_id}")
    @ApiOperation(value = "获取全部评论", notes = "", httpMethod = "GET", response = Map.class)
    public @ResponseBody
    Map<String, Object> getAllComments(@PathVariable("campus_id") Integer campusId,
                                       @RequestParam("limit") Integer limit,
                                       @RequestParam("offset") Integer offset,
                                       @RequestParam(value = "order", defaultValue = "asc") String order,
                                       @RequestParam("sort") String sort) {
        return null;
    }
}
