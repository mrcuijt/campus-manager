package com.cduestc.controller;

import com.cduestc.common.controller.BaseController;
import com.cduestc.common.utils.CalendarTool;
import com.cduestc.service.OrderService;
import com.cduestc.service.entity.TradeInfo;
import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-15 23:05
 */
@Controller
@RequestMapping("/order")
@Api(value = "orderController", description = "订单信息控制器")
public class OlderController extends BaseController {

    @Autowired
    @Qualifier("order")
    private OrderService orderService;

    /**
     * <p>获取指定时间段交易信息</p>
     *
     * @param campusId 校园id
     * @param date     指定时间段
     * @return
     */
    @GetMapping("/{campus_id}")
    @ResponseBody
    @ApiOperation(value = "获取销量和销售额", notes = "", response = List.class, httpMethod = "GET")
    public List<TradeInfo> getSalesByDate(
            @PathVariable("campus_id") Integer campusId,
            @RequestParam("date") Date date) {
        Date dateStart;
        Date dateEnd;
        TradeInfo tradeInfo;
        List<TradeInfo> tradeList = new ArrayList<TradeInfo>();
        //如果month不为空，说明切换了月份；但是注意month为本月的时候，此时是下面的情况
        if (CalendarTool.checkIsThisMonth(date)) {
            dateStart = CalendarTool.getFirstDayOfThisMonth(date);
            dateEnd = CalendarTool.getLastDayOfThisMonth(date);
            tradeInfo = orderService.getTradeInfo(campusId, dateStart, dateEnd);
            tradeInfo.setInfoDateType("本月");
            tradeList.add(tradeInfo);
            return tradeList;
        }
        //当天订单数、销售额
        dateStart = CalendarTool.getTodayStart(date);
        dateEnd = CalendarTool.getTodayEnd(date);
        tradeInfo = orderService.getTradeInfo(campusId, dateStart, dateEnd);
        tradeInfo.setInfoDateType("今天");
        tradeList.add(tradeInfo);
        //本周订单数，销售额
        dateStart = CalendarTool.getMondayOfThisWeek(date);
        dateEnd = CalendarTool.getSundayOfThisWeek(date);
        tradeInfo = orderService.getTradeInfo(campusId, dateStart, dateEnd);
        tradeInfo.setInfoDateType("本周");
        tradeList.add(tradeInfo);
        //本月订单销售额
        dateStart = CalendarTool.getFirstDayOfThisMonth(date);
        dateEnd = CalendarTool.getLastDayOfThisMonth(date);
        tradeInfo = orderService.getTradeInfo(campusId, dateStart, dateEnd);
        tradeInfo.setInfoDateType("本月");
        tradeList.add(tradeInfo);
        return tradeList;
    }
}
