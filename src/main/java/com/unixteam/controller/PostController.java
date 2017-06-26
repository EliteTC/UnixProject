package com.unixteam.controller;


import com.unixteam.entity.Image;
import com.unixteam.entity.Post;
import com.unixteam.service.ImageService;
import com.unixteam.service.PostService;
import com.unixteam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.List;


@RestController
public class PostController {
    @Autowired
    PostService postService;
    @Autowired
    UserService userService;
    @Autowired
    ImageService imageService;


/*    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView init() throws SQLException {
       return getAllPosts();
    }*/


    @RequestMapping(value = "/allposts", method = RequestMethod.GET)
    public ModelAndView getAllPosts() throws SQLException {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String username = auth.getName();
            int personId = userService.getUserIdByLogin(username);
            model.addObject("userId",personId);
        }
        model.addObject("posts",postService.getAllPosts());

        model.setViewName("allposts");
        return model;
    }
    @RequestMapping(value = "/myPosts", method = RequestMethod.GET)
    public ModelAndView getPostsForUser() throws SQLException {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String username = auth.getName();
            int personId = userService.getUserIdByLogin(username);
            model.addObject("userId",personId);
            model.addObject("posts",postService.getPostsForUser(personId));
        }


        model.setViewName("myPosts");
        return model;
    }
    @RequestMapping(value = "/post/{id}")
    public ModelAndView getGood(@PathVariable int id) throws SQLException {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String login = auth.getName();
            int personId = userService.getUserIdByLogin(login);
            model.addObject("userId", personId);
        }
        Post post = postService.getPostById(id);
        List<Image> imageList = post.getImages();
        model.addObject("post",postService.getPostById(id));
        model.addObject("imagecount", imageList.size());
        model.setViewName("postDetails");
        return model;
    }
    @RequestMapping(value = "/add-post",method = RequestMethod.POST)
    @ResponseBody
    public String addPost(@RequestParam String title, @RequestParam String description, @RequestParam int author_id) throws SQLException, ClassNotFoundException {
        postService.addPost(title,description,author_id);
        return "Added successfully";
    }
    @RequestMapping(value = "/edit-post",method = RequestMethod.POST)
    @ResponseBody
    public String editPost(@RequestParam String title, @RequestParam String description, @RequestParam int id, @RequestParam(required = false) String url,@RequestParam(required = false) String url2,@RequestParam(required = false) String url3,@RequestParam(required = false) String url4,@RequestParam(required = false) String url5,@RequestParam(required = false) String url6,@RequestParam(required = false) String url7,@RequestParam(required = false) String url8,@RequestParam(required = false) String url9,@RequestParam(required = false) String url10) throws SQLException, ClassNotFoundException {
        postService.updatePost(title,description,id);

        if(url!= null && url!= ""){
            imageService.addImage(id,url);
        }
        if(url2!= null && url2!= ""){
            imageService.addImage(id,url2);
        }
        if(url3!= null && url3!= ""){
            imageService.addImage(id,url3);
        }
        if(url4!= null && url4!= ""){
            imageService.addImage(id,url4);
        }
        if(url6!= null && url6!= ""){
            imageService.addImage(id,url6);
        }
        if(url5!= null && url5!= ""){
            imageService.addImage(id,url5);
        }
        if(url7!= null && url7!= ""){
            imageService.addImage(id,url7);
        }
        if(url8!= null && url8!= ""){
            imageService.addImage(id,url8);
        }
        if(url9!= null && url9!= ""){
            imageService.addImage(id,url9);
        }
        if(url10!= null && url10!= ""){
            imageService.addImage(id,url10);
        }
        return "Edited successfully";
    }
    @RequestMapping(value = "/delete-post",method = RequestMethod.POST)
    @ResponseBody
    public String deletePost(@RequestParam int id) throws SQLException, ClassNotFoundException {
        postService.deletePost(id);
        return "Deleted successfully";
    }
}
