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
<caption>다승순위(승리 0 제외)</caption>
<tr bgcolor=" #ffff99">
<td align = "center">순위</td>
<td align = "center">선수명</td>
<td align = "center">다승</td>

</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select rank() over(order by total_victories desc)||'위' as rk, playername,total_victories from picthertbl where total_victories not in(0) order by total_victories desc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String rk = rs.getString("rk");
		String playername = rs.getString("playername");
		String total_victories = rs.getString("total_victories");
%>

<tr>
<td align = "center"><%=rk%></td>
<td align = "center"><%=playername%></td>
<td align = "center"><%=total_victories%></td>
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