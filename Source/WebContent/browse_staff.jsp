<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<html>

<%@include file="dashboard.jsp"%>
<script>
var a = 4;
var error = '<%=session.getAttribute("error")%>';

	if (error.trim().length != 0) {
		count =  '<%=session.getAttribute("count")%>';
		if(error == "Added "+count+" New Entries To Database"){

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
			
		 if(filename.trim().length == 0){
			 
			 Swal.fire({
				  type: 'warning',
				  title: 'Please Select .xlsx or .xls to add Staff',
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
								<h4 class="card-title">Add Teachers</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body" style="width: 100%">
								<form action="staff_upload.jsp" enctype="multipart/form-data" method="post">

									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group">

												<label class="bmd-label-floating">Choose Excel Sheet</label>

											</div>
										</div>
									</div>
									<br>
									<input name="upload" class="form-control" id="file" type="file"
										accept=".xls, .xlsx" >
									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group"></div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group">

												<button type="submit" class="btn btn-primary pull-right" onclick="return check()">ADD</button>

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

	</div>

</body>
</html>