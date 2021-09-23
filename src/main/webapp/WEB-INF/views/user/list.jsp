<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Talk</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="../resources/css/slider.css">
		<!--<script src="../resources/js/jquery-1.10.1.min.js"></script>  -->
		<script src="../resources/js/main.js"></script>
		<script src="../resources/js/go_top.js"></script>
<style>
.column_id {
	width:20%;
}
.column_name {
	width:20%;
}
.column_gender {
	width:15%;
}
.column_email {
	width:35%;
}
.column_delete {
	width:20%;
}
.table{
	text-align: center;
}
th, td{
	border:1px solid black;
	padding: 100px 0px;
}
.btn-lg{
	padding:4px;
	font-size: 15px;
	height:30px;
	width:50px
}
</style>
</head>
<body>
<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"
		style="width: 100%">
		<div class="container">
			<a class="navbar-brand" href="/">Movie TALK</a> <img alt=""
				src="../resources/images/logo.jpg" style="margin-bottom: 30px;">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="../"
					style="margin: 0 25px;">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="../review/list.do"
					style="margin: 0 25px;">Review</a></li>
				<c:if test="${admin == null && id!='admin'}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/login.do">LOGIN</a></li>
				</c:if>
				<c:if test="${id != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="logout.do">LOGOUT</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="container">
  <!--    
  <h2 style="margin-bottom: 20px; margin-top: 30px; text-align: left;">>>> 관리자 페이지</h2><br><br>
  -->
  <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16" style="float:left;">
     <path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68L9.669.864zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702 1.509.229z"/>
     <path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1 4 11.794z"/>
 </svg>
  <h2 style="margin-bottom: 20px; margin-top: 30px; text-align: left; line-height:65px; text-indent: 20px;"> 관리자 페이지</h2><br><br>
  <h3 style="margin-bottom: 30px;  text-align: center">회원 관리</h3>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th class="column_id">ID</th>
        <th class="column_name">Name</th>
        <th class="column_gender">Gender</th>
        <th class="column_email">Email</th>
        <th class="column_delete">Del</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="list" items="${list }">
		<tr>
			<td><a href="user/list.do?user_id=${list.user_id }">${list.user_id }</a></td>
			<td>${list.user_name }</td>
			<td>${list.user_gender }</td>
			<td>${list.user_email }</td>
			<td>
			<a id="delBtn" onclick="return confirm('${list.user_id }님을 정말 삭제하시겠습니까?')"
               href="delete.do?user_id=${list.user_id}">
                  <button class="btn btn-primary btn-lg">삭제</button></a>
			</td>
		</tr>
		</c:forEach>
    </tbody>
  </table>
  
  <br>
  <br>
  <br>
  <br>
  <br>
  
  <h3 style="margin-bottom: 30px;  text-align: center">영화게시판관리</h3>
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th class="column_id">영화제목</th>
        <th class="column_name">작성자</th>
        <th class="column_email">장르</th>
        <th class="column_email">평점</th>
        <th class="column_delete">Del</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="list" items="${m_list }">
		<tr>
			<td><a>${list.board_title }</a></td>
			<td>${list.board_writer }</td>
			<td>${list.movie_genre}</td>
			<td>${list.movie_grade }</td>
			<td>
			<a id="delBtn" onclick="return confirm('영화 ${list.board_title }을 정말 삭제하시겠습니까?')"
				href="../delete.do?board_seq=${list.board_seq}">
				<button class="btn btn-primary btn-lg">삭제</button>
			</a></td>
		</tr>
		</c:forEach>
    </tbody>
  </table>
  <div style="text-align: center">
  	<a href="../insert.do"><button class="btn btn-primary ddd">입력</button></a>
  </div>
</div>
	<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; margin-top:300px">
		<div style="width: 1296px; margin: 0 auto;">
			<ul style="padding-top: 10px;">
				<li
					style="color: gray; font-size: 30px; color: #636363; margin-top: 5px;">
					Movie TALK <img src="../resources/images/logo_f.png"
					style="margin-bottom: 30px;">
				</li>
				<li style="color: #fff; font-size: 14px;">TEL : 02-933-2222</li>
				<li style="color: #fff; font-size: 14px;">Copytight/2021/09/10</li>
			</ul>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>

</body>
</html>