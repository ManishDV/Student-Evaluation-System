<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %> 
<%@ page import="java.sql.*" %> 
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
PreparedStatement pstatement = null;
PreparedStatement pstatement1 = null;
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false","Manish","Manny@123");   
Statement st =con.createStatement(); 
 
int updateQuery, i1=0,i2=0;
String i3 ="";
 String staff = request.getParameter("staff");
 String ltl = request.getParameter("ltl");
 String batch = request.getParameter("batch");
String a;
 a ="select tid from teacher where tname = ? ";
 try {
	 pstatement = con.prepareStatement(a);
	 pstatement.setString(1, staff);
	} catch (Exception e) {
	  e.printStackTrace();
	}
 resultset = pstatement.executeQuery();
 if (resultset.next()) {
     i3=resultset.getString("tid");
 }
 
 a ="select * from subject where name = ?";
 try {
	 pstatement = con.prepareStatement(a);
	 pstatement.setString(1, ltl);
	} catch (Exception e) {
	  e.printStackTrace();
	}
 resultset = pstatement.executeQuery();
 if (resultset.next()) {
     i2=resultset.getInt("sid");
 }
 
 Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery("select count(*) as count from teacher_teaches_batch where bid like '"+batch+"' and sid="+i2+"");
	rs.next();
	int ct = rs.getInt("count");
	if (ct > 0) {
		 session.setAttribute("error","Teacher Already Assigned For This Batch");
		response.sendRedirect("add_batch_teacher.jsp");
	} else {

 try
	{
	String queryString = "INSERT INTO teacher_teaches_batch(bid, tid, sid) VALUES (?, ?, ?)";
	pstatement1 = con.prepareStatement(queryString);
	pstatement1.setString(1, batch);
	pstatement1.setString(2, i3);
	pstatement1.setInt(3, i2);
        updateQuery = pstatement1.executeUpdate();
		session.setAttribute("error","Teacher Assigned Successfully");
		response.sendRedirect("add_batch_teacher.jsp");
  
	}
	catch(Exception e)
	{
		session.setAttribute("error",e.getMessage());
		response.sendRedirect("add_batch_teacher.jsp");
	}
	}
%>
</body>
</html>
