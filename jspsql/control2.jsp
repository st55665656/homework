<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ include file = "db-con.jsp"%>
<%
    String acc= (String)session.getAttribute("people");
    String sbir= (String)session.getAttribute("sbirthday");

    ResultSet rs = null;
    String result = null;
    Statement stmt =null;
    stmt = conn.createStatement();
    String btn_all = request.getParameter("submit_all");
    String btn_self = request.getParameter("submit_self");
    String btn_old = request.getParameter("submit_old");
    String btn_young = request.getParameter("submit_young");

    try{
      //註冊
      if(btn_all != null){
        String sql = "select * from aclist;";
        rs = stmt.executeQuery(sql);
        result = "<center><table class='table table-hover'>";
    		result += "<tr><th>name</th><th>birthday</th><th>memo</th></tr>";
    		while (rs.next()){
      		result += "<td>" + rs.getString("name") + "</td>";
      		result += "<td>" + rs.getString("bir") + "</td>";
      		result += "<td>" + rs.getString("memo") + "</td></tr>";
        }
        result += "</table></center>";
      }else if(btn_self != null){
        String sql = "select * from aclist where account = '" + acc + "';";
        rs = stmt.executeQuery(sql);
        result = "<center><table class='table table-hover'>";
    		result += "<tr><th>name</th><th>birthday</th><th>memo</th></tr>";
    		while (rs.next()){
      		result += "<td>" + rs.getString("name") + "</td>";
      		result += "<td>" + rs.getString("bir") + "</td>";
      		result += "<td>" + rs.getString("memo") + "</td></tr>";
        }
        result += "</table></center>";
      }else if(btn_old != null){
        String sql = "select * from aclist where bir < '" + sbir + "';";
        rs = stmt.executeQuery(sql);
        result = "<center><table class='table table-hover'>";
    		result += "<tr><th>name</th><th>birthday</th><th>memo</th></tr>";
    		while (rs.next()){
      		result += "<td>" + rs.getString("name") + "</td>";
      		result += "<td>" + rs.getString("bir") + "</td>";
      		result += "<td>" + rs.getString("memo") + "</td></tr>";
        }
        result += "</table></center>";
      }else if(btn_young != null){
        String sql = "select * from aclist where bir > '" + sbir + "';";
        rs = stmt.executeQuery(sql);
        result = "<center><table class='table table-hover'>";
    		result += "<tr><th>name</th><th>birthday</th><th>memo</th></tr>";
    		while (rs.next()){
      		result += "<td>" + rs.getString("name") + "</td>";
      		result += "<td>" + rs.getString("bir") + "</td>";
      		result += "<td>" + rs.getString("memo") + "</td></tr>";
        }
        result += "</table></center>";
      }else{
        session.invalidate();
  			response.setHeader("refresh","0;URL=index.html");
        result = "";
      }

      stmt.close();
    	rs.close();
    	conn.close();
      //註冊
    }catch(Exception ex){
      ;
    }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title>Register</title>
            <!-- 最新編譯和最佳化的 CSS -->
          	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
          	<!-- 選擇性佈景主題 -->
          	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
          	<!-- 最新編譯和最佳化的 JavaScript -->
          	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
            <link rel="stylesheet" type="text/css" href="css_style.css"></head>

            <body>
                <div>
                    <h1>查詢結果</h1>
                    <h1><%=result%></h1>
                    <input type="button" value="確認" class="btn btn-default" onclick="window.location='control.jsp';"><br>
                </div>
            </body>
        </html>
