<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    String ip ="140.120.49.205:3306";
    String user = "4102029013";
    String pass = "Ss4102029013!";
    String database = "4102029013";
    String driver ="com.mysql.jdbc.Driver";
    Connection conn = null;
    request.setCharacterEncoding("utf-8");
    try{
        String url = "jdbc:mysql://" + ip + "/" + database + "?useUnicode=true&characterEncoding=utf-8";
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url,user,pass);
    }catch(Exception ex){
        out.println(ex);
    }
    %>
