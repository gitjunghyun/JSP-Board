<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%
	String myid = (String) session.getAttribute("id");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr1" />
<%
	String id = (String)session.getAttribute("id");
	request.setCharacterEncoding("EUC-KR");
	int idx = Integer.parseInt(request.getParameter("idx"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(idx);//��ȸ�� ����
	BoardBean bean = bMgr.getBoard(idx);//�Խù� �������� 
	String name = bean.getName();
	String title = bean.getTitle();
	String reg_date = bean.getReg_date();
	String content = bean.getContent();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);//�Խù��� ���ǿ� ����
	int ref = bean.getRef();
	int idx2 = 0;
	
	int depth = bean.getDepth();
	Vector<BoardBean> vlist = null;
	int replySize = 0; //
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ۺ���</title>
</head>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "main.jsp";
		document.listFrm.submit();
	}
	function update(idx) {
		document.updateFrm.idx.value = idx;
		document.updateFrm.pagefile.value = "./board/update1";
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
		document.delFrm.pagefile.value = "./board/delete1";
		document.delFrm.action = "main.jsp";
		document.delFrm.submit();
	}
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	function check() {
		if (document.post.pass.value == "") {
			alert("�н����带 �Է��ϼ���.");
			document.post.pass.focus();
			return false;
		}
		if (document.post.content.value == "") {
			alert("��� ������ �Է��ϼ���.");
			document.post.content.focus();
			return false;
		}
		document.post.submit();
	}
	function del_rep(idx) {
		document.delrep.idx.value = idx;
		document.delrep.pagefile.value = "./board/reply_delete";
		document.delrep.action = "main.jsp";
		document.delrep.submit();
	}
</script>
<body>
	<!-- CONTENT -->
	<h3>�Խ��� �ۺ���</h3>
	<table border="0" cellpadding="3" cellspacing="0" width=100%>
		<tr>
			<td align="center" bgcolor="#DDDDDD" width="10%">�� ��</td>
			<td bgcolor="#FFFFE8"><%=name%></td>
			<td align="center" bgcolor="#DDDDDD" width=10%>��ϳ�¥</td>
			<td bgcolor="#FFFFE8"><%=reg_date%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">�� ��</td>
			<td bgcolor="#FFFFE8" colspan="3"><%=title%></td>
		</tr>
		<tr>
			<td align="center" bgcolor="#DDDDDD">÷������</td>
			<td bgcolor="#FFFFE8" colspan="3">
				<%
					if (filename != null && !filename.equals("")) {
				%> <a href="javascript:down('<%=filename%>')"><%=filename%></a>
				&nbsp;&nbsp;<font color="blue">(<%=filesize%>KBytes)
			</font> <%
 	} else {
 %> ��ϵ� ������ �����ϴ�.<%
 	}
 %>
			</td>
		</tr>
		<tr>
			<td colspan="4"><br /> <pre><%=content%> </pre><br /></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><%=ip%> �� ���� ���� ����̽��ϴ� ./ ��ȸ�� <%=count%>
			</td>
		</tr>
	</table>
	<form name="post" method="post" action="./board/replyProc.jsp">
		<label>��� </label>
		<p />
		<label>�̸�</label> <input type="text" name="name" size="15"
			maxlength="15" value="<%=id%>"> <label>��й�ȣ</label> <input type="password"
			name="pass" size="15" maxlength="15"><hr> ���� :
		<textarea name="content" cols="100" rows="3"></textarea>
		
		<input type="button" value="Ȯ��" onClick="check()" /> <input
			type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> <input
			type="hidden" name="ref" value="<%=bean.getRef()%>"> <input
			type="hidden" name="pos" value="<%=bean.getPos()%>"> <input
			type="hidden" name="depth" value="<%=bean.getDepth()%>">
	</form>
	
	<hr/>
	<%
		vlist = bMgr.getReply(ref);
		replySize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
		if (vlist.isEmpty()) {
	%>
	<div class="form-group">
		<label>����̾����ϴ�</label>
	</div>
	<%
		} else {
			for (int i = 0; i < replySize; i++) {
				if (i == replySize)
					break;
				BoardBean bean2 = vlist.get(i);
				idx2 = bean2.getIdx();
				String mem_name = bean2.getName();
				String content2 = bean2.getContent();
				String reg_date2 = bean2.getReg_date();
				int depth2 = bean2.getDepth();
				int count2 = bean2.getCount();
	%>
	<div class="form-group">
		<label> -  <%=mem_name%> : </label>
		<%=content2%>
		<font color="blue">&nbsp;&nbsp;&nbsp;&nbsp;[<%=reg_date2%>]</font>
		<%if(id.equals(mem_name)) {%>
		<a href="javascript:del_rep('<%=idx2%>')"> �� �� </a>
	
		<% }%>
	</div>
	<%
		}
		}
	%>
	<hr/>
	<%
		if (myid.equals(name)) {
	%>
	[
	<a href="javascript:list() "> ����Ʈ </a> |
	<a href="javascript:update('<%=idx%>') "> �� �� </a> |
	<a href="javascript:del('<%=idx%>')"> �� �� </a> ]
	<%
		} else if (myid.equals("admin")) {
	%>
	[
	<a href="javascript:list() "> ����Ʈ </a> |
	<a href="javascript:del('<%=idx%>')"> �� �� </a> ]
	<%
		} else {
	%>
	[
	<a href="javascript:list() "> ����Ʈ </a> ]
	<%
		}
	%>
	<br>
	<form name="downFrm" action="./board/download1.jsp" method="post">
		<input type="hidden" name="filename">
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="pagefile" value="./board/product_list"> <input
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
		<input type="hidden" name="pagefile" value="./baord/update1"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="replyFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/reply"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="delFrm" method="get">
		<input type="hidden" name="pagefile" value="./baord/delete1"> <input
			type="hidden" name="idx" value="<%=idx%>"> <input
			type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
	<form name="delrep" method="get">
		<input type="hidden" name="pagefile" value="./baord/delete1"> <input
			type="hidden" name="idx" value=<%=idx2 %>>
		</form>
</body>
</html>