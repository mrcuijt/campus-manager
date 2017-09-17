package com.cduestc.controller;

import com.baomidou.mybatisplus.toolkit.SystemClock;
import com.cduestc.common.controller.BaseController;
import com.cduestc.service.HotSearchService;
import com.cduestc.service.entity.HotSearch;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description 热搜控制器
 * @date 2017-09-13 23:02
 */
@Controller
@RequestMapping("/hotsearch")
@Api(value = "HotSearchController", description = "热搜信息控制器")
public class HotSearchController extends BaseController {


    @Autowired
    @Qualifier("hotSearch")
    private HotSearchService hotSearchService;

    /**
     * <p>根据校园id获取数据</p>
     *
     * @param campusId 校园id
     * @return
     */
    @GetMapping("/{campus_id}")
    @ResponseBody
    @ApiOperation(value = "获取热搜条目", notes = "", response = List.class, httpMethod = "GET")
    public List<HotSearch> getHotSearchs(@PathVariable("campus_id") Integer campusId) {
        return hotSearchService.selectHostSearchs(campusId);
    }

    /**
     * <p>更新热搜条目</p>
     *
     * @param hotId       id
     * @param disPlayName name
     * @param searchTag   tag
     * @param campusId    校园id
     * @return
     */
    @PutMapping("/{hot_id}")
    @ApiOperation(value = "更新热搜条目", notes = "", response = Map.class, httpMethod = "PUT")
    public @ResponseBody
    Map<String, Object> updateHotSearch(@PathVariable("hot_id") Integer hotId,
                                        @RequestParam("disPlayName") String disPlayName,
                                        @RequestParam("searchTag") String searchTag,
                                        @RequestParam("campusId") Integer campusId) {
        Integer result = hotSearchService.updateHotSearch(new HotSearch(hotId, disPlayName, searchTag, SystemClock.now(), campusId));
        if (result.intValue() == 1) {
            return sendSuccess("更新热搜成功");
        }
        return sendError("更新热搜失败");
    }

    /**
     * <p>批量删除信息</p>
     *
     * @param idList ids
     * @param nums   删除数目
     * @return
     */
    @DeleteMapping("/{ids}")
    @ApiOperation(value = "批量删除", notes = "", response = Map.class, httpMethod = "DELETE")
    public @ResponseBody
    Map<String, Object> deleteHotSearchs(
            @PathVariable("ids") List<Serializable> idList,
            @RequestParam("nums") Integer nums) {
        if (idList.size() == 0) {
            return sendError("删除的id不能为null");
        }
        if (idList.size() != nums.intValue()) {
            return sendError("删除的id数不对称");
        }
        Integer reslut = hotSearchService.deleteHotSearchs(idList);
        return reslut.intValue() == nums ? sendSuccess("删除成功") : sendError("部分成功");
    }

}
