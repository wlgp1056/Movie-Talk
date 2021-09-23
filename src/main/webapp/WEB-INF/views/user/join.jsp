<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- alert창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="../resources/css/slider.css">
		<!-- <script src="../resources/js/jquery-1.10.1.min.js"></script> -->
		<script src="../resources/js/main.js"></script>
		<script src="../resources/js/go_top.js"></script>
<title>Movie Talk</title>
<style>
body {
	color: #999;
	background: #f3f3f3;
	font-family: 'Roboto', sans-serif;
	heigth:800px;
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
	
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 10px 10px 3px;
	border-bottom: 3px solid lightgray;
}
.signup-form form {
	height:100%;
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #fff;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px 60px;
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
	width:30%;
}
.col-8{ 
	width:70%;
}
.col-8 button{ 
	margin-top:10px;
}
.radiob {
	margin-top: 10px;
}
</style>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	// 아이디 중복 체크
	$(".idCheck").on("click", function() {
		//console.log("log");
		
		// 아이디 정규식
		var idJ = /^[a-z0-9]{4,12}$/; //  아이디는 a-z,0-9로 시작하는 아이디를 설정 
		if(idJ.test($("#user_id").val()) == false ){
			swal("Notice","아이디는 a-z,0-9로 시작하는 4~12자리 아이디로 설정해야합니다!");
			$("#user_id").focus();
			return false;
		}
		
		var query = {
			user_id : $("#user_id").val()
		};

		$.ajax({
			url : "idCheck.do",
			type : "post",
			data : query,
			success : function(data) {

				if (data == 1) {
					$(".result .msg").text("아이디 사용 불가!");
					$(".result .msg").attr("style", "color:#f00");
					//$("#submit").attr("disabled", "disabled");
				} else {
					$(".result .msg").text("아이디 사용 가능!");
					$(".result .msg").attr("style", "color:#00f");
					//$("#submit").removeAttr("disabled");
					check1 = 1;
				}
			}
		}); // ajax 끝
	});
	$("#user_id").keyup(function(){
		 $(".result .msg").text("아이디를 확인해주십시오.");
		 $(".result .msg").attr("style", "color:#000"); 
		 $("#submit").attr("disabled", "disabled");
	});
	
	// 닉네임 중복 체크
	$(".nameCheck").on("click", function() {
		
		var query = {
			user_name : $("#user_name").val()
		};

		$.ajax({
			url : "nameCheck.do",
			type : "post",
			data : query,
			success : function(data) {

				if (data == 1) {
					$(".result2 .msg2").text("닉네임 사용 불가!");
					$(".result2 .msg2").attr("style", "color:#f00");
					//$("#submit").attr("disabled", "disabled");
				} else {
					$(".result2 .msg2").text("닉네임 사용 가능!");
					$(".result2 .msg2").attr("style", "color:#00f");
					$("#submit").removeAttr("disabled");
				}
			}
		}); // ajax 끝
	});
	
	$("#user_name").keyup(function(){
		 $(".result2 .msg2").text("닉네임을 확인해주십시오.");
		 $(".result2 .msg2").attr("style", "color:#000"); 
		 $("#submit").attr("disabled", "disabled");
	});
	

	/* 취소
	$(".cencle").on("click", function() {
		location.href = "/login.do";
	})*/

	$("#submit").on("click", function() {
		
			if ($("#user_id").val() == "") {
				swal("Notice", "아이디를 입력해주세요!");
				$("#user_id").focus();
				return false;
			}
			if ($("#user_pw").val() == "") {
				swal("Notice", "비밀번호를 입력해주세요!");
				$("#user_pw").focus();
				return false;
			}
			if ($("#user_pw2").val() == "") {
				swal("Notice", "비밀번호확인을 입력해주세요!");
				$("#user_pw2").focus();
				return false;
			}
			if ($("#user_name").val() == "") {
				swal("Notice", "성명을 입력해주세요!");
				$("#user_name").focus();
				return false;
			}
			if ($("#user_email").val() == "") {
				swal("Notice", "이메일을 입력해주세요!");
				$("#user_email").focus();
				return false;
			}

			if ($("#user_gender").val() == "") {
				swal("Notice", "성별을 입력해주세요!");
				$("#user_gender").focus();
				return false;
			}

			if ($("#user_pw").val() != $("#user_pw2").val()) {
				// 비밀번호와 비밀번호확인이 다른경우
				swal("Notice", "입력한 2개의 비밀번호가 일치하지 않습니다!");
				$("#user_pw2").focus();
				return false;
			}

			// 이메일 정규식
			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if (exptext.test($("#user_email").val()) == false) {
				//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
				swal("Notice", "이메일형식이 올바르지 않습니다!");
				$("#user_email").focus();
				exit;
			}
			// 비밀번호 정규식
			var pwJ = /^[A-Za-z0-9]{4,8}$/; // 비밀번호는 A-Z,a-z,0-9로 시작하는 4~8자리 비밀번호를 설정 
			if (pwJ.test($("#user_pw").val()) == false) {
				swal("Notice", "비밀번호는 A-Z,a-z,0-9로 시작하는 4~8자리 비밀번호로 설정해야합니다!");
				$("#user_pw").focus();
				return false;
			}
			
		});

	})
