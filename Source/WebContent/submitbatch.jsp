<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%
	int flag = 0;
	String cid = request.getParameter("classid");
	String bid = request.getParameter("batchid");
	int end = Integer.parseInt(request.getParameter("end"));
	int start = Integer.parseInt(request.getParameter("start"));
	out.println(start);
	out.println(end);
	int strength = 0;
	
		strength = (end - start + 1);
	
	
	Connection con = null;

	try {
		   Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false","Manish","Manny@123");   	 
	    
		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		
		String query1 = "select roll_no from batch_has_students where roll_no = "+start+"";
		Statement st4 = con.createStatement();
		ResultSet rs4 = st4.executeQuery(query1);
		rs4.next();
		rs4.last();
		int count = rs4.getRow();
		
		if(count == 0){
			
			int j = st.executeUpdate("insert into batch values('" + bid + "','" + strength + "')");
			int i1 = st1.executeUpdate("insert into class_has_batch values('" + cid + "','" + bid + "')");
			
			for(int i=start;i<=end;i++){
				int l2 = st2.executeUpdate("insert into batch_has_students values("+i+",'"+bid+"')");
			}
			
			 session.setAttribute("error","Batch Added Successfully");	
			 response.sendRedirect("AddBatch.jsp");
		}else{
				 session.setAttribute("error","This Roll Number Range Is Already Added In Another Batch");	
				 response.sendRedirect("AddBatch.jsp");			
		}
	} catch (Exception e) {
		String error = "Duplicate entry '"+bid+"' for key 'PRIMARY'";
		if(e.getMessage().trim().equals(error.trim())){
			session.setAttribute("error","Batch Is Already Added");
			response.sendRedirect("AddBatch.jsp");	
		}else{
			session.setAttribute("error",e.getMessage());
			response.sendRedirect("AddBatch.jsp");	
		}
		
	}
%>
