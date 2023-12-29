<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아임에코몰</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<header>	
<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="height: 80px;">
  <div class="container">
    <ul class="navbar-nav w-100">
      <li class="nav-item">
      	<!-- 컨텍스트 path 얻어오기 -->
      	<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>
        <a class="nav-link active" href="${ctxPath}">아임에코몰</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/admin/adminMain.do">관리자홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/admin/catInput.do">카테고리 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/admin/catList.do">카테고리 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/admin/prodInput.do">상품등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/admin/prodList.do">상품리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/imeco/member/memberList.do">회원리스트</a>
      </li>
      <li class="nav-item ms-auto">
		<c:if test="${sessionScope.loginDTO.name != null}">      	
      		<span class="text-white" style="color:white; line-height:40px">${sessionScope.loginDTO.name}님&nbsp;</span>
      	</c:if>
      	<c:if test="${sessionScope.loginDTO.id == null}">
        	<a class="nav-link" style="display:inline-block;" href="#">로그인</a>
        </c:if>
      	<c:if test="${sessionScope.loginDTO.id != null}">
        	<a class="nav-link" style="display:inline-block;" href="adminLogout.do">로그아웃</a>
        </c:if>
      </li>
    </ul>
  </div>
</nav>
</header>