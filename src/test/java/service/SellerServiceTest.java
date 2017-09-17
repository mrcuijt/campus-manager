package service;

import com.baomidou.mybatisplus.toolkit.SystemClock;
import com.cduestc.common.utils.DigestUtils;
import com.cduestc.service.SellerService;
import com.cduestc.service.entity.Seller;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author admin
 * @description UserServiceTest
 * @date 2017-09-09 16:59
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class SellerServiceTest {
    @Autowired
    @Qualifier("seller")
    SellerService sellerService;

    @Test
    public void selectByCampusAdmin() {
        Seller seller = sellerService.selectByCampusAdmin("admin");
        System.out.println(seller);
    }

    @Test
    public void updateLastLoginTime() {
        sellerService.updateLastLoginTime(new Date(SystemClock.now()), "admin");
    }

    @Test
    public void removeSeller() {
        sellerService.removeSeller("lizhi");
    }

    @Test
    public void addSeller() {
        Seller seller = new Seller("lizhi", "dsfasdgasdfasf", (short) 0, 0, new Date(), "Dfsaf");
        sellerService.addASeller(seller);
    }

    @Test
    public void hashByShiro() {
        System.out.println(DigestUtils.hashByShiro("md5", "admin", "test", 2));
    }
}
