package com.cduestc.service.entity;

public class Preferential {
    private Integer preferentialId;

    private Integer needNumber;

    private Integer discountNum;
    
    private Integer campusId;

    public Integer getCampusId() {
		return campusId==null?0:campusId;
	}

	public void setCampusId(Integer campusId) {
		this.campusId = campusId;
	}

	public Integer getPreferentialId() {
        return preferentialId==null?0:preferentialId;
    }

    public void setPreferentialId(Integer preferentialId) {
        this.preferentialId = preferentialId;
    }

    public Integer getNeedNumber() {
        return needNumber==null?0:needNumber;
    }

    public void setNeedNumber(Integer needNumber) {
        this.needNumber = needNumber;
    }

    public Integer getDiscountNum() {
        return discountNum==null?0:discountNum;
    }

    public void setDiscountNum(Integer discountNum) {
        this.discountNum = discountNum;
    }

}