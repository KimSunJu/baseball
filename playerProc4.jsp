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
<title>포지션 별 선수</title>
<script>
function checkBox() {
	var check_Box = document.getElementsByName("rdbtn"); //체크박스 name
	for (j = 0; j < check_Box.length; j++) {
	 var disign = document.getElementById([j+1]); // 보여질내용
	 if(check_Box[j].checked == true ){
	  disign.style.display = "block";
	 }else{
	  check_Box[j].checked = false;
	  disign.style.display = "none";
	 }
	 }
	}
</script>
</head>
<body>
<center>
   <input type="radio" name="rdbtn" id="rdbtn1" value="1"onclick="checkBox()"/> 타자
   <input type="radio" name="rdbtn" id="rdbtn2" value="2"onclick="checkBox()"/> 투수
   <div id="1" style="display:none">
<table align="center" border="1" width="800">
<tr bgcolor=" #ffff99">
<td align = "center">선수명</td>
<td align = "center">포지션</td>
<td align = "center">구단명</td>
<td align = "center">타율</td>
<td align = "center">타점</td>
<td align = "center">홈런</td>
<td align = "center">도루</td>
</tr>

<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playertbl.playername, playertbl.posi, playertbl.teamname,batting_average, rbi, homerun , stolen_base from playertbl,hittertbl where playertbl.playername=hittertbl.playername";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("playername");
		String posi = rs.getString("posi");
		String teamname = rs.getString("teamname");
		float batting_average = rs.getFloat("batting_average");
		String rbi = rs.getString("rbi");
		String homerun = rs.getString("homerun");
		String stolen_base = rs.getString("stolen_base");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=posi%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=batting_average%></td>
<td align = "center"><%=rbi%></td>
<td align = "center"><%=homerun%></td>
<td align = "center"><%=stolen_base%></td>
</tr>

<%
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</table>
</div>

<div id="2" style="display:none">
<table align="center" border="1" width="800">
<tr bgcolor=" #ffff99">
<td align = "center">선수명</td>
<td align = "center">포지션</td>
<td align = "center">구단명</td>
<td align = "center">다승</td>
<td align = "center">평균자책점</td>
<td align = "center">탈삼진</td>
<td align = "center">세이브</td>
</tr>

<%
 con = null;
 pre = null;
 rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playertbl.playername, playertbl.posi, playertbl.teamname,total_victories, earned_run, strike_out , saves from playertbl,picthertbl where playertbl.playername=picthertbl.playername";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		String playername = rs.getString("playername");
		String posi = rs.getString("posi");
		String teamname = rs.getString("teamname");
		String total_victories = rs.getString("total_victories");
		float earned_run = rs.getFloat("earned_run");
		String strike_out = rs.getString("strike_out");
		String saves = rs.getString("saves");
%>

<tr>
<td align = "center"><%=playername%></td>
<td align = "center"><%=posi%></td>
<td align = "center"><%=teamname%></td>
<td align = "center"><%=total_victories%></td>
<td align = "center"><%=earned_run%></td>
<td align = "center"><%=strike_out%></td>
<td align = "center"><%=saves%></td>
</tr>

<%
	}
    }catch(SQLException e){
		System.out.println(e.getMessage());
	}finally{
		try{
			if(rs!=null)rs.close();
			if(pre!=null)pre.close();
			if(con!=null)con.close();
		}catch(SQLException e){
			System.out.println(e.getMessage());
		}
	}
%>
</table>
</div>
</center>
</body>
</html>