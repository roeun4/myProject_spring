<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ include file="../include/header.jsp" %>	

<div class="container w-50 mt-5 p-5 shadow">
   <form action="register.do" method="post">
      <h4 class="text-center mb-3">글쓰기</h4>
      
      <input class="form-control" type="text" id="writer" name="writer" placeholder="이름을 입력하세요" autofocus>
      
	  <input class="form-control mt-2" type="text" id="subject" name="subject" placeholder="글제목을 입력하세요">
	        
      <textarea class="form-control mt-2" name="contents" id="contents" placeholder="내용을 입력하세요"></textarea>
      
      <div class="text-center mt-3">
         <button class="btn btn-primary">등록</button>   
      </div>			
   </form>
</div>
</body>
</html>