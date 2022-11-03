<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 이후 이야기 작성 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div class="container">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
			<div id="create-review" class="my-4 ml-2">이후 이야기</div>
			
			<!-- 이후 이야기 게시물 제목 -->
			<div class="d-flex align-items-center mt-3">
				<div class="col-1 review-letter p-0 ml-2">제목</div><input id="titleInput" type="text" class="form-control col-11" placeholder="제목을 입력해주세요">
			</div>
			<!-- /이후 이야기 게시물 제목 -->
			
			<!-- 이후 이야기 이미지 파일 -->
			<div class="d-flex align-items-center ml-2 mt-4">
				<div class="mr-3 mt-2 review-letter">아이의 사진</div>
				<a href="#" id="imageIcon"><i class="bi bi-card-image text-dark fileIcon"></i></a>
				<input type="file" id="fileInput" class="d-none" name="uploadFile" multiple>
				
				<div class="text-danger ml-4 mt-2 small">※ 사진은 최대 5개까지 등록이 가능합니다.</div>
			</div>
			<!-- /이후 이야기 이미지 파일 -->
			
			<!-- 이후 이야기 게시물 내용 -->
			<div>
				<div class="review-letter ml-2 mt-5">입양 이후의 이야기를 들려주세요 !</div>
				<textarea id="contentInput" placeholder="내용을 입력해주세요" class="form-control my-3" rows="10"></textarea>
			</div>
			<!-- /이후 이야기 게시물 내용 -->
			
			<!-- 버튼들 -->
			<div class="d-flex justify-content-between align-items-center mb-4">
				
				<a href="/review/main/view" class="btn btn-secondary">목록으로</a>
				
				<button type="button" class="btn btn-primary" id="createBtn">등록하기</button>
				
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
				
				var formData = new FormData();
				var inputFile = $("input[name='uploadFile']")
				var files = inputFile[0].files;
				
				for(var i = 0; i < files.length; i++) {
					formData.append("file", files[i]);
					
					if(files.length > 5) {
						alert("사진은 최대 5개까지 선택 가능합니다.");
						return ;
					}
				}
				
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
				
				
				formData.append("title", title);
				formData.append("content", content);
				
				
				$.ajax({
					type:"post"
					, url:"/review/create"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data) {
						
						if(data.result == "success") {
							location.href="/review/main/view";
						} else {
							alert("업로드 실패");
						}
						
					}
					, error:function() {
						alert("업로드 에러");
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