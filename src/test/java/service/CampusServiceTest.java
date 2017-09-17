package service;

import com.baomidou.mybatisplus.toolkit.SystemClock;
import com.cduestc.service.CampusService;
import com.cduestc.service.entity.Campus;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Time;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-13 14:53
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class CampusServiceTest {
    @Autowired
    @Qualifier("campus")
    private CampusService service;

    @Test
    public void updataCampus() {
        service.updataCampus(5, "xcixi");
    }

    @Test
    public void selectAllCampus() {
        List<Campus> lists = service.selectAllCampus();
        for (Campus campus : lists) {
            System.out.println(campus);
        }
    }

    @Test
    public void insertCampus() {
        Campus campus = new Campus("电子科大", 1, "苏州", new Time(SystemClock.now()), new Time(SystemClock.now()), (short) 1, "18546347575");
        service.insertCampus(campus);
    }
}
