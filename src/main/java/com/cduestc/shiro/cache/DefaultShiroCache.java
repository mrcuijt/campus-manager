package com.cduestc.shiro.cache;


import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.Cache;
import org.springframework.cache.Cache.ValueWrapper;


import java.util.Collection;
import java.util.Collections;
import java.util.Set;

/**
 * @author admin
 * @description 使用spring作为shiro缓存
 * @date 2017-09-09 8:25
 */
public class DefaultShiroCache<K, V> implements org.apache.shiro.cache.Cache<K, V> {
    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultShiroCache.class);

    private final Cache cache;

    public DefaultShiroCache(Cache cache) {
        if (cache == null) {
            throw new IllegalArgumentException("Cache argument cannot be null.");
        }
        this.cache = cache;
    }

    @Override
    public V get(K key) throws CacheException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.trace("Getting object from cache [" + this.cache.getName() + "] for key [" + key + "] key type:" + key.getClass());
        }
        ValueWrapper valueWrapper = cache.get(key);
        if (valueWrapper == null) {
            if (LOGGER.isDebugEnabled()) {
                LOGGER.trace("Element for [" + key + "] is null");
            }
            return null;
        }
        return (V) valueWrapper.get();
    }

    @Override
    public V put(K key, V value) throws CacheException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.trace("Putting object in cache [" + this.cache.getName() + "] for key [" + key + "]key type:" + key.getClass());
        }
        V previous = get(key);
        cache.put(key, value);
        return previous;
    }

    @Override
    public V remove(K key) throws CacheException {
        if (LOGGER.isDebugEnabled()) {
            LOGGER.trace("Removing object from cache [" + this.cache.getName() + "] for key [" + key + "]key type:" + key.getClass());
        }
        V previous = get(key);
        cache.evict(key);
        return previous;
    }

    @Override
    public void clear() throws CacheException {
        if (LOGGER.isTraceEnabled()) {
            LOGGER.trace("Clearing all objects from cache [" + this.cache.getName() + "]");
        }
        cache.clear();
    }

    @Override
    public int size() {
        return 0;
    }

    @Override
    public Set<K> keys() {
        return Collections.emptySet();
    }

    @Override
    public Collection<V> values() {
        return Collections.emptySet();
    }
}

