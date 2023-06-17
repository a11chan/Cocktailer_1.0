# COCKTAILER
> #### 개요
> * 럼 소개 및 칵테일 관련 체험행사 예약 사이트  
> * https://bit.ly/3XcqtfU
> #### 개발 배경
>* 편의성 제공 : 맛과 향으로 원하는 상품 선택 가능
>* 제품 홍보 : 칵테일 클래스, 공장 투어, 시음회 참여 게시판 운영

![siteLayoutImg](https://user-images.githubusercontent.com/85478918/151158178-5acbafdd-9165-4595-b6fd-41322eb7631a.png)

</br>

## 주요 코드
<details>
<summary>
맛과 향으로 상품 필터링
</summary>
<div markdown="1">
  <img src="https://user-images.githubusercontent.com/85478918/154827446-14fdfecf-bd54-488c-8d38-eda1e770a6f6.gif" style="width:400px"/>

  ~~~javascript
    $(function() {
	$.fn.navBarMenuTrigger = function(){
		$("#trigger").click(function(e) {
			e.preventDefault();
			$(this).toggleClass("active");
			$("#mainmenu").toggleClass("active");
		});
	};
	$.fn.navBarMenuTrigger();
	
	
	$.fn.hidePickedItemAndTasteName = function(){
		let pickedItem = $(".itemShowcase > .itemBox");
		let pickedTasteName = $(".pickedBox > div > label");
		let allChevron = $(".chevron");
		pickedItem.hide();
		pickedTasteName.hide();
		allChevron.hide();
	};
	$.fn.hidePickedItemAndTasteName();
	
	
	let pickedItemSelector;
	$.fn.makePickedItemSelector = function(){
		let pickedItemClassName = [];
		
		tasteName.filter(":checked").each(function() {
			pickedItemClassName.push("." + $(this).val());
		});
		pickedItemSelector = pickedItemClassName.join(", ");
	};
	$.fn.showNoseChevron = function(){
		let noseChevron = $(".pickedBox > .toLeft1, .pickedBox > .toRight1");
		if (pickedItemSelector.match(".n_")) {
			noseChevron.show()
		} else {
			noseChevron.fadeOut();
		}
	};
	$.fn.showPalateChevron = function(){
		let palateChevron = $(".pickedBox > .toLeft2, .pickedBox > .toRight2");
		if (pickedItemSelector.match(".p_")) {
			palateChevron.show()
		} else {
			palateChevron.fadeOut();
		}
	};
	$.fn.showFinishChevron = function(){
		let finishChevron = $(".pickedBox > .toLeft3, .pickedBox > .toRight3");
		if (pickedItemSelector.match(".f_")) {
			finishChevron.show()
		} else {
			finishChevron.fadeOut();
		}
	};
	$.fn.showTypeChevron = function(){
		let typeChevron = $(".pickedBox > .toLeft4, .pickedBox > .toRight4");
		if (pickedItemSelector.match(".t_")) {
			typeChevron.show()
		} else {
			typeChevron.fadeOut();
		}
	};
	$.fn.clearForm = function(){
		if (pickedItemSelector == "") {
			$(".chevron").fadeOut();
			$(".itemShowcase").fadeOut();
		}
	};
	
	let tasteName = $(".submenu input");
	tasteName.click(function(){
		$.fn.makePickedItemSelector();
		$.fn.hidePickedItemAndTasteName();
		$(pickedItemSelector).show();
		$.fn.showNoseChevron();
		$.fn.showPalateChevron();
		$.fn.showFinishChevron();
		$.fn.showTypeChevron();
		$.fn.clearForm();
	});
		
	
	$.fn.applyRadioBtnEffect = function(){
		this.click(function(){
			$('input[name="taste"]').not(this).prop("checked", false);
		});
	};
	$("#noseBtn").applyRadioBtnEffect();
	$("#palateBtn").applyRadioBtnEffect();
	$("#finishBtn").applyRadioBtnEffect();
	$("#typeBtn").applyRadioBtnEffect();
	
	
	$.fn.scrollLeft = function(){
		$(this).click(function(){
			$(this).siblings().first().animate({scrollLeft : "-=100"}, 30);
		});
	};
	$.fn.scrollRight = function(){
		$(this).click(function(){
			$(this).siblings().first().animate({scrollLeft : "+=100"}, 30);
		});
	};
	$(".toLeft1").scrollLeft();
	$(".toLeft2").scrollLeft();
	$(".toLeft3").scrollLeft();
	$(".toLeft4").scrollLeft();
	$(".toRight1").scrollRight();
	$(".toRight2").scrollRight();
	$(".toRight3").scrollRight();
	$(".toRight4").scrollRight();
	
	
	$(".itemShowcase").hide();
	$.fn.ToggleSearchBtn = function(){
		$("#searchBtn").click(function() {
			if (!pickedItemSelector) {
				alert("찾을 조건을 선택해주세요.");
				return false;
			} else $(".itemShowcase").fadeToggle();
		});
	};
	$.fn.ToggleSearchBtn();
	
});

function readyAlert( ) {
	alert("서비스 준비중입니다.");
}
  ~~~

</br>

</div>
</details>

<details>
<summary>Bootstrap을 활용한 입력폼 구현</summary>
<div markdown="1">

<img src="https://user-images.githubusercontent.com/85478918/154830287-cd4aded2-69ce-4981-91d0-0c96aa0f464e.gif" style="width:400px" />

~~~html
  <form class="app-form" method="post" action="/board/postProc.jsp">
  
      <div class="radioBox btn-group mb-2">
          <input type="radio" name="event" id="cClass" value="칵테일 클래스"
              class="btn-check" autocomplete="off" checked>
          <label for="cClass" class="btn btn-outline-secondary">칵테일 클래스</label>
          <input type="radio" name="event" id="fTour" value="럼 공장 투어"
              class="btn-check" autocomplete="off">
          <label for="fTour" class="btn btn-outline-secondary">럼 공장 투어</label>
          <input type="radio" name="event" id="rTasting" value="럼 시음 투어"
              class="btn-check" autocomplete="off">
          <label for="rTasting" class="btn btn-outline-secondary">럼 시음 투어</label>
      </div>
  
      <div class="inputSet1">
          <div class="inputSet">
              <input type="text" name="name" placeholder="신청자 닉네임(한글 또는 영문)"
                  pattern="^[가-힣a-zA-Z]+$" required class="form-control mb-2" />
          </div>
          <div class="inputSet">
              <input type="tel" name="tel" placeholder="연락처 입력" maxlength="13"
                  required class="form-control mb-2" />
          </div>
      </div>
~~~

</br>

</div>
</details>


<details>
<summary>JSP 예약 관리 게시판 구현</summary>
<div markdown="1">

<img src="https://user-images.githubusercontent.com/85478918/154832049-183a8cd5-b0cc-4f21-a2a9-60910f9e991a.gif" style="width:400px"/>

* 관리자 비밀번호(P@ssw0rd) 입력 시 조회/수정 가능  
* [게시판 전체 코드 링크](https://github.com/a11chan/cocktailer_1.0/tree/master/WebContent/board)

</br>

~~~jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ page import="cocktail.board.BoardBean" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>

<%
  int totalPosting = 0; // 전체 게시물 수
  int postingListSize = 10; // 페이지당 게시물 수
  int pageNaviSize = 5; // 페이지당 페이지 블럭수(다음 페이지로 넘기는 숫자들[n])
  int totalNaviPages = 0; // 전체 페이지 수
  int nowPage = 1; // 현재 페이지
  int beginNaviPage = 0; // 게시물을 출력할 때 시작번호
  int endNaviPage = 10; // 게시물을 출력할 때 끝번호
  int listSize = 0; // 현재 읽어온 게시물의 수
  Vector<BoardBean> vlist = null;
  int no = 0;
  String keyword = "", keyField = ""; //검색어, 검색 목록

  if (request.getParameter("no") !=null && !"".equals(request.getParameter("no")))
    no = Integer.parseInt(request.getParameter("no"));
  if (request.getParameter("keyword") !=null && !"".equals(request.getParameter("keyword")))
    keyword = request.getParameter("keyword");
  if (request.getParameter("keyField") !=null && !"".equals(request.getParameter("keyField")))
    keyField = request.getParameter("keyField");
  if (request.getParameter("nowPage") !=null && !"".equals(request.getParameter("nowPage")))
    nowPage = Integer.parseInt(request.getParameter("nowPage"));

  String encKeyword = URLEncoder.encode(keyword, "UTF-8");
  String queryString = "?nowPage=" + nowPage + "&keyField=" + keyField + "&keyword=" + encKeyword + "&no=";

  // 페이징 처리를 위한 계산
  totalPosting = bMgr.getTotalCount(keyField, keyword);
  totalNaviPages = (int) Math.ceil(totalPosting / (double) postingListSize);
  beginNaviPage = (nowPage - 1) / pageNaviSize * pageNaviSize + 1;
  endNaviPage = Math.min(totalNaviPages, beginNaviPage + pageNaviSize - 1);
  boolean showPrev = nowPage - pageNaviSize > 0;
  boolean showNext = totalNaviPages != endNaviPage;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <title>COCKTAILER - Booking List</title>

  <link rel="stylesheet" href="../css/bootstrap.css">
  <link rel="stylesheet" href="../css/reset.css"/>
  <link rel="stylesheet" href="../css/common.css"/>
  <link rel="stylesheet" href="../css/list.css"/>

  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <link rel="shortcut icon" href="../imgs/favicon.ico"/>

  <script src="../js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="../js/list.js"></script>

</head>

<body>

<%@ include file="../includes/board_header.jsp" %>

<div class="container">
  <h4>
    Booking <span>List</span>
  </h4>

  <p>
			<span class="badge bg-secondary">
				Total : <%=totalPosting%>행(현재페이지:<%=nowPage%>/전체페이지:<%=totalNaviPages%>)
			</span>
  </p>
  <%
    vlist = bMgr.getBoardList(keyField, keyword, (nowPage - 1) * postingListSize, postingListSize);
    // start~end 페이지 번호만큼 게시물 출력
    listSize = vlist.size(); // 화면에 보여질 게시물 개수

    pageContext.setAttribute("vlist",vlist);
    pageContext.setAttribute("listSize",listSize);

    if (vlist.isEmpty()) {
      out.println("등록된 게시물이 없습니다.");
    } else { %>
  <table class="table table-striped table-hover text-center">
    <thead>
    <tr>
      <th scope="col">번 호</th>
      <th scope="col" class="subject">참여형태</th>
      <th scope="col">신청인</th>
      <th scope="col">방문일</th>
      <th scope="col">처리상태</th>
    </tr>
    </thead>
    <%
      for (int i = 0; i < postingListSize; i++) { // 페이지당 출력되는 게시물
        if (i == listSize)
          break;
        BoardBean boardDto = vlist.get(i);
        no = boardDto.getNo();
        String event_type = boardDto.getEvent_type();
        String name = boardDto.getName();
        int participant = boardDto.getParticipant();
        String visit_date = boardDto.getVisit_date();
        String state = boardDto.getState();
    %>
    <tr>
      <td><%=totalPosting - ((nowPage - 1) * postingListSize) - i%>
      </td>
      <td><a href="<c:url value='/board/readPass.jsp'/><%=queryString + no%>" class="readNum"><%=event_type%>
      </a></td>
      <td><c:out value="<%=name%>"/></td>
      <td><%=visit_date%>
      </td>
      <td><%=state%>
      </td>
    </tr>
    <%}%>
  <%}%>
  </table>

  <% if (totalNaviPages != 0) { %>
  <div class="btn-toolbar justify-content-center">
    <div class="btn-group">
      <% if (showPrev) { %>
      <button type="button" class="btn btn-outline-secondary"
              onClick="location.href='<c:url value="/board/list.jsp?nowPage="/><%=beginNaviPage - 1%>'"
              style="padding-top:3px">&laquo;
      </button>
      <% } %>

      <% for (; beginNaviPage <= endNaviPage; beginNaviPage++) { %>
      <button type="button" class="btn btn-outline-secondary <% if(beginNaviPage == nowPage) {%> active <%}%>"
              onClick="location.href='<c:url value="/board/list.jsp?nowPage="/><%=beginNaviPage%>'"><%=beginNaviPage%>
      </button>
      <% } %>

      <% if (showNext) { %>
      <button type="button" class="btn btn-outline-secondary"
              onClick="location.href='<c:url value="/board/list.jsp?nowPage="/><%=endNaviPage + 1%>'"
              style="padding-top:3px">&raquo;
      </button>
      <% } %>
    </div>
  </div>
  <% } %>

  <div class="d-flex justify-content-center">
    <button class="btn btn-secondary booking me-2" type="button"
            onClick="javascript:location.href='<c:url value="/board/list.jsp"/>'">예약현황
    </button>
    <button class="btn btn-secondary booking" type="button"
            onClick="javascript:location.href='<c:url value="/sub3.jsp#application"/>'">예약하기
    </button>
  </div>

  <form name="searchFrm" method="post" action="<c:url value='/board/list.jsp'/>" class="searchFrm ">
    <div class="input-group">
      <select name="keyField" class="form-select w-auto">
        <option disabled>검색방법</option>
        <option value="event_type">참여형태</option>
        <option value="name" selected>신청인</option>
        <option value="visit_date">방문일</option>
        <option value="state">처리상태</option>
      </select>
      <input type="text" name="keyword" placeholder="검색어 입력"
             class="form-control w-50">
      <button type="button" class="btn btn-secondary" onClick="javascript:check( )">찾기</button>
    </div>
    <input type="hidden" name="nowPage" value="1">
  </form>

  <form name="readFrm" method="post" action="<c:url value='list.jsp'/>">
    <input type="hidden" name="no" value="">
    <input type="hidden" name="nowPage" value="<%=nowPage%>">
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyword" value="<%=keyword%>">
  </form>
</div>

<div class="clear"></div>

<%@ include file="../includes/footer.jsp" %>


<script>
  function check() { // 검색함수
    if (document.searchFrm.keyword.value == "") {
      alert("검색어를 입력하세요.");
      document.searchFrm.keyword.focus();
      return;
    }
    document.searchFrm.submit();
  }
</script>

</body>
</html>
~~~

</br>

</div>
</details>

</br>

## 트러블 슈팅  
* [저장소 링크(Notion)](https://allchan.notion.site/COCKTAILER-5-5480abb6960d44c2a6e00e418d3726bc)

</br>

## 프로젝트 담당 영역
#### `3차 이후`
* 팀원 진로변경(백엔드→프론트엔드)에 따른 1인 프로젝트로 전환
* JSP Model 1 구조로 [예약 게시판 및 관리자 페이지 구현](https://github.com/a11chan/cocktailer_1.0/tree/master/WebContent/board)
* [오프라인 행사 예약 입력 폼](https://github.com/a11chan/cocktailer_1.0/blob/master/WebContent/sub3.jsp)
* 기존 코드 최적화 및 AWS 배포

#### `1차 ~ 2차`
* [맛과 향으로 상품을 분류하는 필터 기능 구현](https://github.com/a11chan/cocktailer_1.0/blob/master/WebContent/sub1.jsp)
* 디자인 통일성 준수를 위한 UI 색상 가이드 제안 및 적용
* 본인 포함 총 4인 진행

</br>

## 개발 이력
* 5차(2022/11/25 ~ 2022/11/30) : 기존 코드 최적화, AWS를 통한 배포 (현재)
* 4차(2022/01/20 ~ 2022/02/20) : 기존 코드 최적화, heroku를 통한 배포 [🔍](https://github.com/a11chan/cocktailer_0.3)
* 3차(2022/01/10 ~ 2022/01/23) : HTML 기반 프로젝트를 JSP로 변환 및 게시판 구현 [🔍](https://github.com/a11chan/cocktailer_0.2)
* 2차(2021/09/19 ~ 2021/09/29) : 다른 서브페이지(sub2.html, sub3.html) 통합 [🔍](https://github.com/a11chan/cocktailer_0.1)
* 1차(2021/09/16 ~ 2021/09/30) : 담당 정적 페이지(sub1.html) 1차 완성 및 구현 [🔍](https://github.com/a11chan/cocktailer_0)

</br>


## 개발 규모
![](https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6ba59ab1-e73a-4b71-a9e5-ed24cd54c7da%2FUntitled.png?table=block&id=29d40b66-55ca-42bf-83c2-7159409e56a8&spaceId=d45b6527-cc9f-4af9-b7e8-975463d8b2e5&width=2000&userId=504d5d0d-ce4c-40f0-8ccd-2a8fd23e22dc&cache=v2)

</br>

## 사용 기술
#### `Back-end`
* Java 11
* Maven 3.8.0
* MySQL 8.0.28
#### `Front-end`
* jQuery 1.12.4
* Bootstrap 5.1.3

</br>

## 개발 환경
* IntelliJ Ultimate 2022.2.4
* Spring Tool Suite 3.9.9
* Eclipse 2021-09 4.21.0
* VS CODE 1.74.2
* Windows 10 Pro

</br>

## 향후 계획
* Spring Boot, JPA 프로젝트로 전환  
* JavaScript, CSS 최적화
