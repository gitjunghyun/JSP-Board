<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.BoardBean"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<%
	String nowPage = request.getParameter("nowPage");
	String title = bean.getTitle();
	String content = bean.getContent();
	String myid = (String) session.getAttribute("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խù� ���</title>
<script>
	function check() {
		if (document.post.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.post.pass.focus();
			return false;
		}
		document.post.submit();
	}
</script>
</head>
<body>
	<!-- CONTENT -->
	<h3>�Խ��� �亯</h3>
	<form name="post" method="post" action="./board/replyPro.jsp">
		<table border="0">
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%"><input type="text" name="name" size="30" value = "<%=myid%>" readonly
					maxlength="20"></td>
			</tr>
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%"><input type="text" name="title" size="50"
					value=" �亯 : <%=title%>" maxlength="50"></td>
			</tr>
			<tr>
				<td width="20%">�� ��</td>
				<td width="80%"><textarea name="content" rows="12" cols="50"><%=content%>
========�亯 ���� ������.======= </textarea></td>
			</tr>
			<tr>
				<td width="20%">��� ��ȣ</td>
				<td width="80%"><input type="password" name="pass" size="15"
					maxlength="15"></td>
			</tr>
			<tr>
				<td colspan="2" height="5"><hr /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value=" �亯��� "
					onClick="check()"> <input type="reset" value=" �ٽþ��� ">
					<input type="button" value=" �ڷ� " onClick="history.back()"></td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="ref" value="<%=bean.getRef()%>"> <input
			type="hidden" name="pos" value="<%=bean.getPos()%>"> <input
			type="hidden" name="depth" value="<%=bean.getDepth()%>">
	</form>
</body>
</html>