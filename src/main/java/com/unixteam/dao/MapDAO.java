package com.unixteam.dao;

import com.unixteam.entity.Map;
import com.unixteam.entity.User;
import com.unixteam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Repository
public class MapDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;


    public class MapMapper implements RowMapper<Map> {
        public Map mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            Map map= new Map();
            map.setPost_id(resultSet.getInt("post_id"));
            map.setPlaceName(resultSet.getString("placeName"));
            map.setX_coordinate(resultSet.getDouble("x_coordinate"));
            map.setY_coordinate(resultSet.getDouble("y_coordinate"));

            return map;
        }
    }
    private static final String GET_ALL_MAPS = "SELECT * FROM `map`";
    private static final String GET_BY_ID = "SELECT * FROM `map` WHERE post_id=?";

    private static final String INSERT_MAP   = "INSERT INTO `map` values(?,?,?,?)";
    private static final String UPDATE_MAP   = "UPDATE `map` SET placeName = ? , x_coordinate = ? , y_coordinate = ? WHERE post_id = ?";

    private static final String DELETE_MAP   = "DELETE FROM `map` WHERE post_id = ?";



    public List<Map> getAllMaps() throws  SQLException {
        return jdbcTemplate.query(GET_ALL_MAPS,new MapMapper());
    }

    public Map getMapById(int mapId) throws  SQLException {
        return jdbcTemplate.queryForObject(GET_BY_ID,new MapMapper(),mapId);
    }

    public void addMap(int post_id,String placeName,double x_coordinate,double y_coordinate){
        jdbcTemplate.update(INSERT_MAP,post_id,placeName,x_coordinate,y_coordinate);
    }

    public void updateMap(int post_id,String placeName,double x_coordinate,double y_coordinate){
        jdbcTemplate.update(UPDATE_MAP,placeName,x_coordinate,y_coordinate,post_id);

    }

    public void deleteMap(int id){
        jdbcTemplate.update(DELETE_MAP,id);
    }



}