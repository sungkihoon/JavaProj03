<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="model1.MemberDTO"%>
<%@page import="model1.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- JoinProcess.jsp --%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter writer = response.getWriter();

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pass1 = request.getParameter("pass");
	String pass2 = request.getParameter("pass2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String mobile1 = request.getParameter("mobile1");
	String mobile2 = request.getParameter("mobile2");
	String mobile3 = request.getParameter("mobile3");
	String email_1 = request.getParameter("email_1");
	String email_2 = request.getParameter("email_2");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String zip = request.getParameter("zip");

	//System.out.println(email_2);
	
	String pass = pass2;
	String tel = tel1 + "-" + tel2;
	String mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
	String email = email_1 + "@" + email_2;
	String addr = addr1 + " " + addr2;

	String drv = application.getInitParameter("MariaJDBCDriver");
	String url = application.getInitParameter("MariaConnectURL");

	MemberDAO dao = new MemberDAO(drv, url);
	MemberDTO dto = new MemberDTO();

	dto.setName(name);
	dto.setId(id);
	dto.setPass(pass);
	dto.setTel(tel);
	dto.setMobile(mobile);
	dto.setEmail(email);
	dto.setAddr(addr);
	dto.setZip(zip);
	
	//System.out.println(email_2);
	
	int affected = dao.insertMember(dto);
	
	if(affected==1){
		//글쓰기에 성공했을때...
		response.sendRedirect("../main/main.jsp");
	}else{
		//글쓰기에 실패했을때..
%>
	<script>
		alert("회원가입에 실패하였습니다.");
		history.go(-1);
	</script>
<%
	}
%>


