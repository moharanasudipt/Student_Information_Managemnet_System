package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.List;

public class studentProfile extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {   
        try {            
            String SEmail = request.getParameter("email");           
            System.out.println(SEmail);
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
          
            List<Student> SProfile = dao.getStudent(SEmail);
            System.out.println(SProfile);
            if (SProfile!=null) {
                System.out.println("SUCCESS");
                request.setAttribute("allStudentProfile", SProfile);                
                RequestDispatcher rd = request.getRequestDispatcher("StudentProfile.jsp");
                rd.forward(request, response);
            } else {                
                RequestDispatcher rd = request.getRequestDispatcher("Student.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
