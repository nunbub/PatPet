<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패트펫 메인 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>

	<div class="container" id="main-page">
		
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<hr>
		
		<!-- 메뉴 -->
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		<!-- /메뉴 -->		
		
		<!-- 메인 페이지 -->
		<section class="main-content mt-4">
			<!-- 메인페이지 배너 이미지 -->
			<div class="d-flex justify-content-center align-items-center">
				<a href="https://www.animal.go.kr/front/index.do" target="_blank"><img src="/static/image/main-image/main-image1.jpg" width="1100" height="550" id="mainImage"></a>
				
			</div>
			<!-- /메인페이지 배너 이미지 -->
					
			<div class="d-flex justify-content-around my-4">
				<!-- 최근에 올라온 게시물 -->
				<c:choose>
					<c:when test="${mainPost.post == null }">
						<div class="col-6">
							<div class="main-animal text-center">새로운 친구</div>
							
							<div class="null-post d-flex justify-content-center align-items-center">아직 새로운 친구가 없습니다.</div>
						</div>	
					</c:when>
					<c:otherwise>					
						<div class="col-6">
							<div class="main-animal text-center">새로운 친구</div>
							<div class="d-flex justify-content-center align-items-center">
							
								<div class="mt-3 text-center">
									<img src="${mainPost.post.imagePath}" width="525" height="350">
									<div class="mainPostTitle"><b>${mainPost.post.title}</b></div>
									<div class="text-secondary">작성자 [ ${mainPost.postUser.name} ]</div>
								</div>
								
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- /최근에 올라온 게시물 -->
								
				<!-- 최근에 올라온 이후 이야기 -->
				<c:choose>
					<c:when test="${mainPost.review == null }">
						<div class="col-6">
							<div class="main-review text-center">새로운 이후 이야기</div>
							
							<div class="null-post d-flex justify-content-center align-items-center">아직 새로운 이야기가 없습니다.</div>
						</div>	
					</c:when>
					<c:otherwise>
						<div class="col-6">
							<div class="main-review text-center">새로운 이후 이야기</div>
							
							<div class="d-flex justify-content-center align-items-center">
						
								<div class="mt-3 text-center">
									<img src="${mainPost.review.imagePath }" width="525" height="350">
									<div class="mainPostTitle"><b>${mainPost.review.title }</b></div>
									<div class="text-secondary">작성자 [ ${mainPost.reviewUser.name } ] </div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				
				
				<!-- /최근에 올라온 이후 이야기 -->
			</div>
			
		</section>
		<!-- /메인 페이지 -->
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	 
	$(document).ready(function() {
		
		var mainImageList = [
			"/static/image/main-image/main-image1.jpg"
			, "/static/image/main-image/main-image2-1.jpg"
			, "/static/image/main-image/main-image2.jpg"
			, "/static/image/main-image/main-image3.jpg"
			, "/static/image/main-image/main-image4.jpg"
			, "/static/image/main-image/main-image5.jpg"]
		var currentImageIndex = 0;
		
		setInterval(function() {
			$("#mainImage").attr("src", mainImageList[currentImageIndex]);
			currentImageIndex++;
			
			if(currentImageIndex == mainImageList.length) {
				currentImageIndex = 0;
			}
		}, 5000);
		
	});
	
	
		
	</script>

</body>
</html>