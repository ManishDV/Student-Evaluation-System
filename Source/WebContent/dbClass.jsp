<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%
	String cid=request.getParameter("classid");
	String strength=request.getParameter("strength");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into class values('"+cid+"','"+strength+"')");	
		con.close();
		st.close();
		session.setAttribute("error","Class Added Successfully");
		response.sendRedirect("AddClass.jsp");
	}
	catch(Exception e){
		String error = "Duplicate entry '"+cid+"' for key 'PRIMARY' ";
		if(error.trim().equals(e.getMessage().trim())){
			session.setAttribute("error","Class Already Added");
			response.sendRedirect("AddClass.jsp");
		}else{
			out.println(e.getMessage());
		}
	}
%>
