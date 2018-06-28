<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%
	String myid = (String) session.getAttribute("id");
%>
<title>글쓰기</title>
<script type="text/javascript">
	function inputCheck() {
		if (document.postFrm.title.value == "") {
			alert("제목을 입력해 주세요.");
			document.postFrm.id.focus();
			return;
		}
		if (document.postFrm.content.value == "") {
			alert("내용을 입력해 주세요.");
			document.postFrm.content.focus();
			return;
		}
		if (document.postFrm.pass.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.postFrm.pass.focus();
			return;
		}
		document.postFrm.submit(); 
	}
</script>
</head>
<body>
	<!-- CONTENT -->
	<h3>게시판 글쓰기</h3>
	<form name="postFrm" enctype="multipart/form-data" method="post"
		action="./board/postProc3.jsp">
		<table border="0" width="100%" align="center">
			<tr>
				<td width="20%">성 명</td>
				<td width="80%"><input type="text" name="mem_id" size="10"
					maxlength="8" value ="<%=myid%>" readonly>
			</tr>
			<tr>
				<td width="20%">제 목</td>
				<td width="80%"><input type="text" name="title" size="50"
					maxlength="30"></td>
			</tr>
			<tr>
				<td width="20%">내 용</td>
				<td width="80%"><textarea name="content" rows="10" cols="50"></textarea></td>
			</tr>
			<tr>
				<td width="20%">비밀 번호</td>
				<td width="80%"><input type="password" name="pass" size="15"
					maxlength="15"></td>
			</tr>
			<tr>
				<td width="20%">파일찾기</td>
				<td width="80%"><input type="file" name="filename" size="50"
					maxlength="50"></td>
			</tr>
			<tr>
				<td>내용타입</td>
				<td>HTML<input type=radio name="contentType" value="HTTP">&nbsp;&nbsp;&nbsp;
					TEXT<input type=radio name="contentType" value="TEXT" checked>
				</td>
			</tr>
			<tr>
				<td colspan="2"><hr /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="등록" onClick="inputCheck()"> <input
					type="reset" value="다시쓰기"> <input type="button" value="리스트"
					onClick="javascript:location.href='main.jsp?pagefile=./board/notice_list'"></td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<!-- request.getRemoteAddr()은 현재 ip 반환 -->
	</form>
</body>
</html>