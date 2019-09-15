<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%
	String cid=request.getParameter("classid");
	String end = request.getParameter("end");
	String start = request.getParameter("start");
	int cal_strength=0;
	if(cid.equals("te9")||cid.equals("te10")||cid.equals("te11"))
	{
		cal_strength = (Integer.parseInt(end)-Integer.parseInt(start)+1);
	}
	else
	{
		cal_strength=0;
	} 
	
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/Demo", "Sahil", "Sahil@123");
		out.println("Connected");
		Statement st=con.createStatement();
		int i=st.executeUpdate("insert into class values('"+cid+"','"+cal_strength+"')");
		
		con.close();
		st.close();
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	finally
	{
		out.println("NOTE: Class added successfully!!");
	}
%>
