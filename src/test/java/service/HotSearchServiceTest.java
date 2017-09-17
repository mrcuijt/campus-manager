package service;

import com.baomidou.mybatisplus.toolkit.SystemClock;
import com.cduestc.service.HotSearchService;
import com.cduestc.service.entity.HotSearch;
import org.apache.shiro.dao.DataAccessException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author admin
 * @description
 * @date 2017-09-13 22:51
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class HotSearchServiceTest {
    @Autowired
    @Qualifier("hotSearch")
    private HotSearchService hotSearchService;

    @Test
    public void selectHostSearchs() {
        List<HotSearch> hotSearches = hotSearchService.selectHostSearchs(3);
        for (HotSearch search : hotSearches) {
            System.out.println(search);
        }
    }

    @Test
    public void updateHotSearch() {
        HotSearch search = new HotSearch(-10, "戴尔电脑", "笔记本电脑", SystemClock.now(), 1);
        int result = hotSearchService.updateHotSearch(search);
        System.out.println(result);
    }

    @Test
    public void deleteHotSearchs() {
        List<Serializable> list = new ArrayList<Serializable>();
        list.add(9);
        list.add(12);
        list.add(14);
        Integer results = hotSearchService.deleteHotSearchs(list);
        System.out.println(results);
    }
}
