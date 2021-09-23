package org.movietalk.app.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.movietalk.app.web.BoardRDTO;
import org.movietalk.app.web.Criteria;

@Mapper
public interface BoardRMapper {

public int insert(BoardRDTO dto);
	
	public List<BoardRDTO> list(BoardRDTO dto);

	public BoardRDTO detail(int rboard_seq);

	public int delete(int rboard_seq);

	public int hit(int rboard_seq);

	public int modify(BoardRDTO dto);

	public List<BoardRDTO> readReply(int rboard_seq);

	public int insertRpl(BoardRDTO dto);

	public int deleteRpl(int rreply_seq);

	public int modifyRpl(BoardRDTO dto);

	public BoardRDTO detailRpl(int rreply_seq);

	public List<BoardRDTO> getListWithPaging(Criteria cri);

	public int getTotalCount();
	
	public int getTotalCount(Criteria cri);
}
