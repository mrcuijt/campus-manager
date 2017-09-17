package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.CityService;
import com.cduestc.service.entity.City;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-14 21:35
 */
@Controller
@RequestMapping("/city")
@Api(value = "cityController", description = "城市信息控制器")
public class CityController extends BaseController {
    @Autowired
    @Qualifier("city")
    private CityService cityService;

    /**
     * <p>
     * 查询所有城市
     * </p>
     *
     * @return
     */
    @GetMapping("/")
    @ResponseBody
    @ApiOperation(value = "查询所有城市", notes = "", httpMethod = "GET", response = List.class)
    public List<City> cityList() {
        return cityService.selectAll();
    }

    /**
     * <p>添加城市信息</p>
     *
     * @param city 城市信息
     * @return
     */
    @PostMapping("/")
    @ApiOperation(value = "添加城市", notes = "", httpMethod = "POST", response = Map.class)
    public @ResponseBody
    Map<String, Object> addCity(@RequestBody() City city) {
        Integer result = cityService.insertCity(city);
        if (result.intValue() == 1) {
            return sendSuccess("成功添加");
        }
        return sendError("添加失败");
    }
}
