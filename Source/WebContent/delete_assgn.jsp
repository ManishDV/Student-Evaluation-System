<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false", "Manish",
				"Manny@123");
		PreparedStatement pstatement = null;
		Statement st = null;

		int i2[], i1 = 0, del;
		i2 = new int[10];
		String s_name = request.getParameter("dltl");

		String query = "select sid from subject where abbrevation = ?";
		try {
			pstatement = con.prepareStatement(query);
			pstatement.setString(1, s_name);

			resultset = pstatement.executeQuery();
			resultset.next();
			i1 = resultset.getInt("sid");
			Statement statement = con.createStatement();
			
			String queryCheck = "select count(*) as Total from assignment where sid = "+i1+"";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(queryCheck);
			rs.next();
			if(rs.getInt("Total") > 0){
				
				del = statement.executeUpdate("delete from assignment where sid =" + i1 + "");
				session.setAttribute("error", "Assignment Deleted Successfully");
						
			}else{
				session.setAttribute("error", "No Assignments To Delete");
			}
			
			response.sendRedirect("browse_word.jsp");

		} catch (Exception e) {
			session.setAttribute("error", e.getMessage());
			response.sendRedirect("browse_word.jsp");
		}
	%>
</body>
</html>