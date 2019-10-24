<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script>
	var a = 0;
</script>
<script type="text/javascript">

</script>
<style type="text/css">

.carousel {
  width:100%;
  height:fixed;
}
</style>
<script>
	var a = 0;
</script>

<%@include file="dashboard.jsp"%>

<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body style="overflow-y:auto;overflow-x:hidden">

	<%
	String user = (String)session.getAttribute("user");
	System.out.println("USER ID FROM HOME: "+user);
	session.setAttribute("user", user);
%>
	<div class="wrapper">
		<div class="main-panel">

			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top  "
				style="margin-left: 30%">
				<div class="container-fluid">
					<div class="collapse navbar-collapse">

						<ul class="navbar-nav">

							<li class="nav-item dropdown"><a class="nav-link"
								href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <img
									src="img/account.png" height="45px" width="45px"></img>

							</a></li>
							<li>Welcome <%=session.getAttribute("acc") %></li>
						</ul>
					</div>
				</div>

			</nav>
			<div class="content">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" width="100%" height="80%" src="img/pict_gate.jpg" alt="First slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" width="100%" height="80%" src="img/pict-library.jpg" alt="Second slide">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="img/pict_building.jpg" width="100%" height="80%" alt="Third slide">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">

					<div class="copyright">
						©
						<script>
              document.write(new Date().getFullYear())
            </script>
						, made with <i class="material-icons">favorite</i> by <a
							href="AboutUS.jsp" target="_blank">Team Enigma</a> for a better
						web.
					</div>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>
