<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 컨텐츠 -->
<div class="container mt-5 border shadow p-5">	
	<h2>관리자 로그인</h2>
	
	<form action="<c:url value="loginOk.do" />" method="post">
	  <div class="mb-3 mt-3">
	    <label for="id" class="form-label">아이디</label>
	    <input type="text" class="form-control" id="id" placeholder="아이디" name="id"
	    value="<c:if test="${sessionScope.loginDTO.id !=null and loginErr !='idErr'}">${sessionScope.loginDTO.id}</c:if>">
	    <c:if test="${loginErr == 'idErr'}">
	    	<p class="text-danger">관리자 아이디를 입력하세요!!</p>
	    </c:if>	
	  </div>
	  <div class="mb-3">
	    <label for="pwd" class="form-label">비밀번호</label>
	    <input type="password" class="form-control" id="password" placeholder="비밀번호" name="password">
	    <c:if test="${loginErr == 'pwdErr'}">
	    	<p class="text-danger">비밀번호를 확인하세요!!</p>
	    </c:if>
	  </div>
	  <div class="text-center">
	  	<button type="submit" class="btn btn-primary">로그인</button>
	  </div>
	</form>
</div>
</body>
</html>