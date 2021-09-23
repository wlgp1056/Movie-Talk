package org.movietalk.app;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.movietalk.app.service.BoardMService;
import org.movietalk.app.service.UserService;
import org.movietalk.app.web.BoardMDTO;
import org.movietalk.app.web.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	UserService service;
	
	@Autowired
	BoardMService mservice;
	
	
	// 회원가입
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String joinPage() {
		return "user/join";
	}
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String joinProcess(ModelAndView mnv, UserDTO dto,HttpServletResponse resp) throws IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = resp.getWriter();
		
		service.join(dto);
		System.out.println(dto);
		
		pw.append("<script>");
		//pw.append("alert('회원가입 성공!');");
		pw.append("alert('회원가입 성공!');location.href='login.do';");
		pw.append("</script>");
		return null;
	}
	
	
	// 회원 확인(아이디중복)
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public int idCheck(HttpServletRequest req) throws Exception {
		
		String user_id = req.getParameter("user_id");
		System.out.println(user_id);
		UserDTO idCheck = service.idCheck(user_id);
		
		int result = 0;
		
		if(idCheck != null) {
			result = 1;
		} 
			 
		 return result;
	}
	
	// 회원 확인(이름 중복)
	@ResponseBody
	@RequestMapping(value = "/nameCheck.do", method = RequestMethod.POST)
	public int nameCheck(HttpServletRequest req) throws Exception {

		String user_name = req.getParameter("user_name");
		System.out.println(user_name);
		UserDTO nameCheck = service.nameCheck(user_name);

		int result = 0;

		if (nameCheck != null) {
			result = 1;
		}

		return result;
	}
	
	// 아이디 찾기
	@RequestMapping(value="/findId.do")
	public ModelAndView findIdPage(ModelAndView mav) {
		mav.setViewName("user/findid");
		return mav;
	}
	@RequestMapping(value="/findId.do", method = RequestMethod.POST)
	public ModelAndView findIdProcess(ModelAndView mav, UserDTO dto) {
		UserDTO user = service.findId(dto);
		
		if (user == null) { // 없으면
			mav.addObject("check", 0);
			mav.setViewName("user/findid");
		}else { // 있으면
			mav.addObject("check", 1);
			mav.addObject("user_id", user.getUser_id());
			mav.setViewName("user/findidR");
		}
		return mav;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/findPw.do")
	public ModelAndView findPwPage(ModelAndView mav) {
		mav.setViewName("user/findpw");
		return mav;
	}
	@RequestMapping(value="/findPw.do", method = RequestMethod.POST)
	public ModelAndView findPwProcess(ModelAndView mav, UserDTO dto) {
		UserDTO user = service.findPw(dto);
		
		if (user == null) { // 없으면
			mav.addObject("check", 0);
			mav.setViewName("user/findpw");
		}else { // 있으면
			mav.addObject("check", 1);
			mav.addObject("user_pw", user.getUser_pw());
			mav.setViewName("user/findpwR");
		}
		return mav;
	}
	
	
	// 로그인 
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginPage() {
		System.out.println("로그인 페이지로 이동");
		return "user/login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(ModelAndView mnv, UserDTO dto, HttpSession session) {
		System.out.println("dto ===> " + dto); // 폼으로 입력받은 정보
		System.out.println("session ===> " + session); // 세션 정보

		int result = service.loginCheck(dto, session); //서비스의 로그인체크기
		System.out.println("dto ===> " + dto); // 폼으로 입력받은 정보
		if(result==0) {
			System.out.println("true인데 일반유저임");
			System.out.println(dto.getUser_name());
			session.setAttribute("id", dto.getUser_id());
			session.setAttribute("name", dto.getUser_name());
			//session.setAttribute("name", dto.getUser_name());
			mnv.setViewName("redirect:../");
			return mnv;
		} else if (result==1){
			System.out.println("true인데 관리자임");
			session.setAttribute("id", dto.getUser_id());
			session.setAttribute("name", dto.getUser_name());
			mnv.setViewName("redirect:list.do");
			return mnv;
		} else {
			System.out.println("fail이 확실함다");
			mnv.addObject("msg", "fail");
			mnv.setViewName("user/login");
			return mnv;
		}
	}

	// 유저 목록
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public ModelAndView userList(ModelAndView mnv, UserDTO dto, BoardMDTO mdto) {
		System.out.println("유저 목록 불러옵니다....");
	    List<BoardMDTO> m_list = mservice.m_list(mdto);
	      mnv.addObject("m_list", m_list);
		List<UserDTO> list = service.userList(dto);
		System.out.println("list는 >> " + list);
	
		mnv.addObject("list", list);
		mnv.setViewName("user/list");
		return mnv;
	}

	// 유저 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView userDelete(ModelAndView mnv, UserDTO dto) {
		System.out.println("유저 삭제 합니다...");
		service.userDelete(dto);
		mnv.setViewName("redirect:list.do");
		return mnv;
	}

	// 로그아웃
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		System.out.println("로그아웃됨");
		session.invalidate();
		return "redirect:../";
	}
	
	// 유저 목록
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView mypage(ModelAndView mnv, UserDTO dto) {
		
		UserDTO user = service.mypage(dto);
		mnv.addObject("user", user);
		mnv.setViewName("user/mypage");
		return mnv;
	}

	// 탈퇴
	@RequestMapping(value = "/user_delete.do", method = RequestMethod.GET)
	public ModelAndView userDelete2(ModelAndView mnv, UserDTO dto) {
		System.out.println("탈퇴 합니다...");
		service.userDelete(dto);
		mnv.setViewName("redirect:logout.do");
		return mnv;
	}
	
	// 비밀번호변경
	@RequestMapping(value = "/update.do")
	public ModelAndView updatePage(ModelAndView mnv, UserDTO dto) {
		service.updatePw(dto);
		mnv.setViewName("user/update");
		return mnv;
	}


}
	
