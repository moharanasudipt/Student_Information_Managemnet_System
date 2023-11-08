package SIMS;
import Dao.*;
import Model.Student;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.util.List;

@MultipartConfig
public class EditStudentProfile extends HttpServlet {
    
    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        try {
            String email = request.getParameter("umail");
            String name = request.getParameter("uname");
            String address = request.getParameter("uaddr");
            String gender = request.getParameter("ugender");
            String Parent = request.getParameter("uparent");                        
            String dob = request.getParameter("udob");
            
            Integer age = Integer.valueOf(request.getParameter("uage"));
            Long contact = Long.valueOf(request.getParameter("ucontact"));

            System.out.println(name);           

            Part p = request.getPart("uimg");
            String fileName = p.getSubmittedFileName();
            System.out.println(fileName);
            String path = getServletContext().getRealPath("") + UPLOAD_DIR;
            System.out.println("File path:" + path);
            File file = new File(path);
            p.write(path + "/" + fileName);
            dbFileName = UPLOAD_DIR + "/" + fileName;
            System.out.println("DBFILENAME" + dbFileName);

            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
            
            boolean flag = dao.updateStudentInfo(email, name, address, age, gender, Parent, contact, dob, dbFileName);
            if (flag) {
                System.out.println("Student profiled updated");
                List<Student> SProfile = dao.getStudent(email);
                request.setAttribute("allStudentProfile", SProfile);     
                RequestDispatcher rd = request.getRequestDispatcher("StudentProfile.jsp");
                rd.forward(request, response);
            } else {                
                RequestDispatcher rd = request.getRequestDispatcher("EditStudentProfile.jsp");
                rd.forward(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
