<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ad_header.jsp"/>      
<div class="container w-50 mt-5">
   <h3 class="text-center">상품 수정</h3>
   <form action="prodUpdateOk.do" method="post" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
         	<tr>
         		<td>상품번호</td>
         		<td><input type="text" class="form-control form-control-sm" name="pnum" value="${pDto.pnum}" readonly/></td>
         	</tr>
            <tr>
               <td>카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="pcategory_fk"> 
                        <c:if test="${list != null || list.size() != 0}">
                         	<c:forEach var="cDto" items="${list}">
                         		<option value="${cDto.code}"
                         		 ${(cDto.code == pDto.pcategory_fk) ? 'selected':''}>
                         		 ${cDto.cate_name}[${cDto.code}]
                         		 </option>
                          	</c:forEach>
                        </c:if>
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품명</td>
               <td><input type="text" class="form-control form-control-sm" name="pname" value="${pDto.pname}"/></td>
            </tr>
            <tr>
               <td>제조회사</td>
               <td><input type="text" class="form-control form-control-sm" name="pcompany" value="${pDto.pcompany}"/></td>
            </tr>
            <tr>
               <td>상품이미지</td>
               <td>
               		<img src="<c:url value="/fileRepo/${pDto.pimage}"/>" width="100px"/><br><br>
               		<input type="file" class="form-control form-control-sm" name="pimage"/>
               		
               		<!-- 이미지를 수정하지 않을 경우에는 현재 이미지를 전송해줌 -->
               		<input type="hidden" class="form-control form-control-sm" name="pimage" value="${pDto.pimage}"/>               		
               </td>
            </tr>
            <tr>
               <td>상품수량</td>
               <td><input type="text" class="form-control form-control-sm" name="pqty" value="${pDto.pqty}"/></td>
            </tr>
            <tr>
               <td>상품가격</td>
               <td><input type="text" class="form-control form-control-sm" name="price" value="${pDto.price}"/></td>
            </tr>
            <tr>
				<td>상품사양</td>
                <td class="d-flex">
                  	<input type="text" class="form-control form-control-sm" name="pspec" value="현재 ${pDto.pspec}상품" readonly/>
                	<select class="form-select form-select-sm" name="pspec">
                    	<option value="none">일반[none]</option>
	                    <c:forEach var="spec" items="${requestScope.pdSpecs}">
	                    	<option value="${spec.name()}">${spec.value}[${spec.name()}]</option>
	                    </c:forEach>                        
                  	</select>
               </td>
            </tr>
			<tr>
               <td>상품소개</td>
               <td>
                  <textarea class="form-control" name="pcontent" rows="3">${pDto.pcontent}</textarea>
               </td>
            </tr>
            <tr>
               <td>상품포인트</td>
               <td><input type="text" class="form-control form-control-sm" name="point" value="${pDto.point}"/></td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-sm btn-primary" value="상품수정"/>   
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>   
   </form>
</div> 
<jsp:include page="ad_footer.jsp"/> 