package service;

import com.baomidou.mybatisplus.plugins.Page;
import com.cduestc.service.FeedBackService;
import com.cduestc.service.FoodService;
import com.cduestc.service.entity.Feedback;
import com.cduestc.service.entity.FoodWithSales;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-13 10:28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class FoodServiceTest {
    @Autowired
    @Qualifier("food")
    private FoodService service;


    @Test
    public void getFeedbacks() throws ParseException {
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date end=dateFormat.parse("2015-05-29");
        Calendar c = Calendar.getInstance();
        c.setTime(end);
        c.add(Calendar.MONTH, -1);
        Date start = c.getTime();
        List<FoodWithSales> lists = service.getFoodWithSales(start, end, 1, 1, 5);
        for (FoodWithSales foodWithSales : lists) {
            System.out.println(foodWithSales);
        }
    }


}
