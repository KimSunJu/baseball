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
<title>선수 전체 조회</title>
</head>
<body>
<table align="center" border="1" width="800">
<caption>전체 선수테이블조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">선수명</td>
<td align = "center">생년월일</td>
<td align = "center">구단명</td>
<td align = "center">포지션</td>
<td align = "center">데뷔년도</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername, to_char(birth,'yyyy/mm/dd') as birthday, teamname, posi, decode(debut_year,null,' ',debut_year || '년') as debut from playertbl";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("playername");
		String birthday = rs.getString("birthday");
		String teamname = rs.getString("teamname");
		String posi = rs.getString("posi");
		String debut = rs.getString("debut");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=birthday%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=posi%></td>
<td align = "center"><%=debut%></td>
</tr>

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