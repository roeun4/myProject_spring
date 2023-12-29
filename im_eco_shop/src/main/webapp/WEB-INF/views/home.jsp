<%@page import="java.util.ArrayList"%>
<%@page import="kr.ezen.imeco.domain.ProductDTO"%>
<%@page import="kr.ezen.util.ProdSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      


<jsp:include page="include/header.jsp"/>

<jsp:include page="user/home_category.jsp"/>

<jsp:include page="member/slide.jsp"/>

<div class="container">
<%
	ProdSpec[] pdSpecs = ProdSpec.values();
	
	for(ProdSpec ps : pdSpecs){
		// HIT, NEW, RECOMMEND
		String spec = ps.name();
		
		// 각 스펙별 상품 리스트
		/* pDtos = pDao.getProdBySpec(spec);*/
		
		pageContext.setAttribute("ps", ps);
%>
	<c:if test="${pDtos.size() == 0}">
		${ps.getValue()}상품이 없습니다!!<br>
	</c:if>	
	<c:if test="${pDtos.size() != 0}">
		<h4 class="mt-5 text-center mb-4 cate-title">${ps.getValue()} 상품</h4>
		<div class="d-flex">
			<c:set var="cnt" value="0"/>
			<c:forEach var="pDto" items="${pDtos}">
				<c:set var="cnt" value="${cnt+1}"/>
					<%@ include file="user/card.jsp" %>
				<c:if test="${cnt%5==0}">
					</div><div class="d-flex mt-3">
				</c:if>
			</c:forEach>
		</div>		
	</c:if>
<% } // end of for문 %>	
</div>


<%@ include file="include/footer.jsp" %>
