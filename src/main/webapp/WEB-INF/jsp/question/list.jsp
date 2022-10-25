<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 문의하기 리스트 페이지</title>

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
			<div class="question-title my-4">나의 문의</div>
			
			<table class="table text-center">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>아이 이름</th>
						<th>분류</th>
						<th>작성 시간</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="questionDetail" items="${questionList }" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${questionDetail.question.title }</td>
						<td>${questionDetail.post.name }</td>
							<c:if test="${questionDetail.post.category eq 'dog'}">
								<td>강아지</td>
							</c:if>
							<c:if test="${questionDetail.post.category eq 'cat'}">
								<td>고양이</td>
							</c:if>
							<c:if test="${questionDetail.post.category eq 'etc'}">
								<td>기타 동물</td>
							</c:if>
						<td><fmt:formatDate value="${questionDetail.question.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script></script>
	
</body>
</html>