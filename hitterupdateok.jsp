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
<title>타자수정 완료</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String playername=request.getParameter("playername");
String batting_average = request.getParameter("batting_average");
String rbi = request.getParameter("rbi");
String homerun = request.getParameter("homerun");
String stolen_base = request.getParameter("stolen_base");

Connection con = null;
PreparedStatement pre = null;
String sql = "update hittertbl set batting_average=?,rbi=?,homerun=?,stolen_base=? where playername=?";
int n = 0;

try{
	con = DBConnection.getCon();
	pre = con.prepareStatement(sql);
	pre.setString(1, batting_average);
	pre.setString(2, rbi);
	pre.setString(3, homerun);
	pre.setString(4, stolen_base);
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
	location.href="adminhitter.jsp";
}else{
	alert("수정실패");
	history.go(-1);
}
</script>
</body>
</html>