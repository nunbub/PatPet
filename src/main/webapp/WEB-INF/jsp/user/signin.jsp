<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페트펫 로그인</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
	<c:import url="/WEB-INF/jsp/include/font.jsp" />
	
</head>
<body>

	<div class="container signin-page" >
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="main-content d-flex mb-4">
			
			<!-- 로그인 고정 -->
			<c:import url="/WEB-INF/jsp/include/signmain.jsp" />
			<!-- /로그인 고정-->
			
			<!-- 로그인 입력 창 -->
			<div class="col-8 d-flex justify-content-center align-items-center">
				<div class="col-7">
					<span class="sign-font">Sign In</span>
					<!-- 로그인 입력 카드 -->
					<form id="loginBox">
						<!-- 아이디 입력 -->
						<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
						<!-- /아이디 입력 -->
						
						<!-- 패스워드 입력 -->
						<input type="password" placeholder="패스워드" class="form-control mt-4" id="passwordInput">
						<!-- /패스워드 입력 -->
						
						<button type="submit" class="btn btn-block listbtn-font mt-4" id="signinBtn">로그인</button>
					</form>
					<!-- /로그인 입력 카드 -->
					
					<div class="mt-4 text-center sign-link">
						계정이 없으신가요?<a href="/user/signup/view">회원가입</a>
					</div>
				
				</div>
			</div>
			<!-- /로그인 입력 창 -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	$(document).ready(function() {
		
		$("#loginBox").on("submit", function(e) {
			e.preventDefault();
			
			let loginId = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력해주세요.");
				return ;
			}
			
			if(password == "") {
				alert("패스워드를 입력해주세요.");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/signin"
				, data:{"loginId":loginId, "password":password}
				, success:function(data) {
					
					if(data.result == "success") {
						
						location.href = "/post/main/view";
						
					} else {
						alert("아이디와 비밀번호를 확인해주세요.");
					}
					
				}
				,error:function() {
					alert("로그인 에러");
				}
			});
			
			
			
		});
		
		
	});
	
	</script>

</body>
</html>