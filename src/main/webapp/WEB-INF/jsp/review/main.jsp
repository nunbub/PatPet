<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 이후 이야기 메인 페이지</title>

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
			<div class="review-main text-center mt-4 mb-2">이후 이야기</div>
			
			<div class="text-secondary text-center mb-3">Don't buy a pet, adopt one.</div>
			
			<!-- 이후 이야기 게시물 리스트 -->
			<div class="d-flex align-items-center post-list">
				
					<c:forEach var="reviewDetail" items="${reviewList }">
						
						<div class="review-box">
							<a href="/review/detail/view?id=${reviewDetail.review.id }">
								<img src="${reviewDetail.file.imagePath }" width="200" height="200"></a>
								
								<div class="text-center">
									<div><b>${reviewDetail.review.title }</b></div>
									<div>작성자 [ <b>${reviewDetail.reviewUser.name }</b> ]</div>
									<div><fmt:formatDate value="${reviewDetail.review.createdAt }" pattern="yyyy-MM-dd"/></div>
								</div>
							
						</div>
					</c:forEach>
				
			</div>
			<!-- /이후 이야기 게시물 리스트 -->
		</section>
		
		<div class="d-flex justify-content-end align-items-center my-3">
			<a href="/review/create/view"><i class="bi bi-pencil-square text-dark review-writer"></i></a>
		</div>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
</html>