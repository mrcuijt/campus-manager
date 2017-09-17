package com.cduestc.shiro;

import com.cduestc.service.entity.Seller;
import org.apache.shiro.crypto.hash.Hash;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author admin
 * @description 认证对象
 * @date 2017-09-10 16:56
 */
@SuppressWarnings("serial")
public class ShiroUser implements Serializable {
    private String id;
    private Set<String> urlSet;
    private Set<String> roles;

    public ShiroUser(Seller seller) {
        this.id = seller.getCampusAdmin();
        this.urlSet = new HashSet<String>();
        this.roles = new HashSet<String>();
    }

    public String getId() {
        return id;
    }

    public Set<String> getUrlSet() {
        return urlSet;
    }

    public Set<String> getRoles() {
        return roles;
    }
}
