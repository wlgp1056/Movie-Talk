<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="KO">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Movie Talk</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="./resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="./resources/css/slider.css">
		<script src="./resources/js/jquery-1.10.1.min.js"></script>
		<script src="./resources/js/main.js"></script>
		<script src="./resources/js/go_top.js"></script>		
		<style>
			.search_bg{width:100%; height:80px; background-color: black;  z-index: 100; position: absolute; display: none;}
			.search_bg .search{width:1296px; height:100%;  margin:0 auto; }
			.search_form{width:810px; height:60px; margin:0 auto;}
			.search_form .select{width:100px; height:40px;  margin-top:20px;}			
			.search_form input[type=text]{width:597px; height:40px;  margin-top:20px;}		
			.search_form input[type=submit]{width:100px; height:40px;  margin-top:20px;}				
			#closeBtn{float:right; margin-top:-45px;}			
		</style>
</head>
<body>
<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="/">Movie TALK</a> <img alt=""
				src="./resources/images/logo.jpg" style="margin-bottom: 30px;">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" href="/"
					style="margin: 0 25px;">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="review/list.do"
					style="margin: 0 25px;">Review</a></li>
				<c:if test="${id == null && admin == null}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/login.do">LOGIN</a></li>
				</c:if>
				<c:if test="${id != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/logout.do">LOGOUT</a></li>
						</c:if>
						
							<c:if test="${id != null && id!='admin' }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/mypage.do?user_id=${id }">MYPAGE</a></li>
				</c:if>
				<c:if test="${admin != null }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/logout.do">LOGOUT</a></li>
						</c:if>
						<c:if test="${id == 'admin' }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" style="margin: 0 25px 0 0px;"
						href="user/list.do">관리자페이지</a></li>
				</c:if>
				<li class="nav-item" >
                  <img alt="" src="./resources/images/sBtn.png" onclick="search()" id="searchBtn">                   		  	
                </li>
			</ul>
		</div>
	</nav>

<!-- search -->
     <div class="search_bg" id="c">
        		<!--search  -->       
				   <div class="search">
				<form name="form1" method="POST" action=""  class="search_form">

			<select name="searchCondition">
				<option value="board_writer"
					<c:out value="${map.mdto.searchCondition == 'board_writer'?'selected':''}"></c:out>>작성자</option>

				<option value="board_title"
					<c:out value="${map.mdto.searchCondition == 'board_title'?'selected':''}"></c:out>>제목</option>

				<option value="movie_content"
					<c:out value="${map.mdto.searchCondition == 'movie_content'?'selected':''}"></c:out>>내용</option>
				<option value="all"
					<c:out value="${map.mdto.searchCondition == 'all'?'selected':''}" />>작성자+내용+제목</option>

			</select> 
				<input name="searchKeyword" value="${map.mdto.searchKeyword}" size="40px"> 
							<input type="submit" value="검 색" id="search_close">
							
					</form>
					<img alt="" src="./resources/images/cBtn.png" onclick="search()" class="" id="closeBtn">
				</div>
        </div>
            <script>
			$('#searchBtn').click(function() {
			    $(".search_bg").show();
			    // goodsBtn을 클릭하면 goodsDiv를 보여줘라
			 
			})
			 
			$('#closeBtn').click(function() {
			    $(".search_bg").hide();
			    // goodsBtn을 클릭하면 goodsDiv를 숨겨라
			 
			})
		</script>
	<!-- Page header with logo and tagline-->

	<div class="slider">
		<!-- B -->
		<ul>
			<li><a href="/"><img
					src="./resources/images/mainslider1.jpg" alt="슬라이더1"></a></li>
			<li><a href="/"><img
					src="./resources/images/mainslider2.jpg" alt="슬라이더1"></a></li>
			<li><a href="/"><img
					src="./resources/images/mainslider3.jpg" alt="슬라이더1"></a></li>

		</ul>
	</div>

	<!--search dd -->
<%-- 	<div>
		<form name="form1" method="POST" action="">

			<select name="searchCondition">
				<option value="board_writer"
					<c:out value="${map.mdto.searchCondition == 'board_writer'?'selected':''}"></c:out>>작성자</option>

				<option value="board_title"
					<c:out value="${map.mdto.searchCondition == 'board_title'?'selected':''}"></c:out>>제목</option>

				<option value="movie_content"
					<c:out value="${map.mdto.searchCondition == 'movie_content'?'selected':''}"></c:out>>내용</option>
				<option value="all"
					<c:out value="${map.mdto.searchCondition == 'all'?'selected':''}" />>작성자+내용+제목</option>



			</select> <input name="searchKeyword" value="${map.mdto.searchKeyword}">
			<input type="submit" value="조회">
		</form>
	</div> --%>

	<!-- Page content-->
	<div class="container">
		<div class="row">
			<!-- Blog entries-->
			<div class="col-lg-8">
				<!-- Nested row for non-featured blog posts-->


		<div class="row">

					<!-- Blog post-->
					<c:forEach var="list" items="${map.m_list }">
						<div class="col-lg-6">
							<div class="card mb-4">
							<%-- 	<a href="/"><img class="card-img-top"
									src=${list.movie_content } alt="..." /></a> --%>
									
									<img src="./resources/file/${list.fileName }"/>
								
								<div class="card-body">
									<div class="small text-muted">${list.board_regdate }</div>
									<h2 class="card-title h4">${list.board_title}</h2>
									<p class="card-text">${list.movie_director }</p>
									<button class="btn btn-primary"
										onclick="location.href='detail.do?board_seq=${list.board_seq }&m_seq=${list.board_seq }'">자세히
										알아보기</button>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>

		</div>
	</div>

	<br>


<!-- Footer-->
	<footer class="footer"
		style="width: 100%; height: 150px; background-color: black; position: absolute; bottom: auto; margin-top:80px;">
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
