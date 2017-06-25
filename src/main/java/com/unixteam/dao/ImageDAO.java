package com.unixteam.dao;

import com.unixteam.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@SuppressWarnings("SpringJavaAutowiringInspection")
@Repository
public class ImageDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;


    public class ImageMapper implements RowMapper<Image> {
        public Image mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            Image image= new Image();
            image.setPost_id(resultSet.getInt("post_id"));
            image.setUrl(resultSet.getString("url"));
            return image;
        }
    }
    private static final String GET_ALL_IMAGES = "SELECT * FROM `image`";
    private static final String GET_BY_ID = "SELECT * FROM `image` WHERE post_id=? AND url=?";
    private static final String INSERT_IMAGE   = "INSERT INTO `image` values(?,?)";
    private static final String UPDATE_IMAGE   = "UPDATE `image` SET url = ?  WHERE post_id = ?";
    private static final String DELETE_IMAGE   = "DELETE FROM `image` WHERE post_id = ? AND url = ?";
    private static final String GET_ALL_IMAGES_FOR_POST = "SELECT * FROM `image` WHERE post_id=?";



    public List<Image> getAllImages() throws  SQLException {
        return jdbcTemplate.query(GET_ALL_IMAGES,new ImageMapper());
    }
    public List<Image> getAllImagesForPost(int post_id) throws SQLException{
        return jdbcTemplate.query(GET_ALL_IMAGES_FOR_POST,new ImageMapper(),post_id);
    }

    public Image getImageById(int imageId,String url) throws  SQLException {
        return jdbcTemplate.queryForObject(GET_BY_ID,new ImageMapper(),imageId,url);
    }

    public void addImage(int post_id,String url){
        jdbcTemplate.update(INSERT_IMAGE,post_id,url);
    }

    public void updateImage(int post_id,String url){
        jdbcTemplate.update(UPDATE_IMAGE,url,post_id);
    }

    public void deleteImage(int id,String url){
        jdbcTemplate.update(DELETE_IMAGE,id,url);
    }



}