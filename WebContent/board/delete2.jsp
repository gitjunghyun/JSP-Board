<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String nowPage = request.getParameter("nowPage");
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�����ϱ�</title>
<link rel="stylesheet" href="../css/board.css" type="text/css" />
<script type="text/javascript">
	function check() {
		if (document.delFrm.pass.value == "") {
			document.delFrm.pass.focus();
			return false;
		}
		document.delFrm.submit();
	}
</script>
</head>
<body>
	<!-- CONTENT -->
	<h3>�Խñ� ����</h3>
	<h5>������� ��й�ȣ�� �Է����ּ���.</h5>
	<form name="delFrm" method="post"
		action="main.jsp?pagefile=./board/deletePro2">
		<table>
			<tr>
				<td align="right">��й�ȣ</td>
				<td colspan="2"><input type="password" name="pass" size="20"
					maxlength="15"></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="2"><input type="button" id="pwd" value="�����Ϸ�"onClick="check()">
					<input type="reset" value=" �ٽþ��� "> <input type="button"
					value=" �ڷ� " onClick="history.go(-1)"></td>
			</tr>
		</table>
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="idx" value="<%=idx%>">
	</form>
</body>
</html>