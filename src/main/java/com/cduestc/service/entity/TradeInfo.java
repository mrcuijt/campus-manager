package com.cduestc.service.entity;

import com.cduestc.common.utils.JsonUtils;

public class TradeInfo {
    private Long orderCount;
    private Float tradeVolume;
    private Float tradeVolumeAliPay;
    private Float tradeVolumeWeChatPay;
    private String infoDateType;

    public Long getOrderCount() {
        return orderCount == null ? 0 : orderCount;
    }

    public void setOrderCount(Long orderCount) {
        this.orderCount = orderCount;
    }

    public Float getTradeVolume() {
        return tradeVolume == null ? 0 : tradeVolume;
    }

    public void setTradeVolume(Float tradeVolume) {
        this.tradeVolume = tradeVolume;
    }

    public Float getTradeVolumeAliPay() {
        return tradeVolumeAliPay == null ? 0 : tradeVolumeAliPay;
    }

    public void setTradeVolumeAliPay(Float tradeVolumeAliPay) {
        this.tradeVolumeAliPay = tradeVolumeAliPay;
    }

    public Float getTradeVolumeWeChatPay() {
        return tradeVolumeWeChatPay == null ? 0 : tradeVolumeWeChatPay;
    }

    public void setTradeVolumeWeChatPay(Float tradeVolumeWeChatPay) {
        this.tradeVolumeWeChatPay = tradeVolumeWeChatPay;
    }

    public String getInfoDateType() {
        return infoDateType;
    }

    public void setInfoDateType(String infoDateType) {

        this.infoDateType = infoDateType;
    }

    @Override
    public String toString() {
        return JsonUtils.toJson(this);
    }
}
