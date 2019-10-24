
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<html lang="en" class="perfect-scrollbar-off">


<head>

<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<script src="js/jquery.js"></script>
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="css/icons_fonts.css" />
<link rel="stylesheet" href="css/font-awesome.css">
<!-- CSS Files -->
<link href="assets/css/material-dashboard.css?v=2.1.1" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<style>
li:hover {
	background: #cac6cc;
}
</style>

<script src="js/table2excel.js"></script>
<script type="text/javascript">
	function makeActive() {
		var elements = document.getElementsByClassName("theli");
		for (i = 0; i < elements.length; i++) {
			if (a == i) {
				elements[i].classList.add("active");
			} else {
				elements[i].classList.add("nav_item");
			}
		}
	}
</script>

</head>

<body onload="makeActive()">
	<div class="wrapper" >
		<div class="sidebar" data-color="purple" data-background-color="green" >
				<!--
	        Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
	
	        Tip 2: you can also add an image using data-image tag
	    -->
			<div class="logo" > 
				<a href="home.jsp" class="simple-text logo-normal">
				<img src="img/pict.png" width="100" height="100"></img>
					<center>PICT SES</center></a>
			</div>
			<div class="sidebar-wrapper" style="height:73%;margin:0px;overflow-x:hidden">
				<%
					try {
						String acc_type = (String) session.getAttribute("type");
						if (acc_type.equals("admin")) {
				%>
				<ul class="nav">
					<li class="theli nav-item"><a class="dropdown-item" href="home.jsp">
							<i class="material-icons">home</i>
							<p>Home</p>
					</a></li>
					</li>
					<li class="theli"><a class="dropdown-item" href="AddClass.jsp">
							<i class="material-icons">content_paste</i>
							<p>Add Class</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="Add_student.jsp"> <i class="material-icons">dashboard</i>
							<p>Add Students</p>
					</a></li>
					<li class="theli"><a class="dropdown-item" href="AddBatch.jsp">
							<i class="material-icons">content_paste</i>
							<p>Add Batch</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="browse_staff.jsp"> <i class="material-icons">content_paste</i>
							<p>Add Teachers</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="AddSubject.jsp"> <i class="material-icons">content_paste</i>
							<p>Add Subject</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="browse_word.jsp"> <i class="material-icons">assignment</i>
							<p>Add / Remove Assignments</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="add_class_teacher.jsp"> <i class="material-icons">content_paste</i>
							<p>Map Class_Teacher</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="add_batch_teacher.jsp"> <i class="material-icons">content_paste</i>
							<p>Map Batch_Teacher</p>
					</a></li>
					<li class="theli"><a class="dropdown-item"
						href="./AddAttendance.jsp"> <i class="material-icons">content_paste</i>
							<p>Add Attendance</p>
					</a></li>
					<li class="theli"><a class="dropdown-item" href="./Login.jsp">
							<i class="material-icons">exit_to_app</i>
							<p>Logout</p>
					</a></li>
				</ul>
			</div>

			<%
				}
					if (acc_type.equals("teacher")) {
			%>

			<ul class="nav">
				<li class="theli"><a class="nav-link" href="home.jsp"> <i
						class="material-icons">home</i>
						<p>Home</p>
				</a></li>
				<li class="theli"><a class="nav-link" href="addUT.jsp"> <i
						class="material-icons">library_books</i>
						<p>Add Unit Test Marks</p>
				</a></li>
				<li class="theli"><a class="nav-link" href="add_assignment.jsp">
						<i class="material-icons">assignment</i>
						<p>Add Assignment Marks</p>
				</a></li>
				<li class="theli"><a class="nav-link"
					href="calculateTermwork.jsp"> <i class="material-icons">library_books</i>
						<p>Calculate Termwork</p>
				</a></li>
				<li class="theli"><a class="nav-link" href="Login.jsp"> <i
						class="material-icons">exit_to_app</i>
						<p>Logout</p>
				</a></li>
			</ul>
		</div>
		<%
			}
		%>
	</div>
	<%
		} catch (Exception e) {

		}
	%>

	<div class="main-panel">
		<!-- Navbar -->

	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap-material-design.min.js"></script>
	<script src="assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!-- Plugin for the momentJs  -->
	<script src="assets/js/plugins/moment.min.js"></script>
	<!--  Plugin for Sweet Alert -->
	<script src="assets/js/plugins/sweetalert2.js"></script>
	<!-- Forms Validations Plugin -->
	<script src="assets/js/plugins/jquery.validate.min.js"></script>
	<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
	<script src="assets/js/plugins/jquery.bootstrap-wizard.js"></script>
	<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
	<script src="assets/js/plugins/bootstrap-selectpicker.js"></script>
	<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
	<script src="assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
	<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
	<script src="assets/js/plugins/jquery.dataTables.min.js"></script>
	<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
	<script src="assets/js/plugins/bootstrap-tagsinput.js"></script>
	<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
	<script src="assets/js/plugins/jasny-bootstrap.min.js"></script>
	<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
	<script src="assets/js/plugins/fullcalendar.min.js"></script>
	<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
	<script src="assets/js/plugins/jquery-jvectormap.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/plugins/nouislider.min.js"></script>
	<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
	<!-- Library for adding dinamically elements -->
	<script src="assets/js/plugins/arrive.min.js"></script>
	<!-- Chartist JS -->
	<script src="assets/js/plugins/chartist.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-dashboard.js?v=2.1.1"
		type="text/javascript"></script>
	<!-- Material Dashboard DEMO methods, don't include it in your project! -->
	<script src="assets/demo/demo.js"></script>
</body>

</html>
