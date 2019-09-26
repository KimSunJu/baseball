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
<title>Insert title here</title>
</head>
<body>
<table align="center" border="1" width="400">
<caption>평균자책점 순위</caption>
<tr bgcolor=" #ffff99">
<td align = "center">순위</td>
<td align = "center">선수명</td>
<td align = "center">평균자책점</td>

</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select rank() over(order by earned_run asc)||'위' as rk, playername, earned_run from picthertbl order by earned_run asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String rk = rs.getString("rk");
		String playername = rs.getString("playername");
		float earned_run = rs.getFloat("earned_run");
%>

<tr>
<td align = "center"><%=rk%></td>
<td align = "center"><%=playername%></td>
<td align = "center"><%=earned_run%></td>
<%
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</table>

<a href="#"
title="Back to Top"
style="display:scroll;position:fixed;bottom:30px;right:15px;"
onfocus='this.blur()'>
<img 
src="img/ball.jpg"
style="width:40px; height:40px; border-radius: 15px;"/>
</a>
</body>
</html>