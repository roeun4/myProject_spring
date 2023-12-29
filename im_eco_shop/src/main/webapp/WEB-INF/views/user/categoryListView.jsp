<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>

<div class="ps-5 container">
	<h3 class="mt-5 mb-4 text-center">${cDto.cate_name}상품</h3>
	<c:if test="${pDtos.size() == 0}">
		<p class="text-center">상품이 존재하지 않습니다!!</p>
	</c:if>
	<c:if test="${pDtos.size() != 0}">
		<div class="d-flex">
			<c:set var="cnt" value="0"/>
			<c:forEach var="pDto" items="${pDtos}">
				<c:set var="cnt" value="${cnt+1}"/>
					<%@ include file="card.jsp" %>
				<c:if test="${cnt%5==0}"> <!-- 한줄에 보여지는 갯수 -->
					</div><div class="d-flex mt-3">
				</c:if>
			</c:forEach>
		</div>		
	</c:if>
</div>

<%@ include file="../include/footer.jsp" %>