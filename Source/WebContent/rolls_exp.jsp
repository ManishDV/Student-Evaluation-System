<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Assignment Marks</title>
<script src="js/jquery.js"></script>

<script>
	var a = 2;

	function rpp_value(rpp, spo, label) {
		var rpp = document.getElementById(rpp).value;
		var spo = document.getElementById(spo).value;
		var total = parseInt(rpp) + parseInt(spo);
		document.getElementById(label).innerHTML = total;
	}
	function spo_value(rpp, spo, label) {
		var rpp = document.getElementById(rpp).value;
		var spo = document.getElementById(spo).value;
		var total = parseInt(rpp) + parseInt(spo);
		document.getElementById(label).innerHTML = total;
	}
	
	
</script>
</head>
<%@include file="dashboard.jsp"%>

<BODY style="overflow: scroll;">
	<%
		Connection con = null;
		ResultSet resultset1 = null;
		ResultSet resultset2 = null;
		Statement st = null;
		int did = 0;
		PreparedStatement pstatement = null;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false", "Manish", "Manny@123");

		String batch = (String) session.getAttribute("batch");
		String a = " ";
		int i1 = 0, i2 = 0;
		int assign_id = Integer.parseInt(request.getParameter("assignment"));

		st = con.createStatement();
		String query = "select * from batch_has_students, student_performs_assignment  where batch_has_students.roll_no=student_performs_assignment.roll_no and assign_id = ? and bid=?";
		try {
			pstatement = con.prepareStatement(query);
			pstatement.setInt(1, assign_id);
			pstatement.setString(2, batch);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultset1 = pstatement.executeQuery();
	%>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div style="margin: 0px auto;" class="col-md-6">
					<div class="card" style="width: 150%">
						<div class="card-header card-header-primary" style="width: 95%">
							<h4 class="card-title">Enter Marks</h4>
							<p class="card-category"></p>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="table-responsive" style="width: 100%">

									<form name="form2" action="enter_total.jsp" method="post">

										<table class="table table-hover" style="width: 100%"
											class="new">
											<thead class="text-primary">
												<th><strong>Roll No.</strong></th>
												<th><strong>Performance Date</strong></th>
												<th><strong>Submission Date</strong></th>
												<th><strong>RPP</strong></th>
												<th><strong>SPO</strong></th>
												<th class="text-center"><strong>TOTAL</strong></th>

											</thead>

											<%
												int i = 1, j = 0, k = 201;
												while (resultset1.next()) {
											%>

											<tr>

												<td name="roll" value="<%=resultset1.getString("roll_no")%>"><%=resultset1.getInt("roll_no")%></td>
												<td><input type="date" id="per_date"
													class="form-control"
													value="<%=resultset1.getDate("actual_performance_date")%>"
													name="<%=resultset1.getInt("roll_no")%>per_date"></td>
												<td><input type="date" id="sub_date"
													class="form-control"
													value="<%=resultset1.getDate("actual_submission_date")%>"
													name="<%=resultset1.getInt("roll_no")%>sub_date"></td>
												<td><select name="<%=resultset1.getInt("roll_no")%>rpp"
													class="form-control" class="rpp"
													id="<%=resultset1.getInt("roll_no")%>rpp"
													onchange="spo_value(this.id,'<%=resultset1.getInt("roll_no")%>spo','<%=resultset1.getInt("roll_no")%>total')">

														<option value="<%=resultset1.getInt("rpp")%>" selected><%=resultset1.getInt("rpp")%></option>
														<option>0</option>
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
												</select></td>
												<td><select name="<%=resultset1.getInt("roll_no")%>spo"
													class="form-control"
													id="<%=resultset1.getInt("roll_no")%>spo"
													onchange="spo_value(this.id,'<%=resultset1.getInt("roll_no")%>rpp','<%=resultset1.getInt("roll_no")%>total')">
														<option value="<%=resultset1.getInt("spo")%>" selected><%=resultset1.getInt("rpp")%></option>
														<option>0</option>
														<option>1</option>
														<option>2</option>
														<option>3</option>
														<option>4</option>
														<option>5</option>
												</select></td>
												<td><b><strong><h4 class="text-center"
																id="<%=resultset1.getInt("roll_no")%>total"><%=resultset1.getString("total")%></h4></strong></b></td>
											</tr>

											<% 	
						j++;
						
						}  				 	
				 	session.setAttribute("expno", Integer.toString(assign_id));
				 	session.setAttribute("batch",batch);
				 	%>


										</table>

										<button type="submit" class="btn btn-primary pull_left" style="margin-left: 25%;width:50%" onclick="myFunction()">ADD</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

