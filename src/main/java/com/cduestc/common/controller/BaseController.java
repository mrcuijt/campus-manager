package com.cduestc.common.controller;


import com.baomidou.mybatisplus.plugins.Page;
import com.cduestc.common.utils.Constants;
import com.cduestc.common.utils.StringEscapeEditor;
import com.cduestc.shiro.ShiroUser;
import org.apache.commons.io.Charsets;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author admin
 * @description 通用controller
 * @date 2017-09-08 21:32
 */
public class BaseController {
    protected static final Logger LOGGER = LoggerFactory.getLogger(BaseController.class);

    @InitBinder
    public void InitBinder(ServletRequestDataBinder dataBinder) {
        /**
         * 自动转换日期类型的字段格式
         * */
        dataBinder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
        dataBinder.registerCustomEditor(String.class, new StringEscapeEditor());
    }

    /**
     * <p>
     * 获取当前登录用户对象<p/>
     *
     * @return {ShiroUser}
     */
    protected ShiroUser getCurrentUser() {
        return (ShiroUser) SecurityUtils.getSubject();
    }


    /**
     * <p>
     * 获取当前登录对象id</p>
     *
     * @return {String}
     */
    protected String getUserId() {
        return getCurrentUser().getId();
    }

    /**
     * <p>
     * 响应错误信息<p/>
     *
     * @param error
     * @return {Map}
     */
    public Map<String, Object> sendError(String error) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(Constants.STATUS, Constants.FAILURE);
        result.put(Constants.MESSAGE, error);
        return result;
    }

    /**
     * <p>
     * 响应正确信息<p/>
     *
     * @param info
     * @return {Map}
     */
    public Map<String, Object> sendSuccess(String info) {
        Map<String, Object> result = new HashMap<String, Object>();
        result.put(Constants.STATUS, Constants.SUCCESS);
        result.put(Constants.MESSAGE, info);
        return result;
    }

    /***
     * <p>
     * 返回响应无内容</p>
     * @param status
     * @return {ResponseEntity}
     */
    protected ResponseEntity<Void> sendMessage(int status) {
        return ResponseEntity.status(status).build();
    }

    /**
     * <p>
     * 重载方法<p/>
     *
     * @param status
     * @return {ResponseEntity}
     */
    protected <T> ResponseEntity<T> sendMessage(T t, int status) {
        return ResponseEntity.status(status).body(t);
    }


    /**
     * <p>
     * 分页<p/>
     *
     * @param current 当前页
     * @param size    页大小
     * @param sort    顺序
     * @param order   长短
     */
    protected <T> Page<T> getPage(Integer current, Integer size, String sort, String order) {
        Page<T> page = new Page<T>(current, size, sort);
        if ("desc".equalsIgnoreCase(order)) {
            page.setAsc(false);
        } else {
            page.setAsc(true);
        }
        return page;
    }


    protected String redirect(String url) {
        return new StringBuilder("redirect:").append(url).toString();
    }

    /**
     * <p>
     * 下载文件<p/>
     *
     * @param file
     * @return {ResponseEntity}
     */
    protected ResponseEntity<Resource> download(File file) {
        String filename = file.getName();
        return download(file, filename);
    }

    private ResponseEntity<Resource> download(File file, String fileName) {
        Resource resource = new FileSystemResource(file);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String header = request.getHeader("User-Agent");
        // 避免空指针
        header = header == null ? "" : header.toUpperCase();
        HttpStatus status;
        if (header.contains("MSIE") || header.contains("TRIDENT") || header.contains("EDGE")) {
            try {
                fileName = UriUtils.encode(fileName, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            status = HttpStatus.OK;
        } else {
            fileName = new String(fileName.getBytes(), Charsets.ISO_8859_1);
            status = HttpStatus.CREATED;
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", fileName);
        return new ResponseEntity<Resource>(resource, headers, status);
    }

}
