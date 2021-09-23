package org.movietalk.app.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.movietalk.app.web.BoardMDTO;
import org.movietalk.app.web.ReplyMDTO;

@Mapper
public interface BoardMMapper {


	public List<BoardMDTO> m_list(BoardMDTO mdto);

	public BoardMDTO m_detail(BoardMDTO mdto);
	
	//평점
	public void rating(BoardMDTO mdto);

	//영화게시판 > 디테일 에서 사용할 Mdto
	public BoardMDTO getMdto(BoardMDTO mdto);

	public void modify(BoardMDTO mdto);

	public void delete(BoardMDTO mdto);

	public void insert(BoardMDTO mdto);

	//영화게시판 > 디테일 > 댓글리스트
	public List<ReplyMDTO> reply_list(ReplyMDTO rmdto_detail);
	
	public ReplyMDTO getRmdto(ReplyMDTO rmdto);
	
	public void insert_reply(ReplyMDTO Rmdto);
	//평점
	public void movie_grade(BoardMDTO mdto);
	//ajax
	public List<ReplyMDTO> replyListJSON(ReplyMDTO rmdto);

	public void hit(BoardMDTO mdto);
	//댓글 삭제
	public void deleteReply(ReplyMDTO rmdto);
	//댓글 수정
	public void modifyReply(ReplyMDTO rmdto);



}
