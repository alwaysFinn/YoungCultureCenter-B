package com.youngtvjobs.ycc.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.youngtvjobs.ycc.common.YccMethod;

@Controller
public class AdminController
{
	//관리자페이지 메인메뉴
	@RequestMapping("/admin")
	public String adminmain(HttpServletRequest request) throws Exception
	{
		// 관리자 권한이 없을 때 동작
		if (!YccMethod.permissionCheck("관리자", request))
		{
			return "redirect:/error/403";
		}
		return "admin/adminmain";
	}
	//관리자페이지 : 공지사항 관리
	@GetMapping("/admin/popup")
	public String popupSetting(HttpServletRequest request) throws Exception
	{
		// 관리자 권한이 없을 때 동작
		if (!YccMethod.permissionCheck("관리자", request))
		{
			return "redirect:/error/403";
		}
		return "admin/popup";
	}
	
	//공지사항 관리 : 저장 버튼 눌렀을 때 동작
	@PostMapping("/admin/popup")
	public String popupSave(String action, String url, String files, Model m) throws Exception
	{
		if(action.equals("save"))
		{
			m.addAttribute("alert", "<script>alert('저장 되었습니다.')</script>");
		}
		
		else if(action.equals("delete"))
		{
			m.addAttribute("alert", "<script>alert('삭제 되었습니다.')</script>");
		}
		System.out.println("post 구문 시작");
		return "redirect:/admin/popup";
	}
	
	//이용약관 관리
	@GetMapping("/admin/agreement")
	public String agreement(HttpServletRequest request) throws Exception
	{
		// 관리자 권한이 없을 때 동작
		if (!YccMethod.permissionCheck("관리자", request))
		{
			return "redirect:/error/403";
		}
		return "admin/agreement";
	}
	

}
