package org.movietalk.app;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.movietalk.app.service.BoardMService;
import org.movietalk.app.web.BoardMDTO;
import org.movietalk.app.web.ReplyMDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class BoardControllerM_detail {

	@Autowired
	BoardMService service;

	@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
	public ModelAndView movieDetail(ModelAndView mnv, BoardMDTO mdto, ReplyMDTO rmdto) {
		System.out.println("DETAIL - list ");
		//조회수
		service.hit(mdto);
		// 영화정보
		BoardMDTO mdto_detail = service.getMdto(mdto);

		// 댓글정보
		List<ReplyMDTO> reply_list = service.reply_list(rmdto);

		// 평점계산
		service.movie_grade(mdto);
//		System.out.println("grade"+mdto.getMovie_grade());
		
		
		// 댓글
		mnv.addObject("mdto", mdto_detail);
		mnv.addObject("reply_list", reply_list);
		mnv.setViewName("boardM/detail");
		return mnv;
	}

	// 영화게시판 > 입력(insert) GET
	@RequestMapping(value = "insert.do", method = RequestMethod.GET)
	public ModelAndView movieInsert(ModelAndView mnv) {
		mnv.setViewName("boardM/insert");
		return mnv;
	}

	// 영화게시판 > 입력(insert) POST
	@RequestMapping(value = "insert.do", method = RequestMethod.POST)
	public ModelAndView movieInsert(ModelAndView mnv, BoardMDTO mdto) throws IllegalStateException, IOException {
		// =-=--------------------------------------

		// 파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = mdto.getUploadFile();
		System.out.println("uploadFile >> " + uploadFile);

		if (!uploadFile.isEmpty()) {
			fileName = uploadFile.getOriginalFilename();
			// uploadFile.transferTo(new
			// File("C:\\Users\\miyoung\\eclipse-workspace\\kosmo\\semiPrj\\MOVIETALK_2\\src\\main\\webapp\\resources\\img\\"
			// + fileName)); //** 경로 끝에 슬래쉬 잊지말것~
			 uploadFile.transferTo(new File("C:\\Users\\jihye\\stud\\spring\\MovieTalk_0916_1531\\src\\main\\webapp\\resources\\file\\" + fileName)); //** 경로 끝에 슬래쉬 잊지말것~
			// 자기 패키지 경로 변경! --> FileDownController.java에서도 변경해야한다!
		}

		// System.out.println("insert.do 컨트롤러의 uploadFile >> " + uploadFile);
		mdto.setFileName(fileName); // ** 이 과정이 누락되었었음.
		System.out.println("fileName >>> " + fileName);
//		System.out.println("보드 컨트롤러의 fileName >> " + fileName);

		// ---------------------------------------
		service.insert(mdto);
		mnv.setViewName("redirect:/user/list.do");
		return mnv;
	}

	// 영화게시판 > 디테일 > 수정 (Modify) GET
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)
	public ModelAndView movieModifyP(ModelAndView mnv, BoardMDTO mdto) {
		BoardMDTO mdto_modify = service.getMdto(mdto);
		mnv.addObject("mdto", mdto_modify);
		mnv.setViewName("boardM/modify");
		return mnv;
	}

	// 영화게시판 > 디테일 > 수정 (Modify) POST
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public ModelAndView movieModifyG(ModelAndView mnv, BoardMDTO mdto) {
		service.modify(mdto);
		mnv.setViewName("redirect:detail.do?board_seq=" + mdto.getBoard_seq() + "&m_seq=" + mdto.getBoard_seq());
		return mnv;
	}

	// 영화게시판 > 디테일 > 영화 삭제
	@RequestMapping(value = "delete.do", method = RequestMethod.GET)
	public ModelAndView movieDelete(ModelAndView mnv, BoardMDTO mdto) {
		service.delete(mdto);
		mnv.setViewName("redirect:/");
		return mnv;
	}

	// 영화게시판 > 디테일 > 댓글 입력 POST
	@RequestMapping(value = "/insertReply.do", method = RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mnv, ReplyMDTO rmdto) {
		System.out.println("insertReply.do 실행");
		service.insert_reply(rmdto);
		System.out.println(">>>>>>>" + rmdto);

		mnv.setViewName("redirect:detail.do?board_seq=" + rmdto.getM_seq() + "&m_seq=" + rmdto.getM_seq());
		return mnv;
	}

	@RequestMapping(value = "replyWrite.do", method = RequestMethod.POST)
	public ModelAndView replyWrite(ModelAndView mnv, ReplyMDTO rmdto) {
		System.out.println(".>>>>" + rmdto);
		service.insert_reply(rmdto);
		List<ReplyMDTO> replyListJSON = service.replyListJSON(rmdto);
		System.out.println("제이슨에서뽑은리스트" + replyListJSON);

		mnv.addObject("replyListJSON", replyListJSON);
		mnv.setViewName("redirect:detail.do?board_seq=" + rmdto.getM_seq() + "&m_seq=" + rmdto.getM_seq());
		return mnv;
	}

	// 댓글 리스트
	@RequestMapping(value = "replyList.do", method = RequestMethod.GET)
	public ModelAndView replyList(ModelAndView mnv, ReplyMDTO rmdto) {
		System.out.println(">>>>>test>>>" + rmdto);
		List<ReplyMDTO> replyListJSON = service.replyListJSON(rmdto);
		System.out.println(replyListJSON);
		mnv.addObject("replyListJSON", replyListJSON);
		// mnv.setViewName("redirect:detail.do?board_seq="+rmdto.getM_seq()+"&m_seq="+rmdto.getM_seq());

		return mnv;
	}
	//댓글 삭제
	@RequestMapping(value = "deleteReply.do", method = RequestMethod.GET)
	public ModelAndView deleteReply(ModelAndView mnv, ReplyMDTO rmdto) {
		System.out.println("삭제할 rmdto >>>"+rmdto);
		service.deleteReply(rmdto);
		mnv.setViewName("redirect:detail.do?board_seq="+rmdto.getM_seq()+"&m_seq="+rmdto.getM_seq());
		return mnv;
	}
	
	//댓글 수정
	@RequestMapping(value = "modifyReply.do",method = RequestMethod.POST)
	public ModelAndView modifyRplyG(ModelAndView mnv, ReplyMDTO rmdto) {
		System.out.println("수정할 rmdto>>" + rmdto);
		service.modifyReply(rmdto);
		System.out.println("디비 수정 완료");
		mnv.setViewName("redirect:detail.do?board_seq="+rmdto.getM_seq()+"&m_seq="+rmdto.getM_seq());
		return mnv;
	}
	



}
