<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="./resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="./resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="./resources/css/slider.css">
<script src="./resources/js/jquery-1.10.1.min.js"></script>
<script src="./resources/js/main.js"></script>
<title>영화소개</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 댓글 js모듈 등록 -->
<script src="./resources/js/reply.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->

<style type="text/css">
.contents {
	width: 1296px;
	height: 950px;
	margin: 0 auto;
	margin-top: 50px;
}

/*searchBar */
.search_bg {
	width: 100%;
	height: 120px;
	background-color: black;
	display: none;
	z-index: 100;
	position: absolute;
	top: 0;
	left:;
}

.search_bg .search {
	width: 1296px;
	height: 100%;
	margin: 0 auto;
}

.search_form {
	width: 800px;
	height: 60px;
	margin: 0 auto;
}

.search_form .select {
	width: 90px;
	height: 60px;
	margin-top: 20px;
}

.search_form input[type=text] {
	width: 597px;
	height: 60px;
	margin-top: 20px;
}

.search_form input[type=submit] {
	width: 100px;
	height: 60px;
	margin-top: 20px;
}

#closeBtn {
	float: right;
	margin-top: -25px;
}

.section01 {
	width: 648px;
	height: 888px;
	float: left;
}

.section01 .ul {
	width: 648px;
	height: 154px;
	display: inline-block;
}

.section01 .ul .li {
	float: left;
}

.section01 .ul .li:nth-child(1) {
	width: 230px;
	font-weight: bold;
	font-size: 50px;
	letter-spacing: 20px;
}

.section01 .ul .li:nth-child(2) {
	width: 398px;
	font-size: 20px;
}

.section01 .ul:nth-child(4) {
	height: 270px;
}

.section02 {
	width: 648px;
	height: 888px;
	x float: left;
}

.contains {
	width: 1296px;
	height: 300px;
	margin: 0 auto;
	margin-bottom: 50px;
	background-color: gray;
}

.contains .ul {
	display: inline-block;
}

.contains .ul .li {
	width: 425px;
	height: 300px;
	float: left;
	background-color: red;
}

.contains .ul .li:nth-child(2) {
	margin: 0 10px;
}

.mb-5 h2 {
	font-weight: bold;
	font-size: 30px;
}

.play_card {
width:100%;
	height: 500px;
}

span h4 {
	padding: 10px 7px;
	font-family: sans-serif;
}

/*slider*/
.swiper-container {
	width: 1000px;
	height: 888px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.MdetailTitle  span {
	font-weight: 600;
}

.mb-55 {
	position: relative;
	top: 0;
	left: 0;
	width: 280px;
	height: 400px;
	float: left;
	overflow: hidden;
	border: 1px solid black;
	border-radius: 20px;
	box-shadow: 2px 1px 10px 10px rgba(0, 0, 0, 0.1);
}

.mb-55 img {
	position: absolute;
	top: 0;
	left: 0;
	width: 290px;
	height: 400px;
}

.rating_star {
	font-size: 2rem;
	/*line-height: 2.5rem;*/
	justify-content: space-around;
	/* padding: 0 0.2em; */
	width: 5px;
	position: relative;
	top: 0;
	left: 0;
	width: 100px;
	height: 50px;
	display: inline-block;
	float:left;
}

.grey_star {
	font-size: 2rem;
	/*line-height: 2.5rem;*/
	justify-content: space-around;
	/* padding: 0 0.2em; */
	width: 5px;
	position: relative;
	top: 0;
	left: 0;
	width: 110px;
	height: 50px;
	display: block;
	float: left;
	clear: left;
}

.star-grade {
	width: 168px;
}

.movie_grade {
	font-size: 2rem;
	/*line-height: 2.5rem;*/
	justify-content: space-around;
	/* padding: 0 0.2em; */
	width: 20px;
	display: inline-block;
	clear: left;
	margin-left: 10px;
}

.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 1.5rem;
	/*line-height: 2.5rem;*/
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

.star-grade label {
	-webkit-text-fill-color: red;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 0px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
	float: left;
}

.grey_star {
	-webkit-text-fill-color: lightgrey;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 0px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
	float: left;
	clear: left;
}

.grey_star label {
	width: 20px;
	height: 28px;
	display: inline-block;
	float: left;
}

.star-rating label {
	-webkit-text-fill-color: lightgrey;
	/* Will override color (regardless of order) */
	-webkit-text-stroke-width: 0px;
	-webkit-text-stroke-color: #2b2a29;
	cursor: pointer;
	float: left;
}

.star-rating :checked ~ label {
	-webkit-text-fill-color: red;
}

.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: pink;
}

