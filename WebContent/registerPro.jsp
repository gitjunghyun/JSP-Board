<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%@ page import="java.sql.Timestamp"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="db.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<%
	//������ ���� �Ѿ���� �ʴ� �������� ���Գ�¥�� ���� ����������� ���� 
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean manager = LogonDBBean.getInstance();
	//����ڰ� �Է��� ����������� ��ü�� ������ ȸ������ ó�� �޼ҵ�ȣ�� 
	int result = manager.insertMember(member);
	if (result == -1) {
%>
<script type="text/javascript">
	alert("ȸ�������� �Ͽ����ϴ�.");
	location.href = "main.jsp";
</script>
<%
	} else if (result == 0) {
%>
<script type="text/javascript">
	alert("�̹� �����ϴ� ���̵��Դϴ�.");
	history.back();
</script>
<%
	} else {
%>
<script type="text/javascript">
	history.back();
</script>
<%
	}
%>