<%@include file="dashboard.jsp" %>
	<!DOCTYPE html>
<html>
<script>
	var a = 1;
	function configureDropDownLists(year, classid) {
		var SE = [ 'SE-09', 'SE-10', 'SE-11' ];
		var TE = [ 'TE-09', 'TE-10', 'TE-11' ];
		var BE = [ 'BE-09', 'BE-10', 'BE-11' ];

		switch (year.value) {

		case 'SE':
			classid.options.length = 0;
			for (i = 0; i < SE.length; i++) {
				createOption(classid, SE[i], SE[i]);
			}
			break;

		case 'TE':
			classid.options.length = 0;
			for (i = 0; i < TE.length; i++) {
				createOption(classid, TE[i], TE[i]);
			}
			break;

		case 'BE':
			classid.options.length = 0;
			for (i = 0; i < BE.length; i++) {
				createOption(classid, BE[i], BE[i]);
			}
			break;

		default:
			classid.options.length = 0;
			break;
		}
	}

	function createOption(year, text, value) {
		var opt = document.createElement('option');
		opt.value = value;
		opt.text = text;
		year.options.add(opt);
	}
	
	var error = '<%=session.getAttribute("error")%>';
	if(error.trim().length != 0){
	
		if(error == "Class Added Successfully")
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
	 year = $("#year").val();
	 classid = $("#classid").val();
	 strength = $("#strength").val();
	 //alert(year+"\n"+classid+"\n"+strength.trim().length);
		if(year == null || classid == null || strength.trim().length == 0){
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
<style>

</style>
<head>
<meta charset="UTF-8">
<title>Add Class</title>
</head>

<body>

<div class="main-panel">
		<!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
			<div class="container-fluid">

				<div class="collapse navbar-collapse justify-content-end"></div>
			</div>
		</nav>
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div style="margin: 0px auto;" class="col-md-6">
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">	Add Class</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
							<form action="dbClass.jsp">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group bmd-form-group">
											<select class="form-control" name="year" id="year"
												onchange="configureDropDownLists(this,document.getElementById('classid'))">
												<option value="" selected disabled>Select Year</option>
												<option value="SE">SE</option>
												<option value="TE">TE</option>
												<option value="BE">BE</option>
											</select>
										</div>
									</div>						
									<div class="col-md-6">
										<div class="form-group bmd-form-group">
											<select class="form-control" name="classid" id="classid">
												<option value="Select Batch" selected disabled>Select Class</option>										
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
						            	<div class="form-group bmd-form-group">
						                	<label class="bmd-label-floating">Strength</label>
						
						                    <input  class="form-control" id="strength" type="text" name="strength" >
								<div class="clearfix"></div>								
						
						                </div>
									</div>						               
								</div>
						
								<button type="submit" style="align:left; margin-left: 45%; margin-right:50%; " class="btn btn-primary " onclick="return check()">ADD</button>								
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