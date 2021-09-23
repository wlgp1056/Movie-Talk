package org.movietalk.app.service.impl;

import java.util.List;

import org.movietalk.app.service.BoardRService;
import org.movietalk.app.service.mapper.BoardRMapper;
import org.movietalk.app.web.BoardRDTO;
import org.movietalk.app.web.Criteria;
import org.movietalk.app.web.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardRServiceImpl implements BoardRService {
	
	@Autowired
	BoardRMapper mapper;

	@Override
	public int insert(BoardRDTO dto) {
		return mapper.insert(dto);
	}
	
	@Override
	public List<BoardRDTO> list(BoardRDTO dto) {
		return mapper.list(dto);
	}

	@Override
	public BoardRDTO detail(int rboard_seq) {
		return mapper.detail(rboard_seq);
	}

	@Override
	public int delete(int rboard_seq) {
		return mapper.delete(rboard_seq);
	}

	@Override
	public int hit(int rboard_seq) {
		return mapper.hit(rboard_seq);
	}

	@Override
	public int modify(BoardRDTO dto) {
		return mapper.modify(dto);
	}

	@Override
	public List<BoardRDTO> readReply(int rboard_seq) {
		return mapper.readReply(rboard_seq);
	}

	@Override
	public int insertRpl(BoardRDTO dto) {
		return mapper.insertRpl(dto);
	}

	@Override
	public int deleteRpl(int rreply_seq) {
		return mapper.deleteRpl(rreply_seq);
	}

	@Override
	public int modifyRpl(BoardRDTO dto) {
		return mapper.modifyRpl(dto);
	}

	@Override
	public BoardRDTO detailRpl(int rreply_seq) {
		return mapper.detailRpl(rreply_seq);
	}

	@Override
	public List<BoardRDTO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}





//	@Override
//	public PageDTO getTotalCount(int pageDto) {
//		return mapper.getTotalCount(pageDto);
//	}
}
