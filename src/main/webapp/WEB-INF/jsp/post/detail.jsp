<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt %>      
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
			<div>
				<div>제목</div>
				<div>관심 5명 + 하트 아이콘</div>
			</div>
			<div>게시물 등록 날짜</div>
			
			<div>
				<div><img src=""></div>
				
				<div>
					<div>이름</div>
					<div>내용</div>
				</div>
			</div>
			
			<div>
				<%-- <c:if test="${not empty loginId }"> --%>
				<button type="button" class="btn btn-block btn-danger">삭제하기</button>
				<%-- </c:if> --%>
				<a href="/post/">목록으로</a>
				
				<%-- <c:if test="${not empty loginId }"> --%>
				<a href="/question/create/view">문의하기</a>
				<button type="button" class="btn btn-bolck btn-primary">수정하기</button>
				<%-- </c:if> --%>
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</body>
</html>