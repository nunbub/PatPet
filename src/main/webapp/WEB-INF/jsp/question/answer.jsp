<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 문의 답변 입력 페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
  	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
  	
  	<c:import url="/WEB-INF/jsp/include/font.jsp" />
  	
</head>
<body>

	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
			<div class="question-detail my-4">${questionDetail.question.title }</div>
			
			<div class="d-flex align-items-center mb-4 question-font">
				<div class="mr-3">아이 이름 : </div>
				<div>${questionDetail.post.name }</div>
			</div>
			
			<div class="mb-5">
				<div class="question-logo mb-4">Q.</div>
				<div class="question-font">${questionDetail.question.content }</div>
			</div>
			
			<div>
				<div class="question-logo mb-4">A.</div>
				<textarea class="form-control" id="answerInput" rows="12" placeholder="답변을 입력해주세요."></textarea>
			</div>
			
			<div class="d-flex justify-content-between align-items-center my-5">
				<a href="/question/list/view?" class="btn listbtn-font">목록으로</a>
				<button type="button" class="btn createbtn-font" id="answerBtn" data-question-id="${questionDetail.question.id }" data-answer-id="${questionDetail.question.isAnswer }">답변 등록</button>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#answerBtn").on("click", function() {
			
			let content = $("#answerInput").val();
			
			let questionId = $(this).data("question-id");
			let isAnswer = $(this).data("answer-id");
			
			if(content == "") {
				alert("답변을 입력해주세요.");
				return ;
			}
			
			
			
			$.ajax({
				type:"get"
				, url:"/question/answer"
				, data:{"content":content, "questionId":questionId, "isAnswer":isAnswer}
				, success:function(data) {
					
					if(data.result == "success"){
						location.href="/question/detail/view?questionId="+questionId;
					} else {
						alert("답변작성 실패");
					}
					 
				}
				, error:function() {
					alert("답변작성 에러");
				}
			});
			
		});
		
	});
	</script>
	
</body>
</html>