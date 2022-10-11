<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패트펫 게시물 디테일 페이지</title>

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
				<h1>${post.title }</h1>
				<div>관심 5명 + 하트 아이콘</div>
			</div>
			<div class="ml-4"><fmt:formatDate value="${post.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
			
			<div class="m-4 d-flex">
				<div><img src="${post.imagePath }" width="400" height="400"></div>
				
				<div class="ml-4">
					<div class="detail-name">이름 : ${post.name }</div>
					<div class="mt-3 detail-content p-3">${post.content }</div>
				</div>
			</div>
			
			<div class="d-flex">
				<div class="m-3">
					<c:if test="${user.id eq post.userId}">
					<button type="button" class="btn btn-block btn-danger">삭제하기</button>
					</c:if>
					
					<a href="/post/" class="btn btn-secondary">목록으로</a>
					
				</div>
				
				<div>
					<c:if test="${user.id eq post.userId}">
					<a href="/question/create/view">문의하기</a>
					<button type="button" class="btn btn-block btn-primary">수정하기</button>
					<</c:if>
				</div>
			</div>
			
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	
	
	</script>
</body>
</html>