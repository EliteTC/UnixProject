<%--
  Created by IntelliJ IDEA.
  User: maria
  Date: 17.06.2017
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    String Username =request.getParameter("Username");
    session.putValue("userid",user);
    String pwd=request.getParameter("pwd");
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String email=request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/unixproject",
            "root","");
    Statement st= con.createStatement();
    ResultSet rs;
    int i=st.executeUpdate("insert into users values ('"+user+"','"+pwd+"','"+fname+"',
    '"+lname+"','"+email+"')");


%>
