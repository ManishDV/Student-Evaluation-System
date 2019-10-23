<%@ page import="java.io.*"%>
<%@ page import="org.apache.poi.xwpf.extractor.*"%>
<%@ page import="org.apache.poi.xwpf.usermodel.*"%>
<%@ page import="org.apache.poi.openxml4j.opc.*"%>
<%@ page import="org.apache.xmlbeans.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import=" java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
 

<%
	ResultSet resultset = null;
	ResultSet resultset1 = null;
	ResultSet resultset2 = null;
	ResultSet resultset3 = null;
%>

<%
int  i1 = 0;

	String sr = new String();
	String exp = new String();
	String dt = new String();
	int count = 0, in = 0,iter=0;
	int updateQuery = 0;
	Date date1 = new Date();
	PreparedStatement pstatement = null;
	PreparedStatement pstatement1 = null;
	PreparedStatement pstatement2 = null;
	PreparedStatement pstatement3 = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES?useSSL=false", "Manish",
			"Manny@123");
	Statement st = null;
	Statement st1 = null;
	Statement st2 = null;
	st1 = con.createStatement();
	st2 = con.createStatement();

	int i = 0, i3 = 0, j = 0;
	int i2[];
	int ct = 0;
	i2 = new int[10];
	String fileName = request.getParameter("file1");
	String s_name = request.getParameter("ltl");

	String query = "select sid from subject where abbrevation = ?";
	try {
		pstatement = con.prepareStatement(query);
		pstatement.setString(1, s_name);
	} catch (Exception e) {
		e.printStackTrace();
	}
	resultset = pstatement.executeQuery();
	if (resultset.next()) {
		i1 = resultset.getInt("sid");
	}
	Statement statement = con.createStatement();
	ResultSet res = statement.executeQuery("select * from assignment where sid ="+i1+"");

	try {

		if (!(fileName.endsWith(".doc") || fileName.endsWith(".docx"))) {
			throw new FileNotFoundException();
		} else {

			XWPFDocument doc = new XWPFDocument(new FileInputStream(fileName));
			List<XWPFTable> table = doc.getTables();
			for (XWPFTable xwpfTable : table) {
				List<XWPFTableRow> row = xwpfTable.getRows();
				for (XWPFTableRow xwpfTableRow : row) {
					List<XWPFTableCell> cell = xwpfTableRow.getTableCells();
					for (XWPFTableCell xwpfTableCell : cell) {
						if (xwpfTableCell != null) {
							if (count > 2) {
								if (in == 0) {
									//sr = xwpfTableCell.getText();
									in = 1;
								} else if (in == 1) {
									exp = xwpfTableCell.getText();
									in = 2;
								} else if (in == 2) {
									dt = xwpfTableCell.getText();
									date1 = new SimpleDateFormat("dd/MM/yyyy").parse(dt);
									in = 0;
								}
							}
						}

						count++;
					}
					
					while (res.next()) {
						ct++;
					}
					if (ct > 0) {
						session.setAttribute("error", "Assignment Already Added");
						response.sendRedirect("browse_word.jsp");
						
					} else {
					try {
						i++;
						if(iter!=0)
						{
						String queryString = "insert into assignment  (assign_name,sid,scheduled_submission_date) values(?,?,?);";
						pstatement = con.prepareStatement(queryString);
						pstatement.setString(1, exp);
						pstatement.setInt(2, i1);
						pstatement.setObject(3, date1);
						updateQuery = pstatement.executeUpdate();
						}
						iter=1;
					} catch (Exception e) {
						e.printStackTrace();
					}
					}
				}

			}

		}
	} catch (Exception e) {
		e.printStackTrace();
	}

	if(ct==0)
	{
	String subquery = "select year from subject where sid = "+i1+"";
	Statement statSub = con.createStatement();
	ResultSet rsState = statSub.executeQuery(subquery);
	rsState.next();
	String year = rsState.getString("year");
	String query2 = "select roll_no from class_has_students,subject where cid like '"+year+"%' and subject.sid="+i1+"";
	try {
		pstatement1 = con.prepareStatement(query2);
	} catch (Exception e) {
		e.printStackTrace();
	}
	resultset1 = pstatement1.executeQuery();
	
	String query1 = "select assign_id from assignment where sid =?";
	try {
		pstatement2 = con.prepareStatement(query1);
		pstatement2.setInt(1, i1);
	} catch (Exception e) {
		e.printStackTrace();
	}
	resultset2 = pstatement2.executeQuery();
	while (resultset2.next()) {
		i2[j] = resultset2.getInt("assign_id");
		
		j++;
	}
	try {
		while (resultset1.next()) {
			i3 = resultset1.getInt("roll_no");
			
			for (int k = 0; k < j; k++) {
			
				String query3 = "Insert into student_performs_assignment(roll_no,assign_id,actual_performance_date, actual_submission_date ) values(?,?,?,?)";
				pstatement3 = con.prepareStatement(query3);
				pstatement3.setInt(1, i3);
				pstatement3.setInt(2, i2[k]);
				pstatement3.setDate(3, new java.sql.Date(new java.util.Date().getTime()));
				pstatement3.setDate(4, new java.sql.Date(new java.util.Date().getTime()));
				updateQuery = pstatement3.executeUpdate();
			}
		}

		session.setAttribute("error","Assignments Added Successfully");
		response.sendRedirect("browse_word.jsp");
	} catch (Exception e) {
		session.setAttribute("error",e.getMessage());
		response.sendRedirect("browse_word.jsp");
	}
	}
%>




