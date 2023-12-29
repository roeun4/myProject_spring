package kr.ezen.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.ezen.imeco.domain.CartDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	// 장바구니 리스트
	@GetMapping("cartList.do")
	public String cartList(HttpSession session) {
		String id = (String) session.getAttribute("id"); // session에 저장된 userId
		List<CartDTO> cartList = service.cartList(id);
		
		for(CartDTO cDto : cartList) {
			// 수량만큼 totPrice, totPoint 계산
			cDto.setTotal();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(cartList);
		map.put("dtos", map);
		
		return "user/cart_list";
	}
	
	// 장바구니 담기
	@GetMapping("cartAdd.do")
	public String cartAdd(CartDTO cDto) {
		
		service.cartAdd(cDto);
		
		return "redirect:cartList.do";
	}
	
	// 장바구니에 담긴 수량 수정
	@PostMapping("cartModify.do")
	public String cartModify(CartDTO cDto) {
		service.cartModify(cDto);
		
		return "redirect:cartList.do";
	}
	
	// 구매하기 폼 이동
	@GetMapping("checkout.do")
	public String cartForm() {
		return "user/checkout";
	}
	
}
