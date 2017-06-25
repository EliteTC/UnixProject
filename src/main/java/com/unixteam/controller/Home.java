package com.unixteam.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.sql.SQLException;

/**
 * Created by Вадим on 25.06.2017.
 */
@RestController
public class Home {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView init() throws SQLException {
        ModelAndView model = new ModelAndView();
        model.setViewName("home");
        return model;
    }

}
