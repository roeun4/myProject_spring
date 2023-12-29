<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

<%@ include file="../include/header.jsp" %>
<style>
	td {vertical-align:middle;}
</style>

<div class="container w-75 mt-5">
	<h3 class="text-center mb-3">장바구니 리스트</h3>
	<table class="table text-center">
		<thead>
			<tr>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>판매가</th>
				<th>합계</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${dtos.size() == 0}">
				<c:set var="cartTotPrice" value="0"/>
				<c:set var="cartTotPoint" value="0"/>
				
				<tr>
					<td colspan="6">장바구니가 비었습니다!!</td>
				</tr>
			</c:if>
			<c:if test="${dtos.size() != 0}">
				<c:forEach var="dto" items="${dtos}">
					<tr>
						<td>
							<a href="prodView.do?pnum=${dto.pnum}&pSpec=${dto.pspec}">
								<img src="<c:url value="/fileRepo/${dto.pimage}"/>" width="60px" />
							</a>	
						</td>
						<td>${dto.pname}</td>
						<td>
							<form action="cartModify.do" method="post">
								<input type="text" name="cart_num" value="${dto.cart_num}"/>
								<input type="text" size="3" name="pqty" value="${dto.pqty}"/>개<br/>
								<input type="submit" value="수정" class="btn btn-sm btn-secondary mt-3"/>	
							</form>
						</td>
						<td>
							<fmt:formatNumber value="${dto.price}"/>원<br/>
						    <fmt:formatNumber value="${dto.point}"/>포인트
						</td>
						<td>
							<fmt:formatNumber value="${dto.totPrice}"/>원<br/>
							<fmt:formatNumber value="${dto.totPoint}"/>포인트
						</td>
						<td>
							<form action="cartDelete.do" method="post">
								<input type="hidden" name="cartNum" value="${dto.cart_num}"/>
								<input type="submit" value="삭제" class="btn btn-sm btn-danger"/>	
							</form>
						</td>						
						
						<c:set var="cartTotPrice" value="${cartTotPrice + dto.totPrice}"/>
						<c:set var="cartTotPoint" value="${cartTotPoint + dto.totPoint}"/>						
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<!-- 장바구니 총액 표시 -->
	<div class="text-end">
		장바구니 총액 : <fmt:formatNumber value="${cartTotPrice}"/> 원 <br>
		총 포인트 : <fmt:formatNumber value="${cartTotPoint}"/> 포인트 <br>
	</div>
	<div class="text-center mt-5">
		<c:if test="${dtos.size() != 0}">
			<a href="checkout.do" class="btn btn-primary me-2">구매하기</a>
		</c:if>
		<a href="<c:url value="/"/>" class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
	</div>
</div>

<%@ include file="../include/footer.jsp" %>

