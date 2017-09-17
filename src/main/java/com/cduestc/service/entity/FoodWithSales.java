package com.cduestc.service.entity;

import com.cduestc.common.utils.JsonUtils;

public class FoodWithSales {
    private Long foodId;
    private String foodName;
    private Integer sales;

    public Long getFoodId() {
        return foodId==null?0:foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public Integer getSales() {
        return sales==null?0:sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
