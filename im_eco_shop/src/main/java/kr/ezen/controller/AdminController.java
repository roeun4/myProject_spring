package kr.ezen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ezen.imeco.domain.AdminDTO;
import kr.ezen.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 로그인 폼 이동
	@GetMapping("login.do")
	public String loginForm() {
		return "admin/ad_login";
	}
	
	@PostMapping("loginOk.do")
	public String adminLogin(AdminDTO dto, HttpServletRequest req) {
		boolean result = service.adminLogin(dto, req);
		
		if(!result) { // 로그인 실패
			return "redirect:login.do";
		}
		return "admin/ad_main";
	}
	
	// 로그아웃
	@GetMapping("adminLogout.do")
	public String memberLogout(HttpSession session) {
		session.invalidate(); // 세션 초기화
		
		return "redirect:/";
	}
	
	// 관리자 메인페이지
	@GetMapping("adminMain.do")
	public String adminMain() {
		return "admin/ad_main";
	}
}
