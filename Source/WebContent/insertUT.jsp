	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	try {

	String classid = (String) session.getAttribute("classid");
	String subject = (String) session.getAttribute("subject");
	String ut = (String) session.getAttribute("ut");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish", "Manny@123");
	String query = "select roll_no from class_has_students where cid = '" + classid + "'";
	Statement stmt = con.createStatement();
	ResultSet res2 = stmt.executeQuery(query);

	Statement one = con.createStatement();
	Statement third = con.createStatement();
	while (res2.next()) {
	String UTmarks = request.getParameter(Integer.toString(res2.getInt("roll_no")));
	
	String query12 = "select sid from subject where abbrevation='" + subject + "'";
	ResultSet sub = one.executeQuery(query12);
	sub.next();
	int sid = sub.getInt("sid");
	if (ut.equals("UT2")) {
	String query2 = "update student_gives_UT set ut2 = " + Integer.parseInt(UTmarks)
	+ " where roll_no=" + res2.getInt("roll_no") + " and sid='" + sid + "'";
	one.executeUpdate(query2);
		session.setAttribute("error", "Marks Entered Successfully");

	} else {
		String query2 = "insert into student_gives_UT(roll_no,sid,ut1) values("+ res2.getInt("roll_no") + "," + sid + "," + Integer.parseInt(UTmarks) + ")";
		
		one.executeUpdate(query2);
		session.setAttribute("error", "Marks Entered Successfully");
}
	}
	con.close();
		//mark.close();
		
		response.sendRedirect("addUT.jsp");
	} catch (Exception e) {
		session.setAttribute("error", e.getMessage());
		response.sendRedirect("addUT.jsp");
	}
	%>