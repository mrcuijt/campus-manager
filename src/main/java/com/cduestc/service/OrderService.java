package com.cduestc.service;

import com.baomidou.mybatisplus.service.IService;
import com.cduestc.service.entity.Order;
import com.cduestc.service.entity.PayByType;
import com.cduestc.service.entity.TradeInfo;

import java.util.Date;
import java.util.List;


public interface OrderService extends IService<Order> {
    /**
     * <p>
     * 获取指定时间段和指定校区的订单总数<p/>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    Long getSalesInfoByCampusId(Integer campusId, Date dateStart, Date dateEnd);

    /**
     * <p>
     * 获取指定时间段和校区的交易额<p/>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    List<PayByType> getTradeVolumeByCampusId(Integer campusId, Date dateStart, Date dateEnd);

    /**
     * <p>
     * 获取交易信息<p/>
     *
     * @param campusId  校园id
     * @param dateStart 起始时间
     * @param dateEnd   结束时间
     * @return
     */
    TradeInfo getTradeInfo(Integer campusId, Date dateStart, Date dateEnd);
}
