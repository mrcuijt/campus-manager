package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.service.CampusAdminService;
import com.cduestc.service.entity.CampusAdmin;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.apache.shiro.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-12 20:41
 */
@Controller
@Api(value = "CampusAdminController", description = "校园管理者控制器")
@RequestMapping("/campusAdmin")
public class CampusAdminController extends BaseController {

    @Autowired
    @Qualifier("campusAdmin")
    private CampusAdminService campusAdminService;

    /**
     * <p>
     * 修改管理员密码</p>
     *
     * @param campusAdmin_id 管理员id
     * @param oldPassword    旧密码
     * @param newPassword    新密码
     * @return
     */
    @PutMapping("/{campusAdmin_id}")
    @ApiOperation(value = "修改密码", notes = "", httpMethod = "PUT", response = Map.class)
    public @ResponseBody
    Map<String, Object> updateCampusAdminPassword(
            @PathVariable(value = "campusAdmin_id") String campusAdmin_id,
            @RequestParam(value = "oldPassword") String oldPassword,
            @RequestParam(value = "newPassword") String newPassword) {
        if (StringUtils.hasText(campusAdmin_id) && StringUtils.hasText(oldPassword)) {
            int flag = campusAdminService.updateCampusAdminPassword(campusAdmin_id, oldPassword, newPassword);
            if (flag == 1) {
                return sendSuccess("修改密码成功");
            }
            return sendError("你输入的用户名和旧密码不存在或不匹配");
        }
        return sendError("你输入的帐号或原密码有误");
    }

    /**
     * <p>
     * 添加管理员
     * </p>
     *
     * @param campusAdmin
     * @return
     */
    @PostMapping("/")
    @ApiOperation(value = "添加管理员", notes = "", httpMethod = "POST", response = Map.class)
    public @ResponseBody
    Map<String, Object> addCampus(@RequestBody CampusAdmin campusAdmin) {
        Integer result = campusAdminService.insertCampusAdmin(campusAdmin);
        if (result.intValue() == 1) {
            return sendSuccess("添加成功");
        }
        return sendError("添加失败");
    }
}
