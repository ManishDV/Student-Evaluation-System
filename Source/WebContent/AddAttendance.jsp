<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<%@include file="dashboard.jsp" %>
	
<title>Upload Attendance</title>
<script>
var a=9;
var error = '<%=session.getAttribute("error")%>';

if(error.trim().length != 0){
	if(error == "Attendance Added Successfully"){
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
	 
	 filename = $("#file").val();
	 ltl = $("#classid").val();	
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
			  title: 'Please Select .docx or .doc to Add Attendance',
			  text: '',
			  confirmButtonColor: 'purple',
			})
		 return false;
	 }else if(ltl == null){
		 Swal.fire({
			  type: 'warning',
			  title: 'Please Select Class',
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
</head>

<%
	ResultSet rs = null;
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
    
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
    
		String q = "select cid from class";
		st = con.createStatement();
		rs = st.executeQuery(q);	
		
%>
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
								<h4 class="card-title">Upload Attendance</h4>
								<p class="card-category"></p>
							</div>
							<div class="card-body">
								<form action="attendanceupload.jsp" method="post"
									enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group bmd-form-group">
												<select class="form-control" name="classid" id="classid">
													<option value="" selected disabled>Select Class</option>
													<%
														while (rs.next()) {
													%>
													<option value="<%=rs.getString("cid")%>"><%=rs.getString("cid")%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12" style="height:50%">
											
												Select your file to upload <input class="form-control" id="file" type="file" name="upload">
												
										</div>
									</div>
									<br>	
									<input style="margin-left:40%;margin-right:50%"  class="btn btn-primary" onclick="return check()" type="submit" value="upload">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%
	con.close();
	} 
	catch (Exception e)
	{
		out.println(e.getMessage());
	}
%>
</body>
</html>