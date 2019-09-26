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
<title>수정 완료</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String teamname=request.getParameter("teamname");
String win = request.getParameter("win");
String lose = request.getParameter("lose");
String tie = request.getParameter("tie");
String game_count = request.getParameter("game_count");

Connection con = null;
PreparedStatement pre = null;
String sql = "update teamtbl set win=?,lose=?,tie=?,game_count=? where teamname=?";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, win);
	pre.setString(2, lose);
	pre.setString(3, tie);
	pre.setString(4, game_count);
	pre.setString(5, teamname);
	n=pre.executeUpdate();
}catch(SQLException se){
	System.out.println(se.getMessage());
}finally{
	try{
		if(pre!=null)pre.close();
		if(con!=null)con.close();
	}catch(SQLException se){
		System.out.println(se.getMessage());
	}
}
%>
<script type="text/javascript">
if(<%=n%> > 0){
	alert("수정되었습니다.");
	location.href="adminteam.jsp";
}else{
	alert("수정실패");
	history.go(-1);
}
</script>
</body>
</html>