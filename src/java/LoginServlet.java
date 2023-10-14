import Model.*;
import Dao.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.util.*;

public class LoginServlet extends HttpServlet {

    @Override
    public void init() {
        ServletContext context = getServletContext();
        Dao dao = (Dao) new DaoImpl();
        context.setAttribute("db", dao);
        System.out.println("dao object set....");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String admin = "Admin";
        String student = "Student";
        String role = null;
        

        ServletConfig sc = getServletConfig();
        String HR_id = sc.getInitParameter("HR_ID");
        System.out.println(HR_id);

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email);
        System.out.println(password);

        ServletContext context = getServletContext();
        Dao dao = (Dao) context.getAttribute("db");
        if (!HR_id.equals(email)) {
            role = dao.checkA(email, password);
            System.out.println("RoleA" + role);
            if(role==null){
            role = dao.checkS(email, password);
            System.out.println("RoleS" + role);
            }
        }

        if (HR_id.equals(email)) {
            System.out.println("if hr");
            RequestDispatcher rd = request.getRequestDispatcher("HR.html");
            rd.forward(request, response);
        } else if (admin.equalsIgnoreCase(role)) {          
            System.out.println("else if Admin");
            RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
            rd.forward(request, response);
        } else if (student.equalsIgnoreCase(role)) {
            System.out.println("else if Student");
            RequestDispatcher rd = request.getRequestDispatcher("Student.html");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("Login.html");
            rd.forward(request, response);
        }
    }
}