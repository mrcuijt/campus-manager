package com.cduestc.shiro;

import com.cduestc.service.SellerService;
import com.cduestc.service.entity.Seller;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.codec.CodecSupport;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.util.SimpleByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import java.util.HashSet;

/**
 * @author admin
 * @description shiro权限认证以及授权
 * @date 2017-09-08 21:52
 */
public class ShiroDbRealm extends AuthorizingRealm {

    private static final Logger LOGGER = LoggerFactory.getLogger(ShiroDbRealm.class);
    @Autowired
    @Qualifier("seller")
    private SellerService service;

    public ShiroDbRealm(CacheManager cacheManager, CredentialsMatcher matcher) {
        super(cacheManager, matcher);
    }

    /**
     * 权限认证
     *
     * @param principals
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        ShiroUser seller = (ShiroUser) principals.getPrimaryPrincipal();
        info.setRoles(seller.getRoles());
        info.addStringPermissions(seller.getUrlSet());
        return info;
    }

    /**
     * 登录认证信息
     *
     * @param authenticationToken
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        Seller seller = service.selectByCampusAdmin(token.getUsername());
        if (seller == null) {
            return null;
        }
        ShiroUser shiroUser = new ShiroUser(seller);
        return new SimpleAuthenticationInfo(shiroUser, seller.getPassword(), ByteSource.Util.bytes(seller.getSalt()), getName());
    }

    @Override
    public void onLogout(PrincipalCollection principals) {
        clearCachedAuthorizationInfo(principals);
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        clearCachedAuthenticationInfo(principals);
    }

}
