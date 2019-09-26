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
<title>선수수정 완료</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String playername=request.getParameter("playername");
String birth = request.getParameter("birth");
String teamname = request.getParameter("teamname");
String posi = request.getParameter("posi");
String debut_year = request.getParameter("debut_year");

Connection con = null;
PreparedStatement pre = null;
String sql = "update playertbl set birth=?,teamname=?,posi=?,debut_year=? where playername=?";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, birth);
	pre.setString(2, teamname);
	pre.setString(3, posi);
	pre.setString(4, debut_year);
	pre.setString(5, playername);
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
	location.href="adminplayer.jsp";
}else{
	alert("수정실패");
	history.go(-1);
}
</script>
</body>
</html>