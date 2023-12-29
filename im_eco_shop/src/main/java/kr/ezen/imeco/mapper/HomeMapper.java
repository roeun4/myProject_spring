package kr.ezen.imeco.mapper;

import java.util.ArrayList;
import java.util.List;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;

public interface HomeMapper {

	ArrayList<CategoryDTO> categoryList();

	ArrayList<ProductDTO> prodList();

	int prodView(ProductDTO pDto, int pnum);

	List<ProductDTO> productList();
	
}
