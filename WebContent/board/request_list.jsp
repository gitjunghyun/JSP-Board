<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<%
	request.setCharacterEncoding("EUC-KR");
	int totalRecord = 0; //전체레코드수
	int numPerPage = 10; // 페이지당 레코드 수
	int pagePerBlock = 15; //블럭당 페이지수
	int totalPage = 0; //전체 페이지 수
	int totalBlock = 0; //전체 블럭수
	int nowPage = 1; // 현재페이지
	int nowBlock = 1; //현재블럭
	int start = 0; //디비의 select 시작번호
	int end = 10; //시작번호로 부터 가져올 select 갯수
	int listSize = 0; //현재 읽어온 게시물의 수
	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null;//getBoardList()메소드의 리턴 타입을 vector<boradBean>으로 선언
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
	totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
	nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산
	totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판</title>
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
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
		}
		document.searchFrm.submit();
	}
	function check_session() {
		alert("회원만 사용 가능합니다.");
		return;
	}
</script>
<body>
	<!-- CONTENT -->
	<h3>상품요청 게시판</h3>
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
			<th scope="col">글번호</th>
			<th scope="col">글제목</th>
			<th scope="col">글쓴이</th>
			<th scope="col">날짜</th>
		</tr>
		</tr>
		<%
			vlist = bMgr.getBoardList(keyField, keyWord, start, end);
			listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
			if (vlist.isEmpty()) {
		%>
		<tr>
			<td colspan="4" align="center">등록된 게시물이 없습니다.</td>
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
	<input type="button" onClick="check_session()" value="글쓰기">
	<%
		} else {
	%>
	<input type="button"
		onClick="javascript:location.href='main.jsp?pagefile=./board/post2'"
		value="글쓰기">
	<%
		}
	%>
	<!-- 페이징 및 블럭 처리 Start-->
	<div class="paging">
		<ol>
			<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
				int pageEnd = ((pageStart + pagePerBlock) < totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
				//하단 페이지 끝번호
				if (totalPage != 0) {
					if (nowBlock > 1) {
			%>
			<li><a href="javascript:block('<%=nowBlock - 1%>')">[이전]</a> <%
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
			<li><a href="javascript:block('<%=nowBlock + 1%>')">[다음]</a></li>
			<%
				}
			%>&nbsp;
			<%
				}
			%>
		</ol>
	</div>
	<!-- 페이징 및 블럭 처리 End-->

	<form name="searchFrm" method="post"
		action="main.jsp?pagefile=./board/request_list">
		<div class="boardSearch">
			<select name="keyField">
				<option value="title" selected="selected">제목</option>
				<option value="mem_name">글쓴이</option>
				<option value="content">내용</option>
			</select> <input type="text" id="txt" name="keyWord" /> <input type="button"
				value="검색" onClick="javascript:check()" /> <input type="hidden"
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