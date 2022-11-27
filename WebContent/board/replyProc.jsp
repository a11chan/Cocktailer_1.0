<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="cocktail.board.MemberBean"%>
<%@ page import="cocktail.board.BoardBean" %>
<%@ page import="java.net.URLEncoder" %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>
<jsp:useBean id="replyDto" class="cocktail.board.BoardBean"/>

<%
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyword = request.getParameter("keyword");
	String encKeyword = URLEncoder.encode(keyword, "UTF-8");

	BoardBean boardDto = (BoardBean) session.getAttribute("boardDto");
	int no = boardDto.getNo();
	String queryString = "?no=" + no + "&nowPage=" + nowPage + "&keyField=" + keyField + "&keyword=" + encKeyword;

	// 이전 페이지에서 넘어온 state, pwd 처리
	MemberBean memberDto = bMgr.getAdminPwd();
	String dbaPwd = memberDto.getPwd( );
	String confirmPwd = request.getParameter("pwd");
	String state = request.getParameter("state");

	if(confirmPwd.equals(dbaPwd)) {
		boardDto.setState(state);
		session.setAttribute("boardDto", boardDto);
		bMgr.updateState(boardDto);
		String url = "read.jsp"+queryString;
		System.out.println("replyProc.jsp.url = " + url);
		response.sendRedirect(url);
	} else {
%>
	<script>
		alert("입력하신 비밀번호는 유효하지 않습니다.");
		history.back( );
	</script>
<%
	}
%>