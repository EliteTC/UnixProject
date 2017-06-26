package com.unixteam.dao;

import com.unixteam.entity.Map;
import com.unixteam.entity.Post;
import com.unixteam.entity.User;
import com.unixteam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Repository("MapDAOInterface")
public class MapDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    private PostDAO postDAO;


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
    private static final String GET_ALL_MAPS = "SELECT * FROM map INNER JOIN post ON map.post_id = post.id";
//            "SELECT * FROM `map`";
    private static final String GET_BY_ID = "SELECT * FROM map INNER JOIN post ON post.id = map.post_id INNER JOIN user ON user.id = map.author";
//        "SELECT * FROM `map` WHERE post_id=?";

    private static final String INSERT_MAP   = "INSERT INTO `map` values(?,?,?,?)";
    private static final String UPDATE_MAP   = "UPDATE `map` SET placeName = ? , x_coordinate = ? , y_coordinate = ? WHERE post_id = ?";

    private static final String DELETE_MAP   = "DELETE FROM `map` WHERE post_id = ?";


    public List<Map> getALlMaps() throws SQLException {

        List<Map> markers = new ArrayList<Map>();

        List<java.util.Map<String, Object>> rows = jdbcTemplate.queryForList(GET_ALL_MAPS);
        for (java.util.Map row : rows) {
            Map map = new Map();
            map.setPost_id((int) row.get("post_id"));
            Post post = postDAO.getPostById((int) row.get("id"));
            map.setPost(post);
            map.setPlaceName((String) row.get("placeName"));
            map.setX_coordinate((Double) row.get("x_coordinate"));
            map.setY_coordinate((Double) row.get("y_coordinate"));

            markers.add(map);

            System.out.println(map);
        }
        if (markers.isEmpty())
            return null;
        else
            return markers;
    }

/*
    public List<Map> getAllMaps(){
        return jdbcTemplate.query(GET_ALL_MAPS,new MapMapper());
    }
*/
    public Map getMapById(int mapId) {
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