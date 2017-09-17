package controller;

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

import java.io.UnsupportedEncodingException;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

/**
 * @author admin
 * @description
 * @date 2017-09-13 23:20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test-web.xml")
@WebAppConfiguration()
public class HotSearchControllerTest {
    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void getHotSearchs() {
        String responseString = null;
        try {
            responseString = mockMvc.perform(get("/hotsearch/2")
                    .contentType(MediaType.APPLICATION_JSON)
            ).andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(responseString);
    }

    @Test
    public void updateSearch() {
        MultiValueMap params = new LinkedMultiValueMap();
        params.add("disPlayName", "戴尔系列");
        params.add("searchTag", "电脑");
        params.add("campusId", "1");
        String responseString = null;
        try {
            responseString = mockMvc.perform(put("/hotsearch/9")
                    .contentType(MediaType.APPLICATION_JSON)
                    .params(params)).andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(responseString);
    }

    @Test
    public void deleteHotSearchs() {
        String responseString = null;
        try {
            responseString = mockMvc.perform(delete("/hotsearch/9,12")
                    .contentType(MediaType.APPLICATION_JSON).param("nums", "2"))
                    .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(responseString);
    }
}
