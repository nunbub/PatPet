<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패트펫 강아지 게시물 페이지</title>

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
			
			<div class="d-flex m-3">
				<div class="col-4 dog-title text-center main-dog">
					<h3 class="mt-2">강아지를 '쓰다듬다'</h3>
				</div>
				
				<div class="small text-secondary ml-4">
					개는 자신보다 당신을 더 사랑하는 이 세상의 유일한 생명체입니다. <br>
					- Josh Billings -
				</div>
			</div>
			
			<!-- 등록된 게시물 리스트 -->
			<div class="d-flex justify-content-evenly align-items-center post-list my-4 ml-5">
				<c:forEach var="post" items="${post }">
				<div class="m-4">
					<img src="${post.imagePath }" width="300" height="300">	
					<div>
						<div><b>${post.title }</b></div>
						<div class="state">${post.state }</div>
						<div class="small text-secondary">${post.updatedAt }</div>
					</div>				
				</div>	
				</c:forEach>
			
			</div>
			<!-- /등록된 게시물 리스트 -->
			
			<!-- 게시물 작성 아이콘 -->
			<c:if test="${not empty userId }">
			<div class="d-flex justify-content-end mb-4 mr-3">
				<a href="/post/create/view"><i class="bi bi-pencil-square create-btn"></i></a>
			</div>
			</c:if>
			<!-- /게시물 작성 아이콘 -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>

</body>
</html>