.rating_greystar {
	-webkit-text-fill-color: lightgrey;
	-webkit-text-stroke-width: 0px;
	-webkit-text-stroke-color: #2b2a29;
}

.result-table {
	clear: left;
}

.table{ width:1290px; !important; }
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
	<div class="search_bg">
		<!--search  -->
		<div class="search">
			<form name="form1" method="POST" action="/app" class="search_form">

				<select name="searchCondition" class="select">
					<option value="board_writer"
						<c:out value="${map.searchCondition == 'board_writer'?'selected':''}"></c:out>>작성자</option>

					<option value="board_title"
						<c:out value="${map.searchCondition == 'board_title'?'selected':''}"></c:out>>제목</option>

					<option value="movie_content"
						<c:out value="${map.searchCondition == 'movie_content'?'selected':''}"></c:out>>내용</option>
					<option value="all"
						<c:out value="${map.searchCondition == 'all'?'selected':''}" />>모두
						선택</option>
				</select> <input type="text" name="searchKeyword"
					value="${map.searchKeyword}" size="40px"> <input
					type="submit" value="검 색" id="search_close">

			</form>
			<img alt="" src="./resources/images/closeBtn.png" onclick="search()"
				class="" id="closeBtn">
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

	<!-- Features section-->
	<section class="py-4">
		<div class="container px-5 my-5" >
			<div class="row gx-5">
				<div class="col-lg-4 mb-55">
					<!-- 포스터 -->
					<img class="" src="./resources/file/${mdto.fileName }" alt="" />
				</div>

				<div class="col-lg-8">
					<div class="MdetailTitle" style="width:100%; height: 100%; padding: 0 70px;">
						<div style="height: 50px;">
							<p style="font-size: 33px; font-weight: 600;">${mdto.board_title }</p>
						</div>

						<div style="height: 70px; font-weight: 100;">
							<!-- <p class="score_title">평점</p>  -->
							<!-- movie_grade 평점 -->
							<div class="movie_grade" style="color: black;">${mdto.movie_grade }</div>
							<div class="grey_star" id="grey_star"
								style="position: relative; top: 0; left: 0;">
								<div class="box">
									<c:forEach var="1" begin="1" end="5">
										<label class="star" id="grey_star" style="float: left;">&#9733;</label>
									</c:forEach>
								</div>
								<div class="star-grade"
									style="position: absolute; top: 0; left: 0;">
									<c:forEach var="1" begin="1" end="${mdto.movie_grade }">
										<label class="star">&#9733;</label>
									</c:forEach>
								</div>
							</div>
							
						</div>
					

						<div style="height: 60px; font-weight: 100;">
							<p
								style="width: 100px; display: inline-block; float: left; font-weight: 600; color: #898989;">제작진</p>
							<span>${mdto.movie_director }</span>
						</div>

						<div>
							<p
								style="width: 100px; height: 90px; display: inline-block; float: left; font-weight: 600; color: #898989;">출연자</p>
							<span>${mdto.movie_character }</span>
						</div>
						<div style="clear: left;">
							<p
								style="width: 100px; height: 140px; display: inline-block; float: left; font-weight: 600; color: #898989;">줄거리</p>
							<span style="height: 140px; overflow: hidden;">
								${mdto.movie_story } </span>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

