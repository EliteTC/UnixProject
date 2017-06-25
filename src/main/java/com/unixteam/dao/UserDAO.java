package com.unixteam.dao;

import com.unixteam.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


@SuppressWarnings("SpringJavaAutowiringInspection")
@Repository
public class UserDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public class UserMapper implements RowMapper<User> {
        public User  mapRow(ResultSet resultSet, int rowNum) throws SQLException {
            User user = new User ();
            user.setId(resultSet.getInt("id"));
            user.setUsername(resultSet.getString("username"));
            user.setRole(resultSet.getString("role"));
            user.setLogin(resultSet.getString("login"));
            user.setPassword(resultSet.getString("password"));
            return user;
        }
    }

    private static final String GET_ALL_USERS = "SELECT * FROM `user`";
    private static final String GET_BY_ID = "SELECT * FROM `user` WHERE id=?";
    private static final String GET_ID_BY_LOGIN = "SELECT id from `user` WHERE login = ?";

    public List<User> getAllUsers() throws  SQLException {
        return jdbcTemplate.query(GET_ALL_USERS,new UserMapper());
    }

    public User getUserById(int UserID) throws  SQLException {
        return jdbcTemplate.queryForObject(GET_BY_ID,new UserMapper(), UserID);
    }
    public int getUserIdByLogin(String login){
        return jdbcTemplate.queryForObject(GET_ID_BY_LOGIN,Integer.class,login);
    }

}
