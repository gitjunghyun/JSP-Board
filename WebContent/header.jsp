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
		���̵� <input type="text" name="id"> ��й�ȣ <input type="password"
			name="pwd"> <input type="submit" value=" �α��� "> <input
			type="button" value="ȸ������" onclick="location.href = 'joinForm.jsp'">
	</form>
	<%
		} else if (session.getAttribute("id").equals("admin")) { //������ �����ڷ� ������ ���
	%>
	<form name="logout " action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>�� �α����ϼ̽��ϴ�. <input type="submit"
			value=" �α׾ƿ� "> <input type="button" value="ȸ������"
			onclick="location.href = 'member_list.jsp'">
	</form>
	<%
		} else {
	%>
	<form name="logout " action="logout.jsp" method="post">
		<%=session.getAttribute("id")%>�� �α����ϼ̽��ϴ�. <input type="submit"
			value=" �α׾ƿ� "> <input type="button" value="����������"
			onclick="javascript:location.href='main.jsp?pagefile=mypage'">
	</form>
	<%
		}
	%>
</body>
</html>