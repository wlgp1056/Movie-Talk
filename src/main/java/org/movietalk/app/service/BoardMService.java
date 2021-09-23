package org.movietalk.app.service;

import java.util.List;

import org.movietalk.app.web.BoardMDTO;
import org.movietalk.app.web.ReplyMDTO;

public interface BoardMService {

	public List<BoardMDTO> m_list(BoardMDTO mdto);

	public BoardMDTO m_detail(BoardMDTO mdto);

//평점
	public void rating(BoardMDTO mdto);

	// 영화게시판 > 디테일 에서 사용할 Mdto
	public BoardMDTO getMdto(BoardMDTO mdto);

	public void modify(BoardMDTO mdto);

	public void delete(BoardMDTO mdto);

	public void insert(BoardMDTO mdto);

	// 영화게시판 > 디테일 > 댓글 리스트
	public List<ReplyMDTO> reply_list(ReplyMDTO rmdto_detail);

	// 평점계산
	public void movie_grade(BoardMDTO mdto);

	// ajax
	public void insert_reply(ReplyMDTO rmdto);

	public List<ReplyMDTO> replyListJSON(ReplyMDTO rmdto);

	public void hit(BoardMDTO mdto);
	
	//댓글 삭제
	public void deleteReply(ReplyMDTO rmdto);
	//댓글 수정
	public void modifyReply(ReplyMDTO rmdto);

}
