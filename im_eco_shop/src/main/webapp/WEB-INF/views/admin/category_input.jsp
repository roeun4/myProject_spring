<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="ad_header.jsp"/>
<!-- 컨텐츠 -->
<div class="container mt-5 border shadow p-5">	
	<h2>카테고리 등록</h2>
	
	<form action="categoryOk.do" method="post" name="cat_inputForm">
	  <div class="mb-3 mt-3">
	    <label for="code" class="form-label">카테고리 코드</label>
	    <input type="text" class="form-control" id="code" placeholder="카테고리 코드 입력하세요" name="code">
	  </div>
	  <div class="mb-3">
	    <label for="cate_name" class="form-label">카테고리명</label>
	    <input type="text" class="form-control" id="cate_name" placeholder="카테고리명을 입력하세요" name="cate_name">
	  </div>
	</form>
	<div class="text-center">
		<input type="submit" class="btn btn-primary" value="등록" onclick="inputChk()"/>
		<input type="reset" class="btn btn-secondary" value="취소"/>
	</div>
</div>

<script>
	function inputChk(){
		if(!cat_inputForm.code.value){ //code값이 null이면 
			alert("카테고리 코드를 입력하세요!!!!");
			cat_inputForm.code.focus();
			return;
		}
		if(!cat_inputForm.cate_name.value){ //cname값이 null이면 
			alert("카테고리명을 입력하세요!!!!");
			cat_inputForm.cate_name.focus();
			return;
		}
		document.cat_inputForm.submit();
	}
</script>

<jsp:include page="ad_footer.jsp"/>
