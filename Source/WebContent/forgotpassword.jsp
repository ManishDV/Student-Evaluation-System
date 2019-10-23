<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="css/Login.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="path/to/font-awesome/css/font-awesome.min.css">
<title>Forgot Password</title>
<script src="assets/js/plugins/sweetalert2.js"></script>
  <link rel="stylesheet" href="css/Login.css">
  <script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
  
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
</head>

<body>
	<div class="main">
		<p class="sign" align="center">Forgot Password</p>
		<form class="form1" action="sendpassword.jsp" method="post">
			<br>
			<br> <input class="un " type="text" align="center"
				placeholder="Username" name="uname" required/> <input type="submit"
				class="submit" value="Submit" />
		</form>
	</div>
</body>
<script>

var error = '<%=session.getAttribute("error")%>';

if(error.trim().length != 0){
	Swal.fire({
		  type: 'warning',
		  title: error,
		  text: '',
		  confirmButtonColor: 'purple',
		})
	<%
    session.setAttribute("error"," ");
    session.setAttribute("user","");
 %> 
}




</script>

</html>