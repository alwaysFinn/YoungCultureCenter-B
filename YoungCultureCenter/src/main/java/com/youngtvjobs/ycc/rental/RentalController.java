package com.youngtvjobs.ycc.rental;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController{

	@Autowired
	RentalDao rentalDao;


	//독서실 대여
	@RequestMapping("/rental/studyroom")
	public String studyRoom()
	{
		return "rental/studyRoom";
	}
	//사물함 안내
	@RequestMapping("/rental/locker")
	public String lockerinfo()
	{
		return "rental/lockerinfo";
	}
	//사물함 신청
	@RequestMapping("/rental/locker/reservation")
	public String locker()
	{
		return"rental/locker";
	}
	
	//대관신청
	@GetMapping("/rental/place")
	public String rentalPlace(Model m, HttpServletRequest request)
	{
		//로그인 확인
		if(!logincheck(request)) 
			return "redirect:/login?toURL="+request.getRequestURL();
		
		//dto에서 장소 이름들 받아오는 controller
		try {
			List<RentalDto> placelist = rentalDao.selectRentalPlace();
			m.addAttribute("placelist", placelist);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "rental/place";
	}
	
	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}
	
}
