package com.youngtvjobs.ycc.course;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CourseController {
	
	@Autowired
	CourseService courseService;

	@RequestMapping("/course/courseinfo")
	public String courseinfo() {
		return "/course/courseinfo";
	}
	
	@RequestMapping("/course/schedule")
	public String courseSchedule() {
		return "/course/courseSchedule";
	}

	@RequestMapping("/course/regcomplete")
	public String courseRegComplete() {
		return "/course/courseRegComplete";
	}
	
	@RequestMapping("/course/detail")
	public String coursedetail() {
		return "/course/coursedetail";
	}
	
	@GetMapping("/course/search")
	public String courseSearch(SearchItem sc, Model m, HttpServletRequest request) {
		if(!logincheck(request)) 
			return "redirect:/login?toURL="+request.getRequestURL();
		try {
			int totalCnt = courseService.getsearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			CourseDto courseDto = new CourseDto();
			
			List<CourseDto> list = courseService.getsearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
			System.out.println(list.get(0).toString());
			System.out.println(courseDto.toString());
			System.out.println(sc.toString());
			System.out.println(sc.getQueryString());
			                       
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/course/courseSearch";
	}
	
	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}
}