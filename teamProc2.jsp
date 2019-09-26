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
<title>구단 순위 조회</title>
</head>
<body>
<br><br><br><br><br><br><br><br>
<div style="float: left; width: 33%;">
<table width="600" style="table-layout:fixed">
<caption>승리 횟수 순위</caption>
<tr bgcolor="#ffffe6">
<td align = "center">순위</td>
<td align = "center">구단명</td>
<td align = "center">구단 승리 횟수</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select teamname, win, rank() over(order by win desc)||'위' as rk from teamtbl order by win desc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String win = rs.getString("win");
		String rk = rs.getString("rk");
%>

<tr>
<td align = "center"><%=rk%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=win%></td>
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
</div>

<div style="float: left; width: 33%;">
<table width="600" style="table-layout:fixed">
<caption>패배 횟수 순위</caption>
<tr bgcolor="#ffffb3">
<td align = "center">순위</td>
<td align = "center">구단명</td>
<td align = "center">구단 패배 횟수</td>
</tr>

<%
//구단테이블 출력
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select teamname, lose, rank() over(order by lose desc)||'등' as rk from teamtbl order by lose desc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		String lose = rs.getString("lose");
		String rk = rs.getString("rk");
%>

<tr>
<td align = "center"><%=rk%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=lose%></td>
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
</div>

<div style="float: left; width: 33%;">
<table  width="600" style="table-layout:fixed">
<caption>구단 승률 순위</caption>
<tr bgcolor="#ffffb3">
<td align = "center">순위</td>
<td align = "center">구단명</td>
<td align = "center">승률</td>
</tr>

<%
//구단테이블 출력
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select teamname, round(win/(win+lose),3) as odds,rank() over(order by win/(win+lose) desc)||'등' as rk from teamtbl order by win/(win+lose) desc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String teamname = rs.getString("teamname");
		double odds = rs.getDouble("odds");
		String rk = rs.getString("rk");
%>

<tr>
<td align = "center"><%=rk%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=odds%></td>
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
</div>
</body>
</html>