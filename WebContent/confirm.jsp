<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	//id�� ����ڰ� ȸ�������� �ϱ����ؼ� �Է��� ���̵� 
	String id = request.getParameter("id");
	//DBó������ LogonDBBeanŬ������ ��ü�� ����. 
	LogonDBBean manager = LogonDBBean.getInstance();
	//����ڰ� �Է��� id���� ������ LogonDBBeanŬ������ confirmId()�޼ҵ� ȣ�� 
	//�ߺ����̵� üũ confirmId()�޼ҵ��� �������� check���� 1�Ǵ� -1���� ���� ��
	int check = manager.confirmId(id);
	if (check == 1) {%>
	<script>
	alert("�̹� �����ϴ� ID�Դϴ�.");
	history.back();
	</script>
	<% } else { %>
	<script>
	alert(" ��� ������ ID�Դϴ�.");
	history.back();
	</script><%
	}
%>