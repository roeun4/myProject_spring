<%@page import="kr.ezen.imeco.domain.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<%@ include file="../include/header.jsp" %>	
                                                 
<div class='container mt-5 d-flex'>
	<aside style="width: 200px;" class="border-end">
		<h4>마이페이지</h4>
		<ul>
			<li><a href="">비밀번호 변경</a></li>
			<li><a href="">회원탈퇴</a></li>
			<li><a href="">기타</a></li>
		</ul>
	</aside>
	
	<div class="conatiner m-auto" style="width: 300px;">
		<h4>비밀번호 변경</h4>
		
		<input type="hidden" id="memberId" value="${sessionScope.loginDTO.id}"/>
		<input type="hidden" value="${sessionScope.loginDTO.pw}"/>
		
		<input type="text" class="form-control mb-3 mt-3" id="pw" name="pw" placeholder="현재비밀번호">
		<input type="text" class="form-control mb-2" id="newPw" name="newPw" placeholder="새비밀번호">
		<p id="pwChkMsg"></p>
		<input type="text" class="form-control mb-3" id="confirmPw" name="confirmPw" placeholder="새비밀번호 확인">
		
		<div class="text-center">
			<button id="pwChangeBtn" class="btn btn-sm btn-success">비밀번호 변경</button>
		</div>
	</div>
</div>

<script>
	let pw="";
	let currentPwChk="";
	
	// 현재 비밀번호 체크
	function pwCheck(){
		pw = $("#pw").val();
		
		$.ajax({
			url:"<c:url value='pwCheck.do' />",
			type:"post",
			data:{"pw":pw},
			async:false, // 동기화 처리로 설정, 기본값 true
			success:function(result){
				console.log("result : " + result);
				if(result == "ok"){
					alert("현재 비밀번호 확인 완료!");
					currentPwChk=true;
				}else{
					alert("현재 비밀번호 다시 확인 요망!");
					currentPwChk=false;
				}
			},
			error:function(){alert("현재 비밀번호 체크 요청 실패!")}
		});
	}
	
	let newPwChk="";
	// 새비밀번호 유효성 체크
	$("#newPw").on("keyup", function(){
		let npw = $("#newPw").val();
		if(npw == ""){
			$("#pwChkMsg").text("새 비밀번호를 입력하세요");         
			newPwChk=false;
		}else if(npw.length < 4){
			$("#pwChkMsg").text("4자리 이상 입력하세요");
			newPwChk=false;
		}else{
			if($("#confirmPw").val()){
				if($("#confirmPw").val() != npw) {
					newPwChk=false;
					return;
				}
				newPwChk=true;
			}else{
				$("#pwChkMsg").text("");
				newPwChk=true;
			}
		}
	});
	
	let newConfirmPwChk="";
	/*  새비밀번호 확인 체크 */
	$("#confirmPw").on("keyup", function() {
		let cpw = $("#confirmPw").val();
		if(cpw == ""){
			$("#pwChkMsg").text("확인 비밀번호를 입력하세요");
			newConfirmPwChk=false;
		}else if($("#newPw").val() != cpw){
			$("#pwChkMsg").text("비밀번호가 일치하지 않습니다");
			newConfirmPwChk=false;
		}else if($("#newPw").val() == cpw){
			$("#pwChkMsg").text("");
			newPwChk=true;
		}
	});
	
	// 비밀번호 변경 요청
	$("#pwChangeBtn").on("click", function(){
		pwCheck();
		
		if(!currentPwChk){
			alert("현재 비밀번호를 확인하세요!");
		}else if(!newPwChk){
			alert("새비밀번호를 다시 확인하세요!");
		}else if(!newConfirmPwChk){
			alert("새비밀번호가 일치 하지 않습니다.. 다시 확인하세요!");
		}else if(currentPwChk && newPwChk && newConfirmPwChk){
			console.log("새비밀번호로 변경처리");
			let id = $("#memberId").val();
			let pw = $("#newPw").val();
			// member는 자바스크립트 객체, json 만들기
			let member = {"id":id, "pw":pw}
			
			$.ajax({
				url:"<c:url value='pwChange.do' />",
				type:"post",
				// 자바스크립트 객체를 전송할 수 없기 때문에
				// JSON형태의 문자열로 변환
				data:JSON.stringify(member),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					if(result > 0){
						alert("비밀번호 변경 완료! 새로운 비밀번호로 로그인 하세요!!");
						location.href="<c:url value='logout.do' />";
					}
				},
				error:function(){alert("비밀번호 변경 요청 실패!!")}
			})
		}
		
	});
	
</script>

<%@ include file="../include/footer.jsp" %>
