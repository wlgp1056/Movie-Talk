package org.movietalk.app.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.movietalk.app.service.UserService;
import org.movietalk.app.service.mapper.UserMapper;
import org.movietalk.app.web.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper mapper;

	@Override
	public void join(UserDTO dto) {
		mapper.join(dto);
		
	}

	@Override
	public UserDTO idCheck(String user_id) {
		return mapper.idCheck(user_id);
	}

	@Override
	public UserDTO nameCheck(String user_name) {
		return mapper.nameCheck(user_name);
	}

	
	@Override
	public UserDTO findId(UserDTO dto) {
		// TODO Auto-generated method stub
		return mapper.findId(dto);
	}
	
	@Override
	public UserDTO findPw(UserDTO dto) {
		return mapper.findPw(dto);
	}

	@Override
	public int loginCheck(UserDTO dto, HttpSession session) {
		String id = dto.getUser_id();	//입력폼에서 가져온 id
		String pw = dto.getUser_pw();	//입력폼에서 가져온 pw
		
		System.out.println("id : " + id);
		System.out.println("pw : " + pw);
		
		UserDTO userdto = mapper.loginCheck(dto);
		System.out.println(userdto);
		// 추가
		
		
		if(userdto == null) {
			System.out.println("아이디와 패스워드 불일치ㅜㅜㅜㅜㅜㅜㅜ");
			return -1;
		}
		if(id.equals(userdto.getUser_id()) && pw.equals(userdto.getUser_pw())) {
			System.out.println("아이디와 패스워드 일치!");
			String name = userdto.getUser_name();
			System.out.println(name);
			dto.setUser_name(name);
			if(id.equals("admin") && pw.equals("0000")){
				System.out.println("관리자로 로그인됨");
				return 1;
			}
			return 0;
		} 
		return -1;
	}
	
	@Override
	public List<UserDTO> userList(UserDTO dto) {
		List<UserDTO> list = mapper.userList(dto);

		return list;
	}

	@Override
	public void userDelete(UserDTO dto) {
		mapper.userDelete(dto);
	}

	@Override
	public UserDTO mypage(UserDTO dto) {
		return mapper.mypage(dto);
	}

	@Override
	public void updatePw(UserDTO dto) {
		
		mapper.updatePw(dto);
	}


	

	


	
}
