package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.shiro.captcha.DreamCaptcha;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author admin
 * @description 登录退出
 * @date 2017-09-08 23:31
 */
@Controller
@Api(value = "sellercontroller", description = "卖家信息控制器")
public class SellerController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(SellerController.class);
//    @Autowired
//    @Qualifier("dreamCaptcha")
//    private DreamCaptcha dreamCaptcha;

    /**
     * 生成图片
     */
//    @GetMapping("/captcha.jpg")
//    public void captcha(HttpServletRequest request, HttpServletResponse response) {
//        dreamCaptcha.generate(request, response);
//    }

    /**
     * get方式登录页面
     */
    @GetMapping("/login")
    @ApiOperation(value = "Get请求登录", notes = "登录", httpMethod = "GET", response = String.class)
    public String login() {
        LOGGER.info("get 请求方式登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
            return "redirect:/index";
        }
        return "login";
    }

    /**
     * 商家post提交登录表单
     *
     * @param response
     * @param request
     * @param campusAdmin
     * @param captcha
     * @param password
     * @param role
     */
    @PostMapping("/login")
    @ResponseBody
    @ApiOperation(value = "post请求登陆", notes = "登陆", httpMethod = "POST", response = Object.class)
    public Object loginPost(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam("campusAdmin") String campusAdmin,
                            @RequestParam("password") String password,
                            @RequestParam("role") String role,
                            @RequestParam("captcha") String captcha) {
        // 改为全部抛出异常，避免ajax csrf token被刷新
        Assert.hasText(campusAdmin, "用户名不能为空");
        Assert.hasText(password, "密码不能为空");
        Assert.hasText(role, "选择角色");
        Assert.hasText(captcha, "验证码不能为空");
//        LOGGER.info("campusAdmin [" + campusAdmin + "]" + " password [" + password + "] " + " codes[" + captcha + "]");
//        Assert.isTrue(dreamCaptcha.validate(request, response, captcha), "验证码不正确");
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(campusAdmin, password);
        token.setRememberMe(true);
        try {
            user.login(token);
        } catch (UnknownAccountException e) {
            throw new RuntimeException("账号不存在！", e);
        } catch (DisabledAccountException e) {
            throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
            throw new RuntimeException("密码错误！", e);
        } catch (Throwable e) {
            throw new RuntimeException(e.getMessage(), e);
        }
        //记住我的功能
        //匹配下拉菜单为总校区管理员
        return "redirect:/seller";


    }

    @GetMapping("/logout")
    @ResponseBody
    @ApiOperation(value = "退出登录", notes = "退出", httpMethod = "GET", response = Object.class)
    public Object logout() {
        LOGGER.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return new Object();
    }
}
