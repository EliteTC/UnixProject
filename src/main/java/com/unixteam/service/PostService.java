package com.unixteam.service;


import com.unixteam.dao.PostDAO;
import com.unixteam.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;



@Service
public class PostService {
    @Autowired
    private PostDAO postDAO;

    public List<Post> getAllPosts() throws SQLException{
        return postDAO.getAllPosts();
    }
    public Post getPostById(int postId) throws  SQLException{
        return postDAO.getPostById(postId);
    }
    public void addPost(String title,String description,int author_id){
       postDAO.addPost(title,description,author_id);
    }

    public void updatePost( String title,String description, int id){
        postDAO.updatePost(title,description,id);
    }

    public void deletePost(int id){
        postDAO.deletePost(id);
    }

    public List<Post> getPostsForUser(int id){
        return postDAO.getPostsForUser(id);
    }

}
