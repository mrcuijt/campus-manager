package service;

import com.cduestc.service.CampusAdminService;
import com.cduestc.service.entity.CampusAdmin;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author admin
 * @description
 * @date 2017-09-12 20:35
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class CampusAdminServiceTest {
    @Autowired
    @Qualifier("campusAdmin")
    CampusAdminService campusAdminService;

    @Test
    public void updateCampusAdminPassword() {
        System.out.println(campusAdminService.updateCampusAdminPassword("test", "admin", "test"));
    }
}
