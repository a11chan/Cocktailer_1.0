<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>FLAVORS RANGE</title>
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/common.css" />
<link rel="stylesheet" href="css/sub2.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="flexSlider/flexslider.css" />
<link rel="shortcut icon" href="imgs/favicon.ico" />
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="flexSlider/jquery.flexslider-min.js"></script>
<script src="js/sub2.js"></script>
</head>
<body>
	<header>
		<h1 class="logo" onClick="javascript:location.href='index.jsp'">
			cock<span>tailer</span>
		</h1>
		<div class="topmenu">
			<!--         <a href="#">login</a>
        <a href="#">join</a> -->
		</div>
		<div class="topmenulogo">
			<!--         <i class="fas fa-user"></i>
        <i class="fas fa-sign-in-alt"></i> -->
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