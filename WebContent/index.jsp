<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang="ko-kr">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>COCKTAILER</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="flexSlider/flexslider.css" />
<link rel="stylesheet" href="css/main/reset.css">
<link rel="stylesheet" href="css/main/main.css">
<link rel="shortcut icon" href="imgs/favicon.ico" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="flexSlider/jquery.flexslider-min.js"></script>
<script src="js/main.js"></script>
</head>

<body>
	<div class="none" id="age_check">
		<div class="age_check__box">
			<h3>welcome</h3>
			<div>
				<p>
					대한민국에 거주하고 만 <span>19세</span> 이상인가요? 
				</p>
				<p>출생년도를 입력해주세요.</p>
			</div>
			<form id="age_form" autocomplete="off">
				<input id="age_text" placeholder="YYYY" maxlength="4"
					required />
				<input id="age_submit" type="submit" value="OK" />
			</form>
			<div id="age_check__alert"></div>
			<h1 class="logo">
				cock<span>tailer</span>
			</h1>
		</div>
	</div>
	
	<header>
		<h1 class="logo" onClick="javascript:location.href='index.jsp'">
			cock<span>tailer</span>
		</h1>
	</header>

	<div id="trigger">
		<span></span> <span></span> <span></span>
	</div>
	
	<nav id="mainmenu">
		<ul class="mainmenu__menu">
			<li><a href="<c:url value='/sub1.jsp'/>">our rums</a></li>
			<li><a href="<c:url value='/sub2.jsp'/>">flavors range</a></li>
			<li><a href="<c:url value='/sub3.jsp'/>">experiences</a></li>
		</ul>
		<div class="mainmenu__sns">
			<a href="#"><i class="fab fa-facebook"></i></a> <a href="#"><i
				class="fab fa-twitter"></i></a> <a href="#"><i
				class="fab fa-instagram"></i></a>
		</div>
	</nav>

	<div class="flexslider">
		<ul class="slides">
			<li>
				<div class="container">
					<div class="pc_left bigbn">
						<img src="imgs/main_rums_1.jpg" alt="" />
						<h2 class="mobile">
							태양이 스며든 듯한,<br />럼을 원하는 스타일로 즐기기
						</h2>
					</div>
					<div class="pc_right">
						<div class="textbox">
							<h2>
								태양이 스며든 듯한,<br />럼을 원하는 스타일로 즐기기
							</h2>
							<p>기억에 남는 칵테일이 있으신가요? 맛과 향을 더듬어 가면서 찾아보세요.</p>
							<a href="<c:url value='/sub1.jsp'/>">our rums <span>more →</span></a>
						</div>
						<div class="smallbn">
							<img src="imgs/main_rums_2.jpg" alt="" />
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="container">
					<div class="pc_left bigbn">
						<img src="imgs/main_flavors_1.jpg" alt="" />
						<h2 class="mobile sub2_title">easy to mix, easy to drink</h2>
					</div>
					<div class="pc_right">
						<div class="textbox">
							<h2 class="sub2_title">easy to mix, easy to drink</h2>
							<p>쉽게 믹스해서 마실 수 있는 과일향의 럼을 즐겨보세요.</p>
							<a href="<c:url value='/sub2.jsp'/>">flavors range <span>more →</span></a>
						</div>
						<div class="smallbn">
							<img src="imgs/main_flavors_2.jpg" alt="" />
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="container">
					<div class="pc_left bigbn">
						<img src="imgs/main_ex_1.jpg" alt="" />
						<h2 class="mobile">일상 속 칵테일 라이프 만들기</h2>
					</div>
					<div class="pc_right">
						<div class="textbox">
							<h2>일상 속 칵테일 라이프 만들기</h2>
							<p>듣기만 하고 막상 어렵게만 느껴지는 럼을 일상 속에서 만날 수 있는 다양한 프로그램이 준비되어 있습니다.</p>
							<a href="<c:url value='/sub3.jsp'/>">experiences <span>more →</span></a>
						</div>
						<div class="smallbn">
							<img src="imgs/main_ex_2.jpg" alt="" />
						</div>
					</div>
				</div>
			</li>
		</ul>
	</div>

	<div class="custom-navigation">
		<div>
			<a href="#" class="flex-next">▶</a>
		</div>
		<div>
			<a href="#" class="flex-prev">◀</a>
		</div>
	</div>
	<div class="numbox">
		<div>1 / 3</div>
		<div class="numbox__bar">
			<div class="numbox__bar__total"></div>
			<div class="numbox__bar__now"></div>
		</div>
	</div>
</body>

</html>