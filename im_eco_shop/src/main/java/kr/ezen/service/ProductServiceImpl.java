package kr.ezen.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.imeco.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductDTO> prodList() {
		
		return mapper.prodList();
	}

//	상품등록시 카테고리 리스트 가져오기
	@Override
	public ArrayList<CategoryDTO> categoryList() {
		
		return mapper.categoryList();
	}

	@Override
	public int prodRegister(Map map) {
		
		return mapper.prodInsert(map);
	}

	@Override
	public ProductDTO prodModify(int pnum) {
		
		return mapper.prodModify(pnum);
	}

	@Override
	public int prodUpdate(Map map) {
		
		return mapper.prodUpdate(map);
	}

	@Override
	public int prodRemove(int pnum) {
		
		return mapper.prodDelete(pnum);
	}

	

}
