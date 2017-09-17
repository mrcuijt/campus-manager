package com.cduestc.service.entity;

public class VeryShortFood {
    private Long foodId;

    private String homeImgUrl;

    public Long getFoodId() {
        return foodId == null ? 0 : foodId;
    }

    public void setFoodId(Long foodId) {
        this.foodId = foodId;
    }

    public String getHomeImage() {
        return homeImgUrl;
    }

    public void setHomeImage(String homeImage) {
        this.homeImgUrl = homeImage;
    }


}
