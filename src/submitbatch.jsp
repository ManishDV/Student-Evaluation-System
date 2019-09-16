<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%

String bid=request.getParameter("batchid");
String end = request.getParameter("end");
String start = request.getParameter("start");
out.println(start);
out.println(end);
int strength=0;
	if(bid.equals("K-9")||bid.equals("L-9")||bid.equals("M-9")||bid.equals("N-9")||bid.equals("K-10")||bid.equals("L-10")||bid.equals("M-10")||bid.equals("N-10")||bid.equals("K-11")||bid.equals("L-11")||bid.equals("M-11")||bid.equals("N-11"))
		strength = (Integer.parseInt(end)-Integer.parseInt(start)+1);
	else
		strength = 0;
	
	ResultSet rs=null;
	Connection con=null;
	Statement st=null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/Demo", "Sahil", "Sahil@123");
		
		String q = "select cid from class";
		st=con.createStatement();
		rs=st.executeQuery(q);
	
		Statement st1=con.createStatement();
		int i=st1.executeUpdate("insert into batch values('"+bid+"','"+strength+"')");
		out.println(bid);
	
		st1.close();
		con.close();
		st.close();
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	finally
	{
		out.println("NOTE: Batch added successfully!!");
	}
%>
