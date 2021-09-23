<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Talk</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/slider.css">
<!--<script src="../resources/js/jquery-1.10.1.min.js"></script>  -->
<script src="../resources/js/main.js"></script>
<script src="../resources/js/go_top.js"></script>
<style>
.column_id {
	width: 20%;
}

.column_name {
	width: 20%;
}

.column_gender {
	width: 15%;
}

.column_email {
	width: 35%;
}

.column_delete {
	width: 20%;
}

.table {
	text-align: center;
}

th, td {
	border: 1px solid black;
	padding: 100px 0px;
}

.btn-lg {
	padding: 4px;
	font-size: 15px;
	height: 30px;
	width: 50px
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
				<c:if test="${id == null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/login.do">LOGIN</a></li>
				</c:if>
				<c:if test="${id != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;" href="logout.do">LOGOUT</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<div class="container">
	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16" style="float:left;">
      <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
      <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
   </svg>
      <h2 style="margin-bottom: 20px; margin-top: 30px; text-align: left; line-height:65px; text-indent: 20px;">
         MY PAGE</h2>
     
		<h3 style="margin-bottom: 40px; margin-top: 30px; text-align: center">내
			정보</h3>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th class="column_id">ID</th>
					<td>${user.user_id }</td>
				</tr>
				<tr>
					<th class="column_name">Name</th>
					<td>${user.user_name }</td>
				</tr>
				<tr>
					<th class="column_gender">Gender</th>
					<td>${user.user_gender }</td>
				</tr>
				<tr>
					<th class="column_email">Email</th>
					<td>${user.user_email }</td>
				</tr>
				<tr>
					<th class="column_delete">Del</th>
					<td><a id="delBtn"
						onclick="return confirm('${user.user_id }님 정말 탈퇴하시겠습니까?')"
						href="user_delete.do?user_id=${user.user_id}">
							<button class="btn btn-primary btn-lg">탈퇴</button>
					</a></td>
				</tr>
			</thead>
		</table>
		<div style="text-align: center">
			<a href="../"><button class="btn btn-primary ddd">Home</button></a>
			<a href="update.do?user_id=${user.user_id }"><button class="btn btn-primary ddd">비밀번호변경</button></a>
		</div>
	</div>
	<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; position: absolute; bottom: 0;">
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