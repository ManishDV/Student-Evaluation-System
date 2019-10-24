<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="css/bootstrap.css">


<head>
<%@include file="dashboard.jsp"%>
<script src="js/jquery.js"></script>
<script src="js/table2excel.js"></script>
<script src="js/bootstrap.js"></script>
<script>
var a = 3;
var error = '<%=session.getAttribute("error")%>';
if(error.trim().length != 0){
	
	if(error == "Termwork Calculated Successfully"){
		Swal.fire({
			type:'success',
			text: error,
		  confirmButtonColor: 'purple',
		  });
		
	}else{
		
		Swal.fire({
				type:'warning',
				text: error,
			  confirmButtonColor: 'purple',
			  });
		
	}
	<%session.setAttribute("error", " ");%>
}

	$(document).ready(function() {

		$("#year").on("change", function() {
			var year = $("#year").val();
			var user = '<%=session.getAttribute("user")%>';
			$.ajax({
				url : "class.jsp",
				data : {
					year : year,
					user:user
				},
				method : "POST",
				success : function(data) {
					$("#class").replaceWith(data);
				}
			});
		});
		
		$("#class").on("change", function() {
			var classid = $("#class").val();
			var user = '<%=session.getAttribute("user")%>';
			$.ajax({
				url : "batch.jsp",
				data : {
					classid : classid,
					user : user
				},
				method : "POST",
				success : function(data) {
					$("#batch").replaceWith(data);
				}
			});
		});

	});

	function Export(filename) {
		$("#termwork").table2excel({
			filename : filename + ".xls"
		});
	}
	function check() {
		var year = $("#year").val();

		var classid = $("#class").val();
		var batch = $("#batch").val();
		var subject = $("#subject").val();

		//alert("YEAR: "+year+"\nCLASS: "+classid+"\nBATCH: "+batch+"\nSUBJECT: "+subject);
		if (year == null || classid == null || batch == null || subject == null) {
			Swal.fire({
				  type: 'error',
				  title: 'All Fields Are Mandatory',
				  text: '',
				  confirmButtonColor: 'purple',
				})
			
			return false;
		}
		return true;

	}
</script>
<meta charset="UTF-8">
<title>Term Work</title>
</head>

