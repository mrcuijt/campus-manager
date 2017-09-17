package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.FoodCategoryService;
import com.cduestc.service.entity.FoodCategory;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-16 19:07
 */
@Controller
@RequestMapping("/foodcategory")
@Api(value = "foodCategoryController", description = "食品分类控制器")
public class FoodCategoryController extends BaseController {

    @Autowired
    @Qualifier("foodcategory")
    private FoodCategoryService service;

    @GetMapping("/{campusId}")
    @ResponseBody
    @ApiOperation(value = "根据校园id获取所有分类", notes = "", httpMethod = "GET", response = List.class)
    public List<FoodCategory> getAllFoodCategory(@PathVariable("campusId") Integer campusId,
                                                 @RequestParam("limit") Integer limit,
                                                 @RequestParam("offset") Integer offset) {
        if (campusId == null || limit == null || offset == null)
            return null;
        return service.getAllFoodCategory(limit, offset, campusId);
    }
}
