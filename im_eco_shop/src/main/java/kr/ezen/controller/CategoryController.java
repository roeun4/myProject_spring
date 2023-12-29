package kr.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.service.CategoryService;

@Controller
@RequestMapping("/admin")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	// 카테고리 리스트
	@GetMapping("catList.do")
	public String categoryList(Model model) {
		List<CategoryDTO> categoryList = service.categoryList();
		model.addAttribute("list", categoryList);
		
		return "admin/category_list";
	}
	
	// 카테고리 등록 폼 이동
	@GetMapping("catInput.do")
	public String categoryRegisterForm() {
		return "admin/category_input";
	}
	
	// 등록 후 리스트 이동
	@PostMapping("categoryOk.do")
	public String categoryInsert(CategoryDTO cDto) {
		service.categoryRegister(cDto);
		
		return "redirect:catList.do";
	}
	
	// 삭제
	@GetMapping("catDelete.do")
	public String categoryDelete(int cate_num) {
		service.categoryRemove(cate_num);
		
		return "redirect:catList.do";
	}
	
	
}
