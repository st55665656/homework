<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
    String acc= (String)session.getAttribute("people");
		String sna= (String)session.getAttribute("sna");
		String login_or_yet = "";
		if(acc == null) {
      response.setHeader("Refresh", "0;index.html" );
			sna = "";
      login_or_yet = "沒登入想幹嘛啦!!!!!!!!!!";
    }
%>
<!DOCTYPE html>
<html>
	<!-- 最新編譯和最佳化的 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
	<!-- 選擇性佈景主題 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
	<!-- 最新編譯和最佳化的 JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Control</title>
	<link rel="stylesheet" type="text/css" href="css_style.css">
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
</head>

<body>
	<h1><%=login_or_yet%> </h1>
	<div id="choice">
		<h1>Hello! <%=sna%> </h1>
		<form id="control_panel" method="post" action="control2.jsp">
			<br>
			<input type="submit" name="submit_all" value="查看所有人資料" class="btn btn-primary">
			<input type="submit" name="submit_self" value="查詢自己的資料" class="btn btn-success"><br><br>
			<input type="submit" name="submit_old" value="查詢老人家QQ" class="btn btn-danger">
			<input type="submit" name="submit_young" value="查詢年輕人^^" class="btn btn-warning"><br><br>
			<input type="submit" value="登出" class="btn btn-default"><br>
		</form>
	</div>

</body>

</html>
