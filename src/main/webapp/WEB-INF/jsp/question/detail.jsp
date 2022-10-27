<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 문의 디테일 페이지</title>

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
		
			<div class="question-detail m-4">${questionDetail.question.title }</div>
			
			<div class="d-flex align-items-center">
				<div class="mr-4 ml-3 question-info">아이 이름 : </div>
				<div>${questionDetail.post.name }</div>
			</div>
			
			<div class="my-4 ml-3">
				<div class="question-detail mb-4">Q.</div>
				<div class="question-box">${questionDetail.question.content }</div>
			</div>
			
			<div class="my-4 ml-3">
				<div class="question-detail mb-4">A.</div>
				
					<!-- 작성된 답변이 없을 경우 -->
					<c:if test="${questionDetail.question.isAnswer == 0 }">
					<div class="non-answer">아직 작성된 답변이 없습니다.</div>
					</c:if>
					
					<!-- 작성된 답변이 있을 경우 -->
					<c:if test="${questionDetail.question.isAnswer == 1 }">
					<div class="question-box">${questionDetail.answer.content }</div>
					</c:if>
			</div>
			
			<!-- 버튼들 -->
			<div class="d-flex justify-content-between align-items-center my-5">
				<a href="/question/list/view?loginId=${userId }" class="btn btn-secondary">목록으로</a>
				<!-- 문의를 받은 게시물의 사용자 에게만 답변하기 버튼 보이기 -->
				<c:if test="${questionDetail.post.userId eq userId && questionDetail.question.isAnswer == 0 }">
				<a href="/question/answer/view?questionId=${questionDetail.question.id }" class="btn btn-info">답변하기</a>
				</c:if>
			</div>
			<!-- /버튼들 -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>

</body>
</html>