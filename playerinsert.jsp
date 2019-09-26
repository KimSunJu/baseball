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
<title>선수영입</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
String playername=request.getParameter("playername");
String birth=request.getParameter("birth");
String teamname=request.getParameter("teamname");
String posi=request.getParameter("posi");
String debut_year=request.getParameter("debut_year");

Connection con = null;
PreparedStatement pre = null;
String sql="insert into playertbl values(?,?,?,?,?)";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, playername);
	pre.setString(2, birth);
	pre.setString(3, teamname);
	pre.setString(4, posi);
	pre.setString(5, debut_year);
	n=pre.executeUpdate();
}catch(Exception e){
	e.printStackTrace();
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
	alert("정상적으로 영입했습니다.");
	location.href="adminplayer.jsp";
}else{
	alert("영입실패");
	history.go(-1);
}
</script>
</body>
</html>