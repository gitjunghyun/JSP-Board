<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr4" />
<script type="text/javascript">
	alert("��ϵǾ����ϴ�.");
</script>
<%
	bMgr.insertBoard(request);
	response.sendRedirect("../main.jsp?pagefile=./board/question_list");
%>