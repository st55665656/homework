<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp" %>
<%
    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();

    try{
      //登入
      String ac =request.getParameter("ac");
      if( ac != null){
        String pa =request.getParameter("pa");
        String sql = "select * from aclist where account = '" + ac + "' AND password ='" + pa + "';";
        rs = stmt.executeQuery(sql);

        if(rs.first()){
          String account = rs.getString("account");
          String bir = rs.getString("bir");
          String na = rs.getString("name");
          //set session
          session.setAttribute("people", account);
          session.setAttribute("sbirthday",bir);
          session.setAttribute("sna",na);
          result = "登　入　成　功";
          response.setHeader("refresh","1;URL=control.jsp");
        }else{
          response.setHeader("refresh","1;URL=index.html");
          result = "錯誤的帳號或密碼，即將回登入頁面";
        }
      //登入
        stmt.close();
      	rs.close();
      	conn.close();
      }else{
        response.setHeader("refresh","0;URL=index.html");
        result = "想幹嘛???";
      }
    }catch(Exception ex){
      out.println(ex);
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title>Login</title>
            <link rel="stylesheet" type="text/css" href="css_style.css"></head>

            <body>
                <div>
                    <h1><%=result%></h1>
                </div>
            </body>
        </html>
