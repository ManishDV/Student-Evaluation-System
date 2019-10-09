package user;

import db.Dbconn;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import com.oreilly.servlet.MultipartRequest;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Add_inword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
//This varible gets the path of the diractory where the current .jsp page is
            String path = getServletContext().getRealPath("/" );
            System.out.println(path);
            path=path+"data//";

//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =db.connect();
//CHECKING IF THE INWORDID IS ALREADY PRESENT
            String s=session.getAttribute("inwdid")+request.getParameter("in_wordno");
            System.out.println("s= "+s);
            Statement chkst=con.createStatement();
            ResultSet chk = chkst.executeQuery("select * from data where in_no='" +s+ "';");
            if (chk.next()) {
                out.println("<script language=\"javascript\">alert(\"INWORD NUMBER ALREADY EXISTS ENTER ANOTHER!\");</script>");
                response.sendRedirect("Add_inward.jsp");
            }
//path=path.replace("build/web/","data/");
//MultipartRequest(HttpServletRequest request, String saveDirectory, int maxPostSize) uploads the to specified directory file upto specified post size.       
            MultipartRequest multipartRequest = new MultipartRequest(request,path,40*4000000);
            
            File file = multipartRequest.getFile("file");
            String inwrdno = multipartRequest.getParameter("in_wordno");
            inwrdno=session.getAttribute("inwdid")+inwrdno;
            String file_name = file.getName();
            String type = multipartRequest.getParameter("type");
            String curntdate = multipartRequest.getParameter("curntdate");
            String lterno = multipartRequest.getParameter("letterno");
            String ltrdate=multipartRequest.getParameter("datepicker");
            String sub = multipartRequest.getParameter("sub");
            String user=(String)session.getAttribute("username");
            String dept=(String)session.getAttribute("dept");
//out.println(con);
            Statement st= con.createStatement();
            int insert=st.executeUpdate("INSERT INTO `data` (in_id, in_no, ltrno, ltrdate, sub, type, uploder, dept, file, fname) VALUES(null, '"+inwrdno+"', '"+lterno+"', '"+ltrdate+"', '"+sub+"', '"+type+"', '"+user+"', '"+dept+"', '"+file+"', '"+file_name+"')");
            
            
//RENAMING FILE THAT IS UPLOADED ON SERVER TO MAKE SURE OF ITS UNIQUENESS
            try{
                inwrdno=inwrdno.replace("/","_");
                File fnw = new File (path+inwrdno+file_name);
                File fn = new File(path+file_name);
                fn.renameTo(fnw);
            }catch(Exception ex){
            System.out.println("rename exception: "+ex);
            }
            if(insert==1)   {
                session.setAttribute("flash_message", "Record Added successfully !!!");
                session.setAttribute("flash_type", "success");
                response.sendRedirect("Add_inward.jsp");
            }
            
        }catch(Exception e){
            session.setAttribute("flash_message", "Null Data Not Allowd");
                session.setAttribute("flash_type", "Fail");
                response.sendRedirect("Add_inward.jsp");
                e.printStackTrace();
            System.out.println("Ex : " + e.toString());
        }
        
    }
}
