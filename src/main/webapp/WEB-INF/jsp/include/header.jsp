<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
		<header class="d-flex justify-content-between">
			<div class="d-flex">
				<div class="logo-image"><image src="/static/image/Patpet-logo-image.jpg" width="60"></div>
				<div class="page-name d-flex justify-content-center align-items-center ml-2"><h1>Pat, Pet</h1></div>
			</div>
			
			<c:choose>
				<c:when test="${not empty userId }">
					<div>
						<div class="mr-3">${userName }님</div>
						<a href="/user/signout">로그아웃</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="mt-4">
						<a href="/user/signin/view" class="mr-3 text-dark">로그인</a>
						<a href="/user/signup/view" class="text-dark">회원가입</a> 
					</div>
				</c:otherwise>
			</c:choose>
		</header>