<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		
	
	String classid = request.getParameter("classid");
	String ut = request.getParameter("ut");
	String subject = request.getParameter("subject");
	

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
	
	String query = "select roll_no from class_has_students where cid='"+classid+"'";
	
	Statement statement = con.createStatement();
	ResultSet rs = statement.executeQuery(query);
	
	
	String query2= "select sid from subject where abbrevation='"+subject+"'";
	
	Statement statement2 = con.createStatement();
	ResultSet rs2 = statement2.executeQuery(query2);
	rs2.next();
	int sid = rs2.getInt("sid");
	rs2.close();
	
	String query3 = "{ call getAllDetailsOfUT(?,?) }";
	CallableStatement stmt = con.prepareCall(query3);
	
	stmt.setString(1,ut.toLowerCase());
	stmt.setInt(2,sid);
	
    ResultSet rs3 = stmt.executeQuery();
    
	%>
	<div class="content" id="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="margin-left: 25%; width: 65%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">Unit Test Marks</h4>
						</div>
						<div class="card-body" style="width: 90%">
							<div class="table-responsive" style="width: 100%">
	
								<table class="table table-hover" id="viewResult" style="width: 120%">
									<thead class=" text-primary">
										<th><strong>Roll No</strong></th>
										<th><strong>Name</strong></th>
										<th><strong>Subject</strong></th>
										<th><strong>Marks</strong></th>
									</thead>
									<tbody>
										<%
    while(rs3.next() && rs.next()){
    	String query1= "select student_name as name from student where roll_no='"+rs.getInt("roll_no")+"'";
    	
    	Statement statement1 = con.createStatement();
    	ResultSet rs1 = statement1.executeQuery(query1);
    	rs1.next();
    	%>
										<tr>
											<td><%=rs.getInt("roll_no") %></td>
											<td><%=rs1.getString("name") %></td>
											<td><%=subject%></td>
											<td><%=rs3.getInt(ut.toLowerCase())%></td>
										</tr>

										<%
    	rs1.close();
    }


	}catch(Exception e){
		session.setAttribute("error",e.getMessage());
	}

%>
									</tbody>

								</table>
								
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
								</div>
							

</body>
</html>