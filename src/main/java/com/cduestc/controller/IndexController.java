package com.cduestc.controller;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author admin
 * @description 主页入口
 * @date 2017-09-13 16:06
 */
@Controller
@Api(value = "IndexController", description = "主页控制器")
public class IndexController {
    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    @ApiOperation(value = "主页", notes = "主页")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/cn/{path}", method = {RequestMethod.GET})
    @ApiOperation(value = "通用子页面入口", notes = "通用子页面入口", httpMethod = "GET")
    public String pages(@PathVariable("path") String path) {
        return path;
    }
}
