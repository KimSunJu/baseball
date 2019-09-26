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
<title>선수 나이 조회</title>
</head>
<body>
<table align="center" border="1" width="400">
<caption>연도별 선수 수</caption>
<tr bgcolor=" #ffff99">
<td align = "center">태어난 연도</td>
<td align = "center">선수 수</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select to_char(birth,'yyyy')|| '년' as birthday, count(playername) || '명' as c_p from playertbl GROUP by to_char(birth,'yyyy') order by birthday asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String birthday = rs.getString("birthday");
		String playername = rs.getString("c_p");
%>

<tr>
<td align = "center"><%=birthday%></td>
<td align = "center"><%=playername%></td>
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

<center>
<h4>10대 선수</h4>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select 2019-to_char(birth,'yyyy')+1 as age, playername from playertbl where 2019-to_char(birth,'yyyy')+1<20";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername") + " ");
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

<h4>20대 선수</h4>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select 2019-to_char(birth,'yyyy')+1 as age, playername from playertbl where 2019-to_char(birth,'yyyy')+1>=20 and 2019-to_char(birth,'yyyy')+1<30 order by age asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername") + " ");
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

<h4>30대 선수</h4>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select 2019-to_char(birth,'yyyy')+1 as age, playername from playertbl where 2019-to_char(birth,'yyyy')+1>=30 and 2019-to_char(birth,'yyyy')+1<40 order by age asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername") + " ");
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

<h4>40대 선수</h4>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select 2019-to_char(birth,'yyyy')+1 as age, playername from playertbl where 2019-to_char(birth,'yyyy')+1>=40";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername") + " ");
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

</center>
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