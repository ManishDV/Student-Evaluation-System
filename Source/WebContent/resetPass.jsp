<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
		
		String password = request.getParameter("pass");
		String uname = (String)session.getAttribute("user");
		String query = "update authenticate set password = '"+password+"' where uname='"+uname+"'";
		
		Statement st = con.createStatement();
		if(password != null){
		int i = st.executeUpdate(query);
		if(i >= 1){
			session.setAttribute("error","Password Is Successfully Updated");
			response.sendRedirect("Login.jsp");
		}else{
			session.setAttribute("error","Password Cannot Be Updated");
			response.sendRedirect("Login.jsp");
		}
	}
		
		
%>

<html>
	<head>
		<title>Reset Password</title>
		 <link rel="stylesheet" href="css/Login.css">
 		
	</head>
	<script type="text/javascript">
		
		function validatePass(){
			var re = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;

			var pass = document.getElementById("pass").value;

			var cpass = document.getElementById("cpass").value;
			
			if(pass.length >= 6){
				if(re.test(pass)){

					if(cpass.equals(pass)){
						return true;
					}	

				}else{
					Swal.fire({
						  type: 'warning',
						  title: 'Passwords Should Have 1 Upper case letter, 1 Special Character and 1 digit',
						  text: '',
						  confirmButtonColor: 'purple',
						})
					return false;
				}	
			}else{
				Swal.fire({
					  type: 'warning',
					  title: 'Password Should Contain At Least 6 characters.',
					  text: '',
					  confirmButtonColor: 'purple',
					})
				return false;
			}
			
		}

	</script>
	<body>
		<div class="main">
    <p class="sign" align="center">Reset Passwrod</p>
    <form class="form1" action="#" method="post"> 
      <input class="pass " type="password" id="pass" align="center" placeholder="New Password" name="pass" autocomplete="off" required />
      <input class="pass" type="password" align="center" id="cpass" placeholder="Confirm Password" name="cpass" autocomplete="off" required />
      <input type="submit" class="submit"  style="margin-left: 30%" value="Reset Password"  onclick="return validatePass()" />
      </form>      
                
    </div>
  

	</body>
</html>
