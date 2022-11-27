<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>

<%
	bMgr.insertBoard(request);
  response.sendRedirect("list.jsp");
%>