<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cocktail.board.BoardBean" %>
<%@ page import="java.net.URLEncoder" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>

<%
  String nowPage = request.getParameter("nowPage");
  String keyField = request.getParameter("keyField");
  String keyword = request.getParameter("keyword");

  BoardBean boardDto = (BoardBean) session.getAttribute("boardDto");
  int no = boardDto.getNo();
  String event_type = boardDto.getEvent_type();
  String name = boardDto.getName();
  String tel = boardDto.getTel();
  int participant = boardDto.getParticipant();
  String visit_date = boardDto.getVisit_date();
  String state = boardDto.getState();

  String encKeyword = URLEncoder.encode(keyword, "UTF-8");
  String queryString = "?no=" + no + "&nowPage=" + nowPage + "&keyField=" + keyField + "&keyword=" + encKeyword;
%>
<!DOCTYPE html>
<html>
<head>
  <title>COCKTAILER - Booking List</title>
  <link rel="stylesheet" href="../css/bootstrap.css">
  <link rel="stylesheet" href="../css/reset.css"/>
  <link rel="stylesheet" href="../css/common.css"/>
  <link rel="stylesheet" href="../css/read.css"/>

  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <link rel="shortcut icon" href="../imgs/favicon.ico"/>

  <script src="../js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="../js/menu.js"></script>

  <script>
    function list() {
      document.listFrm.action = "<c:url value='/board/list.jsp'/><%=queryString%>";
      document.listFrm.submit();
    }
  </script>
</head>

<body>
<header>
  <h1 onClick="javascript:location.href='<c:url value="/index.jsp"/>'" class="logo">
    cock<span>tailer</span>
  </h1>
  <div class="topmenu">
    <!-- <a href="#">login</a> <a href="#">join</a> -->
  </div>
  <div class="topmenulogo">
    <!-- <i class="fas fa-user"></i> -->
<%--    <i class="fas fa-sign-in-alt"--%>
<%--       onClick="javascript:location.href='<c:url value="/board/reply.jsp"/><%=queryString%>'">--%>
<%--    </i>--%>
  </div>
</header>

<%@ include file="../includes/read_header.jsp" %>

<div class="container">
  <h4>
    Detail <span>Page</span>
  </h4>
  <div class="input-group mb-2">
    <span class="input-group-text">참여형태</span>
    <input type="text" class="form-control" value="<%=event_type%>" disabled>
  </div>
  <div class="input-group mb-2">
    <span class="input-group-text">신청인</span>
    <input type="text" class="form-control" value="<%=name%>" disabled>
  </div>
  <div class="input-group mb-2">
    <span class="input-group-text">연락처</span>
    <input type="text" class="form-control" value="<%=tel%>" disabled>
  </div>
  <div class="input-group mb-2">
    <span class="input-group-text">참여인원</span>
    <input type="text" class="form-control" value="<%=participant%>" disabled>
  </div>
  <div class="input-group mb-2">
    <span class="input-group-text">방문일</span>
    <input type="text" class="form-control" value="<%=visit_date%>" disabled>
  </div>
  <div class="input-group end">
    <span class="input-group-text">처리현황</span>
    <input type="text" class="form-control" value="<%=state%>" disabled>
  </div>

  <div class="btnSet d-flex justify-content-center">
    <a href="javascript:list( )" class="btn btn-secondary me-2">목 록</a>
    <a href="<c:url value='/board/update.jsp'/><%=queryString%>" class="btn btn-secondary me-2">수 정</a>
    <a href="<c:url value='/board/delete.jsp'/><%=queryString%>" class="btn btn-secondary me-2">삭 제</a>
  </div>
</div>

<form name="listFrm" method="post">
  <input type="hidden" name="no" value="<%=no%>">
  <input type="hidden" name="nowPage" value="<%=nowPage%>">
  <input type="hidden" name="keyField" value="<%=keyField%>">
  <input type="hidden" name="keyword" value="<%=keyword%>">
</form>

<%@ include file="../includes/footer.jsp" %>

</body>
</html>