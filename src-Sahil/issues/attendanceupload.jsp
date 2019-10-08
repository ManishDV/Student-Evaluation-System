<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.CellValue"%>
<%@page import="org.apache.poi.ss.usermodel.DataFormatter"%>
<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.util.CellReference"%>

<%
		//path where file i.e excel sheet will be uploaded
		String path = "/root/eclipse-workspace/SES/WebContent/data";
		MultipartRequest mr = new MultipartRequest(request, path);
		//storing the path of the uploaded file
		
		String cid = mr.getParameter("cid");
		out.println("This is classid"+cid);
	
		String filepath = mr.getFile("upload").toString();

		out.println("File Uploaded on Server");
		out.println("\nExtracting data....");

		//getting classid
		
		

		ResultSet rs = null;
		Connection con = null;
		int count = 0;
		out.println("This is strength:"+count);
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");

			Statement st1 = con.createStatement();
			String query = "select strength from class where cid='"+cid+"'";
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			//rs.first();
			rs.next();
			count = rs.getInt("strength");
			out.println("This is strength:"+count);

			st1.close();
			con.close();

		}
		
		catch (Exception e) {
			out.println("Exception:" +e);
		}
		
		out.println("This is strength:"+count);

		FileInputStream fis = new FileInputStream(new File(filepath));
		HSSFWorkbook workbook = new HSSFWorkbook(fis);
		HSSFSheet spreadsheet = workbook.getSheetAt(0);
		HSSFRow row = spreadsheet.getRow(3);
		DataFormatter formatter = new DataFormatter();
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

		Sheet sheet = workbook.getSheetAt(0); // Get Your Sheet.
		CellReference cellReference = new CellReference("AE"); // pass the cell which contains the formula

		int col_number = -1;
		for (int i = 0; i < row.getLastCellNum(); i++) {
			if (row.getCell(i).getStringCellValue().trim().equals("Average attendance Theory"))
				col_number = i;
		}

		int i = 0;
		for (Row row1 : sheet) { // For each Row.
			// Get the Cell at the Index / Column you want.
			if (i < 5 || i > (count + 5)) {//start reading from 5th row
				i++;
				continue;
			}
			i++;
			if (i == (count + 5))
				break;
			//System.out.println("ROLL_NO: " + formatter.formatCellValue(row1.getCell(0)) + "\tATTENDANCE: "+ formatter.formatCellValue(row1.getCell(col_number), evaluator));
			String s_roll_no = formatter.formatCellValue(row1.getCell(0));
			String s_attendance = formatter.formatCellValue(row1.getCell(col_number), evaluator);
			int roll_no = Integer.parseInt(s_roll_no);
			float attendance = Float.parseFloat(s_attendance);

			try {
				Class.forName("org.mariadb.jdbc.Driver"); 
				con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish","Manny@123"); //out.println("Connected"); Statement st=con.createStatement();
				Statement st = con.createStatement();
				int executed = st.executeUpdate("insert into attendance values('" + roll_no + "','" + attendance + "')");
				out.println("Executed:"+executed);
				con.close();
				st.close();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
		out.println("Extraction completed successfully! Attendance added to the database");
	%>
