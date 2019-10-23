<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String expno = (String) session.getAttribute("expno");
		String batch = (String) session.getAttribute("batch");
		int assign_id = Integer.parseInt(expno);
		Connection con = null;
		ResultSet resultset1 = null;
		ResultSet resultset2 = null;
		Statement st = null;
		Statement st1 = null;
		PreparedStatement pstatement = null;
		Date date1 = new Date();
		Date date2 = new Date();
		int updateQuery = 0;
		int did = 0,rpp1=0,spo1=0,total=0;
		String rpp=null;
		String spo=null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false", "Manish", "Manny@123");
		String a = " ";
		int i1 = 0, i = 1;
		

		 st = con.createStatement();
			String query = "select * from batch_has_students, student_performs_assignment  where batch_has_students.roll_no=student_performs_assignment.roll_no and assign_id = ? and bid=?";
			try {
				pstatement = con.prepareStatement(query);
				pstatement.setInt(1, assign_id);
				pstatement.setString(2, batch);
			} catch (Exception e) {
				e.printStackTrace();
			}		
			resultset1= pstatement.executeQuery();

		while (resultset1.next()) 
		{

			 rpp = request.getParameter(resultset1.getInt("roll_no") + "rpp");
			rpp1 = Integer.parseInt(rpp);
			 spo = request.getParameter(resultset1.getInt("roll_no") + "spo");
			spo1 = Integer.parseInt(spo);
			total = rpp1 + spo1;
			String per_date = request.getParameter(resultset1.getInt("roll_no") + "per_date");
			date1 = new SimpleDateFormat("yyyy-MM-dd").parse(per_date);
			String sub_date = request.getParameter(resultset1.getInt("roll_no") + "sub_date");
			date2 = new SimpleDateFormat("yyyy-MM-dd").parse(sub_date);

			try {
				String query1 = "update student_performs_assignment set actual_performance_date = ? ,actual_submission_date=?, rpp=?,spo=?,total=? where roll_no= ? and assign_id=?;";
				pstatement = con.prepareStatement(query1);
				
				pstatement.setObject(1, date1);
				pstatement.setObject(2, date2);
				pstatement.setInt(3, rpp1);
				pstatement.setInt(4, spo1);
				pstatement.setInt(5, total);
				pstatement.setInt(6, resultset1.getInt("roll_no"));
				pstatement.setInt(7, assign_id);
				
				updateQuery = pstatement.executeUpdate();
	
			} catch (Exception e) {

				session.setAttribute("error",e.getMessage());
				response.sendRedirect("add_assignment.jsp");
			}

		}
		
		session.setAttribute("error","Assignment Marks Uploaded Successfully");
		response.sendRedirect("add_assignment.jsp");
	%>
</body>
</html>