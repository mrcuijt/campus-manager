package com.cduestc.service.entity;

public class MiniOrder {
	private Short status;
	private Integer orderCount;
	public Short getStatus() {
		return status==null?0:status;
	}
	public void setStatus(Short status) {
		this.status = status;
	}
	public Integer getOrderCount() {
		return orderCount==null?0:orderCount;
	}
	public void setOrderCount(Integer orderCount) {
		this.orderCount = orderCount;
	}
}
