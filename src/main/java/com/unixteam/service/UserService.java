package com.unixteam.service;

import com.unixteam.dao.UserDAO;
import com.unixteam.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;


@Service
public class UserService {
    @Autowired
    private UserDAO userDAO;

    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }

    public User getUserById(int userID) throws SQLException {
        return userDAO.getUserById(userID);
    }

    public int getUserIdByLogin(String login){
       return userDAO.getUserIdByLogin(login);
    }



}
