<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 문의하기 입력 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
  	<c:import url="/WEB-INF/jsp/include/font.jsp" />
  	
</head>
<body>

	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
			<div class="review-main mt-3">문의 하기</div>
			<!-- 문의 하기 제목 -->
			<div class="d-flex align-items-center mt-4">
				<div class="create-font col-1 my-4">제목</div>
				<input type="text" class="form-control" id="titleInput">
			</div>
			<!-- /문의 하기 제목 -->
			
			<!-- 문의 하기 버튼을 누른 게시물의 정보 -->
			<div class="d-flex align-items-center">
				<div class="create-font my-3 ml-2 mr-3">아이 이름 : </div>
				<div class="create-font">${questionDetail.post.name }</div>
			</div>
			
			<div class="d-flex align-items-center">
				<div class="create-font my-3 ml-2 mr-3">분류 : </div>
				<div class="create-font">
					<c:if test="${questionDetail.post.category == 'dog' }">
						강아지
					</c:if>
					<c:if test="${questionDetail.post.category == 'cat' }">
						고양이
					</c:if>
					<c:if test="${questionDetail.post.category == 'etc' }">
						기타 동물
					</c:if>
				</div>
			</div>
			<!-- /문의 하기 버튼을 누른 게시물의 정보 -->
			
			<!-- 문의 내용 -->
			<div class="mb-5">
				<div class="create-font my-3 ml-2">문의 내용</div>
				<textarea class="form-control mt-4" rows="13" id="contentInput"></textarea>
			</div>
			<!-- /문의 내용 -->
			
			<!-- 버튼들 -->
			<div class="mb-4 d-flex justify-content-between align-items-center">
				<a href="/post/detail/view?id=${questionDetail.post.id }" class="btn listbtn-font">목록으로</a>
				
				<button type="button" id="createBtn" class="btn createbtn-font" 
				data-post-id="${questionDetail.post.id }" data-login-id="${userId }" 
				data-postuser-id="${questionDetail.post.userId }">
				등록하기</button>
			</div>
			<!-- /버튼들 -->
			
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#createBtn").on("click", function() {
			
			let title = $("#titleInput").val();
			let content = $("#contentInput").val();
			
			let postId = $(this).data("post-id");
			let loginId = $(this).data("login-id");
			let isAnswer = 0;
			let postUserId = $(this).data("postuser-id")
			
			
			
			
			if(title == "") {
				alert("제목을 입력해주세요.");
				return ;
			}
			
			if(content == "") {
				alert("문의하실 내용을 입력해주세요.");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/question/create"
				, data:{"postId":postId, "loginId":loginId, "postUserId":postUserId, "isAnswer":isAnswer, "title":title, "content":content}
				, success:function(data) {
					
					if(data.result == "success"){
						location.href="/question/list/view?loginId="+loginId+"&receive=F";
					} else {
						alert("업로드 실패");
					}
					
				}
				, error:function() {
					alert(isAnswer);
				}
			});
			
		});
		
	});
	</script>

</body>
</html>