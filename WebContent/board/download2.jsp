<%@ page contentType="application;charset=euc-kr"%>
<jsp:useBean id="bMgr" class="board.BoardMgr1" />
<%
	bMgr.downLoad(request, response, out, pageContext);
%>/html>
