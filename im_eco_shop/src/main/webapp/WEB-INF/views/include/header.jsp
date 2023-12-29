<%@page import="kr.ezen.util.ProdSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아임에코몰</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>           	
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  	
  	<!-- css customize -->
  	<link href="<c:url value="/css/main1.css"/>" rel="stylesheet"/>
</head>
<body>
<div class="pt-4">
	<div class="container top-menu">
		<div>
			<h1><a href="<c:url value="/"/>" style="color: #4fd66e;"><b>i'm eco</b></a></h1>
		</div>
		<div>
			<ul class="login-menu">
				
				<c:if test="${sessionScope.loginDTO.id == 'admin'}">
			        <li style="line-height: 51px;">
			        	<a class="nav-link" href="<c:url value="/admin/adminMain.do"/>">관리자페이지</a>
			        </li>
				    <li class="no-cursor">|</li>
				    <li style="line-height: 51px;">
			        	<a class="nav-link" style="line-height: 51px;"  href="/imeco/admin/adminLogout.do">관리자 로그아웃</a>
			        </li>
			        <li class="no-cursor">|</li>
			    </c:if>
				
				<c:if test="${sessionScope.loginDTO.id == null}">
			        <li>
			        	<a class="nav-link login" style="line-height: 51px;" href="<c:url value="/member/login.do"/>">로그인</a>
			        </li>
			        <li class="no-cursor">|</li>
			    </c:if>
			    
			    <c:if test="${sessionScope.loginDTO.id != null }">
					<li class="nav-item"><a href="/imeco/member/myProfile.do">${sessionScope.loginDTO.name}님</a></li>
					<li class="no-cursor">|</li>
				</c:if>
			    
			    <c:if test="${sessionScope.loginDTO.id != null && sessionScope.loginDTO.id != 'admin'}">
					<li class="nav-item">
						<a class="nav-link" href="member/logout.do">로그아웃</a>
					</li>
					<li class="no-cursor">|</li>
				</c:if>
				
				
				<c:if test="${sessionScope.loginDTO.id == null}">
					<li>
						<a href="<c:url value='/member/memberRegister.do'/>" class="nav-link">회원가입</a>
					</li>
					<li class="no-cursor">|</li>
				</c:if>
				
				<c:if test="${sessionScope.loginDTO.id != null}">
					<li class="nav-item">
						<a class="nav-link" href="/imeco/cartList.do">장바구니</a>
					</li>
					
				</c:if>
				
				<c:if test="${sessionScope.loginDTO.id == null}">      
					<li class="nav-item">
						<a class="nav-link" href="javascript:alert('로그인이 필요합니다')">장바구니</a>
					</li>
				</c:if>
				
			</ul>
		</div>
	</div>	
</div>

<nav class="sticky-top" style="border-bottom: 1px solid #eee;">
	<div class="container p-0">
		<ul class="container d-flex c-list">
			<li style="font-size: 16px; color: #4fd66e; cursor: pointer;" class="over">
				<b><i class='fas fa-bars'></i> 카테고리</b>
				<ul class="c-List text-center">
					<c:forEach var="cDto" items="${list}">
						<li class="nav-item" style="width: 100px; text-align: center; margin: auto;">
					        <a class="nav-link" href="categoryList.do?code=${cDto.code}&cate_name=${cDto.cate_name}">${cDto.cate_name}</a>
					    </li>
					</c:forEach>
				</ul>
			</li>
			
			<li>i'm eco</li>
			<li>제로웨이스트</li>
			<li>이벤트</li>
		</ul>
	</div>
</nav>

<script>
	$(".c-List").hide();
	
	$(".over").hover(()=>{
		$(".c-List").stop().fadeIn();
	}, ()=>{
		$(".c-List").stop().fadeOut();
	})
	
</script>
