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
<title>타자 전체 조회</title>
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
<td align = "center">수정</td>
<td align = "center">삭제</td>
</tr>

<%
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
		String earned_run = rs.getString("earned_run");
		String strike_out = rs.getString("strike_out");
		String saves = rs.getString("saves");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=total_victories%></td>
<td align = "center"><%=earned_run%></td>
<td align = "center"><%=strike_out%></td>
<td align = "center"><%=saves%></td>
<td align = "center"><a href="pictherupdate.jsp?playername=<%=playername%>">수정</a></td>
<td align = "center"><a href="pictherdelete.jsp?playername=<%=playername%>">삭제</a></td>
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