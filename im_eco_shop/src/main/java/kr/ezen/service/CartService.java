package kr.ezen.service;

import java.util.List;

import kr.ezen.imeco.domain.CartDTO;
import kr.ezen.imeco.domain.ProductDTO;

public interface CartService {

	List<CartDTO> cartList(String id);

	int cartAdd(CartDTO cDto);

	// 장바구니에 담긴 수량 수정
	int cartModify(CartDTO cDto);

	 
}
