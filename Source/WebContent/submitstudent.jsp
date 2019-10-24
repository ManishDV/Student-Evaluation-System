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
<%@page import="org.apache.poi.ss.util.NumberToTextConverter"%>

<%	
	int flag = 0;
	//path where file i.e excel sheet will be uploaded
	String path = "/home/neo/eclipse-workspace/SES_INTEGRATED/WebContent/data";
	MultipartRequest mr = new MultipartRequest(request, path);
	//storing the path of the uploaded file

	String filepath = mr.getFile("upload").toString();

	//getting classid

	ResultSet rs = null;
	Connection con = null;

	File f = new File(filepath);
	FileInputStream fis = new FileInputStream(f);
	HSSFWorkbook workbook = new HSSFWorkbook(fis);
	HSSFSheet spreadsheet = workbook.getSheetAt(0);
	HSSFSheet spreadsheet1 = workbook.getSheetAt(1);
	HSSFSheet spreadsheet2 = workbook.getSheetAt(2);

	HSSFRow row = spreadsheet.getRow(2);
	DataFormatter formatter = new DataFormatter();
	FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
	int k = 0;
	String sheetName = "";
	for (int j = 0; j < 3; j++) {

		Sheet sheet = workbook.getSheetAt(j);
		 sheetName = workbook.getSheetName(j);
		int col_number = -1;
		for (int i = 0; i < row.getLastCellNum(); i++) {
			if (row.getCell(i).getStringCellValue().trim().equals("Roll No."))
				col_number = i;
		}

		int col_number1 = -1;
		for (int i = 0; i < row.getLastCellNum(); i++) {
			if (row.getCell(i).getStringCellValue().trim().equals("Name"))
				col_number1 = i;
		}

		int i = 0;
		for (Row row1 : sheet) { // For each Row.
			// Get the Cell at the Index / Column you want.
			if (i < 3) {//start reading from 5th row
				i++;
				continue;
			}
			i++;
			if (!formatter.formatCellValue(row1.getCell(col_number)).equals("")
					&& !formatter.formatCellValue(row1.getCell(col_number1)).equals("")) {
				String s_roll_no = formatter.formatCellValue(row1.getCell(col_number));
				String name = formatter.formatCellValue(row1.getCell(col_number1));
				int roll_no = Integer.parseInt(s_roll_no);

				try {
					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish","Manny@123"); //out.println("Connected"); Statement st=con.createStatement();
					Statement st = con.createStatement();
					int executed = st.executeUpdate("insert into student values(" + roll_no + ",'" + name + "')");
					
					String query = "insert into class_has_students values(" + roll_no + ",'" + sheetName + "')";
					Statement st1 = con.createStatement();
					st1.executeUpdate(query);
					
				
				} catch (Exception e) {
					String error = "Duplicate entry '"+roll_no+"' for key 'PRIMARY'";
					String exception = e.getMessage();
					if(exception.trim().equals(error)){
						session.setAttribute("error", "Students Already Added");
						flag=1;
						break;
					}
					else{
						session.setAttribute("error", exception);
						flag = 1;
						break;
					}
				}
			}
		}
	}
	
	workbook.close();
	if (f.delete()) {
		if(flag == 1){
			response.sendRedirect("Add_student.jsp");
		}else{
			flag = 0;
			session.setAttribute("error", "Students Added Successfully");
			response.sendRedirect("Add_student.jsp");
		}
	}
%>