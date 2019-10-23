<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="org.apache.poi.xssf.usermodel.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = "/home/neo/eclipse-workspace/SES_INTEGRATED/WebContent/data";
		MultipartRequest mr = new MultipartRequest(request, path);
		//storing the path of the uploaded file

		String filepath = mr.getFile("upload").toString();
		File f = new File(filepath);

		try {
			int i = 0;
			int flag = 0;
			String str = new String();
			int n = 0, cnt;
			int updateQuery;
			PreparedStatement pstatement = null;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SES", "Manish", "Manny@123");
			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			XSSFRow row;
			FileInputStream fis = new FileInputStream(f);
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet spreadsheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = spreadsheet.iterator();
			String count = "select count(*)  from teacher  ";
			ResultSet rs1 = st1.executeQuery(count);
			rs1.next();
			String Count1 = rs1.getString(1);
			int count_row = Integer.parseInt(Count1);
			count_row++;

			while (rowIterator.hasNext()) {
				row = (XSSFRow) rowIterator.next();
				Iterator<Cell> cellIterator = row.cellIterator();

				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();

					switch (cell.getCellType()) {
					case NUMERIC:
						n = (int) cell.getNumericCellValue();
						break;

					case STRING:
						str = cell.getStringCellValue();
						break;
					}
				}
			
					String t_no = Integer.toString(n);
					String tid = "emp" + count_row;
					count_row++;
					String[] arrOfStr = str.split(" ");

					char nameInit = arrOfStr[1].charAt(0);
					char nameLast = arrOfStr[2].charAt(0);
					char nameArr[] = { nameInit, nameLast };

					String abbrevation = String.valueOf(nameArr);

					String queryString = "INSERT INTO teacher(tid,tname,abbrevation) VALUES (?, ?,?)";
					pstatement = con.prepareStatement(queryString);
					pstatement.setString(1, tid);
					pstatement.setString(2, str);
					pstatement.setString(3, abbrevation);
					
					String check = "select * from teacher where tname = '" + str + "' ";
					ResultSet rs = st1.executeQuery(check);
					rs.next();
					rs.last();
					
					int count1 = rs.getRow();
					rs.first();
					System.out.println("TNAME: "+str+"\tCOUNT: "+count1);
					if (count1 > 0) {
						
						continue;
					} else {
						i++;
						updateQuery = pstatement.executeUpdate();
						flag = 0;
					}
					
					
			}
			

			if (f.delete()) {
					if(i > 0){
						
						session.setAttribute("count", i);
						session.setAttribute("error", "Added "+i+" New Entries To Database");
						response.sendRedirect("browse_staff.jsp");
					}else{
						session.setAttribute("error", "Staff Already Added");
						response.sendRedirect("browse_staff.jsp");
					}
				
			}
		} catch (Exception e) {
			session.setAttribute("error", e.getMessage());
			response.sendRedirect("browse_staff.jsp");
		}
	%>



</body>
</html>