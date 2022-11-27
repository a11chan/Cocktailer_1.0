<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="java.net.URLEncoder" %>

<%
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyword = request.getParameter("keyword");

	BoardBean boardDto = (BoardBean) session.getAttribute("boardDto");
	int no = boardDto.getNo();
	String state = boardDto.getState();

	String encKeyword = URLEncoder.encode(keyword, "UTF-8");
	String queryString = "?no=" + no + "&nowPage=" + nowPage + "&keyField=" + keyField + "&keyword=" + encKeyword;
%>

<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/reply.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

</head>

<body>
	<%@ include file="../includes/board_header.jsp"%>
	
	<div class="container">
		<h4>
			Administrator <span>Only</span>
		</h4>
		<form name="updateFrm" method="post" action="replyProc.jsp<%=queryString%>">
			<div class="input-group mb-2">
				<label class="input-group-text" for="eventSelect">처리내용</label>
				<select class="form-select" id="eventSelect" name="state">
					<option value="<%=state%>" selected><%=state%></option>
					<option value="">==========</option>
					<option value="처리대기중">처리대기중</option>
					<option value="일정수립중">일정수립중</option>
					<option value="처리완료">처리완료</option>
				</select>
			</div>
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pwd" class="form-control" placeholder="관리자 비밀번호" required>
			</div>
				
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.back( )" class="btn btn-secondary me-2">
				<input type="submit" value="처리확정" class="btn btn-secondary" >
			</div>
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	
</body>
</html>