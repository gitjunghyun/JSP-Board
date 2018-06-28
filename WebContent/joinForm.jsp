<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		location.href = "confirm.jsp?id=" + id;
	}

	function inputCheck() {
		if (document.regFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.regFrm.id.focus();
			return ;
		}
		if (document.regFrm.passwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.regFrm.pass.focus();
			return ;
		}
		if (document.regFrm.repass.value == "") {
			alert("비밀번호를 확인해 주세요");
			document.regFrm.repass.focus();
			return ;
		}
		if (document.regFrm.passwd.value != document.regFrm.repass.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.regFrm.repass.value = "";
			document.regFrm.repass.focus();
			return ;
		}
		if (document.regFrm.name.value == "") {
			alert("이름을 입력해 주세요.");
			document.regFrm.name.focus();
			return ;
		}
		if (document.regFrm.group.value == "") {
			alert("소속을 입력해 주세요.");
			document.regFrm.group.focus();
			return ;
		}
		if (document.regFrm.email.value == "") {
			alert("이메일을 입력해 주세요.");
			document.regFrm.email.focus();
			return ;
		}
		document.regFrm.submit(); 
	}
</script>
</head>
<body>
	<center>
		<form name="regFrm" method="post" action="registerPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5> 회원가입
								페이지 </font></b></td>
				</tr>
				<tr>
					<td>아이디</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" placeholder="ID 입력해주세요 " autofocus> <input
						type="button" value="ID 중복확인 " onClick="idCheck(this.form.id.value)"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16 자 숫자 / 문자 " maxlength="16"></td>
				</tr>
				<tr>
					<td>비밀번호 재입력</td>
					<td><input id="repass" name="repass" type="password" size="20"
						placeholder=" 비밀번호재입력 " maxlength="16"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input id="name" name="name" type="text" size="20"
						placeholder=" 홍길동 " maxlength="10"></td>
				</tr>
				<tr>
					<td>소속</td>
					<td><input id="address" name="group" type="text" size="30"
						placeholder=" 소속 입력 " maxlength="50"></td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td><input id="tel" name="email" type="text" size="20"
						placeholder=" e-mail 입력 " maxlength="20"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<input type ="button" id="process" onClick="inputCheck()" value = "가입하기"> <input
						type="button" value="취소" onclick="location.href = 'main.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>