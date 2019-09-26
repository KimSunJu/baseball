<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="test.db.DBConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    String pw = (String)session.getAttribute("pw");
  if (id==null || pw==null || !id.equals("admin") || !pw.equals("admin1234")) {
%>
    <script>alert('권한이 없어요!'); location.href = "main.jsp"; </script>
<% } %>

<center>
<h2>데이터 사전 조회</h2>
<br><br>
<table align="center" border="1" width="800">
<caption>테이블 정보 조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">테이블명</td>
<td align = "center">테이블스페아스명</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select table_name, tablespace_name from user_tables";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String table_name = rs.getString("table_name");
		String tablespace_name = rs.getString("tablespace_name");
%>

<tr>
<td align = "center"><%=table_name%></td>
<td align = "center"><%=tablespace_name%></td>
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
<br><br>
<table align="center" border="1" width="800">
<caption>뷰테이블 정보 조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">뷰테이블명</td>
<td align = "center">뷰 텍스트</td>
</tr>

<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select view_name, text from user_views";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String view_name = rs.getString("view_name");
		String text = rs.getString("text");
%>

<tr>
<td align = "center"><%=view_name%></td>
<td align = "center"><%=text%></td>
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
<br><br>
<table align="center" border="1" width="800">
<caption>사용자 정보 조회</caption>
<tr bgcolor=" #ffff99">
<td align = "center">사용자명</td>
<td align = "center">사용자 아이디</td>
<td align = "center">테이블스페이스명</td>
<td align = "center">일시적 테이블스페이스</td>
<td align = "center">만든 날짜</td>
</tr>

<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon(); 
	String sql = "select username, user_id, default_tablespace, temporary_tablespace,to_char(created,'yyyy/mm/dd') from user_users";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String username = rs.getString("username");
		String user_id = rs.getString("user_id");
		String default_tablespace = rs.getString("default_tablespace");
		String temporary_tablespace = rs.getString("temporary_tablespace");
		String created = rs.getString("to_char(created,'yyyy/mm/dd')");
%>

<tr>
<td align = "center"><%=username%></td>
<td align = "center"><%=user_id%></td>
<td align = "center"><%=default_tablespace%></td>
<td align = "center"><%=temporary_tablespace%></td>
<td align = "center"><%=created%></td>
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
</center>
</body>
</html>