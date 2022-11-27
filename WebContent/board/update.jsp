<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.BoardBean"%>
<%@ page import="java.net.URLEncoder" %>
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
	String state = boardDto.getState( );

	boolean isDba = session.getAttribute("confirmPwd").equals(session.getAttribute("dbaPwd"));

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
<link rel="stylesheet" href="../css/update.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="shortcut icon" href="../imgs/favicon.ico" />

<script src="../js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="../js/menu.js"></script>

<script>
	function check( ) {
		if (document.updateFrm.pwd.value == "") {
			alert("수정을 위해 비밀번호를 입력하세요.");
			document.updateFrm.pwd.focus( );
			return false;
		}
		document.updateFrm.submit( );
	}
</script>
</head>

<body>

	<%@ include file="../includes/board_header.jsp"%>
	
	<div class="container">
		<h4>
			Detail <span>Page</span>
		</h4>
		<form name="updateFrm" method="post" action="<c:url value='/board/updateProc.jsp'/><%=queryString%>" >
			<div class="input-group mb-2">
				<label class="input-group-text" for="eventSelect">참여형태</label>
				<select class="form-select" id="eventSelect" name="event_type">
					<option value="<%=event_type%>" selected><%=event_type%></option>
					<option value="">==========</option>
					<option value="칵테일 클래스">칵테일 클래스</option>
					<option value="럼 공장 투어">럼 공장 투어</option>
					<option value="럼 시음 투어">럼 시음 투어</option>
				</select>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">신청인</span>
				<input type="text" name="name" class="form-control" value="<%=name%>" pattern="^[가-힣a-zA-Z]+$" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">연락처</span>
				<input type="text" name="tel" class="form-control" value="<%=tel%>" maxlength="13" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">참여인원</span>
				<input type="text" name="participant" class="form-control" value="<%=participant%>" min="1" required>
			</div>
			<div class="input-group mb-2">
				<span class="input-group-text">방문일</span>
				<input type="date" name="visit_date" class="form-control" value="<%=visit_date%>" required>
			</div>
			<%if(isDba) {%>
			<div class="input-group mb-2">
				<label class="input-group-text" for="stateSelect">처리내용</label>
				<select class="form-select" id="stateSelect" name="state">
					<option value="<%=state%>" selected><%=state%></option>
					<option value="">==========</option>
					<option value="처리대기중">처리대기중</option>
					<option value="일정수립중">일정수립중</option>
					<option value="처리완료">처리완료</option>
				</select>
			</div>
			<%} else {%>
			<div class="input-group mb-2">
				<span class="input-group-text">처리현황</span>
				<input type="text" class="form-control" value="<%=state%>" disabled>
				<input type="hidden" name="state" value="<%=state%>">
			</div>
			<%}%>
			<div class="input-group end">
				<span class="input-group-text">비밀번호</span>
				<input type="password" name="pwd" class="form-control" placeholder="비밀번호 입력" maxlength="8" required>
			</div>
			
			<div class="btnSet d-flex justify-content-center">
				<input type="button" value="이전화면" onClick="history.go(-1)" class="btn btn-secondary me-2">
				<input type="reset" value="원래대로" class="btn btn-secondary me-2">
				<input type="button" value="수정완료" onClick="check( )" class="btn btn-secondary">
			</div>
		</form>
	</div>
	
	<%@ include file="../includes/footer.jsp"%>
	</body>
</html>