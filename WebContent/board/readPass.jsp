<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="cocktail.board.MemberBean"%>
<%@ page import="java.net.URLEncoder" %>

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

<% /* 변수설정 및 비밀번호 처리로직 */
	int no = Integer.parseInt(request.getParameter("no"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyword = request.getParameter("keyword");

	MemberBean memberDto = bMgr.getAdminPwd();
	BoardBean boardDto = bMgr.getBoard(no);
	
	if(request.getParameter("pwd") != null) {
		String confirmPwd = request.getParameter("pwd").trim();
		String originalPwd = boardDto.getPwd( );
		String dbaPwd = memberDto.getPwd( );
		
		if(confirmPwd.equals(originalPwd)||confirmPwd.equals(dbaPwd)) {
			session.setAttribute("boardDto",boardDto);
			session.setAttribute("dbaPwd",dbaPwd);
			session.setAttribute("confirmPwd",confirmPwd);
			String encKeyword = URLEncoder.encode(keyword,"UTF-8");
			String url = "read.jsp?no="+no+"&nowPage="+nowPage+"&keyField="+keyField+"&keyword="+encKeyword;
			response.sendRedirect(url);
		} else { %>
			<script>
				alert("입력하신 비밀번호가 아닙니다.");
				history.back( );
			</script>
	<%}
	} else {%>
<script>
	function check( ) {
		if (document.passFrm.pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			document.passFrm.pwd.focus( );
			return false;
		}
		document.passFrm.submit( );
	}
</script>
</head>

<body>
	
	<%@ include file="../includes/board_header.jsp"%>

	<div class="container">
		<h4>
			Password <span>Checking</span>
		</h4>
	
		<form name="passFrm" method="post" action="<c:url value='/board/readPass.jsp'/>">
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pwd" minlength="4" maxlength="8" placeholder="신청서 작성시 비밀번호 입력" class="form-control">
			</div>
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
				<input type="reset" value="원래대로" class="btn btn-secondary me-2">
				<input type="button" value="확 인" onClick="check( )" class="btn btn-secondary"> 
			</div>
			<input type="hidden" name="no" value="<%=no%>">
			<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<input type="hidden" name="keyField" value="<%=keyField%>">
			<input type="hidden" name="keyword" value="<%=keyword%>">
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>	
	
<%}%>
</body>
</html>