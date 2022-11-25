package com.youngtvjobs.ycc.search;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.youngtvjobs.ycc.club.ClubDto;
import com.youngtvjobs.ycc.course.CourseDto;
import com.youngtvjobs.ycc.search.PageResolver;
import com.youngtvjobs.ycc.search.SearchItem;

@Controller
public class SearchController {

	@Autowired
	SearchService searchService;
	BoardDto boardDto;

	@RequestMapping("/search")
	public String searchPage(SearchItem sc, BoardDto boardDto, Model m, HttpServletRequest req) {

		try {
			String keyword = req.getParameter("keyword");
			String article_board_type = req.getParameter("type");
			String type = req.getParameter("type");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyword", keyword);
			map.put("article_board_type", article_board_type);
			map.put("type", type);
			
			int totalCnt = searchService.getSearchResultCnt(map);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);
			
			sc.setPageSize(5);
	
			List<BoardDto> noticeList = searchService.getNoticePage(sc);
			m.addAttribute("noticeList", noticeList);

			List<BoardDto> eventList = searchService.getEventPage(sc);
			m.addAttribute("eventList", eventList);

			List<ClubDto> clubList = searchService.getClubPage(sc);
			m.addAttribute("clubList", clubList);
			
			List<CourseDto> courseList = searchService.getCoursePage(sc);
			m.addAttribute("courseList", courseList);
			
			/*
			 * List<BoardDto> list = searchService.getSearchResultPage(sc);
			 * m.addAttribute("list", list);
			 */
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "search/search";
	}

	@RequestMapping("/search/all")
	public String searchAll(SearchItem sc, BoardDto boardDto, Model m, HttpServletRequest req) {

		try {
			
			String keyword = req.getParameter("keyword");
			String article_board_type = req.getParameter("type");
			String type = req.getParameter("type");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyword", keyword);
			map.put("article_board_type", article_board_type);
			map.put("type", type);
			
			int totalCnt = searchService.getSearchResultCnt(map);
			m.addAttribute("totalCnt", totalCnt);
			
			System.out.println(totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);
			
			List<BoardDto> noticeList = searchService.getNoticePage(sc);
			m.addAttribute("noticeList", noticeList);

			List<BoardDto> eventList = searchService.getEventPage(sc);
			m.addAttribute("eventList", eventList);
			
			List<ClubDto> clubList = searchService.getClubPage(sc);
			m.addAttribute("clubList", clubList);
			
			List<CourseDto> courseList = searchService.getCoursePage(sc);
			m.addAttribute("courseList", courseList);
			

			 
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
