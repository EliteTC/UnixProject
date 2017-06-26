package com.unixteam.service;

import com.unixteam.dao.MapDAO;
import com.unixteam.entity.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Admin on 12-Jun-17.
 */
@Service
public class MapService {
    @Autowired
    private MapDAO mapDAO;

    public List<Map> getAllMaps() throws SQLException {
        return mapDAO.getALlMaps();
    }
    public Map getMapById(int mapId) throws  SQLException{
        return mapDAO.getMapById(mapId);
    }

    public void addMap(int post_id,String placeName,double x_coordinate,double y_coordinate){
        mapDAO.addMap(post_id,placeName,x_coordinate,y_coordinate);
    }

    public void updateMap( int post_id, String placeName,double x_coordinate,double y_coordinate){
        mapDAO.updateMap(post_id, placeName, x_coordinate, y_coordinate);

    }

    public void deleteMap(int id){
        mapDAO.deleteMap(id);
    }
}
