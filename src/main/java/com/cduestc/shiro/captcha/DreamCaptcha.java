package com.cduestc.shiro.captcha;

import com.cduestc.common.utils.AESUtil;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.util.StringUtils;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;


/**
 * @author admin
 * @description 生成验证码工具类
 * @date 2017-09-08 21:54
 */
public class DreamCaptcha implements InitializingBean {
    private final static Logger LOGGER = LoggerFactory.getLogger(DreamCaptcha.class);
    //默认值 login-captcha
    private static final String DEFAULT_COOKIE_NAME = "login-captcha";
    private static final String DEFALUT_CACHE_NAME = "defaultCache";
    private final static int DEFAULT_MAX_AGE = -1;

    private CacheManager cacheManager;
    private String cacheName;
    private String cookieName;

    private Cache<String, String> loginCaptchaCache;

    public DreamCaptcha() {
        this.cacheName = DEFALUT_CACHE_NAME;
        this.cookieName = DEFAULT_COOKIE_NAME;
    }

    public DreamCaptcha(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }


    public CacheManager getCacheManager() {
        return cacheManager;
    }

    public void setCacheManager(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    public String getCacheName() {
        return cacheName;
    }

    public void setCacheName(String cacheName) {
        this.cacheName = cacheName;
    }

    public String getCookieName() {
        return cookieName;
    }

    public void setCookieName(String cookieName) {
        this.cookieName = cookieName;
    }

    public void afterPropertiesSet() throws Exception {
        Assert.notNull(cacheManager, "cacheManager must be not null");
        Assert.hasText(cacheName, "cacheName must be not empty!");
        Assert.hasText(cookieName, "cookieName must be not empty!");
        this.loginCaptchaCache = cacheManager.getCache(cacheName);
    }

    /**
     * 生成验证码
     */
    public void generate(HttpServletRequest request, HttpServletResponse response) {
        //先检查cookie的uuid是否存在
        Cookie cookie = WebUtils.getCookie(request, cookieName);
        String cookieValue = cookie == null ? null : cookie.getValue();
        if (StringUtils.isEmpty(cookieValue)) {
            cookieValue = UUID.randomUUID().toString();
        }
        cookie = new Cookie(cookieName, cookieValue);
        cookie.setMaxAge(DEFAULT_MAX_AGE);
        response.addCookie(cookie);
        String captchaCode = CaptchaUtils.generateCode();
        //生成验证码
        CaptchaUtils.generate(response, captchaCode);
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("captchaCode:[" + captchaCode + "]");
        }
        //缓存验证码
        loginCaptchaCache.put(cookieValue, captchaCode.toUpperCase());
    }

    /**
     * 仅能验证一次，验证后立即删除
     *
     * @param request          HttpServletRequest
     * @param response         HttpServletResponse
     * @param userInputCaptcha 用户输入的验证码
     * @return 验证通过返回 true, 否则返回 false
     */
    public boolean validate(HttpServletRequest request, HttpServletResponse response, String userInputCaptcha) {

        Cookie cookie = WebUtils.getCookie(request, cookieName);
        if (cookie == null) {
            return false;
        }
        String cookieValue = cookie.getValue();
        if (!StringUtils.hasText(cookieValue)) {
            return false;
        }
        String captchaCode = loginCaptchaCache.get(cookieValue);
        if (!StringUtils.hasText(captchaCode)) {
            return false;
        }
        boolean result = captchaCode.equalsIgnoreCase(userInputCaptcha);
        if (LOGGER.isDebugEnabled()) {
            LOGGER.debug("validate captcha userInputCaptcha is [" + userInputCaptcha + "] result [" + result + "]");
        }
        //验证码输入正确删除cookie
        if (result) {
            Cookie tmp = new Cookie(cookieName, null);
            tmp.setMaxAge(-1);
            response.addCookie(tmp);
        }
        loginCaptchaCache.remove(cookieValue);
        return result;
    }
}
