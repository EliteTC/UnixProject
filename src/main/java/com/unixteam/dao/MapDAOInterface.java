package com.unixteam.dao;

import com.unixteam.entity.Map;

import java.util.List;

/**
 * Created by Вадим on 26.06.2017.
 */
public interface MapDAOInterface {
    public List<Map> getAllMaps();

    public Map getMapById(int id);

    public void addMap(Map map);

    public void deleteMap(int id);

}
