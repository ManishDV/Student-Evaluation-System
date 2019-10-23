<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		 $("button").on('click',function(){
			 
			 var exp = $("#exp").val();
			 var ltl = $("#ltl").val();
			 var batch = $("#batch").val();
				$.ajax({
					url : "rolls_exp.jsp",
					method : "POST",
					data : {
						
						ltl : ltl,
					 	batch:batch,
					 	expno : expno
					 	
					},
					success : function(data) {
						$(".form2").replaceWith(data);//response sending to city.jsp page 
					}
				});
			
		 });

	
	
	}); //END
</script>

</head>
<body>
	<%
					Connection con = null;
					ResultSet resultset1 = null;
					ResultSet resultset2 = null;
					Statement st = null;
					PreparedStatement  pstatement = null;
					String ltl = null;
					String class1 = null;
					String batch = null;
					//class1 = request.getParameter("class1");
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false","Manish","Manny@123");
					
					batch = request.getParameter("batch");
					String query22 = "select abbrevation from subject where sid = (select sid from teacher_teaches_batch as ttb where ttb.tid='"+session.getAttribute("user")+"' and ttb.bid = '"+batch+"')"; 
					Statement stmt = con.createStatement();
					ResultSet rs1 = stmt.executeQuery(query22);
					rs1.next();
					ltl = rs1.getString("abbrevation");
					rs1.close();
					int i1=0;
	        		
					String a;
					
					String query = "select sid from subject where abbrevation = ?";
					try {
						 pstatement = con.prepareStatement(query);
						 pstatement.setString(1, ltl);
						} catch (Exception e) {
						  e.printStackTrace();
						}
					resultset1 = pstatement.executeQuery();
					if (resultset1.next()) {
					    i1=resultset1.getInt("sid");
					}
					
				

				    st = con.createStatement();
					String query1 = " select * from assignment where sid="+i1+"";
					resultset1 = st.executeQuery(query1);
					//String query1 = "select exp_id from exps,ltl_exps where exps.exp_id = ltl_exps.exp_id and l_id='"+i1+"' ";
					//resultset2 = st.executeQuery(query);

					

	%>
	<form  name="redirect" action="rolls_exp.jsp" method="post">
		
			<table class="table table-hover" class="new">
				 <thead class="text-primary">
					<th><strong>SR. NO.</strong></th>
					<th><strong>SELECT</strong></th>
					<th><strong>ASSIGNMENT NAME</strong></th>
				 </thead>
					<%
						int i =1;
						while (resultset1.next()){
					%>

	
				<tr>
				<td><%=i %></td><%i++; %>	
				 <td><input type="radio" id="exps" value="<%=resultset1.getInt("assign_id") %>" name="assignment"></td>
					
					<td><%= resultset1.getString("assign_name") %></td>
					
				</tr>

			<% 		}
					
					session.setAttribute("ltl", ltl);
					session.setAttribute("batch", batch);
									
					%>

		
			</table>

			
		
		<button class="btn btn-primary pull-left" style="margin-left:50%" type="submit">Next</button>
	</form>

</body>
</html>