<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
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
	width:100%;
	font-family: 'Roboto', sans-serif;
}
.form-control {
	width:270px;
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
.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 10px 10px 3px;
	border-bottom: 3px solid lightgray;
}
.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}
.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.col-4{
	left:10px; 
	width:20%;
}
.col-8{ 
	width:80%;
	display: inline-block;
}

.col-8 .btn-lg{
	width:50px;
	height:20px;
	float:left;
	
}
.swal-button 
{
	<!-- background-color: #FFB2D9; -->
	font-size: 12px;
	text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
<!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="width: 100%">
            <div class="container">
                <a class="navbar-brand" href="/">Movie TALK</a>
               	<img alt="" src="../resources/images/logo.jpg" style="margin-bottom:30px;">	
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="../" style="margin:0 25px;">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="../review/list.do"  style="margin:0 25px;">Review</a></li>
                       
                        <li class="nav-item"><a class="nav-link active" aria-current="page" style="margin:0 25px 0 0px;" href="login.do">LOGIN</a></li>
                    </ul>
               </div>            
        </nav>
        <!-- Page header with logo and tagline-->
        <br>
        <br>
        <br>
        <br>
         <br>
        <br>
	<div class="signup-form" >
		<form action="login.do" method="post" class="form-horizontal" >
			<div class="row">
	        	<div class="col-8 offset-4" style="left: 20px">
					<h2 style="color: #999999; left:50px">Log In</h2>
				</div>	
      		</div>
			<div class="form-group row">
				<label class="col-form-label col-4">UserID</label> 
				<div class="col-8">
					<input class="form-control" type="text" id="user_id" name="user_id" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">Password</label> 
				<div class="col-8">
					<input class="form-control" type="password" id="user_pw" name="user_pw" />
					<div>
					<c:if test="${msg == 'fail' }">
						<p id="idpw-check" style="color:red; margin:5px; font-size: 13.5px;">아이디 혹은 비밀번호가 일치하지 않습니다.</p>
					</c:if>
					</div>
				</div>
			</div>
			
			<div style="text-align: center">
				<input type="checkbox" id="checkbox" name="checkbox">
				<label>
					<span>아이디 기억하기</span>
				</label>
			</div>
			
			<div class="form-group row" style="margin: auto; ">
				<div class="col-8 offset-4" style="width:400px; margin-left:70px;">
					<button class="btn btn-primary btn-lg" type="submit" id="submit" style="width:10px; height:35px; margin-right:10px;">로그인</button>
					<button class="btn btn-primary btn-lg" type="button" id="cancel" style="width:10px; height:35px; ">취소</button>
				</div>
			</div>
		</form>
		<div class="text-center">Don't have an account? <a href="join.do">Sign Up</a></div>
      <div class="text-center"><a href="findId.do">아이디찾기</a> | <a href="findPw.do">비번찾기</a></div>
      
      <br>
      <br>
      <br>
        <br>
   <br>
        <br>
   </div>
	<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; position:absolute; bottom:0;">
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

	<script type="text/javascript">
		$(document).ready(function() {
			// 취소
			$(".cencle").on("click", function() {

				location.href = "/login.do";

			})

			$("#submit").on("click", function() {
				if ($("#user_id").val() == "") {
					swal("Notice","아이디입력해주세요!");
					$("#user_id").focus();
					return false;
				}
				if ($("#user_pw").val() == "") {
					swal("Notice","비밀번호를 입력해주세요!");
					$("#user_pw").focus();
					return false;
				}
			});

		})
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	
	<!-- 아이디 기억하기 -->
	<script>
       		
		$(document).ready(function() {
			var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
			$("#user_id").val(userInputId);

			if ($("#user_id").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
				// 아이디 저장하기 체크되어있을 시,
				$("#checkbox").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
			}

			$("#checkbox").change(function() { // 체크박스에 변화가 발생시
				if ($("#checkbox").is(":checked")) { // ID 저장하기 체크했을 때,
					var userInputId = $("#user_id").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
				} else { // ID 저장하기 체크 해제 시,
					deleteCookie("userInputId");
				}
			});

			// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
			$("#user_id").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
				if ($("#checkbox").is(":checked")) { // ID 저장하기를 체크한 상태라면,
					var userInputId = $("#user_id").val();
					setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
				}
			});
		});

		function setCookie(cookieName, value, exdays) {
			var exdate = new Date();
			exdate.setDate(exdate.getDate() + exdays);
			var cookieValue = escape(value)
					+ ((exdays == null) ? "" : "; expires="
							+ exdate.toGMTString());
			document.cookie = cookieName + "=" + cookieValue;
		}

		function deleteCookie(cookieName) {
			var expireDate = new Date();
			expireDate.setDate(expireDate.getDate() - 1);
			document.cookie = cookieName + "= " + "; expires="
					+ expireDate.toGMTString();
		}

		function getCookie(cookieName) {
			cookieName = cookieName + '=';
			var cookieData = document.cookie;
			var start = cookieData.indexOf(cookieName);
			var cookieValue = '';
			if (start != -1) {
				start += cookieName.length;
				var end = cookieData.indexOf(';', start);
				if (end == -1)
					end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}
			return unescape(cookieValue);
		}
	</script>
</body>
</html>