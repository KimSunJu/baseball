<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");
%>       
   <%     
          session.setAttribute("id",id);
          session.setAttribute("pw",pw);
    %>
    <% if (id.equals("admin") && pw.equals("admin1234")) { %>
    <script>alert('관리자모드입니다.'); location.href = "main.jsp"; </script>
   <% } %>
    <% if (!id.equals("admin") || !pw.equals("admin1234")) { %>
    <script>alert('관리자권한이 없어요!'); location.href = "main.jsp"; </script>
<%} %>
</body>
</html>