package com.youngtvjobs.ycc.course;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@GetMapping("/payment")
	public String IntegratedPayment() {
		return "/integratedPayment";
	}
	
	@GetMapping("/course/regcomplete")
	public String courseRegComplete(Integer course_id, AttendDto attendDto, Model m, HttpSession session, HttpServletRequest request) {
		String user_id = (String) session.getAttribute("id"); // 세션에 저장되어 있는 id 불러오기
		Date nowdate = new Date(); // 오늘날짜 객체 생성 
		
		attendDto.setUser_id(user_id);
		attendDto.setCourse_id(course_id);
		
//		System.out.println(nowdate);
		System.out.println("attendDto" + attendDto);
		
		try {
			//int name = courseService.readAttendTable(course_id, user_id);
			m.addAttribute("attendDto", attendDto);
			
			// 등록강좌 상세불러오기
			CourseDto courseDto = courseService.readCourseDetail(course_id);
			m.addAttribute("courseDto", courseDto);
			
//			System.out.println(courseDto.toString());
//			System.out.println(courseDto.getCourse_reg_start_date());
//			System.out.println(courseDto.getCourse_reg_start_date().after(nowdate));
			
			// 수강신청
			// 중복 방지
			if(courseService.attendDuplicateCheck(course_id, user_id) == 0) { 
				// 강좌 상태 확인
				// 접수기간
				// reg_start_date는 nowdate보다 이전이다(reg_start_date < nowdate) && reg_end_date는 nowdate보다 이후이다(nowdate < reg_end_date)
				if((courseDto.getCourse_reg_start_date().before(nowdate)==true && courseDto.getCourse_reg_end_date().after(nowdate) == true)
						|| courseDto.getCourse_reg_start_date().equals(nowdate) == true) { // 논리 오류..
				  courseService.attendInsert(attendDto); // 수강신청 시 attend에 insert & 신청인원 1명 증가
				  // 신청인원을 총정원과 비교 
				} else if (courseDto.getCourse_applicants() >= courseDto.getCroom_mpop()) {
					System.out.println("정원이 마감되었습니다.");
					
					return "redirect:/course/search";
				} else {
					System.out.println("접수기간이 아닙니다.");
					
					return "redirect:/course/search";
				}
			} else {
				System.out.println("중복 신청은 할 수 없습니다.");
				
				return "redirect:/course/search";
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:/course/detail?toURL="+request.getRequestURL();
		}
		
		return "/course/courseRegComplete";
	}
	
	@PostMapping("/course/remove")
	public String courseRemove(Integer course_id, Integer page, Integer pageSize,
								RedirectAttributes rattr , HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		String msg = "DEL_OK";
		
		try {
			if(courseService.courseRemove(course_id, user_id) != 1)
				throw new Exception("Delete failed.");
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		
		return "redirect:/course/search";
	}
	
	@PostMapping("/course/write")
	public String courseWrite(CourseDto courseDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		courseDto.setUser_id(user_id);
		
		try {
			if(courseService.courseWrite(courseDto) != 1)
				throw new Exception("Write failed");
			
			rattr.addFlashAttribute("msg", "WRT_OK");
			
			return "redirect:/course/search";
		} catch (Exception e) {
			e.printStackTrace();
			
			m.addAttribute("mode", "new");
			m.addAttribute("courseDto", courseDto);
			m.addAttribute("msg", "WRT_ERR");
			
			return "/course/coursedetail";
		}
		
	}
	
	@GetMapping("/course/write")
	public String courseWrite(Model m, HttpServletRequest request) {
		if(!logincheck(request)) 
			return "redirect:/login?toURL="+request.getRequestURL();
		
		m.addAttribute("mode", "new");
		
		return "/course/coursedetail"; // board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
	}
	
	@GetMapping("/course/detail")
	public String coursedetail(CourseSearchItem sc, Integer course_id, Model m, HttpServletRequest request) {
		System.out.println("redirect:/login?toURL="+request.getRequestURL());
		
		if(!logincheck(request)) 
			return "redirect:/login?toURL="+request.getRequestURL();
		
		try {
			CourseDto courseDto = courseService.readCourseDetail(course_id);
			m.addAttribute(courseDto);
			
			// 수강신청완료페이지에 queryString을 넘겨주기 위해서
			int totalCnt = courseService.getsearchResultCnt(sc);
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
			m.addAttribute("pr", pageResolver);
			
			// 리뷰 개수가 0개일 경우 발생하는 NullPointerException으로 인해 추가
			if(courseDto.getReview_cnt() == 0) {
				double rating = 0;
				m.addAttribute("rating", rating);
			} else {
				System.out.println("리뷰개수="+courseDto.getReview_cnt());
				double rating = courseService.avgReviewRating(course_id);
				m.addAttribute("rating", rating);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			return "redirect:/course/search";
		}
		
		return "/course/coursedetail";
	}
	
	
	@GetMapping("/course/search")
	public String courseSearch(CourseSearchItem sc, Model m, HttpServletRequest request) {
//		if(!logincheck(request)) 
//			return "redirect:/login?toURL="+request.getRequestURL();
		
		try {
			int totalCnt = courseService.getsearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
//			CourseDto courseDto = new CourseDto();
			
			List<CourseDto> list = courseService.getsearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
			//System.out.println(list.get(0).toString());
//			System.out.println(courseDto.toString());
			//System.out.println(sc.toString());
			//System.out.println(sc.getQueryString());
			                       
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