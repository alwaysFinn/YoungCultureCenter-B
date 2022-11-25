package com.youngtvjobs.ycc.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class RentalController{

	@Autowired
	RentalService rentalService;


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
	// Dto에서 장소들 이름 받아와 selectBox에 출력해주는 메서드 //애초에 이부분을 하나의 mapping으로 정의해야하는 필요성을 잘 모르겠음

	public String rentalPlace(Model m, HttpServletRequest request) { 
		//로그인 확인 
		// if(!logincheck(request)) 
		// return "redirect:/login?toURL="+request.getRequestURL();
	  
	  //dto에서 장소 이름들 받아오는 부분 
	  try { 
		  List<RentalDto> placelist = rentalService.selectRentalPlace(); 
			/*
			 * for(int i=0; i<placelist.size(); i++) { boolean a =
			 * placelist.get(i).getCroom_location().equals("1층"); System.out.println(i+
			 * ": "+a); }
			 */
		  m.addAttribute("placelist", placelist);
		  System.out.println(placelist);
	  }catch(Exception e)
	{ 
		  e.printStackTrace(); }return"rental/place";
	}
	
	
	/*
	@PostMapping("/rental/place")
	@ResponseBody
	public RentalDto list(HttpServletRequest req, HttpServletResponse resp, HttpSession session, String croom_id, String prental_de) {
		List<RentalDto> rentalDto = new List<>();
		
		try {
			
			rentalDto = rentalService.checkRental();
			
			// checkRental을 이용해서 ajax 다시 구현하는 중
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return rentalDto;
	} 
	*/
	
	@PostMapping("/rental/place")
	@ResponseBody
	public ResponseEntity<List<RentalDto>> list(Map map, Model m, String croom_id, String prental_de,  HttpServletRequest request) {
		List<RentalDto> list = null;
		
	//list에 값들을 담았는데 return으로 list를 못보내고 있음 해당 문제 해결할것
	
		
		
		try {
			list = rentalService.getList(croom_id);
			m.addAttribute("list",list); 
			
			System.out.println(m);
			System.out.println("list : " + list); //하나의 인자씩 받아와서 해보기
			return new ResponseEntity<List<RentalDto>>(list, HttpStatus.OK);		//200
			
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<RentalDto>>(HttpStatus.BAD_REQUEST);	//400
		}
	}
		
	
	
	/*
	 * @PostMapping("/reg") public String Rental(RentalDto rentalDto, Model m,
	 * HttpSession session, RedirectAttributes rattr) { String client =
	 * (String)session.getAttribute("id"); rentalDto.setUser_id(client);
	 * 
	 * try {
	 * 
	 * rattr.addFlashAttribute("msg", "REN_OK");
	 * 
	 * }catch(Exception e) { e.printStackTrace(); } }
	 */
	
	private boolean logincheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		return session != null && session.getAttribute("id") != null;
	}
	
}
