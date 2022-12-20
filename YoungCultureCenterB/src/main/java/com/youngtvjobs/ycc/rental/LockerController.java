package com.youngtvjobs.ycc.rental;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LockerController {
	
	@Autowired
	LockerService lockerService;
	
	@PostMapping("/rental/locker/reservation")
	public String lockerReservation(LockerDto lockerDto, HttpSession session) {
		String user_id = (String) session.getAttribute("id");
		lockerDto.setUser_id(user_id);
		
		try {
			lockerService.lockerReservation(lockerDto);
			System.out.println("lockerDto: "+ lockerDto);
			return "redirect:/rental/locker?locker_location_id=1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "rental/locker";
	}
	
	// 사물함 신청 페이지
	@GetMapping("/rental/locker")
	public String locker(LockerDto lockerDto, HttpSession session, Model m) {
		String user_id = (String) session.getAttribute("id");
		
		try {
			List<LockerDto>list = lockerService.getLockerList(lockerDto);
			List<LockerDto>locList = lockerService.getLockerLocation();
			List<LockerDto>rsvList = lockerService.getLockerRsvList(lockerDto.getLocker_location_id());
			List<LockerDto>rsvStat = lockerService.getReservationStat(user_id);
			m.addAttribute("list", list);
			m.addAttribute("locList", locList);
			m.addAttribute("rsvList", rsvList);
			m.addAttribute("rsvStat", rsvStat);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "rental/locker";
	}
	
	// 사물함 안내
	@GetMapping("/rental/locker/info")
	public String lockerInfo() { return "rental/lockerinfo"; }
}
