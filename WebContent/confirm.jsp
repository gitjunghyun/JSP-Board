<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="db.LogonDBBean"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	//id는 사용자가 회원가입을 하기위해서 입력한 아이디 
	String id = request.getParameter("id");
	//DB처리빈인 LogonDBBean클래스의 객체를 얻어낸다. 
	LogonDBBean manager = LogonDBBean.getInstance();
	//사용자가 입력한 id값을 가지고 LogonDBBean클래스의 confirmId()메소드 호출 
	//중복아이디 체크 confirmId()메소드의 실행결과로 check에는 1또는 -1값이 리턴 됨
	int check = manager.confirmId(id);
	if (check == 1) {%>
	<script>
	alert("이미 존재하는 ID입니다.");
	history.back();
	</script>
	<% } else { %>
	<script>
	alert(" 사용 가능한 ID입니다.");
	history.back();
	</script><%
	}
%>