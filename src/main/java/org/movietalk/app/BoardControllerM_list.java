package org.movietalk.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.movietalk.app.service.BoardMService;
import org.movietalk.app.web.BoardMDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class BoardControllerM_list {

	@Autowired
	BoardMService service;

	@RequestMapping(value = "/")
	public ModelAndView m_list(BoardMDTO mdto) {
		ModelAndView mnv = new ModelAndView();
		System.out.println("GET - list.do & search");

//		//null check
//		if(mdto.getSearchCondition()==null)
//			mdto.setSearchCondition("title");		
//		if(mdto.getSearchKeyword()==null)
//			mdto.setSearchCondition("");
		
		List<BoardMDTO> m_list = service.m_list(mdto);
//		System.out.println(m_list);
		// map�뿉 �븳踰덉뿉 ���옣
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_list", m_list);
		map.put("mdto", mdto);
//		map.put("searchKeyword", searchKeyword);
//		map.put("searchCondition", searchCondition);

		// map�쓣 modelAndView�뿉 ���옣
//		System.out.println("map>>"+map);
		mnv.addObject("map", map);
		
		mnv.setViewName("home");

		return mnv;

	}

}
