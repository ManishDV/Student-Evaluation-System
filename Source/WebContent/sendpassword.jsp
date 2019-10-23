<%@page import="java.sql.*,javax.sql.*"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
	String uname = request.getParameter("uname");
	Statement st = null;
	ResultSet rs = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish", "Manny@123");
		String query = "select email from teacher where tid=(select uname from authenticate where uname='" + uname+"')";
		st = con.createStatement();
		rs = st.executeQuery(query);
		rs.next();
		
		String email = rs.getString("email");
		String query1 = "select password from authenticate where uname='" + uname + "'";
		st = con.createStatement();
		rs = st.executeQuery(query1);
		rs.next();
		String pass = rs.getString("password");
		if (email != null) {
			String result;
			//Recipient's email ID needs to be mentioned.
			String to = email;

			// Sender's email ID needs to be mentioned
			String from = "noreply.ses.system@gmail.com";
			final String username = "noreply.ses.system@gmail.com";
			final String password = "matasa@123";

			//host here we are using gsmtp
			String host = "smtp.gmail.com"; //while using gsmtp your sender should be a gmail account

			Properties props = new Properties();
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", "587");

			//Get the Session object.
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			try {
				// Create a default MimeMessage object.
				Message message = new MimeMessage(mailSession);

				// Set From: header field of the header.
				message.setFrom(new InternetAddress(from));

				// Set To: header field of the header.
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));

				// Set Subject: header field
				message.setSubject("Your Password is");

				// Now set the actual message
				message.setText("Username: " + uname + "\nPassword: " + pass + "");

				// Send message
				Transport.send(message);
				session.setAttribute("error", "Please Check Your Mail For Password");
				response.sendRedirect("Login.jsp");

			} catch (MessagingException e) {
				session.setAttribute("error", "Unable To Send Email");
				response.sendRedirect("forgotpassword.jsp");
			}

		} else {
			session.setAttribute("error", "No User Present With Given Username");
			response.sendRedirect("forgotpassword.jsp");
		}

		st.close();
		rs.close();
		con.close();

	} catch (Exception e) {
		out.print(e);
	}
%>
