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
<title>ȸ������</title>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("���̵� �Է��� �ּ���.");
			frm.id.focus();
			return;
		}
		location.href = "confirm.jsp?id=" + id;
	}

	function inputCheck() {
		if (document.regFrm.id.value == "") {
			alert("���̵� �Է��� �ּ���.");
			document.regFrm.id.focus();
			return ;
		}
		if (document.regFrm.passwd.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regFrm.pass.focus();
			return ;
		}
		if (document.regFrm.repass.value == "") {
			alert("��й�ȣ�� Ȯ���� �ּ���");
			document.regFrm.repass.focus();
			return ;
		}
		if (document.regFrm.passwd.value != document.regFrm.repass.value) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			document.regFrm.repass.value = "";
			document.regFrm.repass.focus();
			return ;
		}
		if (document.regFrm.name.value == "") {
			alert("�̸��� �Է��� �ּ���.");
			document.regFrm.name.focus();
			return ;
		}
		if (document.regFrm.group.value == "") {
			alert("�Ҽ��� �Է��� �ּ���.");
			document.regFrm.group.focus();
			return ;
		}
		if (document.regFrm.email.value == "") {
			alert("�̸����� �Է��� �ּ���.");
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
					<td colspan="2" align=center><b><font size=5> ȸ������
								������ </font></b></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" placeholder="ID �Է����ּ��� " autofocus> <input
						type="button" value="ID �ߺ�Ȯ�� " onClick="idCheck(this.form.id.value)"></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						placeholder="6~16 �� ���� / ���� " maxlength="16"></td>
				</tr>
				<tr>
					<td>��й�ȣ ���Է�</td>
					<td><input id="repass" name="repass" type="password" size="20"
						placeholder=" ��й�ȣ���Է� " maxlength="16"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input id="name" name="name" type="text" size="20"
						placeholder=" ȫ�浿 " maxlength="10"></td>
				</tr>
				<tr>
					<td>�Ҽ�</td>
					<td><input id="address" name="group" type="text" size="30"
						placeholder=" �Ҽ� �Է� " maxlength="50"></td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td><input id="tel" name="email" type="text" size="20"
						placeholder=" e-mail �Է� " maxlength="20"></td>
				</tr>
				<tr>
					<td colspan="2" align=center>
						<input type ="button" id="process" onClick="inputCheck()" value = "�����ϱ�"> <input
						type="button" value="���" onclick="location.href = 'main.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>