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
<caption>전체 투수선수테이블조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">선수명</td>
<td align = "center">다승</td>
<td align = "center">평균자책점</td>
<td align = "center">탈삼진</td>
<td align = "center">세이브</td>
</tr>

<%
//구단테이블 출력
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername,total_victories, earned_run, strike_out,saves from picthertbl order by playername asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("playername");
		String total_victories = rs.getString("total_victories");
	    float earned_run = rs.getFloat("earned_run");
		String strike_out = rs.getString("strike_out");
		String saves = rs.getString("saves");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=total_victories%></td>
<td align = "center"><%=earned_run%></td>
<td align = "center"><%=strike_out%></td>
<td align = "center"><%=saves%></td>
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
<caption>구단별 투수선수테이블조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">구단명</td>
<td align = "center">다승</td>
<td align = "center">평균자책점</td>
<td align = "center">탈삼진</td>
<td align = "center">세이브</td>
</tr>

<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playertbl.teamname as p_t, round(avg(total_victories),1) as r_tv, round(avg(earned_run),1) as r_er, round(avg(strike_out),1) as r_s, round(avg(saves),1) as r_sa from playertbl join picthertbl on playertbl.playername = picthertbl.playername group by rollup(playertbl.teamname)";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("p_t");
		String total_victories = rs.getString("r_tv");
	    float earned_run = rs.getFloat("r_er");
		String strike_out = rs.getString("r_s");
		String saves = rs.getString("r_sa");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=total_victories%></td>
<td align = "center"><%=earned_run%></td>
<td align = "center"><%=strike_out%></td>
<td align = "center"><%=saves%></td>
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