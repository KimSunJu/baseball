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
String playername=request.getParameter("playername");

Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername, TO_CHAR(batting_average,'FM9990.999')batting_average, rbi, homerun, stolen_base from hittertbl where playername=?";
	
	pre = con.prepareStatement(sql);
	pre.setString(1, playername);
	rs = pre.executeQuery();
	if(rs.next()) {
	String batting_average = rs.getString("batting_average");
	String rbi = rs.getString("rbi");
	String homerun = rs.getString("homerun");
	String stolen_base = rs.getString("stolen_base");
%>
<form method="post" action="hitterupdateok.jsp">
<center>
<table>
<tr>
<td>선수명</td>
<td><%=playername%><input type="hidden" name="playername" value="<%=playername%>"/></td>
</tr>

<td>타율</td>
<td><input type="text" name="batting_average" value="<%=batting_average%>"/></td>
</tr>

<td>타점</td>
<td><input type="text" name="rbi" value="<%=rbi%>"/></td>
</tr>

<td>홈런</td>
<td><input type="text" name="homerun" value="<%=homerun%>"/></td>
</tr>

<td>도루</td>
<td><input type="text" name="stolen_base" value="<%=stolen_base%>"/></td>
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