<%@page import="model1.BbsDAO" %>
<%@page import="model1.BbsDTO" %>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String saveDirectory = application.getRealPath("/Upload");

int maxPostSize = 1024 * 5000;

String encoding = "UTF-8";

FileRenamePolicy policy = new DefaultFileRenamePolicy();

MultipartRequest mr = null;
String title = null; 
String content = null; 
String id = null; 
String bname = null; 

File oldFile = null;
File newFile = null;
String realFileName = null;

try{
	mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	String fileName = mr.getFilesystemName("chumFile1");
	
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	
	int idx = -1;
	idx = fileName.lastIndexOf(".");
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	
	oldFile = new File(saveDirectory+oldFile.separator+fileName);
	newFile = new File(saveDirectory+oldFile.separator+realFileName);

	oldFile.renameTo(newFile);

	title = mr.getParameter("title");
	content = mr.getParameter("content");
	bname = mr.getParameter("bname");
	
	BbsDTO dto = new BbsDTO();
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("id").toString());
	dto.setBname(bname);
	dto.setSfile(realFileName);
	dto.setOfile(mr.getOriginalFileName("chumFile1"));
	
	BbsDAO dao = new BbsDAO(application); 
	int affected = dao.myFileInsert(dto);
	
	response.sendRedirect("sub03.jsp?bname=infoboard");
	
}catch(Exception e){
	e.printStackTrace();
}
%>