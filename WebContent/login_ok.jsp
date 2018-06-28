<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	%>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("pwd");
		LogonDBBean logon = LogonDBBean.getInstance();
		int check = logon.userCheck(id, passwd);
		if (check == 1) {
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		} else if (check == 0) {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디가 맞지 않습니다..");
		history.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>