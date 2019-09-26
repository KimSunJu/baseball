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
<title>구단 리스트</title>
</head>
<body>
<table align="center" border="1" width="800">
<caption>구단테이블조회</caption>
<tr bgcolor="#ffffe6">
<td align = "center">구단명</td>
<td align = "center">구단 승리 횟수</td>
<td align = "center">구단 패배 횟수</td>
<td align = "center">구단 무승부 횟수</td>
<td align = "center">구단 경기 수</td>
<td align = "center">수정</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select * from teamtbl";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String win = rs.getString("win");
		String lose = rs.getString("lose");
		String tie = rs.getString("tie");
		String game_count = rs.getString("game_count");
%>

<tr>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=win%></td>
<td align = "center"><%=lose%></td>
<td align = "center"><%=tie%></td>
<td align = "center"><%=game_count%></td>
<td align = "center"><a href="teamupdate.jsp?teamname=<%=teamname%>">수정</a></td>
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
</body>
</html>