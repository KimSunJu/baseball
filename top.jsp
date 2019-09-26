<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
background-image:url('');
}
.menubar{
border:none;
border:0px;
margin:0px 0px 50px 0px;
padding:0 150px 0 10px;
font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
font-size:14px;
font-weight:bold;
}

.menubar ul{
background:#ffffff;
height:50px;
list-style:none;
margin:0;
padding:0;
}

.menubar li{
float:right;
padding:0px;
}

.menubar li a{
background: #ffffff;
color: #4d4d4d;
display:block;
font-weight:normal;
line-height:50px;
margin:0px;
padding:0px 25px;
text-align:center;
text-decoration:none;
}

.menubar li a:hover, .menubar ul li:hover a{
background: rgb(71,71,71);
color:#FFFFFF;
text-decoration:none;
}

.menubar li ul{
background: rgb(109,109,109);
display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
height:auto;
padding:0px;
margin:0px;
border:0px;
position:absolute;
width:200px;
z-index:200;
}

.menubar li:hover ul{
display:block;
}

.menubar li li {
background: rgb(109,109,109);
display:block;
float:none;
margin:0px;
padding:0px;
width:200px;
}

.menubar li:hover li a{
background:none;
}

.menubar li ul a{
display:block;
height:50px;
font-size:12px;
font-style:normal;
margin:0px;
padding:0px 10px 0px 15px;
text-align:left;
}

.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color:#ffffff;
text-decoration:none;
}

.menubar p{
clear:left;
}

h1 a {
font: 100% sans-serif;
text-decoration:none;
color:#000000;
}
</style> 

</head>
<body>
<center><h1><a href="main.jsp">2019년 프로야구<img src ="img/ball.jpg" height="40px"></a></h1></center>
<div class="menubar">
<ul>
  <li><a href="login.jsp" id="current">관리자페이지</a>
	<ul>
     <li><a href="admin.jsp">선수 수정/삭제</a></li>
     <li><a href="admin2.jsp">선수 영입</a></li>
     <li><a href="admin3.jsp">데이터사전조회</a></li>
    </ul>
 </li>
 
 <li><a href="pic.jsp" id="current">투수</a>
	<ul>
  <li><a href="pic2.jsp">다승 순위</a></li>
     <li><a href="pic3.jsp">평균자책점 순위</a></li>
     <li><a href="pic4.jsp">탈삼진 순위</a></li>
     <li><a href="pic5.jsp">세이브 순위</a></li>
    </ul>
 </li>
 
  <li><a href="hit.jsp" id="current">타자</a>
	<ul>
      <li><a href="hit2.jsp">타율 순위</a></li>
     <li><a href="hit3.jsp">타점 순위</a></li>
     <li><a href="hit4.jsp">홈런 순위</a></li>
     <li><a href="hit5.jsp">도루 순위</a></li>
    </ul>
 </li>
 
 <li><a href="player.jsp" id="current">선수</a>
	<ul>
     <li><a href="player2.jsp">나이별 선수</a></li>
     <li><a href="player3.jsp">데뷔별 선수</a></li>
     <li><a href="player4.jsp">포지션별 선수</a></li>
    </ul>
 </li>
 
  <li><a href="team.jsp" id="current">구단</a>
	<ul>
     <li><a href="team.jsp">구단 선수</a></li>
     <li><a href="team2.jsp">구단 순위</a></li>
    </ul>
 </li>
</ul>
</div>
</body>
</html>