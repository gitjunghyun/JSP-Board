<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDataBean"%>
<%@ page import="db.LogonDBBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ����</title>
<script type="text/javascript">
	function inputCheck() {
		if (document.regFrm.passwd.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regFrm.passwd.focus();
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
	<%
		String id = (String) session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		LogonDBBean manager = LogonDBBean.getInstance(); //���̵�� ��й�ȣ�� �ش��ϴ� ������� ������ �� 
		LogonDataBean m = manager.getMember(id, passwd);

		int check = manager.userCheck(id, passwd);
		try {//�� ����� ������ ȭ�鿡 ǥ��

			if (check == 1) {
	%>
	<center>
		<form name="regFrm" method="post" action="modifyPro.jsp">
			<table border=1>
				<tr>
					<td colspan="2" align=center><b><font size=5> ȸ������
								���������� </font></b></td>
				</tr>
				<tr>
					<td>���̵�</td>
					<td><input id="id" name="id" type="text" size="20"
						maxlength="50" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input id="passwd" name="passwd" type="password" size="20"
						maxlength="16"></td>
				</tr>
				<tr>
					<td>�̸�</td>
					<td><input id="name" name="name" type="text" size="20"
						maxlength="10" value="<%=m.getName()%>"></td>
				</tr>
				<tr>
					<td>�Ҽ�</td>
					<td><input id="address" name="group" type="text" size="30"
						maxlength="50" value="<%=m.getGroup()%>"></td>
				</tr>
				<tr>
					<td>�̸���</td>
					<td><input id="tel" name="email" type="text" size="20"
						maxlength="20" value="<%=m.getEmail()%>"></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="button" value=" ���� "
						onClick="inputCheck()"> <input type="button"
						onclick="javascript:location.href='modify.jsp;" value=" ��� "></td>
				</tr>
			</table>
		</form>
	</center>
	<%
		} else {
	%>
	<script type="text/javascript">
alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
history.back();
</script>
	<%
		}
		} catch (Exception e) {
		}
	%>
</body>
</html>