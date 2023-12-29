<%@page import="kr.ezen.util.ProdSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="container d-flex c-list">
	<li style="font-size: 16px; color: #555; cursor: default;"><b><i class='fas fa-bars'></i> 카테고리</b></li>
	
<c:forEach var="cDto" items="${list}">
	<li class="nav-item" style="width: 80px; text-align: center;">
        <a class="nav-link" href="categoryList.do?code=${cDto.code}&cate_name=${cDto.cate_name}">${cDto.cate_name}</a>
    </li>
</c:forEach>
	
</ul>