package com.youngtvjobs.ycc.rental;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("/rental/place")
	public String rentalPlace(Model m)
	{
		try {
			List<RentalDto> placelist = rentalDao.selectRentalPlace();
			m.addAttribute("placelist", placelist);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "rental/place";
	}
	
}
