package com.youngtvjobs.ycc.search;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.youngtvjobs.ycc.board.BoardDto;
import com.youngtvjobs.ycc.course.PageResolver;
import com.youngtvjobs.ycc.search.SearchItem;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	BoardDto boardDto;

	@RequestMapping("/search")
	public String searchPage(String article_board_type, Model m) {

		try {

			List<BoardDto> noticeList = searchService.getNoticePage();
			m.addAttribute("noticeList", noticeList);

			List<BoardDto> eventList = searchService.getEventPage();
			m.addAttribute("eventList", eventList);

			List<BoardDto> allList = searchService.getAllPage();
			m.addAttribute("allList", allList);
			
			List<BoardDto> moreList = searchService.morePage(article_board_type);
			m.addAttribute("moreList", moreList);

//				int totalCnt = searchService.getNoticePageCnt();
//				m.addAttribute("totalCnt", totalCnt);
//				
//				PageResolver pageResolver = new PageResolver(totalCnt, sc);
//				m.addAttribute("pr", pageResolver);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "search/search";
	}

	@RequestMapping("/search/all")
	public String searchAll(Model m) {

		try {
			
			List<BoardDto> noticeListAll = searchService.getNoticePageAll();
			m.addAttribute("noticeListAll", noticeListAll);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}

//			PageResolver pageResolver = new PageResolver(totalCnt, sc);
//			m.addAttribute("pr", pageResolver);

		return "search/all";
	}

	@GetMapping("/search/all1")			// /comments?bno=411	GET
	@ResponseBody
	//public List<CommentDto> list(Integer bno) {
	public ResponseEntity<List<BoardDto>> list(String article_board_type) {		//List<CommentDto>를 담아와서
		List<BoardDto> list = null;
		
		try {
			list = searchService.morePage(article_board_type);
			
			System.out.println("list = " + list);
			return new ResponseEntity<List<BoardDto>>(list, HttpStatus.OK);		//200
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<BoardDto>>(HttpStatus.BAD_REQUEST);	//400
		}
		
//		return list;
	}

}
