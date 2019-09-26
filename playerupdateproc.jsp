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
<title>선수수정 폼</title>

</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String playername=request.getParameter("playername");

Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername, to_char(birth,'yyyy/mm/dd') as birthday, teamname, posi, decode(debut_year,null,'',debut_year) as debut from playertbl where playername=?";
	
	pre = con.prepareStatement(sql);
	pre.setString(1, playername);
	rs = pre.executeQuery();
	if(rs.next()) {
	String birth = rs.getString("birthday");
	String teamname = rs.getString("teamname");
	String posi = rs.getString("posi");
	String debut_year = rs.getString("debut");
%>
<form method="post" action="playerupdateok.jsp">
<center>
<table>
<tr>
<td>선수명</td>
<td><%=playername%><input type="hidden" name="playername" value="<%=playername%>"/></td>
</tr>

<td>생년월일</td>
<td><input type="text" name="birth" value="<%=birth%>"/></td>
</tr>

<td>구단명</td>
<td><input type="text" name="teamname" value="<%=teamname%>"/></td>
</tr>

<td>포지션</td>
<td><input type="text" name="posi" value="<%=posi%>"/></td>
</tr>

<td>데뷔연도</td>
<td><input type="text" name="debut_year"/></td>
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