<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="js/jquery.js"></script>

<script>
	
$(document).ready(function(){
	
	
	$("#batch").on("change", function() {
		
		var batch = $("#batch").val();
		
		var user = '<%=session.getAttribute("user")%>';
			$.ajax({
					url : "subject.jsp",
					data : {
						user : user,
						batch : batch
					},
					method : "POST",
					success : function(data) {
						$("#subject").replaceWith(data);
					}
				});
			});


	
});
</script>
<body>

<select id="batch" class="form-control" name="batch">
			<option value=" " disabled selected>SELECT BATCH</option>
			<%
			try{	
				String classid = request.getParameter("classid");
			//String year = request.getParameter("year");
			String user = request.getParameter("user");
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
			
			String query = "select distinct(ttb.bid) from class_has_batch as chb,teacher_teaches_batch as ttb where cid='"+classid+"' and ttb.tid='"+user+"'";
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()){
				%>
					<option value=<%=rs.getString("bid")%>><%=rs.getString("bid")%></option>
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