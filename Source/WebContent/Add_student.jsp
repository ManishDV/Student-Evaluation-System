<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<html>
<head>
	<title>
		Add Students
	</title>
</head>

<%@include file="dashboard.jsp" %>
<script>
var a=2;
var error = '<%=session.getAttribute("error")%>';
if(error.trim().length != 0){
	
	if(error == "Students Added Successfully")
	{
		Swal.fire({
			  type: 'success',
			  title: error,
			  text: '',
			  confirmButtonColor: 'purple',
			})
			
	}
	else{

		Swal.fire({
			  type: 'warning',
			  title: error,
			  text: '',
			  confirmButtonColor: 'purple',
			})
			
	 	} 
	
 <%
    session.setAttribute("error","");
 %> 
 
 
}

function check(){
	 
	 filename = $("#file").val();
		
	 if(filename.trim().length == 0){
		 
		 Swal.fire({
			  type: 'warning',
			  title: 'Please Select .xlsx or .xls to add Students',
			  text: '',
			  confirmButtonColor: 'purple',
			})
		 return false;
	 }else{
		return true;	 
	 }
	
}
</script>
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
								<h4 class="card-title">Add Students</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
								<form action="submitstudent.jsp" method="post"
									enctype="multipart/form-data">
									Select your file to upload <br><br>
									<input class="form-control" type="file" id="file" class="form-control" name="upload" accept=".xls, .xlsx"><br>	

									<input class="btn btn-primary" style="margin-left:40%;margin-right:50%" type="submit"  onclick="return check()" value="upload">		
								
						
								</form>
										<div class="clearfix"></div>								
						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>