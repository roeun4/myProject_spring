package kr.ezen.imeco.mapper;

import java.util.List;

import kr.ezen.imeco.domain.CartDTO;
import kr.ezen.imeco.domain.ProductDTO;

public interface CartMapper {

	List<CartDTO> cartList(String id);

	int cartAdd(CartDTO cDto);

	// 장바구니에 담긴 수량 수정
	int cartUpdate(CartDTO cDto);

	
}
