package kr.ezen.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ezen.imeco.domain.CategoryDTO;
import kr.ezen.imeco.domain.ProductDTO;
import kr.ezen.service.ProductService;
import kr.ezen.util.ProdSpec;

@Controller
@RequestMapping("/admin")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	// 리스트
	@GetMapping("prodList.do")
	public String prodList(Model model) {
		List<ProductDTO> prodList = service.prodList();
		model.addAttribute("prodList", prodList);
		
		return "admin/prod_list";
	}
	
	// 상품 등록 폼 이동
	@GetMapping("prodInput.do")
	public String prodRegister(HttpServletRequest request) {
		// 카테고리 리스트 가져오기
		ArrayList<CategoryDTO> dtos = service.categoryList();		
		request.setAttribute("list", dtos);
		
		// 상품스펙 가져오기
		ProdSpec[] pdSpecs= ProdSpec.values();
		request.setAttribute("pdSpecs", pdSpecs);
		
		return "admin/prod_input";
	}
	
	// 등록
	@PostMapping("prodRegisterOk.do")
	public String prodInsert(HttpServletRequest request, MultipartHttpServletRequest mhr, Model model) 
			throws IOException{
		
		Map map = prodSave(request, mhr);
	    
	    service.prodRegister(map);
	       
	    return "redirect:/admin/prodList.do";
	}

	public Map prodSave(HttpServletRequest request, MultipartHttpServletRequest mhr) throws IOException {
		String repo = "resources/fileRepo";
		String savePath = request.getServletContext().getRealPath("")+File.separator+repo; 
	    System.out.println(savePath);
	    
	    Map map = new HashMap();
	    
	    // mhr는 일반 텍스트, 바이너리 파일 정보를 모두 얻어올 수 있는 객체
	    // input의 name속성의 값 = 파라미터값을 가져옴 (id, name)
	    Enumeration<String> enu = mhr.getParameterNames();
	    
	    // 일반 텍스트의 파라미터명과 입력값 모두 출력
	    while(enu.hasMoreElements()) {
	   	  	String paramName = enu.nextElement();
	   	  	// 해당 파라미터명의 값 => input의 value값(사용자가 입력한 값)
	   	  	String paramValue = mhr.getParameter(paramName);
	   	  
	   	  	// name : user, id : test
	   	  	System.out.println(paramName + " : " + paramValue);
	   	  	map.put(paramName, paramValue);
	    }
	    
	    // 첨부 파일 정보 얻어오기
	    // input type = file의 name값
	    Iterator<String> iter = mhr.getFileNames();
	    List<String> fileList = new ArrayList<String>();
	    
	    while(iter.hasNext()) {
	   	  	String fileParamName = iter.next();
	   	  	System.out.println("fileParamName = " + fileParamName);
	   	  
	   	  	// MultipartFile : 파일정보를 갖고 있는 객체
	   	  	MultipartFile mFile = mhr.getFile(fileParamName);
	   	  
	   	  	// 첨부된 이미지 파일명
	   	  	String originName = mFile.getOriginalFilename();
	   	  	System.out.println("originName = " + originName);
	   	  
	   	  	// ~ /day05_fileUpDown\\resources/fileRepo\\file1
	   	  	File file = new File(savePath+"\\"+fileParamName);
	   	  
	   	  	if(mFile.getSize() != 0) { // 업로드된 경우
	   	  		System.out.println("11 : " + file.exists());
	   		  
	   	  		if(!file.exists()) { // 파일이 존재하지 않으면
	   	  			if(file.getParentFile().mkdir()) {
	   	  				file.createNewFile(); // 임시파일 생성
	   	  			} // if
	   	  		} // if
	   		  
	   	  		File uploadFile = new File(savePath + "\\" + originName);
	   		  
	   	  		// 중복시 파일명 대체
	   	  		if(uploadFile.exists()) {
	   	  			originName = System.currentTimeMillis()+"_"+ originName;
	   	  			uploadFile = new File(savePath + "\\" + originName);
	   	  		} // if
	   		  
	   	  		// 실제 파일 업로드
	   	  		mFile.transferTo(uploadFile);
	   	  		fileList.add(originName);
	   	  		map.put("pimage", originName);
	   		  
	   	  	}// if
	    
	    } // while
		return map;
	}
	
	// 수정 폼페이지 이동
	@GetMapping("prodUpdate.do")
	public String modifyForm(HttpServletRequest request, int pnum) {
		// 수정시 카테고리 리스트 가져오기
		ArrayList<CategoryDTO> dtos = service.categoryList();		
		request.setAttribute("list", dtos);
		
		// 상품스펙 가져오기
		ProdSpec[] pdSpecs= ProdSpec.values();
		request.setAttribute("pdSpecs", pdSpecs);
		
		// 저장된 상품정보 가져오기
		ProductDTO pDto = service.prodModify(pnum);
		request.setAttribute("pDto", pDto);
		
		return "admin/prod_update";
	}
	
	// 상품 수정
	@PostMapping("prodUpdateOk.do")
	public String prodUpdate(HttpServletRequest request, MultipartHttpServletRequest mhr) throws IOException{
		Map map = prodSave(request, mhr);
		service.prodUpdate(map);
		
		return "redirect:/admin/prodList.do";
	}
	
	// 상품 삭제
	@GetMapping("prodDelete.do")
	public String prodDelete(int pnum) {
		service.prodRemove(pnum);
		
		return "redirect:/admin/prodList.do";
	}

}
