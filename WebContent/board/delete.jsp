<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="cocktail.board.MemberBean"%>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr" />

<!DOCTYPE html>
<html>
<head>
<title>COCKTAILER - Booking List</title>

<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/common.css" />
<link rel="stylesheet" href="../css/delete.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

<%
	String nowPage = request.getParameter("nowPage");

	BoardBean boardDto = (BoardBean) session.getAttribute("boardDto");
	int no = boardDto.getNo();
	String queryString = "?nowPage=" + nowPage;

	MemberBean memberDto = bMgr.getAdminPwd();

	if(request.getParameter("pwd") != null) {
		String confirmPwd = request.getParameter("pwd");
		String originalPwd = boardDto.getPwd();
		String dbaPwd = memberDto.getPwd( );

		if(confirmPwd.equals(originalPwd)||confirmPwd.equals(dbaPwd)) {
			bMgr.deleteBoard(no);
			String url = "list.jsp"+queryString;
			response.sendRedirect(url);
		} else { %>
			<script>
				alert("비밀번호가 올바르지 않습니다.");
				history.back( );
			</script>
	<%}%>
<%}%>
<script>
	function check( ) { // 비밀번호 입력 체크
		if (document.delFrm.pwd.value == "") { // 비밀번호를 입력하지 않았으면
			alert("비밀번호를 입력하세요.");
			document.delFrm.pwd.focus( );
			return false;
		}
		document.delFrm.submit( );
	}
</script>
</head>

<body>
	<%@ include file="../includes/board_header.jsp"%>

	<div class="container">
		<h4>
			Password <span>Checking</span>
		</h4>
	
		<form name="delFrm" method="post" action="<c:url value='/board/delete.jsp'/><%=queryString%>">
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pwd" placeholder="비밀번호 입력" class="form-control">
			</div>
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
				<input type="reset" value="초기화" class="btn btn-secondary me-2">
				<input type="button" value="삭 제" onClick="check( )" class="btn btn-secondary"> 
			</div>
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>