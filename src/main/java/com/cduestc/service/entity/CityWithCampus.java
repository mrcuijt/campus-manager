package com.cduestc.service.entity;

import java.util.ArrayList;

/**
 * @author admin
 * @description 表关系映射
 * @date 2017-09-10 14:56
 */
public class CityWithCampus extends City {
    private ArrayList<Campus> campuses;

    public ArrayList<Campus> getCampuses() {
        return campuses;
    }

    public void setCampuses(ArrayList<Campus> campuses) {
        this.campuses = campuses;
    }
}
