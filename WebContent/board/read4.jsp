<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<%
	String myid = (String) session.getAttribute("id");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr4" />
<%
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(idx);//조회수 증가
	BoardBean bean = bMgr.getBoard(idx);//게시물 가져오기 
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//게시물을 세션에 저장
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글보기</title>
</head>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "main.jsp";
		document.listFrm.submit();
	}
	function update(idx) {
		document.updateFrm.idx.value = idx;
		document.updateFrm.pagefile.value = "./board/update4";
		document.updateFrm.action = "main.jsp";
		document.updateFrm.submit();
	}
	function reply(idx) {
		document.replyFrm.idx.value = idx;
		document.replyFrm.pagefile.value = "./board/reply";
		document.replyFrm.action = "main.jsp";
		document.replyFrm.submit();
	}
	function del(idx) {
		document.delFrm.idx.value = idx;
		document.delFrm.pagefile.value = "./board/delete4";
		document.delFrm.action = "main.jsp";
		document.delFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
</script>
<body>
	<!-- CONTENT -->
	<h3>게시판 글보기</h3>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#DDDDDD" width="10%">이 름</td>
			<td bgcolor="#FFFFE8"><%=name%></td>
			<td align="center" bgcolor="#DDDDDD" width=10%>등록날짜</td>
			<td bgcolor="#FFFFE8"><%=reg_date%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">제 목</td>
			<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">첨부파일</td>
			<td bgcolor="#FFFFE8" colspan="3">
				<%
					if (filename != null && !filename.equals("")) {
				%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
			</font> <%
 	} else {
 %> 등록된 파일이 없습니다.<%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><br /> <pre><%=content%> </pre><br /></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=ip%> 로 부터 글을 남기셨습니다 ./ 조회수 <%=count%>
			</td>
		</tr>
	</table>
	<hr />
	<%
		if (myid.equals("admin")) {
	%>
	[
	<a href="javascript:list() "> 리스트 </a> |
	<a href="javascript:update('<%=idx%>') "> 수 정 </a> |
	<a href="javascript:reply('<%=idx%>')"> 답 변 </a> |
	<a href="javascript:del('<%=idx%>')"> 삭 제 </a> ]
	<%
		}else {
	%>
	[
	<a href="javascript:list() "> 리스트 </a> |
	<a href="javascript:reply('<%=idx%>')"> 답 변 </a> ]
	<%
		}
	%>
	<br>
	<form name="downFrm" action="./board/download.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="pagefile" value="./board/question_list"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
		<%
			if (!(keyWord == null || keyWord.equals("null"))) {
		%>
		<input type="hidden" name="keyField" value="<%=keyField%>"> <input
			type="hidden" name="keyWord" value="<%=keyWord%>">
		<%
			}
		%>
	</form>
	<form name="updateFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/update4"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="replyFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/reply"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="delFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/delete4"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
</body>
</html>