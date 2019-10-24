<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>


<html>

<head>

  <script src="assets/js/plugins/sweetalert2.js"></script>
  <link rel="stylesheet" href="css/Login.css">
  <script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
  
	<script src="assets/js/plugins/bootstrap-notify.js"></script>
  <title>Student Evaluation System</title>
</head>

<body>
  <div class="main container-fluid">
    <p class="sign" align="center">Sign in</p>
    <form class="form1" action="login.jsp" method="post"> 
      <input class="un " type="text" align="center" placeholder="Username" name="uname" autocomplete="off" required />
      <input class="pass" type="password" align="center" placeholder="Password" name="passwd" autocomplete="off" required />
      <input type="submit" class="submit" value="Login"  />
      <p class="forgot" align="center"><a href="forgotpassword.jsp">Forgot Password?</p>
      </form>      
                
    </div>
     
</body>
	
  <script>
    
    var error = '<%=session.getAttribute("error")%>';
	
    if(error.trim().length != 0 && error != null && error != " "){
    	if(error == "Password Is Successfully Updated"){
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
        session.setAttribute("user"," ");
     %> 
   }


  </script>
		
</html>

