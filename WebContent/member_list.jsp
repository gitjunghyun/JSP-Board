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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("SELECT * FROM member where mem_id != 'admin'");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td colspan=2>ȸ�� ���</td>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr align=center>
				<td><a href="member_info.jsp?id=<%=rs.getString("mem_id")%>">
						<%=rs.getString("mem_id")%>
				</a></td>
				<td><a href="member_delete.jsp?id=<%=rs.getString("mem_id")%>">
						���� </a></td>
			</tr>
			<%
				}
			%>
		</table>
		<p/>
		<input type="button" value="Ȩ���� ���ư���"
			onclick="location.href = 'main.jsp'">
	</center>
</body>
</html>