
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Unit Test Marks</title>

<link rel="stylesheet" href="css/bootstrap.css">

<!-- 	<link rel="stylesheet"
	href="utstyle.css">
 -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>

<%@include file="dashboard.jsp"%>
<script>
	var a = 1;
	$(document).ready(function() {
		$("#content").hide();
		$("#content1").hide();
		
		$("#year").on("change", function() {
			var year = $("#year").val();//id of country select box of index.jsp page;
			var user = '<%=(String) session.getAttribute("user")%>';
					$.ajax({
						url : "class1.jsp",//your jsp page name
						data : {
							year : year,
							user : user
						},//sending request to state.jsp page.
						method : "POST",//HTTP method.
						success : function(data) {
							$("#class").replaceWith(data);//output or response will display in state select box.

						}
					});
				});

				$("form").submit(function(e) {
					e.preventDefault();
				});

				$("#calculate").on('click',function() {
							
							
							var classid = $("#class").val();
							var subject = $("#subject").val();
							var ut = $("#UT").val();
							var year = $('#year').val();
							//alert('CLASSID: '+classid+'\nSUB: '+subject+'\nUT: '+ut+'\nYEAR: '+year);

							if (year == null || classid == null
									|| subject == null || ut == null) {
								Swal.fire({
									  type: 'error',
									  title: 'All Fields Are Mandatory',
									  text: '',
									  confirmButtonColor: 'purple',
									})
								//response.sendRedirect("addUTMarks.jsp");
							}

							else {
								$.ajax({
									url : "Markstable.jsp",
									method : "POST",
									data : {
										classid : classid,
										subject : subject,
										ut : ut
									},
									success : function(data) {
										remark = '<%=session.getAttribute("remark")%>';
											
										if(remark == " "){
											$("#content1").show();
											$("#content").hide();
											$("#content1").replaceWith(data);	
										}else{
											Swal.fire({
												  type: 'error',
												  title: remark,
												  text: '',
												  confirmButtonColor: 'purple',
												})
											<%
												session.setAttribute("remark", " ");
											%>
										}
										
										
									}
								});
							}
						});
				
								
				$("#view").on(
						"click",
						function() {
							
							var classid = $("#class").val();
							var subject = $("#subject").val();
							var ut = $("#UT").val();
							var year = $('#year').val();
							
							if (year == null || classid == null|| ut == null || subject == null) {
								Swal.fire({
									  type: 'error',
									  title: 'All Fields Are Mandatory',
									  text: '',
									  confirmButtonColor: 'purple',
									})
							}else{
								$.ajax({
							
								url : "Marks.jsp",
								method : "POST",
								data : {
									classid : classid,
									subject : subject,
									ut : ut
								},
								success : function(data) {

									$("#content1").hide();	
									$("#content").show();
									remark = '<%=session.getAttribute("remark")%>';
									$("#content").replaceWith(data);//response sending to city.jsp page 
								}
								}
							);}
						});

					
			});
	var error = '<%=session.getAttribute("error")%>';
	if (error.trim().length != 0) {
		if(error == "Marks Entered Successfully"){
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
</script>
</head>
<body style="overflow: scroll">

	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div style="margin: 0px auto;" class="col-md-6">
					<div class="card" style="width: 123%">
						<div class="card-header card-header-primary" style="width: 96%">
							<h4 class="card-title">Add Unit Test Marks</h4>
							<p class="card-category"></p>
						</div>
						<div class="card-body">
							<form action="#" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<select id="year" class="form-control" style="width: 90%">
												<option value=" " selected disabled>SELECT YEAR</option>
												<option value="SE">SE</option>
												<option value="TE">TE</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<select id="class" class="form-control" style="width: 90%">
												<option value=" " selected disabled>SELECT CLASS</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<select id="subject" class="form-control" style="width: 90%">
												<option value=" " selected disabled>SELECT SUBJECT</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group bmd-form-group">
											<select id="UT" class="form-control" style="width: 90%">
												<option value=" " selected disabled>SELECT UNIT
													TEST</option>
												<option value="UT1">UNIT TEST 1</option>
												<option value="UT2">UNIT TEST 2</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<button type="submit" id="calculate" name="calculate"
												class="btn btn-primary pull-right">Calculate</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<button type="submit" id="view"
												class="btn btn-primary pull-left" name="view">View</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content" id="content1">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="width: 100%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">Enter Unit Test Marks</h4>
						</div>
						<div class="card-body" style="width: 90%">
							<div class="table-responsive" style="width: 100%">
								<form class="name" action="insertUT.jsp"></form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content" id="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="width: 100%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">Unit Test Marks</h4>
						</div>
						<div class="card-body" style="width: 100%">
							<div class="table-responsive" style="width: 100%">
								<table class="table table-hover" id="viewResult"
									style="width: 100%">
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