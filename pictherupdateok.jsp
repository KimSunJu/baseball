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
<title>투수수정 완료</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String playername=request.getParameter("playername");
String total_victories = request.getParameter("total_victories");
String earned_run = request.getParameter("earned_run");
String strike_out = request.getParameter("strike_out");
String saves = request.getParameter("saves");

Connection con = null;
PreparedStatement pre = null;
String sql = "update picthertbl set total_victories=?,earned_run=?,strike_out=?,saves=? where playername=?";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, total_victories);
	pre.setString(2, earned_run);
	pre.setString(3, strike_out);
	pre.setString(4, saves);
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
	location.href="adminpicther.jsp";
}else{
	alert("수정실패");
	history.go(-1);
}
</script>
</body>
</html>