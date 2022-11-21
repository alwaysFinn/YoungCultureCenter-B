package com.youngtvjobs.ycc.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController
{
	//관리자페이지 메인메뉴
	@RequestMapping("/admin")
	public String adminmain() {
		return "admin/adminmain";
	}
}
