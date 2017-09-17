package service;

import com.cduestc.service.CityService;
import com.cduestc.service.entity.City;
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
 * @date 2017-09-14 21:30
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test.xml")
public class CityServiceTest {
    @Autowired
    @Qualifier("city")
    private CityService cityService;

    @Test
    public void selectAll() {
        List<City> cities = cityService.selectAll();
        for (City city : cities) {
            System.out.println(city);
        }
    }

    @Test
    public void insertCity() {
        City city = new City();
        city.setCityName("绵阳");
        cityService.insertCity(city);
    }

}
