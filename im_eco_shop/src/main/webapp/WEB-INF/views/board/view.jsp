<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<%@ include file="../include/header.jsp" %>	

<div class="container w-50 mt-5 p-5 border rounded">
	<div class="form-group d-flex justify-content-between">
		<div>
			<label for="bid">번호</label>        
			<input type="text" id="bid" name="bid" value="${dto.bid}" disabled style="border: none; background-color: #fff;">
		</div>
		<div>
	     	${dto.writer}
		</div>
	</div>
	<div class="form-group mt-4 border-bottom">
		<h3>${dto.subject}</h3>
	</div>
	<div class="form-group mt-2 p-2" style="height: 150px;">
     	${dto.contents}
	</div>
     
	<div class="text-center mt-3">
        <button id="btn-modify" class="btn btn-primary me-2">수정하기</button>   
        <button id="btn-list" class="btn btn-primary">목록</button>
	</div>
	
	<!---- 댓글 UI START ---->
	<div class="mt-5 mb-3 d-flex justify-content-between">
		<h6><i class='far fa-comments'></i> 댓글</h6>
		<button id="btn-addRelpy" class="btn btn-sm btn-outline-secondary" data-bs-target="#replyModal" data-bs-toggle="modal">새댓글</button>
	</div>
	<!-- 댓글 리스트 영역 -->
	<ul class="replyArea p-0">
		
	</ul>
	
	<!-- pagination Area -->
	<ul class="pagination justify-content-center my-5">
		
	</ul>
	
	<!---- 댓글 UI END ---->
</div>

<!-- The Modal -->
<div class="modal fade" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h5 class="modal-title">댓글 달기</h5>
      </div>

      <!-- Modal body -->
      <div class="modal-body p-4">
      	<div class="mb-2">
      	  <label>댓글 내용</label>
      	  <textarea class="form-control" id="r_contents"></textarea>
      	</div>
      	<div class="mb-2">
      	  <label>댓글 작성자</label>
      	  <input type="text" class="form-control" id="replyer" name="replyer"/>
      	</div>
      	<div class="mb-2 cr_date">
      	  <label>등록일</label>
      	  <input type="text" class="form-control" id="r_date" name="r_date"/>
      	</div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="btn-modal-modify" class="btn btn-sm btn-success">수정</button>
        <button type="button" id="btn-modal-remove" class="btn btn-sm btn-danger">삭제</button>
        <button type="button" id="btn-modal-register" class="btn btn-sm btn-primary">등록</button>
        <button type="button" id="btn-modal-close" class="btn btn-sm btn-secondary">닫기</button>
      </div>

    </div>
  </div>
</div>

