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
<title>회원관리 시스템 관리자모드(회원 정보 보기)</title>
</head>
<body>
	<center>
		<table border=1 width=300>
			<tr align=center>
				<td>아이디 :</td>
				<td><%=rs.getString("mem_id")%></td>
			</tr>
			<tr align=center>
				<td>비밀번호 :</td>
				<td><%=rs.getString("mem_pwd")%></td>
			</tr>
			<tr align=center>
				<td>이름 :</td>
				<td><%=rs.getString("mem_name")%></td>
			</tr>
			<tr align=center>
				<td>주소 :</td>
				<td><%=rs.getString("mem_group")%></td>
			</tr>
			<tr align=center>
				<td>전화 :</td>
				<td><%=rs.getString("email")%></td>
			</tr>
			<tr align=center>
				<td>가입일 :</td>
				<td><%=rs.getString("reg_date")%></td>
			</tr>
			<tr align=center>
				<td colspan=2><a href="member_list.jsp"> 리스트로 돌아가기 </a></td>
			</tr>
		</table>
	</center>
</body>
</html>
</html>