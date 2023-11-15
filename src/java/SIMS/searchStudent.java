package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class searchStudent extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        try {            
            String sMail = request.getParameter("searchMail");           
            
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
          
            List<Student> stlist = dao.getStudent(sMail);
            
            
            if (stlist!=null) {
                
                request.setAttribute("FeeStudent", stlist);
                RequestDispatcher rd = request.getRequestDispatcher("addFees.jsp");
                rd.forward(request, response);

            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("addFees.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
