package com.cduestc.service.entity;

public class FoodSpecialKey {
    protected Long foodId;
    protected Integer campusId;
    
    protected Integer specialId;

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public Integer getSpecialId() {
        return specialId==null?0:specialId;
    }

    public void setSpecialId(Integer specialId) {
        this.specialId = specialId;
    }
    
    
}