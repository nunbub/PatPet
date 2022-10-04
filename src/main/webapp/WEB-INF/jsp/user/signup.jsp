<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패트펫 회원가입</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>

	<div class="container signup-page" >
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="main-content d-flex">
			
			<!-- 회원가입 고정 -->
			<c:import url="/WEB-INF/jsp/include/signmain.jsp" />
			<!-- /회원가입 고정-->
			
			<!-- 회원가입 입력 창 -->
			<div class="col-7 d-flex justify-content-center align-items-center">
				<div class="col-7">
					<div class="text-center mb-4">
						<h2>회원 가입</h2>
					</div>
					<!-- 아이디 -->
					<div class="input-group">
					  <input type="text" class="form-control" placeholder="아이디" id="loginIdInput">
					  <div class="input-group-append">
					    <button class="btn btn-outline-danger" type="button" id="isDuplicateBtn">중복 확인</button>
					  </div>
					  
					</div>	
					
					  <div class="small text-success d-none" id="availableId">사용가능한 아이디 입니다.</div>
					  <div class="small text-danger d-none" id="duplicateId">중복된 아이디 입니다.</div>
					<!-- /아이디 -->
					
					<!-- 패스워드 -->					
					<input type="password" placeholder="패스워드" class="form-control mb-3 mt-3" id="passwordInput">					
					<!-- /패스워드 -->
					
					<!-- 패스워드 확인 -->					
					<input type="password" placeholder="패스워드 확인" class="form-control mb-3" id="passwordConfirmInput">
					<!-- /패스워드 확인 -->
					
					<!-- 이름 -->
					<input type="text" placeholder="이름" class="form-control mb-3" id="nameInput">
					<!-- /이름 -->
					
					<!-- 이메일 -->
					<input type="text" placeholder="이메일" class="form-control mb-3" id="emailInput">
					<!-- /이메일 -->
					
					<!-- 전화번호 -->					
					<input type="text" placeholder="전화 번호" class="form-control mb-3" id="phoneNumberInput">
					<!-- /전화번호 -->
					
					<!-- 회원가입 버튼 -->					
					<button type="button" class="btn btn-secondary btn-block mb-3" id="signupBtn">가입하기</button>  				
					<!-- /회원가입 버튼 -->
					
					<!-- 로그인 링크 -->
					<div class="text-center">
						계정이 있으신가요? <a href="/user/signin/view">로그인</a>
					</div>
					<!--  -->
				</div>
			</div>
			<!-- /회원가입 입력 창 -->
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
	
	$(document).ready(function() {
		
		var isDuplicateCheck = false;
		var isDuplicateId = true;
		
		$("#isDuplicateBtn").on("click", function() {
			
			let loginId = $("#loginIdInput").val();
			
			if(loginId == "") {
				alert("아이디를 입력해주세요.");
				return ;
			}
			
			$.ajax({
				
				type:"get"
				, url:"/user/duplicate_id"
				, data:{"loginId":loginId}
				, success:function(data) {
					
					isDuplicateCheck = true;
					
					//중복시	{"id_duplicate":true}
					//중복이 아닌경우	{"id_duplicate":false}
					if(data.id_duplicate) {
						$("#duplicateId").removeClass("d-none");
						$("#availableId").addClass("d-none");
						isDuplicateId = true;
					} else {
						$("#duplicateId").addClass("d-none");
						$("#availableId").removeClass("d-none");
						isDuplicateId = false;
					}
					
				}
				, error:function() {
					alert("중복체크 에러");
				}
			});
			
			
			
		});
		
		
		
		$("#signupBtn").on("click", function() {
			
			let loginId = $("#loginIdInput").val();
			let password = $("#passwordInput").val();
			let passwordConfirm = $("#passwordConfirmInput").val();
			let name = $("#nameInput").val();
			let email = $("#emailInput").val();
			let phoneNumber = $("#phoneNumberInput").val();
			
			/* var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

			var PW = $("#passwordInput").val();

			if(false === reg.test(PW)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			}else {
			console.log("통과");
			}
 
			} */
						
			if(loginId == "") {
				alert("아이디를 입력해주세요.");
				return ;
			}
			
			if(isDuplicateCheck == false) {
				alert("중복확인을 진행해주세요.");
				return ;
			}
			
			if(isDuplicateId) {
				alert("아이디가 중복되었습니다.");
				return ;
			}
			
			if(password == "") {
				alert("비밀번호를 입력해주세요.");
				return ;
			}
			
			if(password != passwordConfirm) {
				alert("비밀번호를 확인해주세요.");
				return ;
			}
			
			if(name == "") {
				alert("이름을 입력해주세요.");
				return ;
			}
			
			if(email == "") {
				alert("이메일을 입력해주세요.");
				return ;
			}
			
			if(phoneNumber == "") {
				alert("전화번호를 입력해주세요.");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/signup"
				, data:{"loginId":loginId, "password":password, "name":name, "email":email, "phoneNumber":phoneNumber}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href = "/user/signin/view"
					} else {
						alert("회원가입 실패");
					}
				}
				, error:function() {
					alert("회원가입 에러");
				}	
					
			});
			
		});
		
	});
	
	</script>

</body>
</html>