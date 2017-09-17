package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.common.utils.JsonUtils;
import com.cduestc.service.UserService;
import com.cduestc.service.entity.User;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-15 10:41
 */
@Controller
@RequestMapping("/user")
@Api(value = "usercontroller", description = "用户控制器")
public class UserController extends BaseController {

    @Autowired
    @Qualifier("user")
    private UserService userService;

    @GetMapping("/{phone}")
    @ResponseBody
    @ApiOperation(value = "获取用户类型", notes = "", httpMethod = "GET", response = Short.class)
    public Short getType(@PathVariable("phone") String phone) {
        return userService.getType(phone);
    }

    /**
     * <p>按照search条件查询并实现分页</p>
     *
     * @param limit  每页行数
     * @param offset 起始行
     * @param sort   按照字段排序
     * @param order  降序或者升序
     * @param search 条件
     * @return
     */
    @GetMapping("/")
    @ApiOperation(value = "获取所有用户", notes = "", httpMethod = "GET", response = User.class)
    public @ResponseBody
    Map<String, Object> getAllUser(@RequestParam("limit") Integer limit,
                                   @RequestParam("offset") Integer offset,
                                   @RequestParam(value = "sort", defaultValue = "last_login_date", required = false) String sort,
                                   @RequestParam("order") String order,
                                   @RequestParam(value = "search", required = false) String search) {
        if (limit == null || offset == null) {
            return null;
        }

        if (search != null && !search.trim().equals("")) {
            search = "%" + search + "%";
        }

        if (!"desc".equalsIgnoreCase(order)) {
            order = "asc";
        }
        Map<String, Object> map = new HashMap<String, Object>();
        List<User> users = userService.getAllUser(limit, offset, sort, order, search);
        map.put("total", 15);
        map.put("rows", JsonUtils.toJson(users));
        return map;
    }
}
