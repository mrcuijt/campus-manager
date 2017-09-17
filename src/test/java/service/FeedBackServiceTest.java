package service;

import com.baomidou.mybatisplus.plugins.Page;
import com.cduestc.service.FeedBackService;
import com.cduestc.service.entity.Feedback;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-13 10:28
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class FeedBackServiceTest {
    @Autowired
    @Qualifier("feedback")
    private FeedBackService service;

    @Test
    public void getFeedbacks() {
        List<Feedback> Feedbacks1 = service.selectFeedbacks(0, new Page(2, -6, "date"));
        for (Feedback e : Feedbacks1) {
            System.out.println(e);
        }
    }

    @Test
    public void getFeedbackss() {
        List<Feedback> Feedbacks1 = service.selectFeedbacks(1, new Page(2, 5, "date"));
        for (Feedback e : Feedbacks1) {
            System.out.println(e);
        }
    }
}
