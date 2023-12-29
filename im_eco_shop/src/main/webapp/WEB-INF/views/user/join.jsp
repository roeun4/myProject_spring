<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${requestScope.msg !=null}" >
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>

<script src="js/valid.js"></script>
<div class="container mt-5 w-50 border shadow p-5">
   <h3 class="text-center mb-4">회원 가입</h3>
   <form action="userJoinOk.do" method="post" name="joinForm">
		<input type="text" class="form-control mb-4" id="id" placeholder="아이디" name="id"/>
		<input type="password" class="form-control mb-4" id="pw" placeholder="비밀번호" name="pw"/>
 		<input type="password" class="form-control mb-4" id="pwConfirm" placeholder="비밀번호 확인" name="pwConfirm"/>
		<input type="text" class="form-control mb-4" id="name" placeholder="이름" name="name"/>
		<input type="text" class="form-control mb-4" id="tel" placeholder="전화번호" name="tel"/>
		<input type="text" class="form-control mb-4" id="email" placeholder="이메일" name="email"/>
		<input type="text" class="form-control mb-4" id="addr" placeholder="주소" name="addr"/>
		
      
        <div class="text-center">
			<input type="button" class="btn btn-sm btn-primary" value="회원가입" onclick="inputChk()"/>
			<input type="reset" class="btn btn-sm btn-warning" value="취소"/>
        </div>
   </form>
</div>