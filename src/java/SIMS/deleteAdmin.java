package SIMS;
import Dao.*;
import Model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

public class deleteAdmin extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        try {
             String email = request.getParameter("email");   
             System.out.println("delete admin mail  "+email);
             
            ServletContext context = getServletContext();
            Dao d = (Dao) context.getAttribute("db");
            boolean delete= d.deleteAdmin(email);   
              if (delete) {
                
                request.setAttribute("status", "SUCCESS");
                RequestDispatcher rd = request.getRequestDispatcher("HR.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("deleteAdmin.jsp");
                rd.forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException r) {
            r.printStackTrace();
        }
    }
}