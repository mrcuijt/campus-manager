package service;

import com.cduestc.service.AppKeyService;
import com.cduestc.service.UserService;
import com.cduestc.service.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author admin
 * @description
 * @date 2017-09-10 14:23
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class UserServiceTest {
    @Autowired
    @Qualifier("user")
    private UserService service;

    @Test
    public void getAllUser() {
       List<User> lists=service.getAllUser(10,0,"create_time","asc","test");
       for(User user:lists){
           System.out.println(user);
       }
    }
}
