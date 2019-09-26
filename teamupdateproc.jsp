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
<title>수정 폼</title>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String teamname=request.getParameter("teamname");

Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select * from teamtbl where teamname=?";
	
	pre = con.prepareStatement(sql);
	pre.setString(1, teamname);
	rs = pre.executeQuery();
	if(rs.next()) {
	String win = rs.getString("win");
	String lose = rs.getString("lose");
	String tie = rs.getString("tie");
	String game_count = rs.getString("game_count");
%>
<form method="post" action="teamupdateok.jsp">
<center>
<table>
<tr>
<td>구단명</td>
<td><%=teamname%><input type="hidden" name="teamname" value="<%=teamname%>"/></td>
</tr>

<td>구단 승리 횟수</td>
<td><input type="text" name="win" value="<%=win%>"/></td>
</tr>

<td>구단 패배 횟수</td>
<td><input type="text" name="lose" value="<%=lose%>"/></td>
</tr>

<td>구단 무승부 횟수</td>
<td><input type="text" name="tie" value="<%=tie%>"/></td>
</tr>

<td>구단 경기 수</td>
<td><input type="text" name="game_count" value="<%=game_count%>"/></td>
</tr>

<tr>
<td>
<button type="submit" value="저장">저장</button>
</td>
</tr>
</table>
</center>
</form>
<%
	}
}catch(SQLException se){
	System.out.println(se.getMessage());
}finally{
	try{
		if(rs!=null)rs.close();
		if(pre!=null)pre.close();
		if(con!=null)con.close();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}
}
%>
</body>
</html>