<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="ad_header.jsp"/>      
<div class="container w-50 mt-5">
   <h3 class="text-center">상품 등록</h3>
   <form action="prodRegisterOk.do" method="post" name="pRegi" enctype="multipart/form-data">
      <table class="table table-borderless">
         <tbody>
            <tr>
               <td>카테고리</td>
               <td>
                  <select class="form-select form-select-sm" name="pcategory_fk"> 
                  	   <c:if test="${list == null || list.size() == 0}">                       
							<option value="">카테고리 없음</option>
                        </c:if>
                        <c:if test="${list != null || list.size() != 0}">
                         	<c:forEach var="dto" items="${list}">
                         		<option value="${dto.code}">${dto.cate_name}[${dto.code}]</option>
                          </c:forEach>   
                        </c:if>
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품명</td>
               <td><input type="text" class="form-control form-control-sm" name="pname"/></td>
            </tr>
            <tr>
               <td>제조회사</td>
               <td><input type="text" class="form-control form-control-sm" name="pcompany"/></td>
            </tr>
            <tr>
               <td>상품이미지</td>
               <td><input type="file" class="form-control form-control-sm"  name="pimage"/></td>
            </tr>
            <tr>
               <td>상품수량</td>
               <td><input type="text" class="form-control form-control-sm" name="pqty"/></td>
            </tr>
            <tr>
               <td>상품가격</td>
               <td><input type="text" class="form-control form-control-sm" name="price"/></td>
            </tr>
            <tr>
               <td>상품사양</td>
               <td>
                  <select class="form-select form-select-sm" name="pspec">
                     <option value="none" selected>일반</option>
                     <c:forEach var="spec" items="${requestScope.pdSpecs}">
                     	<option value="${spec.name()}">${spec.value}[${spec.name()}]</option>
                     </c:forEach>                        
                  </select>
               </td>
            </tr>
            <tr>
               <td>상품소개</td>
               <td>
                  <textarea class="form-control" name="pcontent" rows="3"></textarea>
               </td>
            </tr>
            <tr>
               <td>상품포인트</td>
               <td><input type="text" class="form-control form-control-sm" name="point"/></td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="button" class="btn btn-sm btn-primary" value="상품등록" onclick="inputChk()"/> 
                  <input type="reset" class="btn btn-sm btn-secondary" value="취소"/>   
               </td>
            </tr>
         </tbody>         
      </table>   
   </form>
</div>

<script type="text/javascript">
function inputChk(){
	if(document.pRegi.pname.value.length == 0){
		alert("상품명을 입력하세요!!");
		pRegi.pname.focus();
		return;
	}
	
	if(document.pRegi.pcompany.value.length == 0){
		alert("제조회사를 입력하세요!!");
		pRegi.pcompany.focus();
		return;
	}
	
	if(document.pRegi.pimage.value.length == 0){
		alert("이미지를 첨부하세요!!");
		pRegi.pimage.focus();
		return;
	}
	
	if(document.pRegi.pqty.value.length == 0){
		alert("수량을 입력하세요!!");
		pRegi.pqty.focus();
		return;
	}
	
	if(document.pRegi.price.value.length == 0){
		alert("가격을 입력하세요!!");
		pRegi.price.focus();
		return;
	}
	
	if(document.pRegi.pcontent.value.length == 0){
		alert("내용을 입력하세요!!");
		pRegi.pcontent.focus();
		return;
	}
	
	if(document.pRegi.point.value.length == 0){
		alert("포인트를 입력하세요!!");
		pRegi.point.focus();
		return;
	}
	
	document.pRegi.submit();
}
</script>


<jsp:include page="ad_footer.jsp"/> 