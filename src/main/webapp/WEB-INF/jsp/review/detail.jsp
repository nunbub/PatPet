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
	
	<c:import url="/WEB-INF/jsp/include/font.jsp" />
	
</head>
<body>

	<div class="container">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<c:import url="/WEB-INF/jsp/include/nav.jsp" />
		
		<section>
		
		<!-- 디테일 카드 -->
		<div class="review-main mt-3">${reviewDetail.review.title}</div>
		<div class="mt-3">
			<div class="post-info">작성자 : ${reviewDetail.reviewUser.name }</div>
			<div class="mt-2 post-date">작성 일자 : <fmt:formatDate value="${reviewDetail.review.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></div>
		</div>
		
		<div class="d-flex mt-4 align-itmes-center justify-content-center">
			<div>
				<img src="${reviewDetail.files[0].imagePath }" width="450" height="346.5" id="detailImage">
				
				<c:forEach var="file" items="${reviewDetail.files }">
					<input type="hidden" value="${file.imagePath }" class="file-image">
				</c:forEach>
			</div>
			
			<div class="ml-4 detail-content p-3">
				<div>${reviewDetail.review.content }</div>
			</div>	
		</div>
		<!-- /디테일 카드 -->
		
		<!-- 버튼들 -->
		<div class="d-flex justify-content-between align-items-center my-4">
			<a href="/review/main/view" class="btn listbtn-font">목록으로</a>
			<div>
				<c:if test="${userId eq reviewDetail.review.userId }" >
				<a href="/review/update/view?id=${reviewDetail.review.id }" class="btn updatebtn-font mr-3">수정하기</a>
				<button type="button" id="deleteBtn" class="btn deletebtn-font" data-review-id="${reviewDetail.review.id }">삭제하기</button>
				</c:if>
			</div>
		</div>
		<!-- /버튼들 -->
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	$(document).ready(function() {
		
		var files = [];
		var fileImage = $(".file-image");
		
		console.log(fileImage);
		
		for(var i = 0; i < fileImage.length; i++) {
			files.push($(fileImage[i]).val());
		}
		
		var currentImageIndex = 0;
		
		setInterval(function() {
			
			$("#detailImage").attr("src", files[currentImageIndex]);
			currentImageIndex++;
			
			if(currentImageIndex == files.length) {
				currentImageIndex = 0;
				
			}
			
		}, 3500);
		
		$("#deleteBtn").on("click", function() {
			
			let reviewId = $(this).data("review-id");
			
			$.ajax({
				type:"get"
				, url:"/review/delete"
				, data:{"reviewId":reviewId}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href="/review/main/view";
					} else {
						alert("삭제 실패");
					}
					
				}
				, error:function() {
					alert("삭제 에러");
				}
			});
			
		});
		
	});	
	</script>

</body>
</html>