<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script>
 		$("#class").on("change", function() {
			var year = $("#year").val();
			var classid = $("#class").val();
			var user = '<%=(String)session.getAttribute("user")%>';
			
			$("#error").html("");
			$.ajax({
				url : "sub.jsp",
				method : "POST",
				data : {
					year : year,
					classid : classid,
					user : user
				},
				success : function(data) {
					$("#subject").replaceWith(data);//response sending to city.jsp page 
				}
			});
		});
 </script>
 <script src="js/jquery.js"></script>
</head>
<body>
	<select id="class" class="form-control" style="width:90%">
		<option value=" ">SELECT CLASS</option>
		<% 
			try{
				String year = request.getParameter("year");
				String user = request.getParameter("user");
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
				
				String query = "select distinct(cid) from teacher_teaches_class where cid like '"+year+"%' and tid='"+user+"'";
				Statement statement = con.createStatement();
				ResultSet rs = statement.executeQuery(query);
				while(rs.next()){
					%>
						<option value=<%=rs.getString("cid")%>><%=rs.getString("cid")%></option>
					<%
				}
			}catch(Exception e){
					session.setAttribute("error",e.getMessage());
			}
		
		
		%>
	</select>
</body>
</html>