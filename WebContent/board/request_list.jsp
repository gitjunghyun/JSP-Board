<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //��ü���ڵ��
	int numPerPage = 10; // �������� ���ڵ� ��
	int pagePerBlock = 15; //���� ��������
	int totalPage = 0; //��ü ������ ��
	int totalBlock = 0; //��ü ����
	int nowPage = 1; // ����������
	int nowBlock = 1; //�����
	int start = 0; //����� select ���۹�ȣ
	int end = 10; //���۹�ȣ�� ���� ������ select ����
	int listSize = 0; //���� �о�� �Խù��� ��
	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;//getBoardList()�޼ҵ��� ���� Ÿ���� vector<boradBean>���� ����
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null) {
		if (request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = (nowPage * numPerPage) - numPerPage;
	end = start + numPerPage;
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //��ü��������
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //����� ���
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //��ü�����
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���</title>
<script type="text/javascript">
	function list() {
		document.listFrm.action = "main.jsp?pagefile=./board/request_list";
		document.listFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	function block(value) {
		document.readFrm.nowPage.value =
<%=pagePerBlock%>
	* (value - 1) + 1;
		document.readFrm.submit();
	}
	function read(idx) {
		document.readFrm.idx.value = idx;
		document.readFrm.pagefile.value = "./board/read2";
		document.readFrm.action = "./main.jsp";
		document.readFrm.submit();
	}
	function check() {
		if (document.searchFrm.keyWord.value == "") {
			alert("�˻�� �Է��ϼ���.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function check_session() {
		alert("ȸ���� ��� �����մϴ�.");
		return;
	}
</script>
<body>
	<!-- CONTENT -->
	<h3>��ǰ��û �Խ���</h3>
	<table>
		<tr>
			<td>Total : <%=totalRecord%>Articles(<font color="red"> <%=nowPage%>/<%=totalPage%>Pages
			</font>)
			</td>
		</tr>
	</table>
	<table>
		<colgroup>
			<col width="10%" />
			<col width="60%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<tr>
			<th scope="col">�۹�ȣ</th>
			<th scope="col">������</th>
			<th scope="col">�۾���</th>
			<th scope="col">��¥</th>
		</tr>
		</tr>
		<%
			vlist = bMgr.getBoardList(keyField, keyWord, start, end);
			listSize = vlist.size();//������ ȭ�鿡 ������ �Խù�����
			if (vlist.isEmpty()) {
		%>
		<tr>
			<td colspan="4" align="center">��ϵ� �Խù��� �����ϴ�.</td>
		</tr>
		<%
			} else {
				for (int i = 0; i < numPerPage; i++) {
					if (i == listSize)
						break;
					BoardBean bean = vlist.get(i);
					int idx = bean.getIdx();
					String mem_name = bean.getName();
					String title = bean.getTitle();
					String reg_date = bean.getReg_date();
					int depth = bean.getDepth();
					int count = bean.getCount();
		%><tr>
			<td><%=totalRecord - ((nowPage - 1) * numPerPage) - i%></td>
			<td>
				<%
					if (depth > 0) {
								for (int j = 0; j < depth; j++) {
									out.println("&nbsp;&nbsp;");
								}
							}
							if (session.getAttribute("id") == null) {
				%> <a href="" onClick="check_session()"><%=title%></a>
			</td>
			<td><%=mem_name%></td>
			<td><%=reg_date%></td>
		</tr>
		<%
			} else {
		%>
		<a href="javascript:read('<%=idx%>')"><%=title%></a>
		</td>
		<td><%=mem_name%></td>
		<td><%=reg_date%></td>
		</tr>
		<%
			}
				} // for
			} //if
		%>
	</table>
	<br />
	<%
		if (session.getAttribute("id") == null) {
	%>
	<input type="button" onClick="check_session()" value="�۾���">
	<%
		} else {
	%>
	<input type="button"
		onClick="javascript:location.href='main.jsp?pagefile=./board/post2'"
		value="�۾���">
	<%
		}
	%>
	<!-- ����¡ �� �� ó�� Start-->
	<div class="paging">
		<ol>
			<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1; //�ϴ� ������ ���۹�ȣ
				int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
				//�ϴ� ������ ����ȣ
				if (totalPage != 0) {
					if (nowBlock > 1) {
			%>
			<li><a href="javascript:block('<%=nowBlock - 1%>')">[����]</a> <%
 	}
 %>&nbsp;</li>
			<%
				for (; pageStart < pageEnd; pageStart++) {
			%>
			<li><a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %> <font color="blue"><Strong> <%
 	}
 %> [<%=pageStart%>] <%
 	if (pageStart == nowPage) {
 %></Strong></font> <%
 	}
 %></a></li>
			<%
				} //for
			%>&nbsp;
			<%
				if (totalBlock > nowBlock) {
			%>
			<li><a href="javascript:block('<%=nowBlock + 1%>')">[����]</a></li>
			<%
				}
			%>&nbsp;
			<%
				}
			%>
		</ol>
	</div>
	<!-- ����¡ �� �� ó�� End-->

	<form name="searchFrm" method="post"
		action="main.jsp?pagefile=./board/request_list">
		<div class="boardSearch">
			<select name="keyField">
				<option value="title" selected="selected">����</option>
				<option value="mem_name">�۾���</option>
				<option value="content">����</option>
			</select> <input type="text" id="txt" name="keyWord" /> <input type="button"
				value="�˻�" onClick="javascript:check()" /> <input type="hidden"
				name="nowPage" value="1">
		</div>
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> <input
			type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="pagefile" value="./board/request_list"> <input
			type="hidden" name="idx"> <input type="hidden" name="nowPage"
			value="<%=nowPage%>"> <input type="hidden" name="keyField"
			value="<%=keyField%>"> <input type="hidden" name="keyWord"
			value="<%=keyWord%>">
	</form>
</body>
</html>