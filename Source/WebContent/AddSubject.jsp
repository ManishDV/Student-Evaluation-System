<!DOCTYPE html>
<html>
<head>

<%@include file="dashboard.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	
</script>
<meta charset="UTF-8">
<title>Add Subject</title>
<style>

</style>
<script>
var a = 5;
var error = '<%=session.getAttribute("error")%>';

if(error.trim().length != 0){
     if(error == "Subject Added Succcessfully"){
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

function check(){
	 year = $("#year").val();
	 sem = $("#semester").val();
	 sub_id = $("#subject_id").val();
	 sub_name = $("#subject_name").val();
	 sub_name = $("#subject_name").val();
	 sub_abbr = $("#subject_abbrevation").val();
	 type = $("#type").val();
	 
	 //alert(year+"\n"+classid+"\n"+strength.trim().length);
		if(year == null || sem == null || sub_id.trim().length == 0 || sub_name.trim().length == 0 || sub_abbr.trim().length == 0 || type == null){
			Swal.fire({
				  type: 'error',
				  title: "All Fields Are Mandatory",
				  text: '',
				  confirmButtonColor: 'purple',
				})
				return false;
		}
		return true;
}
</script>

</head>
<body>
	<body>
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
								<h4 class="card-title">Add Subject</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
								<form action="dbSubject.jsp" method="POST">
									<div class="row">
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
									
												<select class="form-control" name="year" id="year">
													<option value="-1" selected disabled="disabled">Select
														Year</option>
													<option value="SE">SE</option>
													<option value="TE">TE</option>
													<option value="BE">BE</option>
												</select>
											</div>
										</div>
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
												<select class="form-control" name="semester" id="semester">
													<option value="-1" selected disabled="disabled">Select
														Semester</option>
													<option value="1">SEM 1</option>
													<option value="2">SEM 2</option>
												</select>
											</div>
										</div>
									</div>	
									<div class="row">
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
												<input class="form-control" id="subject_id" name="subject_id"
													type=text placeholder="Subject ID">
											</div>
										</div>
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
												<input class="form-control"
													id="subject_name" name="subject_name" type=text
													placeholder="Subject Name"> 
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
												<input class="form-control"
													id="subject_abbrevation" name="subject_abbrevation" type=text
													placeholder="Subject Abbrevation">
											</div>
										</div>
										<div class="col-md-6">
							            	<div class="form-group bmd-form-group">
												<select class="form-control" name="type" id="type">
													<option value="-1" selected disabled="disabled">Theory/Lab</option>
													<option value="1">Theory</option>
													<option value="0">Lab</option>
												</select>
											</div>
										</div>
									</div>
										<button type="submit" style="align:left; margin-left: 45%; margin-right:50%; "
											class="btn btn-primary " onclick="return check()">ADD</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>