<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

 
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
<script>

/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */

</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
<style type="text/css">
body {
  font-family: "Lato", sans-serif;
  width:20%;
}

/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 275px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;  
background-color: #FFFFFF;
  overflow-x: hidden;
  padding-top: 20px;
  font-size:10px;	
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #000000;
  
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: black;
  background-color:#b0aa99;
}


/* Add an active class to the active dropdown button */
.active {
  background-color: #144069;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display:none;
  background-color: #1f65a6;
  padding-left: 8px;
}

.dropdown-container:hover{
	display:block;
}

.dropdown-container a:hover{
	
	background-color:#144069;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>

<body>


<div class="sidenav" >
<div>
<a href="sidebar.jsp">
<img src="img/pict.png" style="margin-left:35%" height="70" width="70">
</a>
<center style="font-size:18px;color:black">PICT STUDENT EVALUEATION SYSTEM</center>
</div>
<%

    try{
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
    
    String acc_type = (String)session.getAttribute("type");



    if(acc_type.equals("admin")){


%>
<hr style="color:black">
  <button class="dropdown-btn" style="font-size:18px">SETUP 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="Add_student.jsp" style="font-size:18px">Add Students</a>
    <a href="browse_staff.jsp" style="font-size:18px">Add Teachers</a>
    <a href="AddClass.jsp" style="font-size:18px">Add Class</a>
    <a href="AddBatch.jsp" style="font-size:18px">Add Batch</a>
    <a href="browse_word.jsp" style="font-size:18px">Add Assignment</a>
	   
 <a href="AddSubject.jsp" style="font-size:18px">Add Subject</a>
	    
<a href="#" style="font-size:18px">Map Class_Subject_Teacher</a>
	    
<a href="#" style="font-size:18px">Map Batch_Subject_Teacher</a>
  </div>
  <a href="#contact">Add Attendance</a>
  <a href="Login.jsp">Logout</a>
  
</div>
<%
   
  }

  if(acc_type.equals("teacher")){
  %>
<hr style="color:black">

  <a href="addUT.jsp" style="font-size:18px">Add Unit Test Marks</a>
      
<a href="updateUT.jsp" style="font-size:18px">Update Unit Test Marks</a>
      
<a href="#" style="font-size:18px">Add Assignment Marks</a>
<a href="calculateTermwork.jsp" style="font-size:18px">Calculate / View Termwork</a>

  <a href="Login.jsp">Logout</a>
  
</div>
  <%
}

  }catch(Exception e){

}
%>     
</body>
<script>

/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  this.classList.toggle("active");
  var dropdownContent = this.nextElementSibling;
  if (dropdownContent.style.display === "block") {
  dropdownContent.style.display = "none";
  } else {
  dropdownContent.style.display = "block";
  }
  });
}

</script>
</html>