<!-- 동영상 링크-->
	<section class="py-5" >
		<div class="container px-5 my-5"  >
			<div class="row gx-5">
				<div class="col-lg-4 mb-5" class="play_card">
					<div class="card h-200 shadow border-0"  >
						<iframe width="1200px" height="660"
							src="${mdto.movie_content}?autoplay=1"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
							allowfullscreen></iframe>
						

					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- 댓글 -->
	<div class="container" >
	<!-- 댓글처리를 위한 modal div -->
	<!-- Trigger the modal with a button -->
		<c:if test="${id != null }">
	<button type="button" class="btn btn-default" data-toggle="modal"
		data-target="#myModal">내 평점 등록</button>
		</c:if>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				
					<h4 class="modal-title">댓글 쓰기</h4>
				</div>
				<div class="modal-body">
					<p>
					<form id="replyWriteForm">
						<input type="hidden" id="board_seq" value="${mdto.board_seq }">
						<div class="form-group">
						 작성자 : ${name } 님
						 <input type="hidden" id="mreply_writer" value="${name }">
						</div>
						<!-- 별점 -->
						별점:
						<div class="star-rating">
							<input type="hidden" id="v" name="rating" value="0"> <input
								type="radio" id="5-stars" name="rating" value="5" /> <label
								for="5-stars" class="star">&#9733;</label> <input type="radio"
								id="4-stars" name="rating" value="4" /> <label for="4-stars"
								class="star">&#9733;</label> <input type="radio" id="3-stars"
								name="rating" value="3" /> <label for="3-stars" class="star">&#9733;</label>
							<input type="radio" id="2-stars" name="rating" value="2" /> <label
								for="2-stars" class="star">&#9733;</label> <input type="radio"
								id="1-star" name="rating" value="1" /> <label for="1-star"
								class="star">&#9733;</label>
						</div>
						<div class="form-group">
							<label for="mreply_content">댓글 내용:</label>
							<textarea class="form-control" rows="5" id="mreply_content"></textarea>
						</div>
					</form>
					</p>

				</div>

				<script>
					var value = 0; //value를 전역변수로 선언
					$('.star-rating>input').click(function() {
						window.value = $(this).attr('value'); //누른것의 value값을 가지고 와서 window.value에 속성값으로 저장
						console.log(window.value);

						$('#v').val(value); // 눌러서 저장된 값을 hidden input에 넣어주기 

						var value = {
							m_rating : $('#v').val()
						//mrating 이라는 이름으로 값 보내기 
						};
					}); // ajax 끝

					$(function() {

						$("#replyWriteProcessBtn").click(
								function() {
									//데이터 수집 - form 밖에 button이므로 submit이 일어나지 않는다
									var reply = {
										m_seq : $("#board_seq").val(),
										mreply_writer : $("#mreply_writer")
												.val(),
										mreply_content : $("#mreply_content")
												.val(),
										m_rating : value
									};

									//처리 호출
									replyService.add(reply, function() {

										console.log(reply);
										console.log(reply.m_seq);
										$("#mreply_writer").val("");
										$("#mreply_content").val("");
										$('#myModal').modal("hide");
										location.href = 'detail.do?board_seq='
												+ reply.m_seq + '&m_seq='
												+ reply.m_seq;

									});
								});
					});
				</script>
				<div cla ss="modal-footer">
					<button class="btn btn-default" id="replyWriteProcessBtn">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
<!-- 댓글 쓰기 모달 끝 -->

<table class="table">
  <thead> 
    <tr>
      <th scope="col">평점</th>
      <th scope="col">내용</th>
      <th scope="col">작성자</th>
      <th scope="col">날짜</th>
      <th scope="col">수정삭제</th>
    </tr>
  </thead>
  
  <tbody>
    		<c:forEach var="list" items="${reply_list }">
			<tr>
				<td>
					<div class="rating_star" id="rating_star"
						style="position: relative; top: 0; left: 0; float: left;">

						<c:forEach var="1" begin="1" end="5">
							<label class="rating_greystar" id="rating_greystar"
								style="float: left; background-color:">&#9733;</label>
						</c:forEach>

						<div class="star-grade">
							<div style="position: absolute; top: 0; left: 0;">
								<c:forEach var="1" begin="1" end="${list.m_rating }">
									<label class="star">&#9733;</label>							
								</c:forEach>									
							</div>
							<div style="width:10px; float:left; margin-left:32px;">${list.m_rating }</div>					
						</div>
						
					</div>
				</td>
				<td>${list.mreply_content }</td>
				<td>${list.mreply_writer }</td>
				<td>${list.mreply_regdate }</td>
				<!-- Trigger the modal with a button -->
				<td>
				<c:if test="${name == list.mreply_writer || id =='admin' }">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#modifyModal" name="replySeq"
						value="${list.mreply_seq }">수정</button>
				<a onclick="return confirm('정말 삭제하시겠습니까?')"
					href="deleteReply.do?mreply_seq=${list.mreply_seq}&m_seq=${list.m_seq}">
						<button class="btn btn-default">삭제</button>
				</a>
				</c:if>
				</td>
			</tr>
		</c:forEach>
  </tbody>
  
  </table>
  	<div>
  	<button class="btn btn-default "><a href="/">목록으로</a></button>
	<c:if test="${id == 'admin' }">
	<button class="btn btn-default "><a href="modify.do?board_seq=${mdto.board_seq }">수정하기</a></button>
	<button class="btn btn-default "><a href="delete.do?board_seq=${mdto.board_seq }">삭제하기</a></button>
	</c:if>
