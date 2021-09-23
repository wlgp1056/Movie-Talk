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
a
{
text-decoration : none;
color: white;
}

a:link {
text-decoration: none;
color : white;
}

a:visited
{
color: white;
}

a:hover
{
color: white;
}

a:active
{
color: white;
}

</style>

</head>

<body>

<body>
<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">Movie TALK</a> <img alt=""
				src="../resources/images/logo.jpg" style="margin-bottom: 30px;">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="/"
					style="margin: 0 25px;">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="../review/list.do"
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
						
							<c:if test="${id != null && id!='admin' }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/mypage.do?user_id=${id }">MYPAGE</a></li>
				</c:if>
				<c:if test="${admin != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="../user/logout.do">LOGOUT</a></li>
						</c:if>
						<c:if test="${id == 'admin' }">
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
<form action="modifyRpl.do" method="post">
<div>
<div class="form-group" align="center">
<label for="exampleFormControlInput1" style="text-align: left;">작성자</label>
<input type="text" class="form-control" name="rreply_writer"
value="${dto.rreply_writer}" width="100%" readonly/>
</div>
<div class="form-group" align="center">
<label for="exampleFormControlInput1" style="text-align: left;">내용</label>

<textarea class="form-control" value="${dto.rreply_content}" rows="7" cols="10" align="center" name="rreply_content" style= "resize: none;">${dto.rreply_content}</textarea>

</div>
<input type="hidden" name="rreply_seq" value="${dto.rreply_seq }" />
<input type="hidden" name="rboard_seq" value="${dto2.rboard_seq}" />




<div class="form-group" align="center" style="margin-top: 5px">
<button class="btn btn-secondary">수정하기</button>
</div>
</form>

<br>
<div class="form-group" align="center">
<button class="btn btn-primary ddd" style="margin-top: 15px">
<a href="list.do">목록으로</a>
</button>
</div>
<script>
function popUp() {

if ('${dto.fileName}' !== null) {
window
.open(
'../resources/file/${dto.fileName}',
'win',
'left=50, top=50, width=400, height=380, toolbar=no, scrollbars=no, status=no, resizablae=no');
} else {
alert('이미지 없음');
window
.open(
'../resources/file/noimg.jpg',
'win',
'left=50, top=50, width=400, height=380, toolbar=no, scrollbars=no, status=no, resizablae=no')
}
}
</script>
<!-- Footer-->
<footer class="footer"
style="width: 100%; height: 150px; background-color: black; position: absolute; bottom: 0; margin-top:80px;">
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