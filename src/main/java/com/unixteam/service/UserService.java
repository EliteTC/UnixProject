package com.unixteam.service;

import com.unixteam.dao.UserDAO;
import com.unixteam.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@Service
public class UserService {
    @Autowired
    private UserDAO userDAO;

    public void addUser(String username,String login,String password){
        userDAO.addUser(username,login,password);
    }

    public List<User> getAllUsers() throws SQLException {
        return userDAO.getAllUsers();
    }
    public List<String> getAllLogins() throws  SQLException {
        return userDAO.getAllLogins();
    }

    public User getUserById(int userID) throws SQLException {
        return userDAO.getUserById(userID);
    }

    public int getUserIdByLogin(String login){
       return userDAO.getUserIdByLogin(login);
    }



}
