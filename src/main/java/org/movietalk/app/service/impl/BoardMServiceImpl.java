package org.movietalk.app.service.impl;

import java.util.List;

import org.movietalk.app.service.BoardMService;
import org.movietalk.app.service.mapper.BoardMMapper;
import org.movietalk.app.web.BoardMDTO;
import org.movietalk.app.web.ReplyMDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardMServiceImpl implements BoardMService {

	@Autowired
	BoardMMapper mapper;

	@Override
	public List<BoardMDTO> m_list(BoardMDTO mdto) {

		return mapper.m_list(mdto);
	}

	@Override
	public BoardMDTO m_detail(BoardMDTO mdto) {

		return mapper.m_detail(mdto);
	}

	@Override
	public void rating(BoardMDTO mdto) {
		mapper.rating(mdto);

	}

	// 영화게시판 > 디테일 에서 사용할 Mdto
	@Override
	public BoardMDTO getMdto(BoardMDTO mdto) {
		return mapper.getMdto(mdto);
	}

	@Override
	public void modify(BoardMDTO mdto) {
		mapper.modify(mdto);
	}

	@Override
	public void delete(BoardMDTO mdto) {
		mapper.delete(mdto);
	}

	@Override
	public void insert(BoardMDTO mdto) {
		mapper.insert(mdto);
	}

	@Override
	public List<ReplyMDTO> reply_list(ReplyMDTO rmdto_detail) {
		return mapper.reply_list(rmdto_detail);
	}

	@Override
	public void insert_reply(ReplyMDTO rmdto) {
		mapper.insert_reply(rmdto);
	}

	@Override
	public void movie_grade(BoardMDTO mdto) {
		// TODO Auto-generated method stub
		mapper.movie_grade(mdto);
	}


	//ajax
	@Override
	public List<ReplyMDTO> replyListJSON(ReplyMDTO rmdto) {
		return mapper.replyListJSON(rmdto);
	}

	@Override
	public void hit(BoardMDTO mdto) {
		mapper.hit(mdto);
		
	}
	//댓글 삭제
	@Override
	public void deleteReply(ReplyMDTO rmdto) {
		mapper.deleteReply(rmdto);
	}

	//댓글 수정
	@Override
	public void modifyReply(ReplyMDTO rmdto) {
		mapper.modifyReply(rmdto);
	}


}
