package kr.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryMapper mapper;

	// 카테고리 리스트
	@Override
	public List<CategoryDTO> categoryList() {
		
		return mapper.categoryList();
	}

	// 카테고리 등록
	@Override
	public int categoryRegister(CategoryDTO cDto) {
		return mapper.categoryInsert(cDto);
	}

	// 삭제
	@Override
	public int categoryRemove(int cate_num) {
		return mapper.deleteCategory(cate_num);
	}




}
