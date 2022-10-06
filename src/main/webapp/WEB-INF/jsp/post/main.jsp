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
		<nav class="main-menu justify-content-center d-flex">
			<div class="col-9">
				<ul class="nav justify-content-between text-center">
					<li class="nav-item"><a class="nav-link" href="/post/introduce/view"><b class="text-dark">페트펫 소개</b></a></li>
					<li class="nav-item"><a class="nav-link" href="/post/dog/view"><b class="text-dark">함께 해주세요</b></a>					
						<ul class="detail-menu">
							<li class="mt-3"><a href="/post/dog/view">강아지를 '쓰다듬다'</a></li>
							<li class="mt-3"><a href="/post/cat/view">고양이를 '쓰다듬다'</a></li>
							<li class="my-3"><a href="/post/etc/view">기타동물을 '쓰다듬다'</a></li>
						</ul>						
					</li>
					<li class="nav-item"><a class="nav-link" href="/review/main/view"><b class="text-dark">이후 이야기</b></a></li>
					
					<c:if test="${not empty uesrId }" >
						<li class="nav-item"><a class="nav-link" href="/question/list/view"><b class="text-dark">문의하기</b></a></li>
					</c:if>
				</ul>
			</div>
		</nav>
		<!-- /메뉴 -->
		<hr>
		<!-- 메인 페이지 -->
		<section class="main-content mt-4">
			<!-- 강아지를 '쓰다듬다' -->
			<div class="main-dog">
				<div class="col-4 dog-title text-center">
					<h3>강아지를 '쓰다듬다'</h3>
				</div>
				
				<!-- 강아지 게시물 -->				
				<div class="d-flex">
					<c:forEach var="i" begin="1" end="4" step="1">
				 	<div class="m-3">
						<img src="https://cdn.pixabay.com/photo/2016/12/13/05/15/puppy-1903313__340.jpg" width="250" height="250">
						<div class="text-center">제목</div>
					</div>
					</c:forEach>
				</div>
				<!-- /강아지 게시물 -->
				
			</div>
			<!-- /강아지를 '쓰다듬다' -->
			
			<!-- 고양이를 '쓰다듬다' -->
			<div class="main-cat">
				<div class="col-4 cat-title text-center">
					<h3>고양이를 '쓰다듬다'</h3>
				</div>
				
				<!-- 고양이 게시물 -->				
				<div class="d-flex">
					<c:forEach var="i" begin="1" end="4" step="1">
				 	<div class="m-3">
						<img src="https://cdn.pixabay.com/photo/2014/11/30/14/11/cat-551554__340.jpg" width="250" height="250">
						<div class="text-center">제목</div>
					</div>
					</c:forEach>
				</div>
				<!-- /고양이 게시물 -->
			</div>
			<!-- /고양이를 '쓰다듬다' -->
		
		</section>
		<!-- /메인 페이지 -->
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
</html>