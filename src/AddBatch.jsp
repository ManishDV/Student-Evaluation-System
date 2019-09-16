<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%
	
	ResultSet rs=null;
	Connection con=null;
	Statement st=null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/Demo", "Sahil", "Sahil@123");
		
		String q = "select cid from class";
		st=con.createStatement();
		rs=st.executeQuery(q);
	
	}
	catch(Exception e)
	{
		out.println(e.getMessage());
	}
	finally
	{
		out.println("NOTE: Batch added successfully!!");
	}
%>

<!DOCTYPE html>
<html>
<script>
function configureDropDownLists(classid, batchid) {
	var te9 = ['K-9', 'L-9', 'M-9','N-9'];
  	var te10 = ['K-10', 'L-10', 'M-10','N-10'];
	var te11 = ['K-11', 'L-11', 'M-11','N-11'];

	switch (classid.value)
	{
		
		case 'TE-9':
		batchid.options.length = 0;
		for (i = 0; i < te9.length; i++) {
        	createOption(batchid, te9[i], te9[i]);
      	}
      	break;
   		
		case 'TE-10':
      	batchid.options.length = 0;
      	for (i = 0; i < te10.length; i++) {
        	createOption(batchid, te10[i], te10[i]);
      	}
      	break;
    
		case 'TE-11':
      	batchid.options.length = 0;
      	for (i = 0; i < te11.length; i++) {
        	createOption(batchid, te11[i], te11[i]);
      	}
      	break;
    	
		default:
      	batchid.options.length = 0;
      	break;
  	}
}

function createOption(classid, text, value)
{
	var opt = document.createElement('option');
	opt.value = value;
	opt.text = text;
	classid.options.add(opt);
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="submitbatch.jsp">
		<h1>Add Batch</h1>
		<h3>Class</h3>
		<select name="classid" id="classid" onchange="configureDropDownLists(this,document.getElementById('batchid'))">
		<option value="" selected disabled hidden>Select Class</option>
		 <%while (rs.next()) {%> 
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
		<% } %>
		</select><br>
		<select name="batchid" id="batchid">
		<option value="" selected disabled hidden>Select Batch</option>
			
		</select><br>
		
		<input type="text" name="start" placeholder="start"><br>
		<input type="text" name="end" placeholder="end"><br>
		
		<input type="submit" value="Add">

	</form>
</body>
</html>
