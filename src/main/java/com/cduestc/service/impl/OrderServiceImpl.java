package com.cduestc.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cduestc.service.OrderService;
import com.cduestc.service.dao.OrderMapper;
import com.cduestc.service.entity.Order;
import com.cduestc.service.entity.PayByType;
import com.cduestc.service.entity.TradeInfo;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-16 8:54
 */
@Service("order")
public class OrderServiceImpl extends ServiceImpl<OrderMapper, Order> implements OrderService {
    /**
     * <p>获取指定时间内的交易数目</p>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    @Override
    public Long getSalesInfoByCampusId(Integer campusId, Date dateStart, Date dateEnd) {
        Map map = baseMapper.selectSalesInfoByCampusId(campusId, dateStart, dateEnd);
        return (Long) map.get("num");
    }

    /**
     * <p>获取交易方法和指定时间内的交易总额</p>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    @Override
    public List<PayByType> getTradeVolumeByCampusId(Integer campusId, Date dateStart, Date dateEnd) {
        return baseMapper.selectTradeVolumeByCampusId(campusId, dateStart, dateEnd);
    }

    /**
     * <p>封装指定时间段内的交易信息</p>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    @Override
    public TradeInfo getTradeInfo(Integer campusId, Date dateStart, Date dateEnd) {
        TradeInfo tradeInfo = new TradeInfo();
        Long salesNumber = getSalesInfoByCampusId(campusId, dateStart, dateEnd);
        if (salesNumber == null || salesNumber.intValue() == 0) {
            tradeInfo.setTradeVolumeWeChatPay((float) 0);
            tradeInfo.setTradeVolume((float) 0);
            tradeInfo.setTradeVolumeAliPay((float) 0);
            tradeInfo.setOrderCount(0l);
            return tradeInfo;
        }
        tradeInfo.setOrderCount(salesNumber);
        List<PayByType> payByTypes = getTradeVolumeByCampusId(campusId, dateStart, dateEnd);
        if (payByTypes == null) {
            tradeInfo.setTradeVolume((float) 0);
            tradeInfo.setTradeVolumeAliPay((float) 0);
            tradeInfo.setTradeVolumeWeChatPay((float) 0);
            return tradeInfo;
        }
        for (PayByType payByType : payByTypes) {
            switch (payByType.getPayWay()) {
                case 0:
                    if (payByType.getTotalPrice() != null) {
                        tradeInfo.setTradeVolume(payByType.getTotalPrice());
                    } else {
                        tradeInfo.setTradeVolume((float) 0);
                    }
                    break;
                case 1:
                    if (payByType.getTotalPrice() != null) {
                        tradeInfo.setTradeVolumeAliPay(payByType.getTotalPrice());
                    } else {
                        tradeInfo.setTradeVolumeAliPay((float) 0);
                    }
                    break;
                default:
                    if (payByType.getTotalPrice() != null) {
                        tradeInfo.setTradeVolumeWeChatPay(payByType.getTotalPrice());
                    } else {
                        tradeInfo.setTradeVolumeWeChatPay((float) 0);
                    }
                    break;
            }
        }
        return tradeInfo;
    }
}
