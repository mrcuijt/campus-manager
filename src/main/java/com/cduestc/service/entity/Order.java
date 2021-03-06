package com.cduestc.service.entity;

import java.util.Date;

public class Order {
    private Long orderId;
    
    private Integer campusId;
    
    private String phone;

    private Date createTime;

    private Short status;

    private Float price;

    private Integer orderCount;

    private Short isRemarked;

    private Short tag;

   // private Integer foodSpecial;

    private Long foodId;

    private String togetherId;
    
    private String rank;
    
    private Short payWay;
    
    private Float totalPrice;
   

	public Order(){
    	
    }
    
    public Order(Integer campusId,String phoneId, Long foodId2, Integer foodCount) {
    	this.setCampusId(campusId);
    	this.phone=phoneId;
    	foodId=foodId2;
    	orderCount=foodCount;
    	tag=1;
    	createTime=new Date();
    	status=0;
    	isRemarked=0;
    	orderId=createTime.getTime();
	}

	public Long getOrderId() {
        return orderId==null?0:orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Short getStatus() {
        return status==null?0:status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Float getPrice() {
        return price==null?0:price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getOrderCount() {
        return orderCount==null?0:orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public Short getIsRemarked() {
        return isRemarked==null?0:isRemarked;
    }

    public void setIsRemarked(Short isRemarked) {
        this.isRemarked = isRemarked;
    }

    public Short getTag() {
        return tag==null?0:tag;
    }

    public void setTag(Short tag) {
        this.tag = tag;
    }

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

	public String getTogetherId() {
		return togetherId;
	}

	public void setTogetherId(String togetherId) {
		this.togetherId = togetherId;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public Integer getCampusId() {
		return campusId==null?0:campusId;
	}

	public void setCampusId(Integer campusId) {
		this.campusId = campusId;
	}

	public Short getPayWay() {
		return payWay==null?0:payWay;
	}

	public void setPayWay(Short payWay) {
		this.payWay = payWay;
	}

	public Float getTotalPrice() {
		return totalPrice==null?0:totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}
}