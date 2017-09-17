package com.cduestc.service.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.cduestc.service.entity.Order;
import com.cduestc.service.entity.PayByType;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface OrderMapper extends BaseMapper<Order> {
    /**
     * <p>获取指定期间的销售量</p>
     *
     * @param campusId  校园id
     * @param startDate 开始时间
     * @param EndDate   结束时间
     * @return
     */
    Map selectSalesInfoByCampusId(
            @Param("campusId") Integer campusId,
            @Param("dateStart") Date startDate,
            @Param("dateEnd") Date EndDate
    );

    /**
     * <p>按照支付分类：①其他、②支付宝、③、微信分类并综合对应的销售金额</p>
     *
     * @param campusId  校园id
     * @param startDate 起始时间
     * @param endDate   结束时间
     * @return
     */
    List<PayByType> selectTradeVolumeByCampusId(
            @Param("campusId") Integer campusId,
            @Param("dateStart") Date startDate,
            @Param("dateEnd") Date endDate
    );
}
