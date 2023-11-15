package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class StudentDetailAdmin extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        try {            
            HttpSession session=request.getSession();
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");          
            List<Student> StudentDetails=dao.getAllStudentDetails();     
            session.setAttribute("StudentDetails", StudentDetails);                  
            RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}