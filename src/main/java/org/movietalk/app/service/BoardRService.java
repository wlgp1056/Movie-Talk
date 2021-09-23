package org.movietalk.app.service;

import java.util.List;

import org.movietalk.app.web.BoardRDTO;
import org.movietalk.app.web.Criteria;
import org.movietalk.app.web.PageDTO;

public interface BoardRService {

	public List<BoardRDTO> list(BoardRDTO dto);

	public BoardRDTO detail(int rboard_seq);

	public int delete(int rboard_seq);
	
	public int insert(BoardRDTO dto);

	public int hit(int rboard_seq);

	public int modify(BoardRDTO dto);

	public List<BoardRDTO> readReply(int rboard_seq);

	public int insertRpl(BoardRDTO dto);

	public int deleteRpl(int rreply_seq);

	public int modifyRpl(BoardRDTO dto);

	public BoardRDTO detailRpl(int rreply_seq);

	public List<BoardRDTO> getList(Criteria cri);

	public int getTotalCount(); //매개변수 없어도 ㅇㅇ?

	public int getTotalCount(Criteria cri);

}
