<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.* "%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="dashboard.jsp"%>
<style>
</style>
<meta charset="UTF-8">
<title>Add / Remove Assignment</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>

<script src="js/bootstrap-waitingfor.js"></script>
<link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/icons_fonts.css" />
<script src="js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	$("#addTab").on("click",function(){
		$("#add").slideToggle(1000);
		$("#delete").hide();
	});
	$("#deleteTab").on("click",function(){
		$("#delete").slideToggle(1000);
		$("#add").hide();

	});
	
});

</script>

<script>
var a = 6;

var error = '<%=session.getAttribute("error")%>';

	if (error.trim().length != 0) {
		
		if(error == "Assignments Added Successfully" || error == "Assignment Deleted Successfully"){
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
		
			
			<%session.setAttribute("error", " ");%>
	}
	
		
		function check(){
			 
			 filename = $("#file").val();
			 ltl = $("#ltl").val();	
			 if(filename.trim().length == 0 && ltl == null){
				 Swal.fire({
					  type: 'warning',
					  title: 'All Fields Are Mandatory',
					  text: '',
					  confirmButtonColor: 'purple',
					})
				 return false;
				 
			 }
			 else if(filename.trim().length == 0){
				 
				 Swal.fire({
					  type: 'warning',
					  title: 'Please Select .docx or .doc to Add Assignments',
					  text: '',
					  confirmButtonColor: 'purple',
					})
				 return false;
			 }else if(ltl == null){
				 Swal.fire({
					  type: 'warning',
					  title: 'Please Select Subject',
					  text: '',
					  confirmButtonColor: 'purple',
					})
				 return false;
				
			 }
			 else{
				return true;	 
			 }
		}

</script>

<style>
</style>
</head>

<body style="overflow: scroll;">
	<%
		ResultSet resultset = null;
	%>

	<%
		String sr = new String();
		String exp = new String();
		String dt = new String();
		int count = 0, in = 0;
		int updateQuery = 0;
		PreparedStatement pstatement = null;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish",
				"Manny@123");
		Statement statement = con.createStatement();
	%>

	<div class="main-panel">
		<!-- Navbar -->
		<div id="content">
			<div id="container-fluid">

				<div class="row">
					<div style="margin: 0px auto; margin-top: 15%" class="col-md-6">
						<div class="card">
							<div class="card-header card-header-tabs card-header-primary">
								<div class="nav-tabs-navigation">
									<div class="nav-tabs-wrapper">
										<span class="nav-tabs-title">Assignments:</span>
										<ul class="nav nav-tabs" data-tabs="tabs">
											<li class="nav-item" id="addTab"><a
												class="nav-link active" href="#add" data-toggle="tab"> <i
													class="material-icons">add</i> ADD
													<div class="ripple-container"></div>
											</a></li>
											<li class="nav-item" id="deleteTab"><a class="nav-link"
												href="#delete" data-toggle="tab"> <i
													class="material-icons">delete</i> DELETE
													<div class="ripple-container"></div>
											</a></li>

										</ul>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="tab-content">
									<div class="tab-pane active" id="add">
										<table class="table">
											<tbody>
												<tr>
													<td>
														<form name="FileForm" ACTION="extract_word_assign.jsp"
															METHOD=POST>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group bmd-form-group">

																		<%
													resultset = statement.executeQuery("select * from subject where theory = 0");
												%>

																		<select class="form-control" name="ltl" id="ltl">
																			<option selected disabled>Select Subject</option>
																			<%
														while (resultset.next()) {
													%>
																			<option><%=resultset.getString(5)%></option>
																			<%
														}
													%>
																		</select>

																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group bmd-form-group">

																		<label class="bmd-label-floating">Upload Word
																			File</label>

																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group bmd-form-group"></div>
																</div>
															</div>

															<input accept=".doc, .docx" id="file" name="file1"
																class="form-control" type="file">
															<button style="margin-left: 40%; margin-right: 40%;"
																type="submit" onclick="return check()"
																class="btn btn-primary pull-right">ADD</button>

														</form>

													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="tab-pane" id="delete">
										<table class="table">
											<tbody>
												<tr>
													<td>
														<form name="dform" action="delete_assgn.jsp" METHOD=POST>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group bmd-form-group">

																		<%
													resultset = statement.executeQuery("select * from subject where theory = 0");
												%>

																		<select class="form-control" name="dltl" id="dltl">
																			<option selected disabled>Select Subject</option>
																			<%
														while (resultset.next()) {
													%>
																			<option><%=resultset.getString(5)%></option>
																			<%
														}
													%>
																		</select>

																	</div>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class="form-group bmd-form-group"></div>
																</div>
															</div>





															<button type="submit" class="btn btn-primary pull-left">Delete</button>

														</form>

													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
