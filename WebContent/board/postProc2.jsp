<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<script type="text/javascript">
	alert("��ϵǾ����ϴ�.");
</script>
<%
	bMgr.insertBoard(request);
	response.sendRedirect("../main.jsp?pagefile=./board/request_list");
%>