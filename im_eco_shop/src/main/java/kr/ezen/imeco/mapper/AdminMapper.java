package kr.ezen.imeco.mapper;

import kr.ezen.imeco.domain.AdminDTO;
import kr.ezen.imeco.domain.CategoryDTO;

public interface AdminMapper {
	AdminDTO adminLogin(AdminDTO dto);
	
	AdminDTO categoryInsert(CategoryDTO cDto);
}
