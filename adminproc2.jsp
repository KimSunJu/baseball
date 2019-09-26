<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#box{width:350px;}
#box label{display:block; width:100px; float:left;}
</style>
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    String pw = (String)session.getAttribute("pw");
  if (id==null || pw==null || !id.equals("admin") || !pw.equals("admin1234")) {
%>
    <script>alert('권한이 없어요!'); location.href = "main.jsp"; </script>
<% } %>
<form action="playerinsert.jsp" method="post">
<center>
<fieldset id="box">
<legend>선수 영입</legend>
<label>선수명</label><input type="text" name="playername"/><br>
<label>생년월일</label><input type="date" name="birth"/><br>
<label>구단명</label><input type="text" name="teamname"/><br>
<label>포지션</label><input type="text" name="posi"/><br>
<label>데뷔연도</label><input type="text" name="debut_year"/><br>
<input type="submit" value="영입">
<input type="reset" value="취소">
</fieldset>
</center>
</form>
<img src="img/base4.jpg" height="600px" align="right"/>
</body>
</html>