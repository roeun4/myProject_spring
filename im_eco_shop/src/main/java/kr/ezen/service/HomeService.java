package kr.ezen.service;

import java.util.ArrayList;
import java.util.List;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;

public interface HomeService {

	ArrayList<CategoryDTO> categoryList();

	ArrayList<ProductDTO> productList();

	int prodView(ProductDTO pDto, int pnum);

	List<ProductDTO> prodList();

	
}
