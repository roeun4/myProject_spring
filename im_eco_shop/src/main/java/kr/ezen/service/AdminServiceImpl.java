package kr.ezen.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.imeco.domain.AdminDTO;
import kr.ezen.imeco.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;

	@Override
	public boolean adminLogin(AdminDTO dto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		AdminDTO loginDTO = mapper.adminLogin(dto);
		
		if(loginDTO != null) { // 일치
			String inputPw = dto.getPassword(); // 입력비번
			String dbPw = loginDTO.getPassword(); // DB비번
			
			if(inputPw.equals(dbPw)) { // 비번 일치
				session.setAttribute("loginDTO", loginDTO);
				return true;
			}else { // 비번 불일치
				return false;
			}
		}// if
		return false;
	}

}
