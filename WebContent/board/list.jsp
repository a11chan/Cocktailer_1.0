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
  String queryString2 = "?keyField=" + keyField + "&keyword=" + encKeyword + "&nowPage=";

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
              onClick="location.href='<c:url value="/board/list.jsp"/><%=queryString2%><%=beginNaviPage - 1%>'"
              style="padding-top:3px">&laquo;
      </button>
      <% } %>

      <% for (; beginNaviPage <= endNaviPage; beginNaviPage++) { %>
      <button type="button" class="btn btn-outline-secondary <% if(beginNaviPage == nowPage) {%> active <%}%>"
              onClick="location.href='<c:url value="/board/list.jsp"/><%=queryString2%><%=beginNaviPage%>'"><%=beginNaviPage%>
      </button>
      <% } %>

      <% if (showNext) { %>
      <button type="button" class="btn btn-outline-secondary"
              onClick="location.href='<c:url value="/board/list.jsp"/><%=queryString2%><%=endNaviPage + 1%>'"
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
             class="form-control w-50" >
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
