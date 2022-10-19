<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 게시물 리스트 페이지</title>

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
			
			
			<div class="d-flex m-3">
				<c:choose>
					<c:when test="${param.category == 'dog'}">
					
						<div class="col-4 dog-title text-center main-dog">
							<h3 class="mt-2">강아지를 '쓰다듬다'</h3>
						</div>
						<div class="small text-secondary text-center ml-4">
						개는 자신보다 당신을 더 사랑하는 이 세상의 유일한 생명체입니다. <br>
						- Josh Billings -
						</div>
					
					</c:when>
						
					<c:when test="${param.category == 'cat' }">
					
						<div class="col-4 dog-title text-center main-dog">
							<h3 class="mt-2">고양이를 '쓰다듬다'</h3>
						</div>
						<div class="small text-secondary text-center ml-4">
						고양이는 세상 모두가 자기를 사랑해주길 바라지 않는다. <br>다만 자기가 선택한 사람이 자기를 사랑해주길 바랄 뿐이다.<br>
						- Helen Thomson -
						</div>
						
				 	</c:when>
					
					<c:otherwise>
					
						<div class="col-4 dog-title text-center main-dog">
							<h3 class="mt-2">기타동물을 '쓰다듬다'</h3>
						</div>
						<div class="small text-secondary text-center ml-4">
						인간에게는 동물을 다스릴 권리가 있는 것이 아니라, 모든 생명체를 지킬 의무가 있다.<br>
						- Jane Morris Goodall -
						</div>
					
					</c:otherwise>
				</c:choose>
				
			
			</div>
			<!-- 등록된 게시물 리스트 -->
			<div class="d-flex justify-content-between align-items-center post-list my-4 ml-3">
				<c:forEach var="postDetail" items="${postList}">			
					<c:if test="${param.category eq postDetail.post.category }" >
						<div class="m-4">
						
							<a href="/post/detail/view?id=${postDetail.post.id }"><img src="${postDetail.post.imagePath}" width="260" height="200"></a>	
							<div>
								<div><b class="text-dark post-title">${postDetail.post.title}</b></div>
								
								<div class="state text-dark">상태 [ 
								<c:choose>
									<c:when test="${postDetail.post.state == '입양 대기'}">
									<b class="text-danger">${postDetail.post.state }</b>
									</c:when>
									<c:otherwise>
									<span class="text-success">${postDetail.post.state }</span>
									</c:otherwise>
								</c:choose>	
								 ]</div>
								 
								<div class="text-dark"> 작성자 : ${postDetail.user.name }</div>
								<div class="small text-secondary"><fmt:formatDate value="${postDetail.post.createdAt }" pattern="yyyy-MM-dd" /></div>
							</div>				
						
						</div>	
					</c:if>
				</c:forEach>
			
			</div>
			<!-- /등록된 게시물 리스트 -->
			
			<!-- 게시물 작성 아이콘 -->
			<c:if test="${not empty userId }">
			<div class="d-flex justify-content-end mb-4 mr-3">
				<a href="/post/create/view"><i class="bi bi-pencil-square create-btn"></i></a>
			</div>
			</c:if>
			<!-- /게시물 작성 아이콘 -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>

</body>
</html>