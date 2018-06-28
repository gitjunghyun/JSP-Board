<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	LogonDBBean manager = LogonDBBean.getInstance(); //회원탈퇴처리 메소드 수행 후 탈퇴 상황 값 반환 
	int check = manager.deleteMember(id, passwd);
	if (check == 1)//탈퇴성공시 
		session.invalidate();//세션을 무효화
	if (check == 1) {
%>
<script type="text/javascript">
	alert("회원 탈퇴되었습니다");
	location.href = "main.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("비밀번호를 정확히 입력하세요.");
	history.back();
</script>
<%
	}
%>