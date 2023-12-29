package kr.ezen.service;

import javax.servlet.http.HttpServletRequest;

import kr.ezen.imeco.domain.AdminDTO;

public interface AdminService {
	boolean adminLogin(AdminDTO dto, HttpServletRequest req);
}
