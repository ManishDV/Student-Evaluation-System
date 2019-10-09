<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
	String year=request.getParameter("year");
	String semester=request.getParameter("semester");
	String subject_id=request.getParameter("subject_id");
	String subject_name=request.getParameter("subject_name");
	String subject_abbrevation=request.getParameter("subject_abbrevation");
	String type=request.getParameter("type");
	
	int type_of_subject=Integer.parseInt(type);
	
	int sem=Integer.parseInt(semester);
	
	
	ResultSet rs=null;
	Connection con=null;
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");
		
		Statement st1=con.createStatement();
		int i=st1.executeUpdate("insert into subject values('"+subject_id+"','"+year+"','"+sem+"','"+subject_name+"','"+subject_abbrevation+"','"+type_of_subject+"')");
		out.println();
	
		st1.close();
		con.close();
		
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	finally
	{
		out.println("NOTE: Subject added successfully!!");
	}
%>