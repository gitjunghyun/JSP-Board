<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원탈퇴하기</title>
</head>
<body>
	<form name="regFrm" method="post" action="deletePro.jsp">
		비밀번호 <input id="passwd" name="passwd" type="password" size="20"
			placeholder="6~16 자 숫자 / 문자 " maxlength="16">
		<p>
			<input type="submit" value=" 탈퇴 "> <input type="button"
				onClick="history.back()" value=" 취소 ">
	</form>
</body>
</html>