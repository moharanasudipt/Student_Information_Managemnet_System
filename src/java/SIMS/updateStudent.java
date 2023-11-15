package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.List;

public class updateStudent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Integer id = Integer.valueOf(request.getParameter("id"));
            String name = request.getParameter("name");
            String address = request.getParameter("addr");
            Integer age = Integer.valueOf(request.getParameter("age"));
            String gname = request.getParameter("gname");
            String email = request.getParameter("email");
            Long contact = Long.valueOf(request.getParameter("contact"));
            String branch=request.getParameter("branch");
            
            
            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");

            boolean stUplist = dao.updateStudent(id, name, address,age,gname,email ,contact);
            
            if (stUplist) {
          
                List<Student> stlist = dao.getAllDepartment(branch);
                request.setAttribute("allStudent", stlist);
                RequestDispatcher rd = request.getRequestDispatcher("showDepartment.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("Update.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}