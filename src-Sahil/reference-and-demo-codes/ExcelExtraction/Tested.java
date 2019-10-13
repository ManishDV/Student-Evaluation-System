package excel;

import java.io.File;
import java.io.FileInputStream;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellReference;
import java.sql.*;
import javax.sql.*;

class Tested {
	public static void main(String args[]) throws Exception {
		ResultSet rs=null;
		Connection con=null;
		int count=0;
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish", "Manny@123");
			
			Statement st1=con.createStatement();
			String query = "select strength from class where cid='BE-11'";
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			rs.next();
			count = rs.getInt("strength");
			System.out.println(count);
		
			st1.close();
			con.close();
			
		}
		
		 catch(Exception e) { System.out.println(e); }
		 
		FileInputStream fis = new FileInputStream(new File("/root/Downloads/attendance.xls"));
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
			if (i < 5 || i > (count+5)) {//start reading from 5th row
				i++;
				continue;
			}
			i++;
			if(i==count+5)
				break;
			System.out.println("ROLL_NO: " + formatter.formatCellValue(row1.getCell(0)) + "\tATTENDANCE: "
					+ formatter.formatCellValue(row1.getCell(col_number), evaluator));
			String s_roll_no=formatter.formatCellValue(row1.getCell(0));
			String s_attendance=formatter.formatCellValue(row1.getCell(col_number), evaluator);
			int roll_no=Integer.parseInt(s_roll_no);
			float attendance=Float.parseFloat(s_attendance);

			
			
			  /*try
			  { 
				  Class.forName("org.mariadb.jdbc.Driver"); 
				  con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/SES", "Manish","Manny@123"); //out.println("Connected"); Statement st=con.createStatement();
				  Statement st=con.createStatement();
				  int executed=st.executeUpdate("insert into attendance values('"+roll_no+"','"+attendance+"')");
				  con.close();
				  st.close(); 
			  } 
			  catch(Exception e)
			  {			  
				  System.out.println(e.getMessage()); 
			  }*/
			 
			
		}

	}
}
