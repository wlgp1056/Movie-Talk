<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/slider.css">
<!--<script src="../resources/js/jquery-1.10.1.min.js"></script>  -->
<script src="../resources/js/main.js"></script>
<script src="../resources/js/go_top.js"></script>
<title>Movie Talk</title>
<style>
body {
	color: #999;
	background: #f3f3f3;
	width: 100%;
	font-family: 'Roboto', sans-serif;
}

.form-control {
	width: 70%;
	border-color: #eee;
	min-height: 41px;
	box-shadow: none !important;
}

.form-control:focus {
	border-color: #5cd3b4;
}

.form-control, .btn {
	border-radius: 3px;
}

.col-4 {
	left: 10px;
	width: 20%;
}

.col-8 {
	width: 80%;
	display: inline-block;
}

.col-8 .btn-lg {
	width: 50px;
	height: 20px;
	float: left;
}

a {
	text-decoration: none;
	color: white;
}

a:link {
	text-decoration: none;
	color: white;
}

a:visited {
	color: white;
}

a:hover {
	color: white;
}

a:active {
	color: white;
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
				<li class="nav-item"><a class="nav-link" href="list.do"
					style="margin: 0 25px;">Review</a></li>
				<c:if test="${id == null && admin == null}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/login.do">LOGIN</a></li>
				</c:if>
				<c:if test="${id != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/logout.do">LOGOUT</a></li>
				</c:if>
				<c:if test="${admin != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/logout.do">LOGOUT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/list.do">관리자페이지</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<!-- Page header with logo and tagline-->
	<br>
	<br>
	<br>
	<!-- <h1 align="center" class="title">글쓰기 페이지</h1> -->

	<br>
	<form action="insert.do" method="post" enctype="multipart/form-data">
		<div>
			<div class="form-group" align="center">
				<label for="exampleFormControlInput1" style="text-align: left;">제목</label>
				<input type="text" class="form-control" name="rboard_title"
					value="영화제목을 입력해주세요" width="100%" />
			</div>
			<div class="form-group" align="center">
				<label for="exampleFormControlInput1">글쓴이</label> <input type="text"
					class="form-control" name="rboard_writer" value="${name}" readOnly />
			</div>
			<div class="form-group" align="center">
				<label for="exampleFormControlInput1">내용</label>
				<textarea class="form-control" name="rboard_content" rows="10"
					value="리뷰남기기"></textarea>
			</div>
			<div class="form-group" align="center">
				<label for="exampleFormControlInput1">평점</label> <input type="text"
					class="form-control" name="rboard_grade" id="rboard_grade" value="3" />
			</div>
			<div class="form-group" align="center">
				<label for="exampleFormControlInput1">파일</label> <input type="file"
					class="form-control" name="uploadFile" />
			</div>

			<div class="form-group" align="center">
				<button id="submitBtn" type="submit" class="btn btn-primary ddd">등록</button></div>
	</form>

	<div class="form-group" align="center">
		<button class="btn btn-secondary" style="margin-top: 100px">
			<a href="list.do">목록으로</a>
		</button>
	</div>

	<script>
		$(document).ready(function() {

			$("#submitBtn").on("click", function() {
				if ($("#rboard_grade").val() == "") {
					alert("평점을 입력해주세요.");
					return false;
				}
				else if (($("#rboard_grade").val() >5 || $("#rboard_grade").val() < 0)) {
					alert("0~5점까지 입력이 가능합니다");
					return false;
				}
			})

		})
	</script>




	<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; position: absolute; bottom: auto; margin-top: 80px;">
		<div style="width: 1296px; margin: 0 auto;">
			<ul style="padding-top: 10px;">
				<li
					style="color: gray; font-size: 30px; color: #636363; margin-top: 5px;">
					Movie TALK <img src="../resources/images/logo_f.png"
					style="margin-bottom: 30px;">
				</li>
				<li style="color: #fff; font-size: 14px;">TEL : 02-933-2222</li>
				<li style="color: #fff; font-size: 14px;">Copyright/2021/09/10</li>
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