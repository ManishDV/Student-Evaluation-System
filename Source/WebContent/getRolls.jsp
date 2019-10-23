<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
</head>
<body>
	<select id="startRoll" class="form-control">
		<option value=" ">Ending Roll No</option>
		<% 
			try{
				
				String classid = request.getParameter("classid");
				System.out.println("Class Id: "+classid);
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
				
				String query = "select roll_no from class_has_students where cid = '"+classid+"'";
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while(rs.next()){
					%>
						<option value=<%=rs.getString("roll_no")%>><%=rs.getString("roll_no")%></option>
					<%
				}
			}catch(Exception e){
					session.setAttribute("error",e.getMessage());
			}
		
		
		%>
	</select>
</body>
</html>