<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 이후이야기 디테일 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
		
		<!-- 디테일 카드 -->
		<div class="review-title mt-3">${reviewDetail.review.title}</div>
		<div class="mt-3 review-info">
			<div >작성자 : ${reviewDetail.user.name }</div>
			<div class="mt-2">작성 일자 : <fmt:formatDate value="${reviewDetail.review.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
		</div>
		
		<div class="d-flex mt-4 align-itmes-center">
			<div><img src="${reviewDetail.review.imagePath }" width="520" height="500"></div>
			<div class="ml-4 review-content p-3">
				<div>${reviewDetail.review.content }</div>
			</div>	
		</div>
		<!-- /디테일 카드 -->
		
		<!-- 버튼들 -->
		<div class="d-flex justify-content-between align-items-center my-4">
			<a href="/review/main/view" class="btn btn-secondary">목록으로</a>
			<div>
				<a href="/review/update/view?id=${reviewDetail.review.id }" class="btn btn-success mr-3">수정하기</a>
				<button type="button" class="btn btn-danger">삭제하기</button>
			</div>
		</div>
		<!-- /버튼들 -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>

</body>
</html>