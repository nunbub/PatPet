<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
    
    	
		<nav class="main-menu justify-content-center d-flex">
			<div class="col-9">
				<ul class="nav justify-content-between text-center">
					<li class="nav-item"><a class="nav-link" href="/post/introduce/view"><b class="text-dark">페트펫 소개</b></a></li>
					<li class="nav-item"><a class="nav-link" href="/post/list/view?category=dog"><b class="text-dark">함께 해주세요</b></a>					
						<ul class="detail-menu" style="z-index:1">
							<li class="mt-3"><a href="/post/list/view?category=dog">강아지를 '쓰다듬다'</a></li>
							<li class="mt-3"><a href="/post/list/view?category=cat">고양이를 '쓰다듬다'</a></li>
							<li class="my-3"><a href="/post/list/view?category=etc">기타동물을 '쓰다듬다'</a></li>
						</ul>						
					</li>
					<li class="nav-item"><a class="nav-link" href="/review/main/view"><b class="text-dark">이후 이야기</b></a></li>
					
					<c:if test="${not empty userId }" >
						<li class="nav-item"><a class="nav-link" href="/question/list/view?userId=${loginId }"><b class="text-dark">문의하기</b></a></li>
					</c:if>
				</ul>
			</div>
		</nav>
		
		<hr>