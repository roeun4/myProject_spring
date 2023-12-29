package kr.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ezen.imeco.domain.CartDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.imeco.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper mapper;

	@Override
	public List<CartDTO> cartList(String id) {
		
		return mapper.cartList(id);
	}

	@Override
	public int cartAdd(CartDTO cDto) {
		
		return mapper.cartAdd(cDto);
	}

	// 장바구니에 담긴 수량 수정
	@Override
	public int cartModify(CartDTO cDto) {
		
		return mapper.cartUpdate(cDto);
	}

}
