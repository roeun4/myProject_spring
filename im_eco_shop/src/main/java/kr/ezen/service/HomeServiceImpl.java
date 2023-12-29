package kr.ezen.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.imeco.mapper.HomeMapper;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	private HomeMapper mapper;

	// 카테고리 리스트 가져오기
	@Override
	public ArrayList<CategoryDTO> categoryList() {
		
		return mapper.categoryList();
	}

	@Override
	public ArrayList<ProductDTO> productList() {
		
		return mapper.prodList();
	}

	// 상품 상세보기
	@Override
	public int prodView(ProductDTO pDto, int pnum) {
		
		return mapper.prodView(pDto, pnum);
	}

	@Override
	public List<ProductDTO> prodList() {
		
		return mapper.productList();
	}


}
