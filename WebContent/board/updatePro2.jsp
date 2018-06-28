<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bMgr" class="board.BoardMgr2" />
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<jsp:useBean id="upBean" class="board.BoardBean" />
<jsp:setProperty property="*" name="upBean" />
<%
	String nowPage = request.getParameter("nowPage"); //bean에 있는 pass와 upBean pass를 비교(read.jsp) 
	String upPass = upBean.getPass();
	String inPass = bean.getPass();
	if (upPass.equals(inPass)) {
		bMgr.updateBoard(upBean);
		String url = "../main.jsp?pagefile=./board/read2&nowPage=" + nowPage + "&idx=" + upBean.getIdx();
		response.sendRedirect(url);
	} else {
%>
<script type="text/javascript">
	alert("입력하신 비밀번호가 아닙니다.");
	history.back();
</script>
<%
	}
%>