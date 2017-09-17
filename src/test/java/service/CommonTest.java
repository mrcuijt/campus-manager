package service;

import com.cduestc.common.utils.CalendarTool;
import org.junit.Test;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author admin
 * @description
 * @date 2017-09-12 10:27
 */
public class CommonTest {
    @Test
    public void test01() {
        System.out.println(File.separator);
    }

    @Test
    public void test02() {
        Date date = new Date();
//        date.setTime(3545485l); 2015-08-19 15:08:30

        System.out.println(CalendarTool.checkIsThisMonth(date));
    }
}
