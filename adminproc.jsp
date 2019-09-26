<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    String pw = (String)session.getAttribute("pw"); 
 if (id==null || pw==null || !id.equals("admin") || !pw.equals("admin1234")) { %>
    <script>alert('권한이 없어요!'); location.href = "main.jsp"; </script>
<% } %>
<br><br>
<center>
<table>
<tr>
<td><a href="adminteam.jsp">구단 리스트 수정</a></td>
</tr>
<tr>
<td><a href="adminplayer.jsp">선수 리스트 수정/삭제</a></td>
</tr>
<tr>
<td><a href="adminhitter.jsp">타자 리스트 수정/삭제</a></td>
</tr>
<tr>
<td><a href="adminpicther.jsp">투수 리스트 수정/삭제</a></td>
</tr>
</table>
</center>
<img src="img/base3.jpg" height="630px" align="right"/>
</body>
</html>