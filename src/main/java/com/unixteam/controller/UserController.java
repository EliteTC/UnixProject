package com.unixteam.controller;


import com.unixteam.service.PostService;
import com.unixteam.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;
import java.util.List;


@RestController
public class UserController {
    @Autowired
    UserService userService;


    @RequestMapping(value = "/users" , method = RequestMethod.GET)
    public ModelAndView getUsers() throws SQLException {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String username = auth.getName();
            int personId = userService.getUserIdByLogin(username);
            model.addObject("userId",personId);
        }
        model.addObject("users",userService.getAllUsers());
        model.setViewName("users");
        return model;
    }

    @RequestMapping(value = "/add-user",method = RequestMethod.POST)
    @ResponseBody

    public String addUser(@RequestParam String username, @RequestParam String login, @RequestParam String password) throws SQLException, ClassNotFoundException {
        List<String> logins = userService.getAllLogins();
        for(String s: logins){
            if(equals(login)){
                return "login exists";
            }
        }
        userService.addUser(username,login,password);

        return "Registered successfully";
    }

    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public ModelAndView userPage(@PathVariable int id) throws SQLException {
        ModelAndView model = new ModelAndView();

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (!(auth instanceof AnonymousAuthenticationToken)) {
            String username = auth.getName();
            int personId = userService.getUserIdByLogin(username);
            model.addObject("userId",personId);
        }

        model.addObject("user",userService.getUserById(id));
        model.setViewName("user");
        return model;
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

    }

    //for 403 access denied page
    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {

        ModelAndView model = new ModelAndView();

        //check if user is login
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            model.addObject("username", userDetail.getUsername());
        }

        model.setViewName("403");
        return model;

    }
}
