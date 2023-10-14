import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class searchStudent extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        try {            
            String sMail = request.getParameter("searchMail");           
            System.out.println(sMail);
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
          
            List<Student> stlist = dao.getStudent(sMail);
            System.out.println(stlist);
            
            if (stlist!=null) {
                System.out.println("SUCCESS");
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
