package org.movietalk.app;

import java.awt.List;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.movietalk.app.service.BoardRService;
import org.movietalk.app.web.BoardRDTO;
import org.movietalk.app.web.Criteria;
import org.movietalk.app.web.PageDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/review")
public class BoardControllerR {

private final static Logger logger = LoggerFactory.getLogger("BoardControllerR");

	@Autowired
	BoardRService service;
	
	// 검색 조건 목록 설정
		@ModelAttribute("conditionMap")
		public Map<String, String> searchConditionMap(HttpServletRequest req) {
			HttpSession session = req.getSession();
			
			Map<String, String> conditionMap = new HashMap<String, String>(); // param = ConditionMap
			String name = conditionMap.put("제목", "rboard_title"); //key, value
			String writer = conditionMap.put("글쓴이", "rboard_writer");

			
			return conditionMap;
		}
	
		// 게시글 목록 출력
		@RequestMapping(value = "/list.do")
		public ModelAndView list(ModelAndView mnv, BoardRDTO board, Criteria cri, PageDTO pageDto) {
			//페이징
			
			//getListWithPaging
			System.out.println("list: " + cri);
			
			//int pageInt2 = pageDto.getTotal();
			
			//int pageInt = Integer.parseInt(String.valueOf(pageDto.getTotal()));
			int countData = service.getTotalCount(); //총 게시글 수.
			System.out.println("countData>> "+ countData);
			
			
			
			mnv.addObject("list", service.getList(cri));
			
			int countData2 = service.getTotalCount(cri); //페이징+검색어 처리 시 총 게시글 수(매개변수를 담아준 거)
			
//			mnv.addObject("pageMaker", new PageDTO(cri, countData2));
			mnv.addObject("pageMaker", new PageDTO(cri, countData2));
			mnv.addObject("search", service.list(board));
			
			
			System.out.println("service.getList>> " + service.getList(cri));
			
			// Null Check
			if (board.getSearchCondition() == null) // 만약 검색조건에 값이 없으면 "rboard_title"을 담아라.
				board.setSearchCondition("rboard_title");
			if (board.getSearchKeyword() == null)
				board.setSearchKeyword("");

			//java.util.List<BoardRDTO> dto = service.list(board);
			//mnv.addObject("dto", dto);
			mnv.setViewName("boardR/list");
			return mnv;
		}
	
	
	//수정화면 전환
	@RequestMapping(value="/modify.do", method=RequestMethod.GET)
	public ModelAndView modifyPage(ModelAndView mnv, int rboard_seq) {
		System.out.println("modifyPage 컨트롤러");
		BoardRDTO dto = service.detail(rboard_seq);
		mnv.addObject("dto", dto);
		mnv.setViewName("boardR/modify");
		return mnv;
	}
	
	//수정 처리
	@RequestMapping(value="/modify.do", method= RequestMethod.POST)
	public ModelAndView modify(ModelAndView mnv, BoardRDTO dto) {
		
		System.out.println("modify.do POST 컨트롤러");
		service.modify(dto);
		mnv.setViewName("redirect:detail.do?rboard_seq="+dto.getRboard_seq());
		return mnv;
	}
	
	// 상세보기
		@RequestMapping(value = "/detail.do", method = RequestMethod.GET)
		public ModelAndView detail(ModelAndView mnv, int rboard_seq) {
			
			service.hit(rboard_seq); //조회수 증가
			
			BoardRDTO dto = service.detail(rboard_seq);
			java.util.List<BoardRDTO> replyList = service.readReply(rboard_seq);
			
			mnv.addObject("dto", dto);
			mnv.addObject("replyList", replyList); // 댓글조회
			
			mnv.setViewName("boardR/detail");
			
			System.out.println("상세보기의 dto >> " + dto);
			System.out.println("상세보기 컨트롤러의 replyList >> " + replyList);
			return mnv;
		}

	// 삭제
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView mnv, int rboard_seq) {
		service.delete(rboard_seq);
		mnv.setViewName("redirect:list.do");
		return mnv;
	}

	// 글쓰기 페이지 전환
	@RequestMapping(value = "insert.do")
	public ModelAndView insertPage(ModelAndView mnv) {

		mnv.setViewName("boardR/insert");
		return mnv;
	}


	//upload 요청이 들어올 경우 처리할 컨트롤러
