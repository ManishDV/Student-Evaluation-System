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
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false", "Manish",
				"Manny@123");
		
		Statement st1=con.createStatement();
		
			int i=st1.executeUpdate("insert into subject values('"+subject_id+"','"+year+"','"+sem+"','"+subject_name+"','"+subject_abbrevation+"','"+type_of_subject+"')");
			session.setAttribute("error","Subject Added Succcessfully");
			response.sendRedirect("AddSubject.jsp");
	
		
	}
	catch(Exception e){
		String error = "Duplicate entry '"+subject_id+"' for key 'PRIMARY'";
		String error1 = "Duplicate entry '"+subject_name+"' for key 'name_2'";
			
				if(e.getMessage().trim().equals(error.trim())){
					session.setAttribute("error","Subject Already Present With ID: "+subject_id+"");
					response.sendRedirect("AddSubject.jsp");			
				}else if(e.getMessage().trim().equals(error1.trim())){

					session.setAttribute("error","Subject Already Present with Name : "+subject_name+"");
					response.sendRedirect("AddSubject.jsp");		
					
				}
				
				
				else{
					session.setAttribute("error",e.getMessage());
					response.sendRedirect("AddSubject.jsp");
				}
		
		
	}
	
%>