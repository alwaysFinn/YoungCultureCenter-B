package com.youngtvjobs.ycc.search;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String searchPage(SearchItem sc, Model m, ModelAndView mav) {

		try {

			sc.setPageSize(5);

			int totalCnt = searchService.getSearchAllResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);

			List<BoardDto> noticeList = searchService.getNoticePage(sc);
			m.addAttribute("noticeList", noticeList);
			
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
	        for (BoardDto dto : noticeList) {
	            map.add("article_title", dto.getArticle_title());
	        }
	        m.addAttribute(map);
	        
//	        System.out.println(map.get("article_title"));
	        
	        JSONObject jsonObject = new JSONObject(map);
	        System.out.println(jsonObject);
	        
			List<BoardDto> eventList = searchService.getEventPage(sc);
			m.addAttribute("eventList", eventList);

			List<ClubDto> clubList = searchService.getClubPage(sc);
			m.addAttribute("clubList", clubList);
			
			List<CourseDto> courseList = searchService.getCoursePage(sc);
			m.addAttribute("courseList", courseList);
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "search/search";
	}

	@RequestMapping("/search/all")
	public String searchAll(SearchItem sc, BoardDto boardDto, Integer article_id, Model m, HttpServletRequest req) {

		try {
			
			// SearchItem 의 keyword, type과 BoardDto의 article_board_type을 Map에 담음 (다른 클래스에 있는 값들을 Map을 통해 한 곳에 담음)
			// 여기서 정의한 Map을 mapper의 searchResultCnt의 파라미터값으로 사용
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

		return "search/all";
	}
	
	  @ResponseBody
	  @GetMapping(value = "/search/autocomplete", produces="application/json;charset=UTF-8") 
	  public String autocomplete(Model m, SearchItem sc) throws Exception {
			List<BoardDto> noticeList = null;
			noticeList = searchService.getNoticePage(sc);
			MultiValueMap<String, Object> map = new LinkedMultiValueMap<>();
	        for (BoardDto dto : noticeList) {
	            map.add("article_title", dto.getArticle_title());
	        }
	        JSONObject jsonObject = new JSONObject(map);
	        String data = jsonObject.toString();
	  
	  return data; 
	  
	  }
	 

}
