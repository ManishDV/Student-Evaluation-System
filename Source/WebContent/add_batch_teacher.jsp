<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>

<HTML>
<HEAD>

<%@include file="dashboard.jsp"%>
<TITLE>Select element drop down box</TITLE>
<script>
    var a = 8;

    var error = '<%=session.getAttribute("error")%>';

	if (error.trim().length != 0) {
		if(error == "Teacher Assigned Successfully"){
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
		batch = $("#batch").val();
		subject = $("#subject").val();
		teacher = $("#teacher").val();
		
		if(batch == null || subject == null || teacher == null){
			Swal.fire({
				  type: 'warning',
				  title: 'All Fields Are Mandatory',
				  text: '',
				  confirmButtonColor: 'purple',
				})
			 return false;
		}
		return true;
		
	}
</script>

</HEAD>

<BODY>

	<%
		try {
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false",
					"Manish", "Manny@123");

			Statement statement = connection.createStatement();

			resultset = statement.executeQuery("select * from batch ");
	%>

	<div class="main-panel">
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
			<div class="container-fluid">

				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<!-- End Navbar -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div style="margin: 0px auto;" class="col-md-6">
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">MAP Batch_Teacher</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
								<form action="submit_batch_teacher.jsp">

									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group">



												<select class="form-control" id="batch" name="batch">
												<option value=" " disabled selected>SELECT BATCH</option>
													<%
														while (resultset.next()) {
													%>
													<option><%=resultset.getString("bid")%></option>
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


												<%
													resultset = statement.executeQuery("select * from subject where theory = 0");
												%>
												<select id="subject" class="form-control" name="ltl">
												<option value=" " disabled selected>SELECT SUBJECT</option>
													<%
														while (resultset.next()) {
													%>
													<option><%=resultset.getString("name")%></option>
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
												<%
													resultset = statement.executeQuery("select distinct(tname) from teacher");
												%>
												<select id="teacher" class="form-control" name="staff">
												<option value=" " disabled selected>SELECT TEACHER</option>
													<%
														while (resultset.next()) {
													%>
													<option><%=resultset.getString("tname")%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									</div>

									<button type="submit" onclick="return check()" class="btn btn-primary pull-right">ADD</button>

								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

	<%
		//**Should I input the codes here?**
		} catch (Exception e) {
			session.setAttribute("error", e.getMessage());
			response.sendRedirect("add_batch_teacher.jsp");
		}
	%>


</BODY>
</HTML>
