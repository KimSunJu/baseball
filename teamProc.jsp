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
<title>구단 전체 조회</title>
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

<br><br><br>


<table align="center" border="1" width="800">
<caption>구단 별 선수들 조회</caption>
<tr bgcolor="#ffffe6">
<td align = "center">구단명</td>
<td align = "center">선수명</td>
<td align = "center">포지션</td>
</tr>

<%
//뷰테이블 출력
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select * from playertbl_view order by teamname asc, playername asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String playername = rs.getString("playername");
		String posi = rs.getString("posi");
%>

<tr>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=playername%></td>
<td align = "center"><%=posi%></td>
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

<br><br><br>

<table align="center" border="1" width="600">
<caption>구단별 타자 수 (총 타자 수)</caption>
<tr bgcolor="#ffffe6">
<td align = "center">구단명</td>
<td align = "center">타자 수</td>
</tr>

<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select teamname, count(posi) from playertbl where posi='타자' group by rollup(teamname)";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String posi = rs.getString("count(posi)");
%>

<tr>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=posi%></td>
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

<br><br><br>

<table align="center" border="1" width="600">
<caption>구단별 투수 수 (총 투수 수)</caption>
<tr bgcolor="#ffffe6">
<td align = "center">구단명</td>
<td align = "center">투수 수</td>
</tr>

<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select teamname, count(posi) from playertbl where posi='투수' group by rollup(teamname)";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String posi = rs.getString("count(posi)");
%>

<tr>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=posi%></td>
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