<body style="overflow: scroll;">
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div style="margin: 0px auto;" class="col-md-6">
					<div class="card" style="width: 130%">
						<div class="card-header card-header-primary" style="width: 95%">
							<h4 class="card-title">Calculate Term Work</h4>
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
											<select id="batch" name="batch" class="form-control">
												<option value=" " disabled selected>SELECT BATCH</option>
											</select>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group bmd-form-group">
											<select id="subject" class="form-control" style="width: 90%">
												<option value=" " selected disabled>SELECT SUBJECT</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<button type="submit" class="btn btn-primary pull-right"
												name="calculate" onclick="return check()">Calculate</button>

										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group bmd-form-group">

											<button type="submit" class="btn btn-primary pull-left"
												name="view" onclick="return check()">View</button>

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
	<%
		try {
			String x = request.getParameter("calculate");
			String y = request.getParameter("view");

			if (x != null) {

				boolean flag = false;
				try {
					String year = request.getParameter("year");
					String user = request.getParameter("user");
					String subject = request.getParameter("subject");
					String classid = request.getParameter("class");
					String bid = request.getParameter("batch");
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish",
							"Manny@123");

					String query = "select * from assignment where sid=(select sid from subject where abbrevation='"
							+ subject + "')";
					String query1 = "select * from batch_has_students where bid='" + bid + "' order by roll_no";

					Statement statement = con.createStatement();
					ResultSet rs = statement.executeQuery(query);
					rs.next();
					rs.last();
					int assignment_count = rs.getRow();
					rs.first();

					Statement statement1 = con.createStatement();
					ResultSet rs1 = statement1.executeQuery(query1);
					rs1.next();
					rs1.last();

					int total_students = rs1.getRow();
					rs1.first();
					String query8 = "select sid from subject where abbrevation = '" + subject + "'";
					Statement statement2 = con.createStatement();
					ResultSet rs2 = statement2.executeQuery(query8);
					rs2.next();
					int sid = rs2.getInt("sid");
					

					int actualMarksInAssignment = 0;
					int totalMarksInPractical = assignment_count * 10;
					int outOfSixty = 0;
					int totalUtMarks = 0;
					int actualUtMarks = 0;
					int outOfTwentyUT = 0;
					int attendancePercent = 0;
					int outOfTwentyAttendance = 0;
					int outOfHundredTermwork = 0;
					int outOfTwentyFiveTermwork = 0;
					int outOfFiftyTermwork = 0;

					rs1 = statement.executeQuery(query1);

					while (rs1.next()) {
						String query2 = "select sum(total) as actual from student_performs_assignment,subject where roll_no = "
								+ rs1.getInt("roll_no") + " and sid=" + sid + "";

						Statement st1 = con.createStatement();
						ResultSet mark = st1.executeQuery(query2);
						mark.next();
						actualMarksInAssignment = mark.getInt("actual");

						outOfSixty = Math.round((actualMarksInAssignment * 60) / totalMarksInPractical);

						String query5 = "select count(sid) as count from teacher_teaches_class where cid='"
								+ classid
								+ "' and sid in (select sid from subject where teacher_teaches_class.sid = subject.sid and subject.theory = 1)";
						Statement st5 = con.createStatement();
						ResultSet totalUT = st5.executeQuery(query5);
						totalUT.next();
						totalUtMarks = totalUT.getInt("count") * 60;

						String query3 = " select ut1,ut2 from student_gives_UT where roll_no = "
								+ rs1.getInt("roll_no")
								+ " and sid in (select subject.sid from subject,teacher_teaches_class where teacher_teaches_class.sid = subject.sid and subject.theory = 1);";
						Statement st2 = con.createStatement();
						ResultSet utmark = st2.executeQuery(query3);
						
						while (utmark.next()) {
							actualUtMarks += (utmark.getInt("ut1") + utmark.getInt("ut2"));
						}

						outOfTwentyUT = Math.round((actualUtMarks * 20) / totalUtMarks);

						String query4 = "select attendance from attendance where roll_no = " + rs1.getInt("roll_no")
								+ "";
						Statement st3 = con.createStatement();
						ResultSet attendance = st3.executeQuery(query4);
						attendance.next();

						attendancePercent = attendance.getInt("attendance");

						if (attendancePercent < 75) {
							outOfTwentyAttendance = 0;
						} else if (attendancePercent >= 75 && attendancePercent < 80) {
							outOfTwentyAttendance = 4;
						} else if (attendancePercent >= 80 && attendancePercent < 85) {
							outOfTwentyAttendance = 8;
						} else if (attendancePercent >= 85 && attendancePercent < 90) {
							outOfTwentyAttendance = 12;
						} else if (attendancePercent >= 90 && attendancePercent < 95) {
							outOfTwentyAttendance = 16;
						} else {
							outOfTwentyAttendance = 20;
						}

						outOfHundredTermwork = outOfSixty + outOfTwentyUT + outOfTwentyAttendance;

						outOfTwentyFiveTermwork = Math.round((outOfHundredTermwork * 25) / 100);
						outOfFiftyTermwork = Math.round((outOfHundredTermwork * 50) / 100);

						String insertTermwork = "insert into termwork values(" + rs1.getInt("roll_no") + "," + sid
								+ "," + outOfTwentyFiveTermwork + "," + outOfFiftyTermwork + ")";

						String repQuery = "select count(*) as total from termwork where roll_no="
								+ rs1.getInt("roll_no") + " and sid = " + sid + "";
						Statement rep = con.createStatement();
						ResultSet reprs = rep.executeQuery(repQuery);
						reprs.next();
						int count = reprs.getInt("total");
						if (count > 0) {
							flag = true;
						} else {
							flag = false;
							Statement insert = con.createStatement();
							int j = insert.executeUpdate(insertTermwork);
						}

						actualMarksInAssignment = 0;
						outOfSixty = 0;
						totalUtMarks = 0;
						actualUtMarks = 0;
						outOfTwentyUT = 0;
						attendancePercent = 0;
						outOfTwentyAttendance = 0;
						outOfHundredTermwork = 0;
						outOfTwentyFiveTermwork = 0;
						outOfFiftyTermwork = 0;
					}
					if (flag) {
						out.println("FLAG: " + flag);
						session.setAttribute("error", "Termwork Already Calculated For This Batch");
						response.sendRedirect("calculateTermwork.jsp");
					} else {
						session.setAttribute("error", "Termwork Calculated Successfully");
						response.sendRedirect("calculateTermwork.jsp");
					}
				} catch (Exception e) {
					session.setAttribute("error", "Insufficient Data To Calculate Termwork");
					response.sendRedirect("calculateTermwork.jsp");

				}
			}
	%>
	<%
		if (y != null) {
	%>
	<div class="content" id="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="margin-left: 25%; width: 65%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">Term Work</h4>
						</div>
						<div class="card-body" style="width: 100%">
							<div class="table-responsive" style="width: 100%">

								<table id="termwork" class="table table-hover">
									<tr>
										<th>Roll No</th>
										<th>Name</th>
										<th>Subject</th>
										<th>Out Of 25</th>
										<th>Out Of 50</th>
									</tr>
									<%
										String year = request.getParameter("year");
												String user = request.getParameter("user");
												String subject = request.getParameter("subject");
												String classid = request.getParameter("class");
												String bid = request.getParameter("batch");

												String query1 = " select roll_no from batch_has_students where bid='" + bid + "' order by roll_no";
												Class.forName("com.mysql.jdbc.Driver");
												Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish",
														"Manny@123");

												Statement st = con.createStatement();
												Statement st1 = con.createStatement();
												Statement st2 = con.createStatement();
												Statement st3 = con.createStatement();

												ResultSet rs = st.executeQuery(query1);

												String query2 = "select sid from subject where abbrevation='" + subject + "'";
												ResultSet rs1 = st2.executeQuery(query2);
												rs1.next();
												int sid = rs1.getInt("sid");
												while (rs.next()) {
									%>
									<tr>
										<td><%=rs.getInt("roll_no")%></td>
										<%
											String query3 = "select student_name from student where roll_no=" + rs.getInt("roll_no") + "";
														ResultSet rs2 = st2.executeQuery(query3);
														rs2.next();
										%>
										<td><%=rs2.getString("student_name")%></td>
										<td><%=subject%></td>
										<%
											String query4 = "select out_of_25,out_of_50 from termwork where roll_no=" + rs.getInt("roll_no")
																+ " and sid=" + sid + "";
														ResultSet rs3 = st3.executeQuery(query4);
														rs3.next();
										%>
										<td><%=rs3.getInt("out_of_25")%></td>
										<td><%=rs3.getInt("out_of_50")%></td>
									</tr>
									<%
										}
									%>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<button style="margin-left: 50%; margin-top: 20px"
		class="btn btn-primary" onclick="Export('<%=bid%>_<%=subject%>_Temwork')">Export
		To Excel</button>

	<%
		}
		} catch (Exception e) {

			session.setAttribute("error", "Termwork Is Not Calculated Yet");
			response.sendRedirect("calculateTermwork.jsp");

		}
	%>


</body>
</html>