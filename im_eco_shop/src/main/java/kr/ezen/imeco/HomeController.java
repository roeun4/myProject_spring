package kr.ezen.imeco;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.service.HomeService;
import kr.ezen.util.ProdSpec;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HomeService service;
	
	@GetMapping("/")
	public String home(Model model, HttpServletRequest request) {
		
		cDtoList(request);
		
		pDtoList(request);
		
		return "home";
	}

	@GetMapping("categoryList.do")
	public String cateList(HttpServletRequest request, ProductDTO pDto, Model model) {
		List<ProductDTO> pDtos = service.prodList();		
		model.addAttribute("pDtos", pDtos);
		cDtoList(request);
		
		
		
		return "user/categoryListView";
	}

	@GetMapping("prodView.do")
	public String prodView(HttpServletRequest request, ProductDTO pDto, int pnum) {
		
		String pSpec = request.getParameter("pSpec");
		
		String specValue = null;
		
		if(pSpec.equals("none")) {
			specValue = "일반";
		} else { // 인기, 추천, 최신
			specValue = ProdSpec.valueOf(pSpec).getValue();			
		}
		
		request.setAttribute("specValue", specValue);
		
		service.prodView(pDto, pnum);

		return "user/prodView";
	}


	
	
	
	
	
	
	
	public void pDtoList(HttpServletRequest request) {
		ArrayList<ProductDTO> pDtos = service.productList();		
		request.setAttribute("pDtos", pDtos);
	}
	
	public void cDtoList(HttpServletRequest request) {
		ArrayList<CategoryDTO> dtos = service.categoryList();		
		request.setAttribute("list", dtos);
	}
}
