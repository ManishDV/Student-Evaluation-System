<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%
	String cid = request.getParameter("classid");
	String bid = request.getParameter("batchid");
	String end = request.getParameter("end");
	String start = request.getParameter("start");
	out.println(start);
	out.println(end);
	int strength = 0;
	
		strength = (Integer.parseInt(end) - Integer.parseInt(start) + 1);
	
	
	Connection con = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");

		Statement st = con.createStatement();
		Statement st1 = con.createStatement();
		int i = st.executeUpdate("insert into batch values('" + bid + "','" + strength + "')");
		int i1 = st1.executeUpdate("insert into class_has_batch values('" + cid + "','" + bid + "')");
		

		st.close();
		st1.close();
		con.close();

	} catch (Exception e) {
		out.println(e.getMessage());
	} finally {
		out.println("NOTE: Batch added successfully!!");
	}
%>
