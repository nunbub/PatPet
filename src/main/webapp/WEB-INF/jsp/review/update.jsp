<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 이후이야기 게시물 수정 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>

	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
		
			<div class="mt-3 review-title">이후이야기 수정하기</div>
			
			<div class="d-flex mt-4 justify-content-center align-items-center">
				<div class="col-1 update-style">제목</div>
				 <input type="text" id="titleInput" class="form-control" value="${detailReview.review.title }">
			</div>
			
			<div class="d-flex align-items-center mt-4">
				<div class="mr-3 ml-2 mt-2 update-style">아이의 사진</div> <a href="#"><i id="imageIcon" class="bi bi-card-image text-dark fileIcon"></i></a>
				<input type="file" id="fileInput" class="d-none">
			</div>
			
			<div class="my-4 ml-2">
				<div class="mb-3 update-style">입양 이후의 이야기를 들려주세요!</div>
				<textarea id="contentInput" class="form-control" rows="10">${detailReview.review.content }</textarea>
			</div>
			
			<div class="d-flex justify-content-between align-items-center pl-2 mb-4">
				<a href="review/main/view" class="btn btn-secondary">목록으로</a>
				
				<button type="button" class="btn btn-success" id="updateBtn">수정하기</button>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#updateBtn").on("click", function() {
			
			let title = $("#titleInput").val();
			let content = $("#contentInput").val();
			
			let postId = $(this).data("post-id");
			
			if(title == "") {
				alert("제목을 입력해주세요.");
				return ;
			}
			
			if(content == "") {
				alert("내용을 입력해주세요.");
				return ;
			}
			
			if($("#fileInput")[0].files.length == 0) {
				alert("아이의 사진을 업로드해주세요.");
				return ;
			}
			
			let formData = new FormData();
			
			formData.append("postId", postId);
			formData.append("title", title);
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post"
				, url:"/review/update"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data) {
					
					if(data.result == "success") {
						location.href="/review/detail/view?id="+postId
					} else {
						alert("수정 실패");
					}
					
				}
				, error:function() {
					alert("수정 에러");
				}
			});
			
		});
		
		$("#imageIcon").on("click", function() {
			$("#fileInput").click();
		});
		
	});
	</script>

</body>
</html>