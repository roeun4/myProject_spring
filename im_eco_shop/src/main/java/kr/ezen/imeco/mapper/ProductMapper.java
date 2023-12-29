package kr.ezen.imeco.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;

public interface ProductMapper {

	List<ProductDTO> prodList();

//	상품등록시 카테고리 리스트 가져오기
	ArrayList<CategoryDTO> categoryList();

	// 상품등록
	int prodInsert(Map map);

	ProductDTO prodModify(int pnum);

	int prodUpdate(Map map);

	int prodDelete(int pnum);


}
