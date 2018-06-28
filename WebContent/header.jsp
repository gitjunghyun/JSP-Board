<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("euc-kr");
		if (session.getAttribute("id") == null) {
	%>
	<form action="login_ok.jsp" method="post">
		아이디 <input type="text" name="id"> 비밀번호 <input type="password"
			name="pwd"> <input type="submit" value=" 로그인 "> <input
			type="button" value="회원가입" onclick="location.href = 'joinForm.jsp'">
	</form>
	<%
		} else if (session.getAttribute("id").equals("admin")) { //세션이 관리자로 설정된 경우
	%>
	<form name="logout " action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>님 로그인하셨습니다. <input type="submit"
			value=" 로그아웃 "> <input type="button" value="회원관리"
			onclick="location.href = 'member_list.jsp'">
	</form>
	<%
		} else {
	%>
	<form name="logout " action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>님 로그인하셨습니다. <input type="submit"
			value=" 로그아웃 "> <input type="button" value="마이페이지"
			onclick="javascript:location.href='main.jsp?pagefile=mypage'">
	</form>
	<%
		}
	%>
</body>
</html>