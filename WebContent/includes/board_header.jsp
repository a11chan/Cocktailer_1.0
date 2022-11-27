<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

	<header>
		<h1 onClick="javascript:location.href='../index.jsp'" class="logo">
			cock<span>tailer</span>
		</h1>
		<div class="topmenu">
			<!-- <a href="#">login</a> <a href="#">join</a> -->
		</div>
		<div class="topmenulogo">
			<!-- <i class="fas fa-user"></i> <i class="fas fa-sign-in-alt"></i> -->
		</div>
	</header>

	<div id="trigger">
		<span></span> <span></span> <span></span>
	</div>

	<nav id="mainmenu">
		<ul class="mainmenu__menu">
			<li><a href="<c:url value='/sub1.jsp'/>">our rums</a></li>
			<li><a href="<c:url value='/sub2.jsp'/>">flavors range</a></li>
			<li><a href="<c:url value='/sub3.jsp'/>">experiences</a></li>
			<li><a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
					class="fab fa-twitter"></i></a> <a href="#"><i
					class="fab fa-instagram"></i></a></li>
		</ul>
	</nav>

	<div class="banner">
		<div class="rotate">
			<h2>experiences</h2>
		</div>
		<div class="first">
			<h3>일상 속 칵테일 라이프 만들기</h3>
			<p>듣기만 하고 막상 어렵게만 느껴지는 럼을 일상 속에서 만날 수 있는 다양한 프로그램이 준비되어 있습니다.</p>
		</div>
	</div>