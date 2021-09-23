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
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="../resources/css/slider.css">
		<!-- <script src="../resources/js/jquery-1.10.1.min.js"></script>  -->
		<script src="../resources/js/main.js"></script>
		<script src="../resources/js/go_top.js"></script>
<title>Movie Talk</title>
<style>
body {
   color: #999;
   background: #f3f3f3;
   font-family: 'Roboto', sans-serif;
}
.form-control {
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
   align-content: center;
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

   <div class="signup-form" >
      <form class="form-horizontal">
         <div class="row">
              <div class="col-8 offset-4" style="left: 20px">
               <h2 style="color: #999999; left:50px">FIND PW</h2>
            </div>   
            </div>
         <div class="form-group row">
         <div align="center">
              <h5 style="color: #999999; ">찾으시는 비밀번호는 <b>${user_pw }</b> 입니다</h5>
         </div>
         </div>
         <div class="form-group row" style="width:300px; margin:auto;">
            <button class="btn btn-primary btn-lg" type="button" id="submit" onclick="location.href='login.do'">로그인</button>
         	<button class="btn btn-primary btn-lg" type="button" onclick="location.href='findId.do'">아이디찾기</button>
         </div>
      </form>
      <div class="text-center">회원가입하시겠습니까? <a href="join.do">Join here</a></div>
   </div>
   <br>
   <br>
   <br>
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
   
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>

</body>
</html>