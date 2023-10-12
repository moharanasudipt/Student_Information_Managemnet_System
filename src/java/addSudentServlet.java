import Dao.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import jakarta.servlet.http.Part;

@MultipartConfig
public class addSudentServlet extends HttpServlet {

    public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String gname = request.getParameter("gname");
            String email = request.getParameter("email");
            String branch = request.getParameter("branch");

            Integer age = Integer.valueOf(request.getParameter("age"));
            Integer contact = Integer.valueOf(request.getParameter("contact"));

            System.out.println(name);
            System.out.println(address);
            System.out.println(age);
            System.out.println(dob);
            System.out.println(contact);
            System.out.println(gender);
            System.out.println(gname);
            System.out.println(email);
            System.out.println(branch);

            Part p = request.getPart("files");
            String fileName = p.getSubmittedFileName();
            System.out.println(fileName);
            String path = getServletContext().getRealPath("") + UPLOAD_DIR;
            System.out.println("File path:" + path);
            File file = new File(path);
            p.write(path + File.separator + fileName);
            dbFileName = UPLOAD_DIR + File.separator + fileName;
            System.out.println("DBFILENAME" + dbFileName);

            ServletContext context = getServletContext();
            Dao dao = (Dao) context.getAttribute("db");
            String password = dao.generatePassword(name, email);
            System.out.println(password);
            boolean flag = dao.addStudent(name, address, age, dob, contact, gender, gname, email, branch, password, dbFileName);
            if (flag) {
                System.out.println("SUCCESS");
                request.setAttribute("status", "SUCCESS");
                RequestDispatcher rd = request.getRequestDispatcher("addStudent.html");
                rd.forward(request, response);

            } else {
                request.setAttribute("status", "FAILED");
                RequestDispatcher rd = request.getRequestDispatcher("addStudent.html");
                rd.forward(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
