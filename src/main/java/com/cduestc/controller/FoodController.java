package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.FoodService;
import com.cduestc.service.entity.FoodWithSales;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-15 13:40
 */
@Controller
@RequestMapping("/food")
@Api(value = "foodController", description = "食物信息控制器")
public class FoodController extends BaseController {

    @Autowired
    @Qualifier("food")
    private FoodService foodService;

    /**
     * <p>热销排行榜单</p>
     *
     * @param start    开始时间
     * @param end      结束时间
     * @param campusId 校园id
     * @param page     当前页数
     * @param limit    行数
     * @return
     */
    @GetMapping("/{campus_id}")
    @ResponseBody
    @ApiOperation(value = "获取热销榜单数据", notes = "", httpMethod = "GET", response = List.class)
    public List<FoodWithSales> getTopFive(@RequestParam("start") Date start,
                                          @RequestParam("end") Date end,
                                          @PathVariable("campus_id") Integer campusId,
                                          @RequestParam("page") Integer page,
                                          @RequestParam("limit") Integer limit) {
        return foodService.getFoodWithSales(start, end, campusId, page, limit);
    }
}
