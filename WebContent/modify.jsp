<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �����ϱ�</title>
<script type="text/javascript">
	function inputCheck() {
		if (document.regFrm.passwd.value == "") {
			alert("��й�ȣ�� �Է��� �ּ���.");
			document.regFrm.passwd.focus();
			return;
		}
		document.regFrm.submit();
	}
</script>
</head>
<body>
	<form name="regFrm" method="post" action="modifyForm.jsp">
		��й�ȣ <input id="passwd" name="passwd" type="password" size="20"
			placeholder="6~16 �� ���� / ���� " maxlength="16">
		<p>
			<input type="button" onClick="inputCheck()" value=" ���� "> 
			<input type="button" onClick="history.back()"
				value=" �ڷΰ��� ">
	</form>
</body>
</html>