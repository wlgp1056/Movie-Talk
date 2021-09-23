<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Talk</title>
</head>
<body>
<form action="modify.do" method="POST">
	<input type="hidden" name="board_seq" value="${mdto.board_seq }" />
	<table border="1" width="100%">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>내용</td>
			<td>날짜</td>
			<td>조회수</td>
			<td>평점</td>
			<td>감독</td>
			<td>출연진</td>
			<td>스토리</td>
		</tr>
			<tr>
				<td>${mdto.board_seq }</td>
				<td><input type="text" name="board_title" value="${mdto.board_title }"></td>
				<td>${mdto.board_writer }</td>
				<td><img src=${mdto.movie_content }></td>
				<td>${mdto.board_regdate }</td>
				<td>${mdto.board_hit }</td>
				<td><input type="text" name="movie_grade" value="${mdto.movie_grade }"></td>
				<td><input type="text" name="movie_director" value="${mdto.movie_director }"></td>
				<td>${mdto.movie_character }</td>
				<td>${mdto.movie_story }</td>
			</tr>
	</table>
	<input type="submit" value="수정"/>
</form>
</body>
</html>