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
		<!-- header 시작  -->
		<h2>중고 거래</h2>
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="headermenu"><jsp:include page="menu.jsp" /></div>
		<!-- header 끝  -->
		<!--  content 시작  -->
		<div id="content">
			<jsp:include page='<%=pagefile + ".jsp"%>' />
		</div>
		<!--  content 끝  -->



		<!--  footer 시작   -->
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
		<!--  footer 끝  -->

	</div>

</body>
</html>
