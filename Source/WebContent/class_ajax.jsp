
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script>
/*$(document).ready(function() {
	$("#batch").on("change", function() {
		var batch = $("#batch").val();//id of country select box of index.jsp page;
		$.ajax({
			url : "batch_ajax.jsp",//your jsp page name
			data : {
				batch : batch
			},//sending request to state.jsp page.
			method : "POST",//HTTP method.
			success : function(data) {
				$("#roll").replaceWith(data);//output or response will display in state select box.
			}
		});
	});
});*/
</script>
</head>
<body>
	<select name="batch" id="batch">
		<option value="Select Batch" selected disabled="disabled">Select Batch</option>
		<%
				Connection con = null;
            	ResultSet resultset = null;
            	PreparedStatement pstatement = null;
            	int i1=0;
        		Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
				String class1 = request.getParameter("class1");
				String user = request.getParameter("user");
				 Statement st = con.createStatement();
				String query = "select chb.bid from class_has_batch as chb,teacher_teaches_batch as ttb where cid = '"+class1+"' and ttb.tid = '"+user+"'";
				resultset = st.executeQuery(query);
				while (resultset.next()) {
            %>
		<option><%=resultset.getString("bid")%></option>
		<%
                }
        %>
	</select>
	
   
</body>

</html>