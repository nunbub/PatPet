<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 게시물 입력 페이지</title>

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
			<div class="d-flex justify-content-between">
				<div class="create-post p-3">게시물 등록하기</div>
				<div class="d-flex align-items-center p-3">
					<button type="button" class="btn btn-success">수정하기</button>
					
				</div>
			</div>
			
			<!-- 게시물 입력창 -->
			<div>
				<!-- 게시물 제목 -->
				<div class="d-flex align-items-center justify-content-center">
					<div class="text-center col-1">제목</div> <input type="text" placeholder="제목을 입력해주세요." class="form-control col-11" id="titleInput">
				</div>
				<!-- /게시물 제목 -->
				
				<!-- 이름, 분류, 상태 -->
				<div class="mt-3 d-flex align-items-center justify-content-center">
					<!-- 아이 이름 -->
					<div class="col-4 d-flex align-items-center justify-content-center">
						<div class="col-3">이름</div> <input type="text" placeholder="아이의 이름을 입력해주세요." class="form-control col-9" id="nameInput">
					</div>
					<!-- /아이 이름 -->
					
					<!-- 아이 분류 -->
					<div class="d-flex col-4 align-items-center justify-content-center">
						<div class="ml-2 col-3">분류</div>
						<select class="form-control col-8" id="categorySelect">
							<option value="nonselect">--분류 선택--</option>
							<option value="dog">강아지</option>
							<option value="cat">고양이</option>
							<option value="etc">기타 동물</option>
						</select>
					</div>
					<!-- /아이 분류 -->
					
					<!-- 아이 상태 -->
					<div class="d-flex col-4 align-items-center justify-content-center">
						<div class="ml-2 col-3">상태</div>
						
						<select class="form-control col-8" id="stateSelect">
							<option value="nonselect">--상태 선택--</option>
							<option value="입양 대기">입양 대기</option>
							<option value="입양 완료">입양 완료</option>
						</select>
					</div>
					<!-- /아이 상태 -->
					
				</div>
				<!-- /이름, 분류, 상태 -->
				
				<!-- 사진 업로드 -->
				<div class="d-flex align-items-center col-5 mt-3">
					<div class="col-5">아이의 사진 업로드</div>
					
					<div class="pb-2">
					<a href="#" id="imageIcon"> <i class="bi bi-card-image text-dark"></i> </a>
					<input type="file" id="fileInput" class="d-none">
					</div>
				</div>
				<!-- /사진 업로드 -->
				
				<!-- 게시물 내용 -->
				<div class="mt-3 mb-5 ml-4 pl-2">
					<div>아이를 소개해 주세요.</div>
					<textarea class="form-control mt-3" rows="10" cols="50" placeholder="아이를 소개해주세요." id="introduce-textbox"></textarea>
				</div>
				<!-- /게시물 내용 -->
				
			</div>
			<!-- /게시물 입력창 -->
			<div class="d-flex justify-content-between align-items-center p-3">
				<a href="/post/list/view?category=${post.category }" class="btn btn-secondary">목록으로</a>
				<button type="button" class="btn btn-primary" id="createBtn">등록하기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

	<script>
	$(document).ready(function() {
		
		$("#createBtn").on("click", function() {
			
			let title = $("#titleInput").val();
			let name = $("#nameInput").val();
			let category = $("#categorySelect").val();
			let state = $("#stateSelect").val();
			let content = $("#introduce-textbox").val();
			
			if(title == "") {
				alert("제목을 입력해주세요.");
				return ;
			}
			
			if(name == "") {
				alert("아이의 이름을 입력해주세요.");
				return ;
			}
			
			if(category == "nonselect") {
				alert("아이의 분류를 선택해주세요.");
				return ;
			}
			
			if(state == "nonselect") {
				alert("아이의 입양 상태를 선택해주세요.");
				return ;
			}
			
			if(content == "") {
				alert("아이의 소개를 작성해주세요.");
				return
			}
			
			if($("#fileInput")[0].files.length == 0) {
				alert("아이의 사진을 업로드해주세요.");
				return ;
			}
			
			let formData = new FormData();
			formData.append("title", title);
			formData.append("name", name);
			formData.append("category", category);
			formData.append("state", state);
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				type:"post"
				, url:"/post/create"
				, data:formData
				, enctype:"multipart/form-data"
				, processData:false
				, contentType:false
				, success:function(data) {
					
					if(data.result == "success") {
						location.href="/post/list/view?category="+category;
					} else{
						alert("업로드 실패");
					}
				}
				,error:function() {
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