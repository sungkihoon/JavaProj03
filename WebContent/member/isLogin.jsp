<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- isLogin.jsp --%>

<%
if(session.getAttribute("id") == null){
%>
	<script>
		alert("로그인 후 이용해주세요");
		location.href = "../main/main.jsp";
	</script>
<%
	return;
}
%>