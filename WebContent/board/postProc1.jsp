<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr1" />
<script type="text/javascript">
	alert("��ϵǾ����ϴ�.");
</script>
<%
	bMgr.insertBoard(request);
	response.sendRedirect("../main.jsp?pagefile=./board/product_list");
%>