package com.unixteam.dao;


import com.unixteam.entity.Image;
import com.unixteam.entity.Map;
import com.unixteam.entity.Post;
import com.unixteam.entity.User;
import com.unixteam.service.ImageService;
import com.unixteam.service.MapService;
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
public class PostDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserService userService;

    @Autowired
    MapService mapService;

    @Autowired
    ImageService imageService;

    public class PostMapper implements RowMapper<Post> {
        public Post mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            Post post= new Post();
            post.setId(resultSet.getInt("id"));
            post.setDate(resultSet.getDate("date"));
            post.setTitle(resultSet.getString("title"));
            post.setDescription(resultSet.getString("description"));
            User author = userService.getUserById(resultSet.getInt("author"));
         //   Map map = mapService.getMapById(post.getId());
            List<Image> images = imageService.getAllImagesForPost(post.getId());
            post.setImages(images);
          //  post.setMap(map);
            post.setAuthor(author);

            return post;
        }
    }
    private static final String GET_ALL_POSTS = "SELECT * FROM `post`";
    private static final String GET_BY_ID = "SELECT * FROM `post` WHERE id=?";
    private static final String INSERT_POST   = "INSERT INTO `post` values(DEFAULT,?,?,?,?)";
    private static final String UPDATE_POST   = "UPDATE `post` SET title = ? , description = ? WHERE id = ?";
    private static final String DELETE_POST   = "DELETE FROM `post` WHERE id = ?";
    private static final String GET_POSTS_FOR_USER = "SELECT * FROM `post` WHERE author_id = ?";


    public List<Post> getAllPosts() throws  SQLException {
        return jdbcTemplate.query(GET_ALL_POSTS,new PostMapper());
    }

    public Post getPostById(int postId) throws  SQLException {
        return jdbcTemplate.queryForObject(GET_BY_ID,new PostMapper(),postId);
    }

    public void addPost(String title,String description,int author_id){
        Timestamp timestamp = new Timestamp(new Date().getTime());
        jdbcTemplate.update(INSERT_POST,timestamp,title,description,author_id);
    }

    public void updatePost(String title,String description,int id){
        jdbcTemplate.update(UPDATE_POST,title,description,id);
    }

    public void deletePost(int id){
        jdbcTemplate.update(DELETE_POST,id);
    }


    public List<Post> getPostsForUser(int id){
        return jdbcTemplate.query(GET_POSTS_FOR_USER,new PostMapper(),id);
    }
}
