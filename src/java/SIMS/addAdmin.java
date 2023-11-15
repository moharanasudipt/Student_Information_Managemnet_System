package SIMS;

import Dao.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import jakarta.servlet.http.Part;

@MultipartConfig
public class addAdmin extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
            String name = request.getParameter("name");                       
            String email = request.getParameter("email");
            String pwd = request.getParameter("password");

            Part p = request.getPart("photo");
            String fileName = p.getSubmittedFileName();
            System.out.println(fileName);
            String path = getServletContext().getRealPath("") + UPLOAD_DIR;
            System.out.println("File path:" + path);
            File file = new File(path);
            p.write(path + File.separator + fileName);
            dbFileName = UPLOAD_DIR + File.separator + fileName;
            System.out.println("DBFILENAME" + dbFileName);

            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
            
            boolean flag = dao.AddAdmin(name, email, pwd, dbFileName);
             if (flag) {
                System.out.println("ADMIN added SUCCESS");
                request.setAttribute("status", "SUCCESS");
                RequestDispatcher rd = request.getRequestDispatcher("HR.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("addAdmin.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}