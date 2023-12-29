<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:if test="${requestScope.msg !=null}">
	<script>
		alert("${requestScope.msg}");
	</script>
</c:if>

<jsp:include page="ad_header.jsp"/>

<!-- 컨텐츠 -->
<div class="container mt-5 border shadow p-5 text-center">	
	<h2>카테고리 리스트</h2>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>코드</th>
				<th>카테고리명</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${requestScope.list}">
			<tr>
				<td>${dto.cate_num}</td>
				<td>${dto.code}</td>
				<td>${dto.cate_name}</td>
				<td><a href="catDelete.do?cate_num=${dto.cate_num}" class="btn btn-sm btn-outline-danger">삭제</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="ad_footer.jsp"/>

