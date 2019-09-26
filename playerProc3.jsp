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
<title>데뷔연도별 선수 조회</title>
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
<h2>연도별 데뷔 총 선수 수</h2>
<%
Connection con = null;
PreparedStatement pre = null;
ResultSet rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select debut_year , count(playername) as su from playertbl where debut_year is not null group by debut_year order by debut_year asc";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("debut_year") + "년 "+ rs.getString("su") + "명" + "<br>");
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
   <br><br><div>
   <input type="radio" name="rdbtn" id="rdbtn1" value="1"onclick="checkBox()"/> 1999년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn2" value="2"onclick="checkBox()"/> 2001년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn3" value="3"onclick="checkBox()"/> 2002년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn4" value="4"onclick="checkBox()"/> 2003년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn5" value="5"onclick="checkBox()"/> 2004년 데뷔선수명단<br>
   <input type="radio" name="rdbtn" id="rdbtn6" value="6"onclick="checkBox()"/> 2005년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn7" value="7"onclick="checkBox()"/> 2006년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn8" value="8"onclick="checkBox()"/> 2007년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn9" value="9"onclick="checkBox()"/> 2008년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn10" value="10"onclick="checkBox()"/> 2009년 데뷔선수명단<br>
   <input type="radio" name="rdbtn" id="rdbtn11" value="11"onclick="checkBox()"/> 2010년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn12" value="12"onclick="checkBox()"/> 2011년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn13" value="13"onclick="checkBox()"/> 2012년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn14" value="14"onclick="checkBox()"/> 2013년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn15" value="15"onclick="checkBox()"/> 2014년 데뷔선수명단<br>
   <input type="radio" name="rdbtn" id="rdbtn16" value="16"onclick="checkBox()"/> 2015년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn17" value="17"onclick="checkBox()"/> 2016년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn18" value="18"onclick="checkBox()"/> 2017년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn19" value="19"onclick="checkBox()"/> 2018년 데뷔선수명단
   <input type="radio" name="rdbtn" id="rdbtn20" value="20"onclick="checkBox()"/> 2019년 데뷔선수명단<br>
   </div>
   <br><br>
<div id="1" style="display:none">
<h3>1999년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='1999'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="2" style="display:none">
<h3>2001년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2001'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="3" style="display:none">
<h3>2002년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2002'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="4" style="display:none">
<h3>2003년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2003'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="5" style="display:none">
<h3>2004년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2004'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="6" style="display:none">
<h3>2005년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2005'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="7" style="display:none">
<h3>2006년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2006'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="8" style="display:none">
<h3>2007년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2007'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="9" style="display:none">
<h3>2008년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2008'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="10" style="display:none">
<h3>2009년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2009'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="11" style="display:none">
<h3>2010년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2010'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="12" style="display:none">
<h3>2011년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2011'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="13" style="display:none">
<h3>2012년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2012'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="14" style="display:none">
<h3>2013년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2013'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="15" style="display:none">
<h3>2014년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2014'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="16" style="display:none">
<h3>2015년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2015'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="17" style="display:none">
<h3>2016년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2016'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="18" style="display:none">
<h3>2017년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2017'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="19" style="display:none">
<h3>2018년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2018'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>

<div id="20" style="display:none">
<h3>2019년 데뷔 선수 명단</h3>
<%
con = null;
pre = null;
rs = null; 

try{
	con = DBConnection.getCon();
	String sql = "select playername from playertbl where debut_year='2019'";
	pre = con.prepareStatement(sql);
	rs = pre.executeQuery();
	
	while(rs.next()){
		out.println(rs.getString("playername")+"  ");
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
</div>
</center>
</body>
</html>