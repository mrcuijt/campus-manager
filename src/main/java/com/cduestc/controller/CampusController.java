package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.CampusService;
import com.cduestc.service.entity.Campus;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description 用户管理模块开发
 * @date 2017-09-12 14:33
 */

@Controller
@RequestMapping("/campus")
@Api(value = "CampusController", description = "校园信息控制器")
public class CampusController extends BaseController {

    @Autowired
    @Qualifier("campus")
    private CampusService service;

    /**
     * <p>关闭校区店面</p>
     *
     * @param campus_id   校区id
     * @param closeReason 关闭原因
     * @return
     */
    @PutMapping("/{campus_id}")
    @ApiOperation(value = "更新店面修改信息", notes = "", httpMethod = "PUT", response = Map.class)
    public @ResponseBody
    Map<String, Object> closeCampus(@PathVariable("campus_id") Integer campus_id,
                                    @RequestParam("closeReason") String closeReason) {
        if (campus_id != null && StringUtils.hasText(closeReason)) {
            Integer i = service.updataCampus(campus_id, closeReason);
            if (i.intValue() == 1) {
                return sendSuccess("成功关闭店并消息");
            }
            return sendError("关闭店面失败,你输入的信息有误");
        }
        return sendError("关闭店面信息不能为空");
    }


    /**
     * <p>
     * 获取所有校区
     * </p>
     *
     * @return
     */
    @GetMapping("/")
    @ResponseBody
    @ApiOperation(value = "获取校区所有信息", notes = "查询所有", httpMethod = "GET", response = List.class)
    public List<Campus> getAllCampus() {
        return service.selectAllCampus();
    }

    /**
     * <p>校区信息</p>
     *
     * @param campus 校园信息
     * @return
     */
    @PostMapping("/")
    @ApiOperation(value = "添加校区信息", notes = "", httpMethod = "POST", response = Map.class)
    public @ResponseBody
    Map<String, Object> addCampus(@RequestBody Campus campus) {
        Integer result = service.insertCampus(campus);
        if (result.intValue() == 1) {
            return sendSuccess("添加成功");
        }
        return sendError("添加失败");
    }

    /**
     * <p>根据id获取校园信息</p>
     *
     * @param campus_id
     * @return
     */
    @GetMapping("/{campus_id}")
    @ResponseBody
    @ApiOperation(value = "根据主键获取学校相关信息", notes = "", httpMethod = "GET", response = List.class)
    public Campus
    getCampus(@PathVariable("campus_id") Integer campus_id) {
        return service.selectCampus(campus_id);
    }
}
