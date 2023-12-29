<%@page import="kr.ezen.imeco.domain.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 공유된 request에서 memberList  가져오기
	ArrayList<MemberDTO> memberList= 
		(ArrayList<MemberDTO>)request.getAttribute("list");
%>

<%@ include file="../admin/ad_header.jsp" %>	
                                                                                                
	<div class='container mt-5 text-center'>                                                                     
		<h2>회원 리스트</h2>                                                                         
		<table class='table'>                                                                        
			<thead class='table-dark text-center'>                                                               
				<tr>                                                                                 
					<th>번호</th>                                                                  
					<th>아이디</th>                                                                  
					<th>비밀번호</th>                                                                
					<th>이름</th>                                                                    
					<th>생년월일</th>                                                                    
					<th>이메일</th>                                                                  
					<th>전화번호</th>                                                                
					<th>삭제</th>                                                                    
				</tr>                                                                                
			</thead>                                                                                 
			<tbody>                                                                                  

<% for(MemberDTO dto : memberList) { %>
			<tr>                                                                                     
				<td><%=dto.getNo()%></td>                                                             
				<td><a href='memberInfo.do?no=<%=dto.getNo()%>'><%=dto.getId()%></a></td>       
				<td><%=dto.getPw()%></td>                                                             
				<td><%=dto.getName()%></td>                                                           
				<td><%=dto.getDob()%></td>                                                            
				<td><%=dto.getEmail()%></td>                                                          
				<td><%=dto.getTel()%></td>                                                            
				<td><input type="button" class='btn btn-danger btn-sm' value="삭제" onclick="delMember(<%=dto.getNo()%>)"></td>
			</tr>                                                                                     
<% } %>
			</tbody>                                                                          
		</table>                                                                              
	</div>      
	<script>
		function delMember(no){
			location.href="memberDelete.do?no="+no;
		}
	</script>                                                                              
<%@ include file="../admin/ad_footer.jsp" %>


