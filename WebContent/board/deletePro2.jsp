<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int idx = Integer.parseInt(request.getParameter("idx"));
	if (request.getParameter("pass") != null) { //����� �Է��� �ؼ� ���ǿ� �ִ� pass �񱳿�û
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(idx);
%>
<script type="text/javascript">
	alert("���� �Ϸ�");
	location.href = "main.jsp?pagefile=./board/request_list";
</script>
<%
	} else {
%>
<script type="text/javascript">
alert(dbPass);
	alert("�Է��Ͻ� ��й�ȣ�� �ƴմϴ�.");
	history.back();
</script>
<%
	}
	} else {
%>
<script type="text/javascript">
	alert("�߸��Ȱ���Դϴ�..");
	history.back();
</script>
<%
	}
%>