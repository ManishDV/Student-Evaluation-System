<%@page import="org.apache.commons.math3.util.ResizableDoubleArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<HTML>

<%@include file="dashboard.jsp"%>

<HEAD>

<TITLE>Add Assignment Marks</TITLE>

<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script>
var a = 2;
	$(document).ready(function() {
		$("#content").hide();
		$("form").submit(function(e){
	        e.preventDefault();
	    });

		 $("#check").on('click',function(){
			 
			 var batch = $("#batch").val();
			 if(batch == null ){
				 Swal.fire({
					  type: 'error',
					  title: 'Please Select Batch',
					  text: '',
					  confirmButtonColor: 'purple',
					})
					//response.sendRedirect("addUTMarks.jsp");
				}
				
			 else{
	
			 //$("#error").html("All Fields Are Mandatory");
				$.ajax({
					url : "table.jsp",
					method : "POST",
					data : {
						batch:batch
					},
					success : function(data) {
						 $("#content").show();
						$(".redirect").replaceWith(data);//response sending to city.jsp page 
					}
				});
			 }
		 });
	}); //END

    var error = '<%=session.getAttribute("error")%>';

	if (error.trim().length != 0) {
		if(error == "Assignment Marks Uploaded Successfully"){ 
		Swal.fire({
			  type: 'success',
			  title: error,
			  text: '',
			  confirmButtonColor: 'purple',
			})
			
		}else{
			Swal.fire({
				  type: 'warning',
				  title: error,
				  text: '',
				  confirmButtonColor: 'purple',
				})
				
			
		}	
			<%
				session.setAttribute("error"," ");
			%>
	}
</script>

</HEAD>

<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish", "Manny@123");
		
%>

<BODY style="overflow: scroll;	">
		<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div style="margin: 0px auto;" class="col-md-6">
					<div class="card" style="width: 130%">
						<div class="card-header card-header-primary" style="width: 96%">
							<h4 class="card-title">Add Assignment Marks</h4>
							<p class="card-category"></p>
						</div>
			
		<form action="#" method="POST">
						<div class="card-body">
								<div class="row">
		
			<%
				String user = (String)session.getAttribute("user");
				String batchQuery = "select bid from teacher_teaches_batch as ttb where ttb.tid='"+user+"' ";
				Statement statement = connection.createStatement();
				ResultSet resultset = statement.executeQuery(batchQuery);
				resultset.next();
				resultset.last();
				int count = resultset.getRow();
				
				if(count <= 0){
					%>
							<h3 class="card-title "><strong class="text-center">You Are Not Assigned To Any Batch</strong></h3>
					
					<%
				}else{
					resultset = statement.executeQuery(batchQuery);
					while (resultset.next()) {
						%>
					<select name="batch" class="form-control" style="width: 90%" id="batch">
						<option value="Select Batch" selected disabled>Select Batch</option>
						<option value="<%=resultset.getString("bid")%>"><%=resultset.getString("bid")%></option>
						<%
							}
						%>
					</select>					
								
			</div> 
			<div class="row">
			<button class="btn btn-primary pull-center" id="check" type="submit">Submit</button>
			</div>	
			</div>
	
				<%} %>
			<%
				} catch (Exception e) {
					out.println("wrong entry" + e);
				}
			%>
		</form>
		</div>
		</div>
		</div>
		</div>
		</div>

	
	<div class="content" id="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="margin-left: 25%; width: 65%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">ASSIGNMENT LIST</h4>
						</div>
						<div class="card-body" style="width: 90%">
							<div class="table-responsive" style="width: 100%">
								<form class="redirect" action="#"></form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</BODY>
</HTML>