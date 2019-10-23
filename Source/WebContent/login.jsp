<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
	String uname = request.getParameter("uname");
	String pass = request.getParameter("passwd");
	/*out.println("Reading Parameters");*/
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES","Manish","Manny@123");
		
		String query = "select password,acc_type from authenticate where uname='"+uname+"'";
		Statement st = con.createStatement();
		ResultSet resultSet = st.executeQuery(query);
		
		if(resultSet.next()){
			if(pass.equals(resultSet.getString("password"))){
				if(resultSet.getString("password").equals("123456")){
					session.setAttribute("user",uname);
					response.sendRedirect("resetPass.jsp");
				}else{
					if(!resultSet.getString("acc_type").equals("admin")){
						String query2 = "select tname from teacher where tid='"+uname+"'";
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery(query2);
						rs.next();
						session.setAttribute("user",uname);
						session.setAttribute("acc",rs.getString("tname"));
						session.setAttribute("type",resultSet.getString("acc_type"));
				    	response.sendRedirect("home.jsp");
					}else{
						session.setAttribute("user",uname);
						session.setAttribute("acc","Admin");
						session.setAttribute("type",resultSet.getString("acc_type"));
				    	response.sendRedirect("home.jsp");	
					}
					
				}
				 
			}else{
				session.setAttribute("error","Password or Username is Wrong");
				response.sendRedirect("Login.jsp");
			}
		}else{
			session.setAttribute("error","No user with user Name "+uname);
			response.sendRedirect("Login.jsp");
		}
		

		st.close();
		resultSet.close();
		con.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>
