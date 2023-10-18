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
                d.deleteStudent(id);   
                List<Student> stlist = d.getAllDepartment(branch);
                if (stlist!=null) {
                System.out.println("SUCCESS");
                RequestDispatcher rd = request.getRequestDispatcher("showDepartment.jsp");
                rd.forward(request, response);
            } 
        } catch (ServletException | IOException | NumberFormatException r) {
            r.printStackTrace();
        }
    }
}
