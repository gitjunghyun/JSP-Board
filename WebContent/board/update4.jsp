<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="board.BoardBean"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean) session.getAttribute("bean");
	String title = bean.getTitle();
	String name = bean.getName();
	String content = bean.getContent();
	String myid = (String) session.getAttribute("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 수정</title>
<script>
	function check() {
		if (document.updateFrm.pass.value == "") {
			alert("수정을 위해 패스워드를 입력하세요.");
			document.updateFrm.pass.focus();
			return false;
		}
		document.updateFrm.submit();
	}
</script>
</head>
<body>
	<h3>게시판 글수정</h3>
	<form name="updateFrm" method="post" action="./board/updatePro4.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="idx" value="<%=idx%>">
		<table width="70%" cellspacing="0" cellpadding="7">
			<tr>
				<td width="20%">성 명</td>
				<td width="80%"><input type="text" name="name"
					value="<%=myid%>" size="30" maxlength="20" readonly></td>
			</tr>
			<tr>
				<td width="20%">제 목</td>
				<td width="80%"><input type="text" name="title" size="50"
					maxlength="50" value="<%=title%>"></td>
			<tr>
				<td width="20%">내 용</td>
				<td width="80%"><textarea name="content" rows="10" cols="50"><%=content%></textarea>
				</td>
			</tr>
			<tr>
				<td width="20%">비밀 번호</td>
				<td width="80%"><input type="password" name="pass" size="15"
					maxlength="15"> 수정시에는 비밀번호가 필요합니다.</td>
			</tr>
			<tr>
				<td colspan="2" height="5"><hr /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value=" 수정완료 "
					onClick="check()"> <input type="reset" value=" 다시수정 ">
					<input type="button" value=" 뒤로 " onClick="history.go(-1)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>