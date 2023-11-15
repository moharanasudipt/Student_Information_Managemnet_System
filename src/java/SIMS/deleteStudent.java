package SIMS;
import Dao.*;
import Model.Student;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

public class deleteStudent extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                int id=0;
        try {
             String branch = request.getParameter("branch");   
             id = Integer.parseInt(request.getParameter("del"));
             
            ServletContext context = getServletContext();
            Dao d = (Dao) context.getAttribute("db");
            boolean delete= d.deleteStudent(id);  
            System.out.println(delete+"deleteStudent");
              if (delete) {
                
                List<Student> stlist = d.getAllDepartment(branch);
                request.setAttribute("allStudent", stlist);
                RequestDispatcher rd = request.getRequestDispatcher("showDepartment.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("Update.jsp");
                rd.forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException r) {
            r.printStackTrace();
        }
    }
}