package SIMS;
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String admin = "Admin";
        String student = "Student";
        String role = null;
        String adName = null;
        String photo = null;
        List<Admin> adminList = new ArrayList<Admin>();
        List<HR> HRlist = new ArrayList<HR>();
        HttpSession session = request.getSession();

        ServletConfig sc = getServletConfig();
        String HR_id = sc.getInitParameter("HR_ID");
        String HR_PWD = sc.getInitParameter("HR_PWD");     

        String email = request.getParameter("email");
        String password = request.getParameter("password");    

        ServletContext context = getServletContext();
        Dao dao = (Dao) context.getAttribute("db");
        if (!HR_id.equals(email)) {
            role = dao.checkA(email, password);
            System.out.println("RoleA" + role);
            if (role != null) {
                adminList = dao.getAdminDetails(email);
                Admin adminDetails = adminList.get(0);
                adName = adminDetails.getName();
                photo = adminDetails.getPhoto();
                
            }
            if (role == null) {
                role = dao.checkS(email, password);
                System.out.println("RoleS" + role);
            }
        }
        if (HR_id.equals(email)&& HR_PWD.equals(password)) {
            System.out.println("if hr");
            HRlist = dao.HRDetails();
            HR hrDeatils = HRlist.get(0);
            String HRName = hrDeatils.getName();
            String HRPhoto = hrDeatils.getPhoto();
            session.setAttribute("HRname", HRName);
            session.setAttribute("HRPhoto", HRPhoto);

            RequestDispatcher rd = request.getRequestDispatcher("HR.jsp");
            rd.forward(request, response);
        } else if (admin.equalsIgnoreCase(role)) {
            System.out.println("else if Admin");
            List<Student> StudentDetails = dao.getAllStudentDetails();
            session.setAttribute("AdminName", adName);
            session.setAttribute("AdminPhoto", photo);
            session.setAttribute("StudentDetails", StudentDetails);
            RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
            rd.forward(request, response);
        } else if (student.equalsIgnoreCase(role)) {
            System.out.println("else if Student");
            List<Student> StudentInfo = dao.getStudent(email);
            Student SI=StudentInfo.get(0);
            String sName=SI.getName();            
            String smail=SI.getEmail();            
            String sPIC=SI.getPhoto();            
            session.setAttribute("StudentName", sName);           
            request.setAttribute("StudentEmail", smail);           
            session.setAttribute("StudentPhoto", sPIC);
            RequestDispatcher rd = request.getRequestDispatcher("Student.jsp");
            rd.forward(request, response);
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("Error.html");
            rd.forward(request, response);
        }
    }
}