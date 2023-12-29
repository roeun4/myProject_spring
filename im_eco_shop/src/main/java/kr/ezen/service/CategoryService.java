package kr.ezen.service;

import java.util.List;

import kr.ezen.imeco.domain.CategoryDTO;

public interface CategoryService {

	// 리스트
	List<CategoryDTO> categoryList();

	// 카테고리 등록
	int categoryRegister(CategoryDTO cDto);

	// 카테고리 삭제
	int categoryRemove(int cate_num);
	 
}
