<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.prod-title {margin: auto;
	    /* 여러 줄 자르기 */
	    width: 170px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    white-space: normal;}
</style>

<!-- Card -->
<div class="card me-3" style="width: 230px; height: 360px;">
	<a href="prodView.do?pnum=${pDto.pnum}&pSpec=${pDto.pspec}&pcategory_fk=${pDto.pcategory_fk}" style="margin: auto;"> 	
		<img class="card-img-top" src="<c:url value="/fileRepo/${pDto.pimage}"/>" alt="Card image" style="width: 160px; padding-top: 10px;">
	</a>	
	<div class="card-body">
		<h5 class="card-title text-center prod-title" style="height: 60px; line-height: 23px">${pDto.pname}</h5>
		<p class="card-text">
	    	가격 : <fmt:formatNumber value="${pDto.price}"/>원<br>
	    	포인트 : <fmt:formatNumber value="${pDto.point}"/>
		</p>
	    <!-- 로그인 되었을 경우 -->
	    <c:if test="${sessionScope.loginDTO.id != null}">
	    	<a href="cartAdd.do?id=${sessionScope.loginDTO.id}&pnum=${pDto.pnum}&pqty=1&pspec=${pDto.pspec}" class="btn btn-primary" style="width:100%;">장바구니 담기</a>
	    </c:if>
	    <!-- 로그인 안되었을 경우 -->
	    <c:if test="${sessionScope.loginDTO.id == null}">
	    	<a href="javascript:alert('로그인이 필요합니다')" class="btn btn-primary" style="width:100%">장바구니 담기</a>
	    </c:if>
	</div>
</div>
<!-- Card End-->