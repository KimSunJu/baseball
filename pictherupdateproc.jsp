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
	String sql = "select playername,total_victories, earned_run, strike_out, saves from picthertbl where playername=?";
	
	pre = con.prepareStatement(sql);
	pre.setString(1, playername);
	rs = pre.executeQuery();
	if(rs.next()) {
	String total_victories = rs.getString("total_victories");
	String earned_run = rs.getString("earned_run");
	String strike_out = rs.getString("strike_out");
	String saves = rs.getString("saves");
%>
<form method="post" action="pictherupdateok.jsp">
<center>
<table>
<tr>
<td>선수명</td>
<td><%=playername%><input type="hidden" name="playername" value="<%=playername%>"/></td>
</tr>

<td>다승</td>
<td><input type="text" name="total_victories" value="<%=total_victories%>"/></td>
</tr>

<td>평균자책점</td>
<td><input type="text" name="earned_run" value="<%=earned_run%>"/></td>
</tr>

<td>탈산진</td>
<td><input type="text" name="strike_out" value="<%=strike_out%>"/></td>
</tr>

<td>세이브</td>
<td><input type="text" name="saves" value="<%=saves%>"/></td>
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