package com.youngtvjobs.ycc.rental;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LockerController {
	
	@Autowired
	LockerService lockerService;
	
	// 사물함 예
	@PostMapping("/rental/locker/reservation")
	public String lockerReservation(LockerDto lockerDto, HttpSession session, RedirectAttributes rattr) {
		String user_id = (String) session.getAttribute("id");
		lockerDto.setUser_id(user_id);
		
		try {
			// 중복 예약 방지용 유저별 현재 예약 개수
			int rsvCnt = lockerService.getReservationCnt(user_id);
			
			// 예약 개수가 0이 아니면 예약 불가
			if(rsvCnt == 0) {
				// 예약메서드
				lockerService.lockerReservation(lockerDto);
				lockerService.getReservationStat(user_id);
				return "redirect:/rental/locker?locker_location_id=1";
			} else {
				rattr.addFlashAttribute("msg", "NO_DUPLICATE");
				lockerService.getReservationStat(user_id);
				return "redirect:/rental/locker?locker_location_id=1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "rental/locker";
	}
	
	// 사물함 신청 페이지
	@GetMapping("/rental/locker")
	public String locker(LockerDto lockerDto, HttpSession session, Model m) {
		String user_id = (String) session.getAttribute("id");
		LocalDate nowdate = LocalDate.now();
		m.addAttribute("nowdate", nowdate);
		LocalDate afterMonth = LocalDate.now().plusDays(30);
		m.addAttribute("afterMonth", afterMonth);
		
		try {
			// 사물함 장소별 번호 불러오기
			List<LockerDto>list = lockerService.getLockerList(lockerDto);
			m.addAttribute("list", list);
			
			// 사물함 장소 불러오기
			List<LockerDto>locList = lockerService.getLockerLocation();
			m.addAttribute("locList", locList);
			
			// 예약된 사물함 불러오기
			List<LockerDto>rsvList = lockerService.getLockerRsvList(lockerDto);
			m.addAttribute("rsvList", rsvList);
			
			if(lockerDto.getLocker_start_date() != null) {
				LocalDate startDate = LocalDate.parse(lockerDto.getLocker_start_date());
				LocalDate endDate = LocalDate.parse(lockerDto.getLocker_end_date());
				
				int period = (int) startDate.until(endDate, ChronoUnit.DAYS);
				
				m.addAttribute("period", period);
			}
			
			// 나의 예약 현황 불러오기
			List<LockerDto>myRsvStat = lockerService.getReservationStat(user_id);
			m.addAttribute("myRsvStat", myRsvStat);
			System.out.println(myRsvStat);
			int myRsvCnt = lockerService.getReservationCnt(user_id);
			m.addAttribute("myRsvCnt", myRsvCnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "rental/locker";
	}
	
	// 사물함 신청 페이지
		@PostMapping("/rental/locker")
		public String lockerpost(LockerDto lockerDto, HttpSession session, Model m) {
			String user_id = (String) session.getAttribute("id");
			LocalDate nowdate = LocalDate.now();
			m.addAttribute("nowdate", nowdate);
			LocalDate afterMonth = LocalDate.now().plusDays(30);
			m.addAttribute("afterMonth", afterMonth);
			
			try {
				// 사물함 장소별 번호 불러오기
				List<LockerDto>list = lockerService.getLockerList(lockerDto);
				m.addAttribute("list", list);
				
				// 사물함 장소 불러오기
				List<LockerDto>locList = lockerService.getLockerLocation();
				m.addAttribute("locList", locList);
				
				// 예약된 사물함 불러오기
				List<LockerDto>rsvList = lockerService.getLockerRsvList(lockerDto);
				m.addAttribute("rsvList", rsvList);
				
				if(lockerDto.getLocker_start_date() != null) {
					LocalDate startDate = LocalDate.parse(lockerDto.getLocker_start_date());
					LocalDate endDate = LocalDate.parse(lockerDto.getLocker_end_date());
					
					int period = (int) startDate.until(endDate, ChronoUnit.DAYS);
					
					m.addAttribute("period", period);
				}
				
				// 나의 예약 현황 불러오기
				List<LockerDto>myRsvStat = lockerService.getReservationStat(user_id);
				m.addAttribute("myRsvStat", myRsvStat);
				System.out.println(myRsvStat);
				int myRsvCnt = lockerService.getReservationCnt(user_id);
				m.addAttribute("myRsvCnt", myRsvCnt);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return "rental/locker";
		}
	
	// 사물함 안내
	@GetMapping("/rental/locker/info")
	public String lockerInfo() { return "rental/lockerinfo"; }
}
