<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 소개 페이지</title>
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
			<div class="d-flex justify-content-between align-items-center">
				<div class="m-4 col-5">
					<img src="/static/image/introduce-image.jpg" width="450">
				</div>
				
				<div class="col-7 p-3">
					<div class="d-flex">
						<div class="patpet">패트펫은?</div>
						<span class="text-secondary pl-3 pt-4">[ Pat, Pet ]</span>
					</div>
					
					<div class="pt-5">
						'쓰다듬다' 라는 뜻의 <b class="introduce">Pat</b> <br>
						'반려동물' 이라는 뜻의 <b class="introduce">Pet</b> 을 합친 말로,
					</div>
					
					<div class="intent text-center pt-5">
						' 모든 반려동물은 사랑가득한 쓰다듬을 받을 수 있다 '
					</div>
					
					<div class="pt-5">
						라는 의미로, <br>
						상처받은 아이들에게 새로운 가족을 찾아주고자 만들게 되었습니다.
					</div>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>