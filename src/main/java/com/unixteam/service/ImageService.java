package com.unixteam.service;

import com.unixteam.dao.ImageDAO;
import com.unixteam.entity.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;

@Service
public class ImageService {
    @Autowired
    private ImageDAO imageDAO;

    public List<Image> getAllImages() throws SQLException {
        return imageDAO.getAllImages();
    }
    public List<Image> getAllImagesForPost(int post_id) throws SQLException{
        return imageDAO.getAllImagesForPost(post_id);
    }
    public Image getImageById(int imageId,String url) throws  SQLException{
        return imageDAO.getImageById(imageId,url);
    }
    public void addImage(int post_id,String url){
        imageDAO.addImage(post_id,url);
    }

    public void updateImage( int post_id,String url){
        imageDAO.updateImage(post_id, url);
    }

    public void deleteImage(int id,String url){
        imageDAO.deleteImage(id,url);
    }

}
