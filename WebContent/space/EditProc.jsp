<%@page import="model1.BbsDAO"%>
<%@page import="model1.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isFlag.jsp"%>

<%-- EditProc.jsp --%>

<%
	//자유게시판, 질문과답변만 글쓰기 가능함.
	if (bname.equals("notice") || bname.equals("schboard")) {
		JavascriptUtil.jsAlertBack("해당 게시판은 수정할 수 없습니다.", out);
		return;
	}
%>

<% 
request.setCharacterEncoding("UTF-8");

//폼값받기
//String bname = request.getParameter("bname");
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);

BbsDAO dao = new BbsDAO(application);

//DTO객체를 DAO로 전달하여 게시물 업데이트(수정)
int affected = dao.updateEdit(dto);
if(affected == 1) {
	//정상적으로 수정되었다면 수정된 내용의 확인을 위해 상세보기로 이동
	response.sendRedirect("sub03.jsp?.jsp?bname="+bname + "&num=" + dto.getNum());
}
else {
	//수정 중 문제가 발생하였다면 수정하기 페이지로 돌아간다.
%>
	<script>
		alert("수정하기에 실패하였습니다.");
		histor.go(-1);
	</script>
<%
}
%>