<%@ include file="../include/footer.jsp" %>
<script src="../js/reply.js"></script>
<script>
	$(document).ready(function() {
		// 게시글 번호 구하기
		let bidVal = "${dto.bid}";
		
		let viewPage = 1;
		
		let replyArea = $(".replyArea");
		 
		// 페이지가 로드될 때 댓글을 화면에 출력
		displayList(viewPage);
		
		// 해당 게시판의 댓글을 가져와서 출력하기
//		function displayList(){
		function displayList(viewPage){
			let str = "";

			// 게시글에 해당하는 댓글 가져오기 함수 호출 후에 화면에 출력
//			replyFunc.getList(bidVal, function(list){ // list는 서버에서 전송된 댓글 리스트(배열)
			replyFunc.getList({bid:bidVal, viewPage:viewPage || 1}, function(data){
				console.log(data);
				let list = data.list;
			
				for(let i=0; i<list.length; i++){
					str += '<li class="mb-2 border rounded p-3 modal-li" data-rno="'+list[i].rno+'">'
					+'<div>'
					+'<div class="d-flex justify-content-between">'
					+'<h6>'+list[i].replyer+'</h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span>'
					+'</div>'
					+'<p>'+list[i].r_contents+'</p>'
					+'</div>'
					+'</li>'
				}//for
				replyArea.html(str);
				showPageNavi(data);
			});//replyFunc
				
		}// End of displayList
      	
      	/* 	pageNation 처리	 */
      	let pageArea = $(".pagination");
      	
      	// data는 자바의 rPageDto를 JSON형태로 받은것
      	function showPageNavi(data) {
			let prevPage = data.prevPage;
			let nextPage = data.nextPage;
			let blockStart = data.blockStart;
			let blockEnd = data.blockEnd;
			
			let totalPage = data.totalPage;
			let viewPage = data.viewPage;
			
			let str="";
			
			if(prevPage){
				str += '<li class="page-item">'
					+'<a class="page-link" href="'+prevPage+'">이전</a></li>';
			}
			
			for(let i = blockStart; i<=blockEnd; i++){
				let active = viewPage == i ? "active":"";
				
				str += '<li class="page-item '+active+'">'
					+'<a class="page-link" href="'+i+'">'+i+'</a></li>';
					
			}
			
			if(blockEnd < totalPage){
				str += '<li class="page-item">'
					+'<a class="page-link" href="'+nextPage+'">다음</a></li>';
			}
			
			pageArea.html(str);
		}// End of showPageNavi
		
		// 이벤트 위임, 발생한 기본 이벤트를 차단
		pageArea.on("click", "li a", function(e) {
			e.preventDefault(); // a 태그의 기본 이벤트(링크)를 차단
			
			let viewPage = $(this).attr("href");
			
			displayList(viewPage);
		});
		
			
		/* ------- Modal & Event 처리 ------- */
		let modal = $(".modal"); // modal 창 div
	      
		let taReplyContents = $("#r_contents");
		let inputReplyer = $("#replyer");
		let inputReplyDate = $("#r_date");
		
		let modifyBtn = $("#btn-modal-modify");
		let removeBtn = $("#btn-modal-remove");
		let registerBtn = $("#btn-modal-register");
		
		$("#btn-modal-close").on("click", ()=>{
		   modal.modal("hide"); //modal()함수사용
		});
		
		// 등록버튼과 삭제버튼 안보이도록 처리
		$("#btn-addReply").on("click", ()=>{
		   taReplyContents.val("");
		   inputReplyer.val("");
		   inputReplyer.attr("readonly", false);
		   
		   // 조상 중에 가장 가까운 div 선택해서 감추기
		   inputReplyDate.closest("div").hide();
		   
		   // 수정, 삭제 버튼 감추기
  		   //modal.find("button[id != btn-modal-close]").hide();
		   //registerBtn.show();
		   
 		   //modifyBtn.hide();
 		   //removeBtn.hide();
		});
		
		// modal의 등록버튼 클릭시
		registerBtn.on("click", ()=>{
		   if(taReplyContents.val().trim() ==""){
		      alert("댓글을 입력하세요!!")
		      taReplyContents.focus();
		      return;
		   }
		   
		   if(inputReplyer.val().trim() ==""){
		      alert("작성자를 입력하세요!!")
		      inputReplyer.focus();
		      return;
		   }
		   
		   let reply = {bid:bidVal, r_contents:taReplyContents.val(), replyer:inputReplyer.val()};
		   
		   replyFunc.register(reply, function(result){
		      modal.modal("hide"); // modal()함수 사용해서 modal 닫기
		      displayList(); // 추가된 댓글을 화면에 출력
		   })
      	});// End of 등록
      	
      	// 댓글 상세보기
      	$(".replyArea").on("click", "li", function(){
      		let rno = $(this).data("rno");
      		
      		$(".modal-title").text("댓글 보기");
      		
      		replyFunc.read(rno, function(reply){
      			// db에서 전달된 댓글 내용들을 모달창에 설정
      			let r_date = replyFunc.showDateTime(reply.r_date);
      			
      			taReplyContents.val(reply.r_contents);
      			inputReplyer.val(reply.replyer).attr("readonly", true);
      			inputReplyDate.val(reply.r_date).attr("readonly", true);
      			
      			inputReplyDate.closest("div").show();
      			
      			// 모달창에 선택한 댓글의 rno값을 임시저장
      			modal.data("rno", reply.rno)
      			
      			registerBtn.hide();
      			modifyBtn.show();
      			removeBtn.show();
      		})
      		
      		modal.modal("show");
      	}); // End of 댓글 상세보기
      	
      	// 댓글 수정
      	modifyBtn.on("click", function(){
      		// modal.data("rno")는 선택한 댓글의 rno를 의미
      		let reply = {rno:modal.data("rno"), r_contents:taReplyContents.val()};
      		
      		replyFunc.update(reply, function(result){
      			modal.modal("hide");
      			displayList(); // 수정된 내용 출력
      		})
      		
      	});
      	
      	// 댓글 삭제
      	removeBtn.on("click", function(){
      		let rno = modal.data("rno");
      		
      		replyFunc.remove(reply, function(){
      			modal.modal("hide");
      			displayList();
      		})
      	});
      	
	}); // End document.ready()

	
	$("#btn-list").click(()=>{
		location.href="<c:url value='/board/list.do?viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}'/>";
	});
	
	$("#btn-modify").click(()=>{
		location.href="<c:url value='/board/modify.do?bid=${dto.bid}&viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyword=${pDto.keyword}&cntPerPage=${pDto.cntPerPage}'/>";
	});
	
	
</script>
</body>
</html>