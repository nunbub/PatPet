<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 게시물 디테일 페이지</title>

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
	
		<section>
			
			
			<div class="d-flex m-4 justify-content-between align-items-center">
				<h1>${detailPost.post.title }</h1>	
				
				<!-- 관심 버튼 -->
				<div class="d-flex">
					<div class="mr-2">관심 ${detailPost.attentionCount }명</div>
					<c:choose>		
						<c:when test="${detailPost.attention }">							
							<a href="#" class="nonattention-btn" data-post-id="${detailPost.post.id }"><i class="bi bi-heart-fill text-danger"></i></a>
						</c:when>
						<c:otherwise>							
							<a href="#" class="attention-btn" data-post-id="${detailPost.post.id }"><i class="bi bi-heart"></i></a>
						</c:otherwise>					
					</c:choose>
				</div>
				<!-- /관심 버튼 -->
			</div>
			
			<!-- 게시물 내용 -->
			<div class="ml-4"><fmt:formatDate value="${detailPost.post.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			
			<div class="m-4 d-flex">
				<div><img src="${detailPost.post.imagePath }" width="400" height="400"></div>
				
				<div class="ml-4">
					<div class="detail-name">이름 : ${detailPost.post.name }</div>
					<div class="mt-3 detail-content p-3">${detailPost.post.content }</div>
				</div>
			</div>
			<!-- /게시물 내용 -->
			
			<!-- 버튼들 -->
			<div class="d-flex justify-content-between">
				<div class="m-3 d-flex">
					<c:if test="${userId eq detailPost.post.userId}">
					<button type="button" class="btn btn-block btn-danger m-2" id="deleteBtn" data-post-id="${detailPost.post.id }" data-post-category="${detailPost.post.category }">삭제하기</button>
					<a href="/post/update/view?id=${detailPost.post.id }" class="btn btn-primary m-2 text-white" id="updateBtn">수정하기</a>
					</c:if>
				</div>
				
				<div class="my-4">
					<c:if test="${not empty userId}">
					<a href="/question/create/view" class="btn btn-warning mr-2">문의하기</a>
					</c:if>
					
					<a href="/post/list/view?category=${detailPost.post.category }" class="btn btn-secondary">목록으로</a>
					
				</div>
			</div>
			<!-- /버튼들 -->
			
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	$(document).ready(function() {
		
		$(".nonattention-btn").on("click", function(e) {
			
			e.preventDefault();
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get"
				, url:"/post/nonattention"
				, data:{"postId":postId}
				, success:function(data) {
					
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 취소 실패");
					}
					
				}
				, error:function() {
					alert("좋아요 취소 에러");
				}
			});
			
		});
		
		$(".attention-btn").on("click", function(e) {
			
			e.preventDefault();
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"get"
				, url:"/post/attention"
				, data:{"postId":postId}
				, success:function(data) {
					
					if(data.result == "success") {
						location.reload();
					} else {
						alert("좋아요 실패");
					}
					
				}
				, error:function() {
					alert("좋아요 에러");
				}
			});
			
		});
		
		$("#deleteBtn").on("click", function() {
			let postId = $(this).data("post-id");
			let category = $(this).data("post-category");
			
			$.ajax({
				type:"get"
				, url:"/post/delete"
				, data:{"postId":postId, "category":category}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href="/post/list/view?category="+category;
					} else {
						alert("삭제 실패");
					}
					
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
		});
		
	});
	
	</script>
</body>
</html>