</div>
  </div>
	<!-- 댓글 수정 위한 modal div -->
	<!-- Modal2 -->
	<div id="modifyModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					
					<h4 class="modal-title">댓글 수정</h4>
				</div>
				<div class="modal-body">
					<form id="replyWriteForm2">
						작성자 : ${name } 님 <br /> <input type="hidden" id="board_seq2"
							value="${mdto.board_seq }">
						<script type="text/javascript">
							var mreply_seq;
							$("button[name=replySeq]").click(function() {
								mreply_seq = $(this).val();
								console.log(">>>" + mreply_seq);
							});
						</script>
						<!-- 별점 -->
						별점 주기 : <input type="number" id="m_rating2" value="">
						<div class="form-group">
							<label for="mreply_content">수정 내용:</label>
							<textarea class="form-control" rows="5" id="mreply_content2">수정내용</textarea>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button class="btn btn-default" id="replyModifyBtn">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 댓글 수정 모달 끝 -->
	<!-- 댓글 수정 스크립트 -->
	<script>
		var value = 0; //value를 전역변수로 선언
		$('#modifyModal .star-rating2>input').click(function() {
			window.value = $(this).attr('value'); //누른것의 value값을 가지고 와서 window.value에 속성값으로 저장
			console.log(window.value);

			$('#v2').val(value); // 눌러서 저장된 값을 hidden input에 넣어주기 

			var value = {
				m_rating : $('#v2').val()
			//mrating 이라는 이름으로 값 보내기 
			};
		}); // ajax 끝

		$(function() {
			$("#replyModifyBtn").click(
					function() {
						//데이터 수집 - form 밖에 button이므로 submit이 일어나지 않는다
						var reply = {
							mreply_seq : mreply_seq,
							m_seq : $("#board_seq2").val(),
							mreply_content : $("#mreply_content2").val(),
							m_rating : $("#m_rating2").val()
						};

						//처리 호출
						replyService.reply(reply, function() {

							console.log(reply);
							console.log(reply.m_seq);
							$("#mreply_content2").val("");
							$('#modifyModal').modal("hide");
							location.href = 'detail.do?board_seq='
									+ reply.m_seq + '&m_seq=' + reply.m_seq;

						});
					});
		});
	</script>




        <!-- Footer-->
          <footer style="width:100%; height:100px; background-color: black; margin-top:70px;">        
		     <div style="width:1296px; margin:0 auto;">
		     	<ul style="width:100%; padding-top:16px;  display: inline-block;">
		     		<li style="width:300px; color:gray; font-size:30px; float:left; color:gray; font-size:30px;">
		     			<p style="width:170px; display: inline-block; margin-top:10px;">Movie TALK</p>
		     			 <img src="../resources/images/logo_f.png" style="margin-bottom:30px;">
		     		</li>	 		
		     		<li style=" float:right;  color:#fff; font-size:14px;">TEL : 02-933-2222</li><br/>	     			
		     		<li style=" float:right;  color:#fff; font-size:14px;">Copytight/2021/09/10</li>		     		
		     	</ul>
		     </div>  
        </footer>
  
 
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="./resources/js/scripts.js"></script>
</body>
</html>