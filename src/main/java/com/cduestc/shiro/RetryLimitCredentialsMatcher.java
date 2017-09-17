package com.cduestc.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.util.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author admin
 * @description 输错5次密码锁定半个小时
 * @date 2017-09-09 11:46
 */
public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher implements InitializingBean {
    private final static Logger LOGGER = LoggerFactory.getLogger(RetryLimitCredentialsMatcher.class);
    private final static String DEFAULT_CACHE_NAME = "retryLimitCache";

    private CacheManager cacheManager;
    private String retryLimitCachaName;
    private Cache<String, AtomicInteger> passwordRetryCache;
    private PasswordHash passwordHash;

    public RetryLimitCredentialsMatcher(CacheManager cacheManager) {
        this.retryLimitCachaName = DEFAULT_CACHE_NAME;
        this.cacheManager = cacheManager;
    }

    public void setRetryLimitCachaName(String retryLimitCachaName) {
        this.retryLimitCachaName = retryLimitCachaName;
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) token.getPrincipal();
        boolean matches = super.doCredentialsMatch(token, info);
        if (matches){
            return true;
        }
        AtomicInteger retryCounnt=passwordRetryCache.get(username);
        if (retryCounnt==null){
            retryCounnt=new AtomicInteger(0);
            passwordRetryCache.put(username,retryCounnt);
        }
        if (retryCounnt.incrementAndGet()>5){
             LOGGER.info("username: " + username + " tried to login more than 5 times in period");
            throw new ExcessiveAttemptsException("用户名: " + username + " 密码连续输入错误超过5次，锁定半小时！");
        }else{
            passwordRetryCache.put(username,retryCounnt);
        }
        return false;
    }

    public void setPasswordHash(PasswordHash passwordHash) {
        this.passwordHash = passwordHash;
    }


    @Override
    public void afterPropertiesSet() throws Exception {
        Assert.notNull(passwordHash, "you must set passwordHash");
        super.setHashAlgorithmName(passwordHash.getAlgorithmName());
        super.setHashIterations(passwordHash.getHashIterations());
        this.passwordRetryCache = cacheManager.getCache(retryLimitCachaName);
    }
}
