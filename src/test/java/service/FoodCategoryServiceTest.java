package service;

import com.cduestc.service.FoodCategoryService;
import com.cduestc.service.entity.FoodCategory;
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
public class FoodCategoryServiceTest {
    @Autowired
    @Qualifier("foodcategory")
    private FoodCategoryService service;


    @Test
    public void getAllFoodCategory() {
        List<FoodCategory> lists = service.getAllFoodCategory(10, 0, 1);
        for (FoodCategory category : lists) {
            System.out.println(category);
        }
    }
}
