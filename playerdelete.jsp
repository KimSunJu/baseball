<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
Connection con = null;
PreparedStatement pre = null;

String playername = request.getParameter("playername");
int n = 0;
try{
	con = DBConnection.getCon();
	String sql = "delete from playertbl where playername=?";
	pre = con.prepareStatement(sql);
	pre.setString(1, playername);
	
	n=pre.executeUpdate();
}catch(SQLException se){
	System.out.println(se.getMessage());
}finally{
	if(pre!=null)pre.close();
	if(con!=null)con.close();
}
response.sendRedirect("adminplayer.jsp");
%>
</body>
</html>