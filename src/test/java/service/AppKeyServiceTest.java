package service;

import com.cduestc.service.AppKeyService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-10 14:23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class AppKeyServiceTest {
    @Autowired
    @Qualifier("appkey")
    private AppKeyService service;

    @Test
    public void selectKey() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("secrect", "2fbf3345716d7ae1840bc11aa09e0b19");
        System.out.println(service.selectKey(map));
    }
}
