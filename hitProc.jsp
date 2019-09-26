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
<table align="center" border="1" width="800">
<caption>전체 타자선수테이블조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">선수명</td>
<td align = "center">타율</td>
<td align = "center">타점</td>
<td align = "center">홈런</td>
<td align = "center">도루</td>
</tr>

<%
//구단테이블 출력
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername, batting_average, rbi, homerun, stolen_base from hittertbl order by playername asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("playername");
		float batting_average = rs.getFloat("batting_average");
		String rbi = rs.getString("rbi");
		String homerun = rs.getString("homerun");
		String stolen_base = rs.getString("stolen_base");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=batting_average%></td>
<td align = "center"><%=rbi%></td>
<td align = "center"><%=homerun%></td>
<td align = "center"><%=stolen_base%></td>
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
<caption>구단별 타자선수테이블조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">구단명</td>
<td align = "center">타율</td>
<td align = "center">타점</td>
<td align = "center">홈런</td>
<td align = "center">도루</td>
</tr>

<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playertbl.teamname as p_t, round(avg(batting_average),1) as r_b, round(avg(rbi),1) as r_rbi, round(avg(homerun),1) as r_h, round(avg(stolen_base),1) as r_s from hittertbl join playertbl on playertbl.playername = hittertbl.playername group by rollup(playertbl.teamname)";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("p_t");
		float batting_average = rs.getFloat("r_b");
		String rbi = rs.getString("r_rbi");
		String homerun = rs.getString("r_h");
		String stolen_base = rs.getString("r_s");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=batting_average%></td>
<td align = "center"><%=rbi%></td>
<td align = "center"><%=homerun%></td>
<td align = "center"><%=stolen_base%></td>
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