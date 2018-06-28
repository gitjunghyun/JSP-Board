<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr4" />
<jsp:useBean id="reBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="reBean" />
<%
	bMgr.replyUpBoard(reBean.getRef(), reBean.getPos());
	bMgr.replyBoard(reBean);
	String nowPage = request.getParameter("nowPage");
	response.sendRedirect("../main.jsp?pagefile=./board/question_list&nowPage=" + nowPage);
%>