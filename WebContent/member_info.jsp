<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;
	if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	String info_id = request.getParameter("id");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM member WHERE mem_id=?");
		pstmt.setString(1, info_id);
		rs = pstmt.executeQuery();
		rs.next();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ���� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td>���̵� :</td>
				<td><%=rs.getString("mem_id")%></td>
			</tr>
			<tr align=center>
				<td>��й�ȣ :</td>
				<td><%=rs.getString("mem_pwd")%></td>
			</tr>
			<tr align=center>
				<td>�̸� :</td>
				<td><%=rs.getString("mem_name")%></td>
			</tr>
			<tr align=center>
				<td>�ּ� :</td>
				<td><%=rs.getString("mem_group")%></td>
			</tr>
			<tr align=center>
				<td>��ȭ :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td>������ :</td>
				<td><%=rs.getString("reg_date")%></td>
			</tr>
			<tr align=center>
				<td colspan=2><a href="member_list.jsp"> ����Ʈ�� ���ư��� </a></td>
			</tr>
		</table>
	</center>
</body>
</html>
</html>