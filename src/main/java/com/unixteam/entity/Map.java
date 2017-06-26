package com.unixteam.entity;

import java.io.Serializable;
import com.unixteam.entity.Post;


public class Map implements Serializable {
    private int post_id;
    private String placeName;
    private double x_coordinate;
    private double y_coordinate;
    private Post post;

    public Map(){

    }

    public Map(String placeName, double x_coordinate, double y_coordinate, Post post) {
        this.placeName = placeName;
        this.x_coordinate = x_coordinate;
        this.y_coordinate = y_coordinate;
        this.post = post;
    }

    public Map(int post_id, String placeName, double x_coordinate, double y_coordinate, Post post) {
        this.post_id = post_id;
        this.placeName = placeName;
        this.x_coordinate = x_coordinate;
        this.y_coordinate = y_coordinate;
        this.post = post;
    }

    public String getPlaceName() {
        return placeName;
    }

    public void setPlaceName(String placeName) {
        this.placeName = placeName;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public double getX_coordinate() {
        return x_coordinate;
    }

    public void setX_coordinate(double x_coordinate) {
        this.x_coordinate = x_coordinate;
    }

    public double getY_coordinate() {
        return y_coordinate;
    }

    public void setY_coordinate(double y_coordinate) {
        this.y_coordinate = y_coordinate;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    @Override
    public String toString() {
        return "Map{" +
                "post_id=" + post_id +
                ", placeName='" + placeName + '\'' +
                ", x_coordinate=" + x_coordinate +
                ", y_coordinate=" + y_coordinate +
                ", post=" + post +
                '}';
    }
}
