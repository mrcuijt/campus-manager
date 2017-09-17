package com.cduestc.shiro.cache;


import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.util.Destroyable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;


/**
 * @author admin
 * @description 使用spring-cache作为shiro缓存
 * @date 2017-09-09 8:52
 */
public class DefaultShiroCacheManager implements org.apache.shiro.cache.CacheManager, Destroyable {
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultShiroCacheManager.class);
    private CacheManager cacheManager;

    public void setCacheManager(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    public DefaultShiroCacheManager(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    @Override
    public <K, V> Cache<K, V> getCache(String name) throws CacheException {
        if (LOGGER.isTraceEnabled()) {
            LOGGER.trace("Acquiring ShiroSpringCache instance named [" + name + "]");
        }
        org.springframework.cache.Cache cache = cacheManager.getCache(name);
        return new DefaultShiroCache<K, V>(cache);
    }

    @Override
    public void destroy() throws Exception {
        cacheManager = null;
    }
}
