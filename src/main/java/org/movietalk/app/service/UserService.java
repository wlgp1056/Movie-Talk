package org.movietalk.app.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.movietalk.app.web.UserDTO;

public interface UserService {

	public void join(UserDTO dto);

	public UserDTO idCheck(String user_id);

	public UserDTO nameCheck(String user_name);

	public UserDTO findId(UserDTO dto);

	public int loginCheck(UserDTO dto, HttpSession session);

	public UserDTO findPw(UserDTO dto);
	
	public List<UserDTO> userList(UserDTO dto);

	public void userDelete(UserDTO dto);

	public UserDTO mypage(UserDTO dto);

	public void updatePw(UserDTO dto);

	

	

}
