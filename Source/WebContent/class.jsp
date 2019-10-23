<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$("#class").on("change", function() {
	var year = $("#year").val();
	var classid = $("#class").val();
	var user = '<%=(String)session.getAttribute("user")%>';
	
	$("#error").html("");
	$.ajax({
		url : "batch.jsp",
		method : "POST",
		data : {
			year : year,
			classid : classid,
			user : user
		},
		success : function(data) {
			$("#batch").replaceWith(data);//response sending to city.jsp page 
		}
	});
});
</script>


</script>

</head>
<body>
		<select id="class" name="class" class="form-control">
			<option value=" " disabled selected>SELECT CLASS</option>
			<%
			try{	
			String year = request.getParameter("year");
			String user = request.getParameter("user");
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
			String query = "select cid from teacher_teaches_class where cid like '"+year+"%'";
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery(query);
			while(rs.next()){
				%>
					<option value=<%=rs.getString("cid")%>><%=rs.getString("cid")%></option>
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