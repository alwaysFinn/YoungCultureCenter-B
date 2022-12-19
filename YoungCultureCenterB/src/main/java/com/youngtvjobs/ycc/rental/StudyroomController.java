package com.youngtvjobs.ycc.rental;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StudyroomController {

	@Autowired
	StudyroomService studyroomService;

	// 독서실 페이지로 이동했을 때 조건이 지난 부분은 삭제되고, 그 결과를 받아오는 get
	@GetMapping("/rental/studyroom")
	public String studyRoom(HttpServletRequest request, Model m) throws Exception {

		if (!logincheck(request))
			return "redirect:/login?toURL=" + request.getRequestURL();

		try {
			List<StudyroomDto> list = studyroomService.sroomFix();
			m.addAttribute("list", list);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return "rental/studyRoom";
	}

	// 독서실 페이지에서 예약을 진행했을 때 insert와 update를 진행하는 post
	@PostMapping("/rental/studyroom")
	public String studyRoom(HttpServletRequest request, HttpSession session, String sroom_rental_etime,
			Integer sroom_seat_id) throws Exception {

		try {
			System.out.println("종료 시간 : " + sroom_rental_etime);
			System.out.println("좌석 no : " + sroom_seat_id);
			StudyroomDto studyroomDto = new StudyroomDto();
			String user_id = (String) session.getAttribute("id");

			studyroomDto.setSroom_seat_id(sroom_seat_id);

			
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS"); 
			  Date date_sroom_rental_etime = sdf.parse(sroom_rental_etime);
			  studyroomDto.setSroom_rental_etime(date_sroom_rental_etime);
			 

			  studyroomDto.setUser_id(user_id);
			  
			  if(studyroomService.validationChkRentaled(studyroomDto) == 1) {
				  return "redirect:/error/403";
			  }else {
				  
				  if (studyroomService.sroomInsert(studyroomDto) != 1) {
						throw new Exception("예약오류");
					  } else {
						System.out.println("예약 성공");
					  }
			  }

			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("예약 실패");
		}

		return "/course/courseRegComplete";
	}

	
	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}

}
