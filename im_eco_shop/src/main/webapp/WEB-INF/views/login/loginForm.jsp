<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<%@ include file="../include/header.jsp" %>

<div class="container p-5 mt-5">
   <form action="<c:url value="login.do" />" method="post" name="login">
   
      <h3 class="text-center mb-4">로그인</h3>
      <div style="width: 40%; margin: auto;">
      <input class="form-control mb-3" type="text" id="id" name="id" placeholder="아이디"/>
      <input class="form-control mb-2" type="text" id="pw" name="pw" placeholder="비밀번호"/>

      <div class="text-center pt-4">
         <input type="button" class="btn btn-primary w-100" value="로그인" onclick="inputChk()"/>
      </div>
      
      <div class="mt-3 w-100 findIdPw">
	      <div class="d-flex justify-content-between">
	         <div>
		         <i class="fa fa-lock"></i> <a href="<c:url value="idPwFind.do?find=id" />">아이디</a>
		         <a href="<c:url value="idPwFind.do?find=pw" />">비밀번호 찾기</a>
	         </div>
	         <div>
	         	<i class="fa fa-user-plus"></i> <a href="<c:url value="memberRegister.do" />">회원가입</a>
	         </div>
	      </div>
   	  </div>
      </div>
   </form>
</div>

<script>
/**
 * 유효성 검사
 */
function inputChk(){
	if(document.login.id.value.length == 0){
		alert("아이디를 입력하세요!!");
		login.id.focus();
		return;
	}
	
	if(document.login.pw.value.length == 0){
		alert("비밀번호를 입력하세요!!");
		login.pw.focus();
		return;
	}
	
	document.login.submit();
}
 
</script>

<%@ include file="../include/footer.jsp" %>