</script>
<!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="width: 100% height:80px;">
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
   <br/>
   <br/>
   <br/>
   <div class="box" style="height:1300px; height:550px;">  
	<div class="signup-form">
		<form action="" method="post" class="form-horizontal" id="insertForm" >
			<div class="row">
	        	<div class="col-8 offset-4" style="left: 20px">
					<h2 style="color: #999999; left:50px">Sign Up</h2>
				</div>	
      		</div>
			<div class="form-group row">
				<label class="col-form-label col-4">UserID</label> 
				<div class="col-8">
					<input class="form-control" type="text" id="user_id" name="user_id" placeholder="소문자,숫자로 시작하는 4~12자리 아이디"/>
					<button class="idCheck" type="button">아이디중복확인</button>
					<div style="margin-top: 10px">
						<p class="result">
							<b><span class="msg">아이디를 확인해주세요★</span></b>
						</p>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">닉네임</label> 
				<div class="col-8">
					<input class="form-control" type="text" id="user_name" name="user_name" />
					<button class="nameCheck" type="button">닉네임중복확인</button>
					<div style="margin-top: 10px">
						<p class="result2">
							<b><span class="msg2">닉네임을 확인해주세요★</span></b></p>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">Password</label> 
				<div class="col-8">
					<input class="form-control" type="password" id="user_pw" name="user_pw" placeholder="한글포함x 4~8자리 비밀번호" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">Password확인</label> 
				<div class="col-8">
					<input class="form-control" type="password" id="user_pw2" name="user_pw2" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">Email Address</label> 
				<div class="col-8">
					<input class="form-control" type="email" id="user_email" name="user_email" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-form-label col-4">Gender</label>
				<div class="col-8">
					<div class="radiob" >
						<input type="radio" name="user_gender" id="user_gender" value="남자" >&nbsp;남자&nbsp;&nbsp;&nbsp;
		  				<input type="radio" name="user_gender" id="user_gender" value="여자" checked>&nbsp;여자
					</div>
				</div>
			</div>
			<div class="form-group row" style="width:450px;">
				<div class="col-8 offset-4" style="float:left;">
					<button class="btn btn-primary btn-lg" type="submit" id="submit" disabled="disabled" style="width:50px; margin-left:-30px;">회원가입</button>
					<button class="btn btn-primary btn-lg" type="reset" style="width:50px;">취소</button>
				</div>
			</div>
		</form>
	<div class="text-center">Already have an account? <a href="login.do">Log In</a></div>
	</div>
</div>
	
	<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; margin-top:300px;">
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
	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>