<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String id = (String) session.getAttribute("id");
	String passwd = request.getParameter("passwd");
	LogonDBBean manager = LogonDBBean.getInstance(); //ȸ��Ż��ó�� �޼ҵ� ���� �� Ż�� ��Ȳ �� ��ȯ 
	int check = manager.deleteMember(id, passwd);
	if (check == 1)//Ż�𼺰��� 
		session.invalidate();//������ ��ȿȭ
	if (check == 1) {
%>
<script type="text/javascript">
	alert("ȸ�� Ż��Ǿ����ϴ�");
	location.href = "main.jsp";
</script>
<%
	} else {
%>
<script type="text/javascript">
	alert("��й�ȣ�� ��Ȯ�� �Է��ϼ���.");
	history.back();
</script>
<%
	}
%>