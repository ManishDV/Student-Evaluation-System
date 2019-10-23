<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var flag = 0;
	function validatemarks(eid,error) {
		var marks = document.getElementById(eid).value;
		
		if (marks > 30) {
			document.getElementById(error).innerHTML = "Marks Must Be Less Than 30";
			document.getElementById(eid).style = "border:2 px solid red";
			flag = 1;
			return false;
		} else {
			document.getElementById(error).innerHTML = "";
			flag = 0;	
			document.getElementById(eid).style = "border:2 px solid green";
			return true;
		
		}
		
	}
	
	function checkFlag(){
		if (flag == 0){
				return true;
		}	
		return false;
	}
</script>

</head>
<body>
	<%
		Connection con = null;
		ResultSet res = null;
		Statement st = null;
		String subject = null;
		String classid = null;
		String ut = "";
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish", "Manny@123");

		classid = request.getParameter("classid");
		ut = request.getParameter("ut");
		subject = request.getParameter("subject");
		session.setAttribute("error", " ");

		try {

			if (ut.equals("UT2")) {

				int count = 0;
				Statement two = con.createStatement();
				ResultSet res1 = two.executeQuery(
						"select ut1 from student_gives_UT where sid = (select sid from subject where abbrevation='"
								+ subject + "')");
				res1.next();
				res1.last();
				count = res1.getRow();

				if (count == 0) {
					session.setAttribute("remark", "Unit Test 1 Marks Are Not Entered For This Subject");
				} else {
					String query = "select roll_no from class_has_students where cid = '" + classid
							+ "' order by roll_no";
					session.setAttribute("remark", " ");
					st = con.createStatement();
					res = st.executeQuery(query);
				}
			} else {


				String check = "select roll_no from student_gives_UT where sid=(select sid from subject where abbrevation='"+subject+"')";
				Statement stmt = con.createStatement();
				ResultSet res2 = stmt.executeQuery(check);
				res2.next();
				res2.last();
				int count = res2.getRow();

				if (count > 0) {
					session.setAttribute("remark", "Unit Test 1 Marks Are Already been filled.");
				}
				else{
					String query = "select roll_no from class_has_students where cid = '" + classid
							+ "' order by roll_no";
					session.setAttribute("remark"," ");	
					st = con.createStatement();
					res = st.executeQuery(query);
				}
			}
			
	%>
	
	<div class="content" id="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="margin-left: 25%; width: 65%">
						<div class="card-header card-header-primary"
							style="margin-left: 5%; width: 90%">
							<h4 class="card-title ">Unit Test Marks</h4>
						</div>
						<div class="card-body" style="width: 90%">
							<div class="table-responsive" style="width: 100%">
		
	<div style="color:red;margin-left:30%"><h4>Please Enter 0 For Absent Students </h4></div>
	<form class="name" action="insertUT.jsp">
	
		<table class="new table table-hover" style="margin-left:0%">
			<thead class="text-primary">
				<th class="text-center"><strong>Roll No</strong></th>
				<th class="text-center"><strong>Marks (Out Of 30)</strong></th>
				<th></th>
			</thead>

			<%
				while (res.next()) {
			%>


			<tr>

				<td class="text-center"><%=res.getInt("roll_no")%></td>
				<td ><input type="text" class="form-control"
					placeholder="Enter Marks" id="<%=res.getInt("roll_no")%>"
					maxlength="2"  name="<%=res.getInt("roll_no")%>" required
					onkeyup="return validatemarks(this.id,'<%=res.getInt("roll_no")%>error')"></td>
				<td id="<%=res.getInt("roll_no")%>error" style="color: red"></td>
			</tr>

			<%
				}

					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

				session.setAttribute("classid", classid);
				session.setAttribute("subject", subject);
				session.setAttribute("ut", ut);
			%>
		</table>
				<input type="submit" id="newButton" class="btn btn-primary" style="margin-left:30%;width:60%" value="Add" onclick="return checkFlag()">
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