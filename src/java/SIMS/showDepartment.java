package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class showDepartment extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        try {            
            String branch = request.getParameter("branch");           
            System.out.println("br"+branch);
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
          
            List<Student> stlist = dao.getAllDepartment(branch);
            
            if (stlist!=null) {
                
                request.setAttribute("allStudent", stlist);
                request.setAttribute("branch", branch);
                RequestDispatcher rd = request.getRequestDispatcher("showDepartment.jsp");
                rd.forward(request, response);

            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}