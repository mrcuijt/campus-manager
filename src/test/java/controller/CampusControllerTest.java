package controller;

import com.baomidou.mybatisplus.toolkit.SystemClock;
import com.cduestc.common.utils.JsonUtils;
import com.cduestc.service.entity.Campus;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;

import java.sql.Time;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @author admin
 * @description
 * @date 2017-09-13 15:45
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test-web.xml")
@WebAppConfiguration
public class CampusControllerTest {
    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void closeCampus() {
        MultiValueMap multiValueMap = new LinkedMultiValueMap();
        multiValueMap.add("closeReason", "  ");
        String responseString = null;
        try {
            responseString = mockMvc.perform(put("/campus/3")
                    .contentType(MediaType.APPLICATION_JSON).params(multiValueMap))
                    .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("--------返回的json = " + responseString);
    }

    @Test
    public void selectAllCampus() {
        String responseString = null;
        try {
            responseString = mockMvc.perform(get("/campus/")
                    .contentType(MediaType.APPLICATION_JSON))
                    .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(responseString);
    }

    @Test
    public void addCampus() {
        String responseString = null;
        Campus campus=new Campus("电子科大成都学院",1,"苏州",new Time(SystemClock.now()),new Time(SystemClock.now()),(short)1,"18546347575");
        String reqesutString = JsonUtils.toJson(campus);
        System.out.println(reqesutString);

        try {
            responseString = mockMvc.perform(post("/campus/")
                    .contentType(MediaType.APPLICATION_JSON).content(reqesutString))
                    .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(responseString);
    }
}
