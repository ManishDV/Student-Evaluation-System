<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CLIENT::TATTI</title>
</head>
<body>
	<%
		//String root=getServletContext().getRealPath("/data");
		//out.println(root);
		String path="/root/eclipse-workspace/SES/WebContent/data";
		MultipartRequest mr=new MultipartRequest(request,path);
		out.println("File Uploaded\n Nikal....Pehli fursat me nikal");
	%>
</body>
</html>
