package org.movietalk.app.service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.movietalk.app.web.UserDTO;

@Mapper
public interface UserMapper {

	public void join(UserDTO dto);

	public UserDTO idCheck(String user_id);

	public UserDTO nameCheck(String user_name);

	public UserDTO getUser(UserDTO dto);

	public UserDTO findId(UserDTO dto);

	public UserDTO loginCheck(UserDTO dto);

	public UserDTO findPw(UserDTO dto);
	
	public List<UserDTO> userList(UserDTO dto);
	
	public void userDelete(UserDTO dto);

	public UserDTO mypage(UserDTO dto);

	public void updatePw(UserDTO dto);






}
