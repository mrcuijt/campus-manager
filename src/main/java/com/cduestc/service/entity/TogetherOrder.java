package com.cduestc.service.entity;

import java.util.Date;
import java.util.List;


public class TogetherOrder {
    private String togetherId;
    
    private Short status;
    
    private Date togetherDate ;
    
    private List<SmallOrder> smallOrders;
    
    private Short payWay;
    
    private Float totalPrice;
     
	public Short getPayWay() {
		return payWay==null?0:payWay;
	}
	public void setPayWay(Short payWay) {
		this.payWay = payWay;
	}
	public String getTogetherId() {
		return togetherId;
	}
	public void setTogetherId(String togetherId) {
		this.togetherId = togetherId;
	}
	public List<SmallOrder> getSmallOrders() {
		return smallOrders;
	}
	public void setSmallOrders(List<SmallOrder> smallOrders) {
		this.smallOrders = smallOrders;
	}
	public Short getStatus() {
		return status==null?0:status;
	}
	public void setStatus(Short status) {
		this.status = status;
	}
	public Date getTogetherDate() {
		return togetherDate;
	}
	public void setTogetherDate(Date togetherDate) {
		this.togetherDate = togetherDate;
	}
	public Float getTotalPrice() {
		return totalPrice==null?0:totalPrice;
	}
	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
    
    
}
