<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<select id="subject" class="form-control" style="width:90%">
		<option value=" ">SELECT SUBJECT</option>
		<% 
			try{
				String year = request.getParameter("year");
				String user = request.getParameter("user");
				String cid = request.getParameter("classid");
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
				
				String query = "select abbrevation from subject,teacher_teaches_class as tt where tt.sid = subject.sid and cid='"+cid+"' and subject.theory = 1 and tt.tid = '"+user+"'";
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while(rs.next()){
					%>
						<option value=<%=rs.getString("abbrevation")%>><%=rs.getString("abbrevation")%></option>
					<%
				}
				con.close();	
			}catch(Exception e){
				
				session.setAttribute("error", e.getMessage());
			}
			
		
		%>
	</select>
</body>
</html>