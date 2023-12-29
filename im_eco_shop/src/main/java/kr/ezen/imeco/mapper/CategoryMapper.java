package kr.ezen.imeco.mapper;

import java.util.List;

import kr.ezen.imeco.domain.CategoryDTO;

public interface CategoryMapper {

	List<CategoryDTO> categoryList();

	int categoryInsert(CategoryDTO cDto);

	int deleteCategory(int cate_num);

	
}
