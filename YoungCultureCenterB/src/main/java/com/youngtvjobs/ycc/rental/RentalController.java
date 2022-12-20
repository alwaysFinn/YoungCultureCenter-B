package com.youngtvjobs.ycc.rental;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RentalController {

	@Autowired
	RentalService rentalService;

	// 독서실 페이지로 이동했을 때 조건이 지난 부분은 삭제되고, 그 결과를 받아오는 get
	@GetMapping("/rental/studyroom")
	public String studyRoom(HttpServletRequest request, Model m) throws Exception {
		
		if(!logincheck(request))
			return "redirect:/login?toURL="+request.getRequestURL();
		
		
		
		try {
			  rentalService.sroomClear();
			  
			  RentalDto rentalDtoa = new RentalDto();
			  
			  //예약테이블 현황
			  List<RentalDto> lista = rentalService.sroomYCheck();
			  //studyroom에서 y값을 가지는 것들
			  List<RentalDto> listb = rentalService.sroomRentaledCheck();
				
			  System.out.println("lista : " + lista);
			  System.out.println();
			  System.out.println("listb : " + listb);
			  System.out.println();
			  System.out.println("listb's length : " + listb.size());
			  
			  
			  for(RentalDto b : listb) {
				  boolean isEquals = false;
				  for(RentalDto a : lista) {
					  if(b.equals(a)) isEquals = true;
				  }
				  if(isEquals) {
					  System.out.println("pass");
				  }else {
					  System.out.println(b);
					  rentalService.sroomRentalDelUpdate(b);
				  }
			  }
			  
				/*
				 * for(RentalDto a : listb) { boolean isEquals = false; for(RentalDto b : lista)
				 * { if(a.equals(b)) isEquals = true; } if(isEquals) { System.out.println("패스");
				 * }else { System.out.println(a); rentalService.sroomRentalDelUpdate(a); } }
				 * 
				 */
			List<RentalDto> rentalDto = rentalService.sroomRentalCheck();
			m.addAttribute("rentalDto", rentalDto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "rental/studyRoom";
	}
	
	// 독서실 페이지에서 예약을 진행했을 때 insert와 update를 진행하는 post
	@PostMapping("/rental/studyroom")
	public String studyRoom(HttpServletRequest request, HttpSession session, String sroom_rental_yn, String sroom_rental_etime, Integer sroom_seat_id) throws Exception{
		
		try {
			System.out.println("종료 시간 : " + sroom_rental_etime);
			System.out.println("좌석 no : " + sroom_seat_id);
			RentalDto rentalDto = new RentalDto();
			String customer = (String)session.getAttribute("id");
			
			rentalDto.setSroom_seat_id(sroom_seat_id);
			
			SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
			Date date_sroom_rental_etime = sdf.parse(sroom_rental_etime);
			rentalDto.setSroom_rental_etime(date_sroom_rental_etime);

			
			rentalDto.setUser_id(customer);
			
			//for update(y->n)
			rentalDto.setSroom_rental_yn(sroom_rental_yn);
			System.out.println("rentalDtl : " + rentalDto);
			
			if(rentalService.sroomRental(rentalDto) != 1) {
				throw new Exception("예약 오류");
			}else {
				System.out.println("예약 성공");
			}
			
			if(rentalService.sroomRentalInsUpdate(rentalDto) != 1) {
				throw new Exception("n>y오류");
			}else {
				System.out.println("n>y업데이터 성공");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("예약 실패");
		}
		
		return "/ycc";
	}

	// 대관신청
		@GetMapping("/rental/place")
		// Dto에서 장소들 이름 받아와 selectBox에 출력해주는 메서드
		public String rentalPlace(Model m, HttpServletRequest request, RentalDto rentalDto, HttpSession session) {
			try {
				//String croom_id = request.getParameter("croom_id");
				//String date = request.getParameter("date");
				//System.out.println(croom_id);
				//System.out.println(date);
				
				// 대관 장소 (classroom) 리스트 출력
				List<RentalDto> placelist = rentalService.selectRentalPlace();
				m.addAttribute("placelist", placelist);

				String customer = (String)session.getAttribute("id");
				rentalDto.setUser_id(customer);
				m.addAttribute("customer", customer);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "rental/place";
		}
		
		// 예약 정보 insert해주는 메서드
		@PostMapping("/rental/place.do")
		public String rentalInfoInsert(RentalDto rentalDto, RedirectAttributes rattr, HttpSession session, Model m, 
				HttpServletRequest request, @RequestParam("user_id") String user_id, @RequestParam("date") String date, 
				@RequestParam("croom_id") String croom_id, @RequestParam(value = "timeList", required = false) String timeList) throws Exception {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date prental_de = sdf.parse(date);
			rentalDto.setPrental_de(prental_de);
			
			JSONParser parser = new JSONParser();
			Object timeListObj = parser.parse(timeList);
			JSONObject jsonObj = (JSONObject) timeListObj;
			  
			boolean time1 = Boolean.parseBoolean((String)jsonObj.get("time1"));
			boolean time2 = Boolean.parseBoolean((String)jsonObj.get("time2"));
			boolean time3 = Boolean.parseBoolean((String)jsonObj.get("time3"));
			boolean time4 = Boolean.parseBoolean((String)jsonObj.get("time4"));
			boolean time5 = Boolean.parseBoolean((String)jsonObj.get("time5"));
			boolean time6 = Boolean.parseBoolean((String)jsonObj.get("time6"));
			rentalDto.setTime1(time1);
			rentalDto.setTime2(time2);
			rentalDto.setTime3(time3);
			rentalDto.setTime4(time4);
			rentalDto.setTime5(time5);
			rentalDto.setTime6(time6);
			
			rentalService.insertInfo(rentalDto);
		
			return null;
		}
		
		
		@ResponseBody
		@GetMapping("/rental/place.send")
		// 장소, 날짜 선택 후 조회하기 눌렀을 때 prental_info 데이터를 불러와서 선택한 장소, 날짜의 예약 가능한 시간대만 출력해주는 메서드
		public Map<String, Object> rentalSelect(Model m, @RequestParam("croom_id") String croom_id, 
				@RequestParam(value = "date", required = false) String date, HttpServletRequest req, RentalDto dto) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date prental_de = sdf.parse(date);
			
			List<RentalDto> infoList = rentalService.selectInfo(croom_id, prental_de);
			m.addAttribute("infoList", infoList);
			map.put("infoList", infoList);
			
			return map;
		}

	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}

}
