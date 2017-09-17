package service;

import com.cduestc.common.utils.CalendarTool;
import com.cduestc.service.CampusAdminService;
import com.cduestc.service.OrderService;
import com.cduestc.service.entity.PayByType;
import com.cduestc.service.entity.TradeInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-12 20:35
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class OrderServiceTest {
    @Autowired
    @Qualifier("order")
    OrderService service;

    @Test
    public void getSalesInfoByCampusId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date = null;
        try {
            date = dateFormat.parse("2015-04-29 09:54:09");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date startDate = CalendarTool.getFirstDayOfThisMonth(date);
        Long i = service.getSalesInfoByCampusId(1, startDate, date);
        System.out.println(i);
    }

    @Test
    public void getTradeVolumeByCampusId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date date = null;
        try {
            date = dateFormat.parse("2017-10-08 16:05:48");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date endDate=CalendarTool.getLastDayOfThisMonth(date);
        Date startDate = CalendarTool.getFirstDayOfThisMonth(date);
        TradeInfo tradeInfo = service.getTradeInfo(1, startDate, endDate);
        System.out.println(tradeInfo);
    }
}
