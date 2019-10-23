<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	ResultSet resultset = null;
%>

<HTML>
<HEAD>

<%@include file="dashboard.jsp"%>
<TITLE>Map Class Teacher</TITLE>
<script>
    var a = 7;

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
		
		classid = $("#class").val();
		subject = $("#subject").val();
		teacher = $("#teacher").val();
		
		if(classid == null || subject == null || teacher == null){
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

			resultset = statement.executeQuery("select * from class ");
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
								<h4 class="card-title">Map Class_Teacher</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
								<form action="submit_class_teacher.jsp">
								
									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group">


												<select class="form-control" id="class" name="class">
												<option value=" " disabled selected>SELECT CLASS</option>
												
													<%
														while (resultset.next()) {
													%>
													<option><%=resultset.getString(1)%></option>
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
													resultset = statement.executeQuery("select * from subject where theory=1");
												%>
												<select name="ctl" class="form-control" id="subject">
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
												<select name="staff" class="form-control" id="teacher">
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

							     <button type="submit"  onclick="return check()" class="btn btn-primary pull-right">ADD</button>
									
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
			out.println("wrong entry" + e);
		}
	%>


</BODY>
</HTML>

