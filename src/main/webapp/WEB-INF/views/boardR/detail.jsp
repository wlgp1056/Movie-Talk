<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
	width: 270px;
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

.table {
	text-align: center;
	width: 800px;
}

.oriImg {
	width: auto;
	height: 200px;
}
</style>
</head>

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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h3 style="text-align: center">${dto.rboard_title }</h3>
	<br>

			<br>
		
		<%
		//줄바꿈
		pageContext.setAttribute("br", "<br/>");
		pageContext.setAttribute("cn", "\n");
		%>	
			
			
			
	<div class="container">
		<div class="">

			<table style="width: 900px; margin:auto;"  
								
				class="table table-bordered" >
				<thead class="thead-light">
					<tr>
						<th>번호</th>
						<td>${dto.rboard_seq }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${dto.rboard_title }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${dto.rboard_writer}</td>
					</tr>

					<tr>
						<th>작성일</th>
						<td>${dto.rboard_regdate}</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>${dto.rboard_grade}</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${dto.rboard_hit}</td>
					</tr>
					<tr>
						<th>파일</th>
						<td><a href="#" onclick="popUp()"><img class="oriImg"
								src="../resources/file/${dto.fileName}"
								onerror="this.src='../resources/file/noimage.jpg'" cursor: pointer;" /></a></td>
					</tr>

					<c:if test="${dto.fileName ne null}">
						<tr>
							<th>첨부파일</th>
							<td><a href="fileDownload.do?fileName=${dto.fileName}">${dto.fileName}</a></td>

						</tr>
					</c:if>

					<tr>
						<td colspan="2" id="con" height="200px">${fn:replace(dto.rboard_content, cn, br)}</td>
					</tr>
				</thead>
			</table>
			
		</div>
	</div>
	
	<div class="container" style="margin: auto; text-align: center; margin-top: 15px" >
				<div class="">
					<c:choose>
						<c:when test="${dto.rboard_writer == name }">
							<a href=modify.do?rboard_seq=${dto.rboard_seq}><button
									class="btn btn-secondary">수정</button></a>
							<a id="delBtn" onclick="return confirm('정말 삭제하시겠습니까?')"
								href=delete.do?rboard_seq=${dto.rboard_seq}><button
									class="btn btn-secondary">삭제</button></a>
						</c:when>
					</c:choose>
					
					<c:choose>
						<c:when test="${id=='admin' && id!=dto.rboard_writer}">
							<a href=modify.do?rboard_seq=${dto.rboard_seq}><button
									class="btn btn-secondary">수정</button></a>
							<a id="delBtn" onclick="return confirm('정말 삭제하시겠습니까?')"
								href=delete.do?rboard_seq=${dto.rboard_seq}><button
									class="btn btn-secondary">삭제</button></a>
						</c:when>
					</c:choose>
				</div>
			</div>


	<br>
	<br>
	<!--  <div class="container">
				<h5 style="margin: auto; text-align: center;">Comments></h5>
	</div>-->
	
	<div class="container">
		<div class="">
			<table style="width: 1000px; margin: auto;"
				class="table table-borded">
				<tr>
					<c:forEach var="rList" items="${replyList }">
						<td style="width: 120px"><b>${rList.rreply_writer}</b></td>

						<td style="width: 600px; margin-right: 100px">${fn:replace(rList.rreply_content, cn, br)}</td>

						<td style="width: 100px;">${rList.rreply_regdate}</td>
						<td>		<td><c:choose>
								<c:when test="${rList.rreply_writer == name || id=='admin'}">
									<button type="button" class="btn btn-light btn-sm">
										<a href="modifyRplPage.do?rreply_seq=${rList.rreply_seq }&rboard_seq=${dto.rboard_seq}">수정</a>
									</button>
									<button type="button" class="btn btn-light btn-sm">
										<a href="deleteRpl.do?rreply_seq=${rList.rreply_seq }&rboard_seq=${dto.rboard_seq}"
											onclick="return confirm('댓글을 정말 삭제하시겠습니까?')">삭제</a>
									</button>
								</c:when>
							</c:choose>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>

	<div class="container" style="text-align: center; margin-top: 50px">
		<div class="write_comment">
		
			<!-- 회원만 댓글 달기 -->
			<div class="" style="margin: auto; width: 800px;">
			<c:if test="${id != null }">
					
				<form action="insertRpl.do" method="post">
					<input type="hidden" name="rreply_writer" value="${name}"/>
					<div><p><b style="float: left; margin-top:20px; align-content: center;">${name}</b></p></div>
				
					<textarea rows="3" cols="10" align="center" name="rreply_content" style="width: 600px; resize: none;"></textarea>
					
					
					<input
						type="hidden" name="r_seq" value="${dto.rboard_seq }" /> <input
						type="hidden" name="rboard_seq" value="${dto.rboard_seq }" />
					
					<button type="submit" class="btn btn-light btn-sm" style="margin-top:20px; float: right; ">등록하기</button>
					
				</form>
			</c:if>
	</div>
		</div>
		<br> <a href="list.do"><button class="btn btn-primary ddd" style="margin-top: 20px">목록으로</button></a><br>


	</div>
	<script>
	   function popUp(){
	         
	         if('${dto.fileName}'=== '') {
	            alert("이미지 없음");
	         } else{
	         window.open('../resources/file/${dto.fileName}', 'win', 'left=50, top=50, width=400, height=380, toolbar=no, scrollbars=no, status=no, resizablae=no');
	         
	         
	         }
	      }
	</script>


	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; position: absolute; bottom: auto; margin-top: 70px;">
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