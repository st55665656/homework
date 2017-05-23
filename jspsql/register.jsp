<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();
    String reac =request.getParameter("acco");
    try{
      //註冊

      String repa =request.getParameter("repa");
      String sql = "select * from aclist where account = '" + reac + "';";
      rs = stmt.executeQuery(sql);

      if(rs.first()){
        result = "帳號重複，請重新輸入3Q";
      }else if( repa != null && reac != null ){
        String rena =request.getParameter("rena");
        String rebir =request.getParameter("rebir");
        String rememo =request.getParameter("rememo");
        String sql2 = "insert into aclist (account,password,name,bir,memo) values ( '" + reac + "','" + repa +"','" + rena +"','" + rebir +"','" + rememo +"')";
        stmt.executeUpdate(sql2);
        result = "註　冊　成　功";
      }else{
        result = "幹???什麼東西???";
      }
      response.setHeader("refresh","0;URL=index.html");

      stmt.close();
    	rs.close();
    	conn.close();
      //註冊
    }catch(Exception ex){
      out.println(ex);
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title>Register</title>
            <link rel="stylesheet" type="text/css" href="css_style.css"></head>

            <body>
                <div>
                    <h1 id="result"><%=result%></h1>
                </div>
            </body>
        </html>
