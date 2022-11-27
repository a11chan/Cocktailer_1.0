<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="cocktail.board.BoardBean" %>
<%@ page import="cocktail.board.MemberBean" %>
<%@ page import="java.net.URLEncoder" %>

<jsp:useBean id="bMgr" class="cocktail.board.BoardMgr"/>
<jsp:useBean id="updateDto" class="cocktail.board.BoardBean"/>
<jsp:setProperty name="updateDto" property="*"/>

<%
  String nowPage = request.getParameter("nowPage");
  String keyField = request.getParameter("keyField");
  String keyword = request.getParameter("keyword");
  String encKeyword = URLEncoder.encode(keyword, "utf-8");

  BoardBean boardDto = (BoardBean) session.getAttribute("boardDto");
  int no = boardDto.getNo();
  String queryString = "?no=" + no + "&nowPage=" + nowPage + "&keyField=" + keyField + "&keyword=" + encKeyword;

  MemberBean memberDto = bMgr.getAdminPwd();

  if (updateDto.getPwd() != null) {
    String confirmPwd = updateDto.getPwd();
    String originalPwd = boardDto.getPwd();
    String dbaPwd = memberDto.getPwd();

    if (confirmPwd.equals(originalPwd) || confirmPwd.equals(dbaPwd)) {
      bMgr.updateBoard(updateDto);
      session.setAttribute("boardDto",updateDto);
      String url = "read.jsp"+queryString;
      response.sendRedirect(url);
    } else { %>
    <script>
      alert("입력하신 비밀번호가 아닙니다.");
      history.back();
    </script>
  <%}
  }%>