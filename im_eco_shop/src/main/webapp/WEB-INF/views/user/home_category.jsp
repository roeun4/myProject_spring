<%@page import="kr.ezen.util.ProdSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    


<ul class="container text-center d-flex mt-3">
	<c:forEach var="cDto" items="${list}">
		<li class="nav-item" style="width: 100px; text-align: center;">
	        <a class="nav-link" href="categoryList.do?code=${cDto.code}&cate_name=${cDto.cate_name}">${cDto.cate_name}</a>
	    </li>
	</c:forEach>
</ul>

