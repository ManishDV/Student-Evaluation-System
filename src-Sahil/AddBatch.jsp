<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>

<%
	ResultSet rs = null;
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");

		String q = "select cid from class";
		st = con.createStatement();
		rs = st.executeQuery(q);

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>

<!DOCTYPE html>
<html>
<script>
	function configureDropDownLists(classid, batchid) {
		var te9 = [ 'K-09', 'L-09', 'M-09', 'N-09' ];
		var te10 = [ 'K-10', 'L-10', 'M-10', 'N-10' ];
		var te11 = [ 'K-11', 'L-11', 'M-11', 'N-11' ];

		var se9 = [ 'E-09', 'F-09', 'G-09', 'H-09' ];
		var se10 = [ 'E-10', 'F-10', 'G-10', 'H-10' ];
		var se11 = [ 'E-11', 'F-11', 'G-11', 'H-11' ];

		var be9 = [ 'P-09', 'Q-09', 'R-09', 'S-09' ];
		var be10 = [ 'P-10', 'Q-10', 'R-10', 'S-10' ];
		var be11 = [ 'P-11', 'Q-11', 'R-11', 'S-11' ];

		switch (classid.value) {
		case 'SE-09':
			batchid.options.length = 0;
			for (i = 0; i < se9.length; i++) {
				createOption(batchid, se9[i], se9[i]);
			}
			break;

		case 'SE-10':
			batchid.options.length = 0;
			for (i = 0; i < se10.length; i++) {
				createOption(batchid, se10[i], se10[i]);
			}
			break;

		case 'SE-11':
			batchid.options.length = 0;
			for (i = 0; i < se11.length; i++) {
				createOption(batchid, se11[i], se11[i]);
			}
			break;

		case 'TE-09':
			batchid.options.length = 0;
			for (i = 0; i < te9.length; i++) {
				createOption(batchid, te9[i], te9[i]);
			}
			break;

		case 'TE-10':
			batchid.options.length = 0;
			for (i = 0; i < te10.length; i++) {
				createOption(batchid, te10[i], te10[i]);
			}
			break;

		case 'TE-11':
			batchid.options.length = 0;
			for (i = 0; i < te11.length; i++) {
				createOption(batchid, te11[i], te11[i]);
			}
			break;

		case 'BE-09':
			batchid.options.length = 0;
			for (i = 0; i < be9.length; i++) {
				createOption(batchid, be9[i], be9[i]);
			}
			break;

		case 'BE-10':
			batchid.options.length = 0;
			for (i = 0; i < be10.length; i++) {
				createOption(batchid, be10[i], be10[i]);
			}
			break;

		case 'BE-11':
			batchid.options.length = 0;
			for (i = 0; i < be11.length; i++) {
				createOption(batchid, be11[i], be11[i]);
			}
			break;

		default:
			batchid.options.length = 0;
			break;
		}
	}

	function createOption(classid, text, value) {
		var opt = document.createElement('option');
		opt.value = value;
		opt.text = text;
		classid.options.add(opt);
	}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="submitbatch.jsp">
		<h1>Add Batch</h1>
		<h3>Class</h3>
		<select name="classid" id="classid"
			onchange="configureDropDownLists(this,document.getElementById('batchid'))">
			<option value="" selected disabled>Select Class</option>
			<%
				while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
			<%
				}
			%>
		</select><br> <select name="batchid" id="batchid">
			<option value="Select Batch" selected disabled>Select Batch</option>

		</select><br> <input type="text" name="start" placeholder="start"><br>
		<input type="text" name="end" placeholder="end"><br> <input
			type="submit" value="Add">

	</form>
</body>
</html>
