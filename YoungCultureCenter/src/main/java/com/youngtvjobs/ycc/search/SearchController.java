package com.youngtvjobs.ycc.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
				m.addAttribute("type", article_board_type);
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
		public String searchAll(String article_board_type, Model m) {
			
			try {

				List<BoardDto> noticeList = searchService.getNoticePage();
				m.addAttribute("noticeList", noticeList);
				
				List<BoardDto> eventList = searchService.getEventPage();
				m.addAttribute("eventList", eventList);
				
				List<BoardDto> allList = searchService.getAllPage();
				m.addAttribute("allList", allList);

				List<BoardDto> moreList = searchService.morePage(article_board_type);
				m.addAttribute("type", article_board_type);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//			PageResolver pageResolver = new PageResolver(totalCnt, sc);
//			m.addAttribute("pr", pageResolver);

			
			return "search/all";
		}

		

}