//	@MultipartConfig(
//			fileSizeThreshold = 1024*1024*5, //5mb 파일업로드 시 메모리에 저장되는 임시파일 크기 
//			maxFileSize=1024*1024*10, //10mb 업로드할 파일의 최대크기 
//			maxRequestSize = 1024*1024*50, //50mb request시에 최대 크기
//			location = "c:/upload")//파일업로드 시 임시 저장 디렉토리
//	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
//	public class UploadController{
//		private static final String FILE_PATH = "C:/test";//업로드 할 경로
//		
//		public ModelAndView ModelAndView (@RequestParam("uploadFile") MultipartFile file, ModelAndView mnv) throws IllegalStateException, IOException {
//			System.out.println("UploadController 진입 ... ");
//			
//			if(!file.getOriginalFilename().isEmpty()) {
//				file.transferTo(new File(FILE_PATH, file.getOriginalFilename()));
//				mnv.addObject("msg", file);
//			} else {
//				mnv.addObject("msg", file);
//			}
//			mnv.setViewName("redirect: list.do");
//			return mnv;
//		}
//		
//	}
	
	
	// 글쓰기	
	@RequestMapping(value = "/insert.do", method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView mnv, BoardRDTO dto) throws IOException {
		System.out.println("insert.do 컨트롤러");
		
		//파일 업로드 처리
		String fileName = null;
		MultipartFile uploadFile = dto.getUploadFile();
		System.out.println("uploadFile >> " + uploadFile);
		
		if(!uploadFile.isEmpty()) {
			logger.debug("디버그1>> "+fileName);
			fileName = uploadFile.getOriginalFilename();
			//uploadFile.transferTo(new File("C:\\Users\\miyoung\\eclipse-workspace\\kosmo\\semiPrj\\MOVIETALK_2\\src\\main\\webapp\\resources\\img\\" + fileName)); //** 경로 끝에 슬래쉬 잊지말것~
			uploadFile.transferTo(new File("C:\\Users\\jihye\\stud\\spring\\MovieTalk_0916_1531\\src\\main\\webapp\\resources\\file\\" + fileName)); //** 경로 끝에 슬래쉬 잊지말것~
			// 자기 패키지 경로 변경! --> FileDownController.java에서도 변경해야한다!
			//uploadFile.transferTo(new File("C:\\Users\\jihye\\stud\\spring\\MOVIETALK_2_1\\src\\main\\webapp\\resources\\img\\" + fileName));
		}
		
		//System.out.println("insert.do 컨트롤러의 uploadFile >> " + uploadFile);
		dto.setFileName(fileName);  //** 이 과정이 누락되었었음.
		//System.out.println("보드 컨트롤러의 fileName >> " + fileName);
		int rs = service.insert(dto);
		System.out.println("rs >> "+rs);
		
		// post는 별도로 안담아줘도 된다.
		if (rs > 0) {
			mnv.setViewName("redirect: list.do");
		} else
			mnv.setViewName("boardR/insert");

		System.out.println("글쓰기의 dto >> " + dto);
		return mnv;
	}
	
	// 댓글등록
		@RequestMapping(value = "insertRpl.do", method = RequestMethod.POST)
		public ModelAndView insertRpl(ModelAndView mnv, BoardRDTO dto) {
			int rs = service.insertRpl(dto);

			if (rs > 0) {
				System.out.println(">>> " + dto.getRboard_seq());
				// mnv.setViewName("redirect: detail.do?rboard_seq="+
				// dto.getRboard_seq()+"&rreply_seq="+dto.getRreply_seq()); //이것도 가능.
				mnv.setViewName("redirect: detail.do?rboard_seq=" + dto.getRboard_seq());
			} else
				mnv.setViewName("redirect: list.do");

			return mnv;
		}

		// 댓글 수정페이지
		@RequestMapping(value = "modifyRplPage.do")
		public ModelAndView modifyRplPage(ModelAndView mnv, int rreply_seq, int rboard_seq) {
			BoardRDTO board = service.detailRpl(rreply_seq);//댓글
			BoardRDTO board2 = service.detail(rboard_seq);//게시판

			mnv.addObject("dto2", board2);
			mnv.addObject("dto", board);
			// System.out.println("댓글수정페이지 컨트롤러 board>> " + board);
			// System.out.println("댓글수정페이지 컨트롤러 board2>> " + board2);
			mnv.setViewName("boardR/modifyRpl");
			System.out.println("dto2>>> " + board2);
			System.out.println("dto>>> " + board);

			return mnv;
		}

		// 댓글수정
		@RequestMapping(value = "modifyRpl.do", method = RequestMethod.POST)
		public ModelAndView modifyRpl(ModelAndView mnv, BoardRDTO dto) {
			service.modifyRpl(dto);
	//mnv.setViewName("redirect: detail.do?rboard_seq="+ dto.getRboard_seq()+"&rreply_seq="+ dto.getRreply_seq()); // 이것도 가능.
			mnv.setViewName("redirect: detail.do?rboard_seq=" + dto.getRboard_seq());
			return mnv;

		}

		// 댓글삭제
	      @RequestMapping(value = "deleteRpl.do")
	      public ModelAndView deleteRpl(ModelAndView mnv, int rreply_seq, BoardRDTO dto) {
	         service.deleteRpl(rreply_seq);
	         mnv.setViewName("redirect: detail.do?rboard_seq="+ dto.getRboard_seq());
	         return mnv;

	      }
}
