<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int idx = Integer.parseInt(request.getParameter("idx"));
	if (request.getParameter("pass") != null) { //비번을 입력을 해서 세션에 있는 pass 비교요청
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String dbPass = bean.getPass();
		if (inPass.equals(dbPass)) {
			bMgr.deleteBoard(idx);
%>
<script type="text/javascript">
	alert("삭제 완료");
	location.href = "main.jsp?pagefile=./board/request_list";
</script>
<%
	} else {
%>
<script type="text/javascript">
alert(dbPass);
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%
	}
	} else {
%>
<script type="text/javascript">
	alert("잘못된경로입니다..");
	history.back();
</script>
<%
	}
%>