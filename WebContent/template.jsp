<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Lab2</title>

<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>

</head>
<%
	String pagefile = request.getParameter("pagefile");
%>
<body>
	<div id="container">
		<!-- header ����  -->
		<h2>�߰� �ŷ�</h2>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="headermenu"><jsp:include page="menu.jsp" /></div>
		<!-- header ��  -->
		<!--  content ����  -->
		<div id="content">
			<jsp:include page='<%=pagefile + ".jsp"%>' />
		</div>
		<!--  content ��  -->



		<!--  footer ����   -->
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
		<!--  footer ��  -->

	</div>

</body>
</html>
