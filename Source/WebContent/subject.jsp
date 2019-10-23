<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id="subject" name="subject" class="form-control">
			<option value=" " disabled selected>SELECT SUBJECT</option>
			<%
			try{	
			String user = request.getParameter("user");
			String batch = request.getParameter("batch");
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
			
			String query = "select abbrevation from subject where sid=(select sid from teacher_teaches_batch where tid='"+user+"' and bid='"+batch+"') ";
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()){
				%>
					<option value=<%=rs.getString("abbrevation")%>><%=rs.getString("abbrevation")%></option>
				<%
			}
			con.close();
		}catch(Exception e){
			out.println("ERROR: "+e.getMessage());
		}
			
		%>
			
		</select>
</body>
</html>