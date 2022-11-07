<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
    
    	
		<nav class="main-menu justify-content-center d-flex">
			<div class="col-9">
				<ul class="nav justify-content-between text-center">
					<li class="nav-item"><a class="nav-link nav-font" href="/post/introduce/view">페트펫 소개</a></li>
					<li class="nav-item"><a class="nav-link nav-font" href="/post/list/view?category=dog">함께 해주세요</a>					
						<ul class="detail-menu" style="z-index:1">
							<li class="mt-3"><a href="/post/list/view?category=dog" class="detail-nav">강아지를 '쓰다듬다'</a></li>
							<li class="mt-3"><a href="/post/list/view?category=cat" class="detail-nav">고양이를 '쓰다듬다'</a></li>
							<li class="my-3"><a href="/post/list/view?category=etc" class="detail-nav">기타동물을 '쓰다듬다'</a></li>
						</ul>						
					</li>
					<li class="nav-item"><a class="nav-link nav-font" href="/review/main/view">이후 이야기</a></li>
					
					<c:if test="${not empty userId }" >
						<li class="nav-item"><a class="nav-link nav-font" href="/question/list/view?loginId=${userId}&receive=F">문의 내역</a>
							<ul class="detail-menu" style="z-index:1">
								<li class="mt-3"><a href="/question/list/view?loginId=${userId }&receive=F" class="detail-nav">내가 작성한 문의</a></li>
								<li class="my-3"><a href="/question/list/view?loginId=${userId }&receive=T" class="detail-nav">내가 받은 문의</a></li>
							</ul>
						</li>
					</c:if>
				</ul>
			</div>
		</nav>
		
		<hr>