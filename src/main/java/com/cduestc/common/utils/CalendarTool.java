package com.cduestc.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author admin
 * @description 日期工具类
 * @date 2017-09-16 8:22
 */
public final class CalendarTool {
    private CalendarTool() {

    }

    public static Date getMondayOfThisWeek(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
        if (day_of_week == 0)
            day_of_week = 7;
        c.add(Calendar.DATE, -day_of_week + 1);
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), 00, 00, 00);
        return c.getTime();
    }

    public static Date getSundayOfThisWeek(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
        if (day_of_week == 0)
            day_of_week = 7;
        c.add(Calendar.DATE, -day_of_week + 7);
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), 23, 59, 59);
        return c.getTime();
    }

    public static Date getTodayStart(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), 00, 00, 00);
        return c.getTime();
    }

    public static Date getTodayEnd(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE), 23, 59, 59);
        return c.getTime();
    }

    public static Date getFirstDayOfThisMonth() {
        Calendar c = Calendar.getInstance();
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 00, 00, 00);
        return c.getTime();
    }

    public static Date getFirstDayOfThisMonth(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(c.get(Calendar.YEAR), c.get(Calendar.MONTH), 1, 00, 00, 00);
        return c.getTime();
    }

    public static Date getLastDayOfThisMonth() {
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DATE, calendar.getMaximum(Calendar.DATE));
        return calendar.getTime();
    }

    public static Date getLastDayOfThisMonth(Date date) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.DATE, c.getMaximum(Calendar.DATE));
        return c.getTime();
    }

    public static Map<String, Date> getFirstAndLastDayOfMonth(String month) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
        Date date = null;
        try {
            date = sdf.parse(month);
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Map<String, Date> map = new HashMap<String, Date>();
        map.put("monthStart", getFirstDayOfThisMonth(date));
        map.put("monthEnd", getLastDayOfThisMonth(date));
        return map;
    }

    public static Boolean checkIsThisMonth(Date date) {
        Calendar c = Calendar.getInstance();
        int year = c.get(Calendar.YEAR);
        int month = c.get(Calendar.MONTH) + 1;//月份从0开始

//        int indexYear = monthStr.indexOf(String.valueOf(year));
        Calendar d = Calendar.getInstance();
        d.setTime(date);
        int indexYear = d.get(Calendar.YEAR);
        int indexMonth = d.get(Calendar.MONTH) + 1;


        if (indexYear == year && indexMonth == month) {
            //说明不是当前年月
            return true;
        }
        return false;
    }
}
